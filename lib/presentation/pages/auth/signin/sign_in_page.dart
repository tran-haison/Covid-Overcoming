import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/config/route/router/main_router.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_state.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_form_field.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final SignInBloc _signInBloc = getIt<SignInBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (_) => _signInBloc,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.dimen25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        S.current.sign_in,
                        style: textStyle40Bold,
                      ),
                      Text(
                        S.current.enter_email_and_password_to_get_started,
                        style: textStyle14Gray,
                      ),
                      vGap20,
                      _buildEmailTextFormField(),
                      vGap10,
                      _buildPasswordTextFormField(),
                      _buildForgotPasswordButton(context),
                      _buildSignInButton(context),
                      vGap20,
                      _buildSocialSignInButton(),
                    ],
                  ),
                ),
                _buildSignUpTextButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextFormField() {
    return CommonTextFormField(
      hintText: S.current.email,
      icon: const Icon(Icons.mail_outline_rounded),
      isPassword: false,
      onChanged: (email) {
        _signInBloc.add(SignInEmailChangedEvent(email));
      },
    );
  }

  Widget _buildPasswordTextFormField() {
    return CommonTextFormField(
      hintText: S.current.password,
      icon: const Icon(Icons.lock_outline_rounded),
      isPassword: true,
      onChanged: (password) {
        _signInBloc.add(SignInPasswordChangedEvent(password));
      },
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => AuthRouter.goForgotPassword(context),
        child: Text(
          S.current.forgot_password,
          style: textStyle14Gray,
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (prev, curr) => prev.isFieldsValid != curr.isFieldsValid,
      builder: (context, state) {
        if (state.isFieldsValid) {
          return CommonElevatedButton(
            text: S.current.sign_in,
            onPressed: () {
              // TODO: implement sign in
              MainRouter.goMain(context);
            },
          );
        }
        return CommonElevatedButton(
          text: S.current.sign_in,
          onPressed: null,
        );
      },
    );
  }

  Widget _buildSocialSignInButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CommonSocialButton(
          onPressed: () {
            // TODO: google sign in
          },
          iconPath: AssetPaths.icGoogle,
        ),
        hGap22,
        CommonSocialButton(
          onPressed: () {
            // TODO: facebook sign in
          },
          iconPath: AssetPaths.icFacebook,
        ),
      ],
    );
  }

  Widget _buildSignUpTextButton(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: S.current.dont_have_an_account,
        style: textStyle14Gray.copyWith(fontFamily: Fonts.poppins),
        children: <TextSpan>[
          const TextSpan(text: ' '),
          TextSpan(
            text: S.current.sign_up,
            style: textStyle14Gray.copyWith(
              color: colorPrimary,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AuthRouter.goSignUp(context);
              },
          ),
        ],
      ),
    );
  }
}
