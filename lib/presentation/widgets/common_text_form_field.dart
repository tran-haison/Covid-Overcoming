import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.isPassword,
    required this.onChanged,
    this.radius = Dimens.radius8,
  }) : super(key: key);

  final String hintText;
  final Icon icon;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final double radius;

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: Colors.grey[100],
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
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      style: textStyle14Medium,
      decoration: InputDecoration(
        icon: widget.icon,
        suffixIcon: widget.isPassword
            ? IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => setState(() {
                  _passwordVisible = !_passwordVisible;
                }),
              )
            : Visibility(visible: false, child: Container()),
        hintText: widget.hintText,
        hintStyle: textStyle14Gray,
        border: InputBorder.none,
      ),
      obscureText: widget.isPassword ? !_passwordVisible : widget.isPassword,
      autocorrect: !widget.isPassword,
      enableSuggestions: !widget.isPassword,
    );
  }
}