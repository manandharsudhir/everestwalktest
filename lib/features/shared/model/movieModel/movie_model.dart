import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    bool? adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    @JsonKey(name: "genre_ids") @Default([]) List<int> genreIds,
    required int id,
    @JsonKey(name: "original_language") String? originalLanguage,
    @JsonKey(name: "original_title") String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "release_date") DateTime? releaseDate,
    String? title,
    bool? video,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
