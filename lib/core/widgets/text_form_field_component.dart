import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldComponent extends StatefulWidget {
  const TextFormFieldComponent({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.formatters,
    this.keyboardType,
    this.isPassword = false,
    this.fieldFocus,
    this.nextFocus,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.minLines = 1,
    this.maxLines = 1,
    this.customIcon,
    this.cursorHeight = 26,
    this.suffixIcon,
    this.prefixIcon,
    this.style,
    this.maxLength,
    this.onTap,
  });

  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? formatters;
  final TextInputType? keyboardType;
  final bool isPassword;
  final FocusNode? fieldFocus;
  final FocusNode? nextFocus;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final int minLines;
  final int maxLines;
  final Widget? customIcon;
  final TextStyle? style;
  final double? cursorHeight;
  final int? maxLength;
  final VoidCallback? onTap;

  @override
  State<TextFormFieldComponent> createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  String? errorText;
  final _key = GlobalKey<FormFieldState>();
  late bool isVisibleChar = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _key,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      inputFormatters: widget.formatters,
      textCapitalization: widget.textCapitalization,
      validator: (v) {
        errorText = widget.validator?.call(v);
        return errorText;
      },
      onChanged: (v) {
        if (errorText?.isNotEmpty == true) {
          _key.currentState?.validate();
        }
        widget.onChanged?.call(v);
      },
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: isVisibleChar,
      onTap: widget.onTap,
      obscuringCharacter: '•',
      focusNode: widget.fieldFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorHeight: widget.cursorHeight,
      textAlign: TextAlign.start,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      onFieldSubmitted: (value) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
        widget.fieldFocus?.unfocus();
        if (widget.nextFocus != null) {
          FocusScope.of(context).requestFocus(widget.nextFocus);
        }
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.hint,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () => setState(() => isVisibleChar = !isVisibleChar),
                child: Icon(
                  isVisibleChar ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
              )
            : widget.suffixIcon,
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        contentPadding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            )),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
