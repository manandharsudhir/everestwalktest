import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../configs/style/colors.dart';

class DropDownField<T> extends StatelessWidget {
  const DropDownField({
    required this.name,
    required this.items,
    this.initialValue,
    this.hintText,
    this.validator,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.onReset,
    this.onSaved,
    this.allowClear = false,
    this.enableLabel = true,
    this.labelText,
    this.enabled = true,
    this.style,
    this.isLightBorder = false,
    this.fillColor = Colors.white,
    Key? key,
  }) : super(key: key);

  final String name;
  final String? hintText;
  final String? labelText;
  final String? Function(T?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final T? initialValue;
  final List<DropdownMenuItem<T>> items;
  final Widget? prefixIcon;
  final void Function(T? value)? onChanged;
  final void Function(T?)? onSaved;
  final void Function()? onTap;
  final void Function()? onReset;
  final bool allowClear;
  final bool enableLabel;
  final bool enabled;
  final Color fillColor;
  final TextStyle? style;
  final bool isLightBorder;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      enabled: enabled,
      items: items,
      name: name,
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      onReset: onReset,
      onSaved: onSaved,
      icon: const Icon(
        CupertinoIcons.chevron_down,
        size: 24,
      ),
      validator: validator,
      style: style,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(overflow: TextOverflow.ellipsis),
          contentPadding: contentPadding,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isLightBorder ? Palette.dividerColor : Palette.greyColor,
            ),
          ),
          prefixIcon: prefixIcon),
    );
  }
}
