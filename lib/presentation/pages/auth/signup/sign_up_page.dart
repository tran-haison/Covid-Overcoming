import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_form_field.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.dimen10,
                vertical: Dimens.dimen5,
              ),
              child: _buildIconButtonBack(context),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(Dimens.dimen25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S.current.sign_up,
                            style: textStyle40Bold,
                          ),
                          Text(
                            S.current.begin_your_journey_with_us_from_today,
                            style: textStyle14Gray,
                          ),
                          vGap20,
                          _buildEmailTextFormField(),
                          vGap10,
                          _buildPasswordTextFormField(),
                          vGap10,
                          _buildConfirmPasswordTextFormField(),
                          vGap20,
                          _buildSignUpButton(context),
                        ],
                      ),
                    ),
                    _buildSignInTextButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButtonBack(BuildContext context) {
    return IconButton(
      onPressed: () {
        NavigatorUtils.goBack(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  Widget _buildEmailTextFormField() {
    return CommonTextFormField(
      hintText: S.current.email,
      icon: const Icon(Icons.mail_outline_rounded),
      isPassword: false,
      onChanged: (value) {
        // TODO: onChange mail
      },
    );
  }

  Widget _buildPasswordTextFormField() {
    return CommonTextFormField(
      hintText: S.current.password,
      icon: const Icon(Icons.lock_outline_rounded),
      isPassword: true,
      onChanged: (value) {
        // TODO: onChange password
      },
    );
  }

  Widget _buildConfirmPasswordTextFormField() {
    return CommonTextFormField(
      hintText: S.current.confirm_password,
      icon: const Icon(Icons.lock_outline_rounded),
      isPassword: true,
      onChanged: (value) {
        // TODO: onChange confirm password
      },
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CommonElevatedButton(
      text: S.current.sign_up,
      onPressed: () {
        // TODO: implement click sign up
      },
    );
  }

  Widget _buildSignInTextButton(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: S.current.already_have_an_account,
        style: textStyle14Gray.copyWith(fontFamily: Fonts.poppins),
        children: <TextSpan>[
          const TextSpan(text: ' '),
          TextSpan(
            text: S.current.sign_in,
            style: textStyle14Gray.copyWith(
              color: colorPrimary,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                NavigatorUtils.goBack(context);
              },
          ),
        ],
      ),
    );
  }
}
