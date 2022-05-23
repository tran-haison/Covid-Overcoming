import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/config/route/router/main_router.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/data/datasource/mock/mock_data.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_state.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_dialogs.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_form_field.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/fonts.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with BaseStateMixin<SignInPage> {
  final _authBloc = getIt<AuthBloc>();
  final _signInBloc = getIt<SignInBloc>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = MockData.email;
    _passwordController.text = MockData.password;
    _signInBloc.add(SignInEmailChangedEvent(_emailController.text));
    _signInBloc.add(SignInPasswordChangedEvent(_passwordController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => _authBloc),
        BlocProvider<SignInBloc>(create: (_) => _signInBloc),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignInLoadingState) {
            showLoadingProgress();
            return;
          }
          hideLoadingProgress();

          if (state is AuthSignInSuccessState) {
            MainRouter.goMain(context);
            return;
          }

          if (state is AuthSignInFailedState) {
            showCommonDialog(context, Strings.error, state.error);
            return;
          }
        },
        child: _buildPage(),
      ),
    );
  }

  Widget _buildPage() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    _buildSignInButton(),
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
    );
  }

  Widget _buildEmailTextFormField() {
    return CommonTextFormField(
      controller: _emailController,
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
      controller: _passwordController,
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

  Widget _buildSignInButton() {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (prev, curr) => prev.isFieldsValid != curr.isFieldsValid,
      builder: (_, state) {
        if (state.isFieldsValid) {
          return CommonElevatedButton(
            text: S.current.sign_in,
            onPressed: () {
              _authBloc.add(SignInWithEmailAndPasswordEvent(
                _emailController.text,
                _passwordController.text,
              ));
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
