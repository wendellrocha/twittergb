import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'text_field_store.dart';

class TextFieldWidget extends FormField<String> {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final bool expands;
  final int? maxLines;
  final Color? containerColor;
  final Color? iconColor;
  final IconData? icon;
  final TextAlign? align;
  final TextInputType inputType;
  final bool isPassword;
  final double opacity;
  final Color? textColor;
  final Function? onChanged;
  final double fontSize;
  final bool readOnly;
  final double hMargin;
  final double vMargin;
  final FormFieldValidator<String>? validator;
  final bool shadow;
  final double? width;
  final Color? fillColor;
  final Color? borderColor;
  final double? height;
  final bool useDefaultHeight;
  final List<TextInputFormatter> inputFormatters;
  final VoidCallback? onTap;
  final int? maxLength;

  TextFieldWidget({
    Key? key,
    required this.controller,
    this.title,
    this.hint,
    this.maxLines,
    this.expands = false,
    this.icon,
    this.align,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.opacity = 0.2,
    this.containerColor,
    this.iconColor,
    this.textColor,
    this.onChanged,
    this.fontSize = 16,
    this.readOnly = false,
    this.hMargin = 0,
    this.vMargin = 0,
    this.validator,
    this.shadow = true,
    this.width,
    this.height = 60,
    this.fillColor,
    this.borderColor,
    this.inputFormatters = const [],
    this.onTap,
    this.maxLength,
    this.useDefaultHeight = true,
  }) : super(
          key: key,
          validator: validator,
          builder: (FormFieldState state) {
            final RxNotifier<bool> isVisible = RxNotifier<bool>(false);
            final theme = Theme.of(state.context);

            _onChanged(String value) {
              state.didChange(value);
              if (onChanged != null) onChanged(value);
            }

            _toggle() {
              isVisible.value = !isVisible.value;
            }

            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: hMargin,
                vertical: vMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: containerColor != null
                          ? containerColor.withOpacity(opacity)
                          : theme.backgroundColor.withOpacity(opacity),
                      boxShadow: shadow
                          ? [
                              BoxShadow(
                                color: theme.shadowColor.withOpacity(.1),
                                blurRadius: 5.0,
                                offset: const Offset(0, 2),
                                spreadRadius: 0,
                              ),
                            ]
                          : [],
                    ),
                    height: useDefaultHeight ? height : null,
                    width: width ?? MediaQuery.of(state.context).size.width,
                    child: RxBuilder(
                      builder: (context) {
                        return Center(
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.top,
                            textAlign: TextAlign.start,
                            keyboardType: inputType,
                            obscureText:
                                isPassword ? !isVisible.value : isVisible.value,
                            readOnly: readOnly,
                            controller: controller,
                            cursorColor:
                                textColor ?? theme.textTheme.bodyText1!.color,
                            expands: expands,
                            maxLines: expands ? null : maxLines,
                            style: textColor != null
                                ? TextStyle(color: textColor)
                                : TextStyle(
                                    color: theme.textTheme.bodyText1!.color,
                                  ),
                            onChanged: (String value) => _onChanged(value),
                            inputFormatters: inputFormatters,
                            validator: validator != null
                                ? (String? value) {
                                    return validator(value);
                                  }
                                : null,
                            onTap: onTap,
                            maxLength: maxLength,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(
                                color: theme.textTheme.bodyText2!.color,
                              ),
                              alignLabelWithHint: true,
                              fillColor: fillColor ?? theme.backgroundColor,
                              hoverColor: fillColor ?? theme.backgroundColor,
                              focusColor: fillColor ?? theme.backgroundColor,
                              suffixIcon: isPassword
                                  ? IconButton(
                                      icon: Icon(
                                        isVisible.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: iconColor ??
                                            theme.textTheme.bodyText1!.color,
                                      ),
                                      onPressed: () => _toggle(),
                                    )
                                  : icon != null
                                      ? Icon(icon, color: iconColor)
                                      : null,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF12AF7C),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: borderColor ??
                                      theme.textTheme.bodyText1!.color!,
                                  width: 0.5,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              errorStyle: const TextStyle(
                                height: 0,
                                fontSize: 0,
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE21723),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFE21723),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              labelText: title,
                              hintText: hint,
                              labelStyle: textColor != null
                                  ? TextStyle(color: textColor)
                                  : Theme.of(state.context).textTheme.bodyText1,
                              hintStyle: textColor != null
                                  ? TextStyle(color: textColor)
                                  : Theme.of(state.context).textTheme.bodyText1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  state.hasError
                      ? Container(
                          width: width,
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            state.errorText!,
                            style: const TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          },
        );

  @override
  FormFieldState<String> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends FormFieldState<String> {
  final TextFieldStore _store = Modular.get();

  TextFieldStore get store => _store;

  @override
  void didChange(String? value) {
    super.didChange(value);
  }
}
