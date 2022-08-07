import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
    this.isPassword = false,
    this.icon,
    this.validator,
    this.autoValidateMode,
    this.radius = Dimens.radius8,
    this.backgroundColor = colorGray100,
  }) : super(key: key);

  final String hintText;
  final Icon? icon;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final double radius;
  final Color? backgroundColor;

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dimen5,
          horizontal: Dimens.dimen15,
        ),
        child: _buildTextFormField(),
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      style: textStyle14Medium.copyWith(height: 1.5),
      decoration: InputDecoration(
        icon: widget.icon,
        suffixIcon: widget.isPassword
            ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => setState(() {
                  _passwordVisible = !_passwordVisible;
                }),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: textStyle14Gray.copyWith(height: 1.5),
        border: InputBorder.none,
      ),
      obscureText: widget.isPassword ? !_passwordVisible : widget.isPassword,
      autocorrect: !widget.isPassword,
      enableSuggestions: !widget.isPassword,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
    );
  }
}
