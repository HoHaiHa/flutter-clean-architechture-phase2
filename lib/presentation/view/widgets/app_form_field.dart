import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/utils/keyboard.dart';
import '../../resources/colors.dart';

class AppFormField extends StatefulWidget {
  const AppFormField({
    super.key,
    this.label,
    this.required = false,
    this.value,
    this.enabled = true,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.onFieldSubmitted,
    this.onTap,
    this.keyboardType,
    this.maxLength = TextField.noMaxLength,
    this.minLines,
    this.maxLines,
    this.inputFormatters,
    this.onChanged,
    this.controller,
    this.disableTextColor,
    this.disableBackgroundColor,
    this.readOnly = false,
    this.isLoading = false,
    this.textDirection,
    this.obscuringCharacter = '*',
    this.obscureText = false,
    this.validator,
    this.decoration,
    this.isRequire = false,
    this.onSuffixIconTap,
    this.centerVertical = false,
    this.autofocus = false,
  });

  final String? label;
  final bool required;
  final String? value;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enabled;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool isLoading;
  final TextDirection? textDirection;
  final Color? disableTextColor;
  final Color? disableBackgroundColor;
  final InputDecoration? decoration;
  final bool isRequire;
  final VoidCallback? onSuffixIconTap;
  final bool centerVertical;
  final bool autofocus;

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late TextEditingController _controller;
  bool hideClearWordBtn = true;

  @override
  void initState() {
    _controller =
        widget.controller ?? TextEditingController(text: widget.value ?? '');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppFormField oldWidget) {
    if (_controller.text != widget.value) {
      _controller.text = widget.value ?? '';
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.styleOwn();
    final colorSchema = context.colorOwn();

    final defaultBorder =
        Theme.of(context).brightness == Brightness.light
            ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color:
                    widget.decoration?.border?.borderSide.color ??
                    colorSchema?.grayscaleBodyText ??
                    AppColors.grayscaleBodyText, // Border color
              ),
            )
            : null;

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide(
        color:
            Theme.of(context).brightness == Brightness.light
                ? (widget.decoration?.errorBorder?.borderSide.color ??
                    colorSchema?.errorDark ??
                    AppColors.errorDark)
                : (widget.decoration?.errorBorder?.borderSide.color ??
                    colorSchema?.errorDarkmode ??
                    AppColors.errorDarkmode), // Border color
      ),
    );

    final fillColor =
        widget.decoration?.errorText == null
            ? (Theme.of(context).brightness == Brightness.light
                ? Colors.transparent
                : colorSchema?.darkmodeInputBackground)
            : colorSchema?.errorLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          widget.centerVertical
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text.rich(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                TextSpan(
                  text: widget.label ?? '',
                  style: textTheme?.textSmall?.copyWith(
                    color:
                        Theme.of(context).brightness == Brightness.light
                            ? colorSchema?.grayscaleBodyText
                            : colorSchema?.darkmodeBody,
                  ),
                ),
                if (widget.isRequire)
                  TextSpan(
                    text: '*',
                    style: textTheme?.textSmall?.copyWith(
                      color:
                          Theme.of(context).brightness == Brightness.light
                              ? colorSchema?.errorDark
                              : colorSchema?.errorDarkmode,
                    ),
                  ),
              ],
            ),
          ),
        if (widget.label != null) Gap(4),

        Container(
          child: TextFormField(
            autofocus: widget.autofocus,
            obscuringCharacter: '*',
            obscureText: widget.obscureText,
            readOnly: widget.readOnly,
            onChanged: widget.onChanged,
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            minLines: widget.minLines,
            maxLines: widget.maxLines ?? 1,
            keyboardType: widget.keyboardType,
            textDirection: widget.textDirection,
            onTap: () {
              widget.onTap?.call();
              setState(() {
                hideClearWordBtn = false;
              });
            },
            onTapOutside: (event) {
              hideKeyboard();
              setState(() {
                hideClearWordBtn = true;
              });
            },
            onFieldSubmitted: widget.onFieldSubmitted,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            controller: _controller,
            enabled: widget.enabled,
            style: textTheme?.textSmall?.copyWith(
              color:
                  widget.enabled
                      ? colorSchema?.grayscaleTitleactive
                      : widget.disableTextColor,
            ),
            decoration: InputDecoration(
              counterText: '',
              suffixIconConstraints: BoxConstraints.tight(const Size(40, 44)),
              suffixIcon:
                  widget.decoration?.suffixIcon ??
                  (!hideClearWordBtn
                      ? InkWell(
                        onTap: () {
                          _controller.text = '';
                          widget.onChanged?.call('');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child:
                              widget.decoration?.errorText == null
                                  ? Assets.icons.closeSearch.svg(
                                    color: Theme.of(context).iconTheme.color,
                                  )
                                  : Assets.icons.closeSearchIconError.svg(),
                        ),
                      )
                      : null),
              prefixIcon:
                  (widget.decoration?.prefixIcon != null)
                      ? Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                        child: widget.decoration?.prefixIcon,
                      )
                      : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 13.5,
              ),
              filled: true,
              fillColor:
                  widget.enabled
                      ? fillColor
                      : (widget.disableBackgroundColor ?? AppColors.white),
              hintText: widget.decoration?.hintText,
              hintStyle: textTheme?.textSmall?.copyWith(
                color: colorSchema?.grayscalePlaceholder,
              ),
              enabledBorder: defaultBorder,
              disabledBorder: defaultBorder,
              focusedBorder:
                  widget.readOnly
                      ? defaultBorder
                      : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color:
                              colorSchema?.grayscaleBodyText ??
                              AppColors.grayscaleBodyText, //lor
                        ),
                      ),
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
              error:
                  widget.decoration?.errorText != null
                      ? const SizedBox()
                      : null,
              errorStyle: Theme.of(context).brightness == Brightness.light ? colorSchema?.darkBlack : colorSchema?.darkBlack ?? c;
            ),
          ),
        ),
        if (widget.decoration?.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Assets.icons.warningIcon.svg(
                  color:
                      Theme.of(context).brightness == Brightness.light
                          ? null
                          : colorSchema?.errorDarkmode ??
                              AppColors.errorDarkmode,
                ),
                const Gap(4),
                Text(
                  maxLines: 1,
                  widget.decoration?.errorText ?? '',
                  style: textTheme?.textSmall?.copyWith(
                    color:
                        Theme.of(context).brightness == Brightness.light
                            ? colorSchema?.errorDark
                            : colorSchema?.errorDarkmode ??
                                AppColors.errorDarkmode,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // Widget _buildSuffixIcon(InputDecoration _decoration) {
  //   return _decoration.suffixIcon ?? SizedBox();
  //   return UnconstrainedBox(
  //     alignment: Alignment.centerRight,
  //     child:
  //         _decoration.suffixText != null
  //             ? Padding(
  //               padding: const EdgeInsets.only(right: 10),
  //               child: Text(
  //                 _decoration.suffixText ?? '',
  //                 style: _decoration.suffixStyle,
  //               ),
  //             )
  //             : _decoration.suffixIcon,
  //   );
  // }
  //
  // Widget _buildPrefixIcon(InputDecoration _decoration) {
  //   return UnconstrainedBox(
  //     alignment: Alignment.centerLeft,
  //     child:
  //         _decoration.prefixText != null
  //             ? Padding(
  //               padding: const EdgeInsets.only(left: 10),
  //               child: Text(
  //                 _decoration.prefixText ?? '',
  //                 style: _decoration.prefixStyle,
  //               ),
  //             )
  //             : _decoration.prefixIcon,
  //   );
  // }
}
