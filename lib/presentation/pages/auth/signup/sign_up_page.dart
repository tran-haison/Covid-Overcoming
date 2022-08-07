import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:covid_overcoming/presentation/pages/auth/signup/bloc/sign_up_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/signup/bloc/sign_up_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/signup/bloc/sign_up_state.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_dialogs.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_form_field.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/fonts.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with BaseStateMixin<SignUpPage> {
  final _authBloc = getIt<AuthBloc>();
  final _signUpBloc = getIt<SignUpBloc>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => _authBloc),
        BlocProvider<SignUpBloc>(create: (_) => _signUpBloc),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignUpLoadingState) {
            showLoadingProgress();
            return;
          }
          hideLoadingProgress();

          if (state is AuthSignUpSuccessState) {
            showCommonDialog(
              context,
              S.current.success,
              S.current.sign_up_successfully,
              firstButtonCallback: () {
                AuthRouter.goSignIn(context);
              },
            );
            return;
          }

          if (state is AuthSignUpFailedState) {
            showCommonDialog(context, Strings.error, state.error.message);
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
                          vGap10,
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
                          vGap50,
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
      controller: _emailController,
      hintText: S.current.email,
      icon: const Icon(Icons.mail_outline_rounded),
      isPassword: false,
      onChanged: (email) {
        _signUpBloc.add(SignUpEmailChangedEvent(email));
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
        _signUpBloc.add(SignUpPasswordChangedEvent(password));
      },
    );
  }

  Widget _buildConfirmPasswordTextFormField() {
    return CommonTextFormField(
      controller: _confirmPasswordController,
      hintText: S.current.confirm_password,
      icon: const Icon(Icons.lock_outline_rounded),
      isPassword: true,
      onChanged: (confirmPassword) {
        _signUpBloc.add(SignUpConfirmPasswordChangedEvent(confirmPassword));
      },
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (prev, curr) => prev.isFieldsValid != curr.isFieldsValid,
      builder: (context, state) {
        if (state.isFieldsValid) {
          return CommonElevatedButton(
            text: S.current.sign_up,
            onPressed: () {
              _authBloc.add(AuthSignUpWithEmailAndPasswordEvent(
                _emailController.text,
                _passwordController.text,
              ));
            },
          );
        }
        return CommonElevatedButton(
          text: S.current.sign_up,
          onPressed: null,
        );
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
