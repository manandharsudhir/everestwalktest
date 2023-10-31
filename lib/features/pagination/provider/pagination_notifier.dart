import 'dart:async';
import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/widgets/toast/toast.dart';
import '../model/paginated_state_model.dart';

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginationNotifier({
    required this.fetchNextItems,
    required this.itemsPerBatch,
  }) : super(const PaginationState.loading());

  final Future<List<T>> Function(int itemCount) fetchNextItems;
  final int itemsPerBatch;

  List<T> items = [];

  Timer _timer = Timer(const Duration(milliseconds: 0), () {});

  bool noMoreItems = false;
  bool isFetchFirst = true;

  void init() {
    if (items.isEmpty) {
      fetchFirstBatch();
    }
  }

  void updateData(List<T> result) {
    noMoreItems = result.length < itemsPerBatch;
    if (!isFetchFirst) {
      if (noMoreItems) {
        showErrorToast("No More Items Found");
      }
    } else {
      isFetchFirst = false;
    }
    if (result.isEmpty) {
      state = PaginationState.data(items);
    } else {
      state = PaginationState.data(items..addAll(result));
    }
  }

  updateItem(T item, int index) {
    items[index] = item;
    state = PaginationState.data([...items]);
  }

  updateState() {
    state = PaginationState.data(items);
  }

  addItem(T item) {
    items.insert(0, item);
    state = PaginationState.data(items);
  }

  removeItem(int index) {
    items.removeAt(index);
    state = PaginationState.data(items);
  }

  Future<void> fetchFirstBatch() async {
    try {
      items = [];
      state = const PaginationState.loading();

      final List<T> result = await fetchNextItems(0);
      updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  Future<void> fetchNextBatch() async {
    if (_timer.isActive && items.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});

    if (noMoreItems) {
      return;
    }

    if (state == PaginationState<T>.onGoingLoading(items)) {
      log("Rejected");
      return;
    }

    log("Fetching next batch of items");

    state = PaginationState.onGoingLoading(items);

    try {
      await Future.delayed(const Duration(seconds: 1));
      final result = await fetchNextItems(items.length);
      updateData(result);
    } catch (e, stk) {
      log("Error fetching next page", error: e, stackTrace: stk);
      state = PaginationState.onGoingError(items, e, stk);
    }
  }
}
