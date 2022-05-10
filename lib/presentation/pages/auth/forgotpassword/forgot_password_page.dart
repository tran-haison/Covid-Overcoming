import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_form_field.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
                            S.current.forgot_password,
                            style: textStyle40Bold.copyWith(height: 1),
                          ),
                          vGap10,
                          Text(
                            S.current
                                .we_will_send_a_link_to_your_email_to_reset_password,
                            style: textStyle14Gray,
                          ),
                          vGap20,
                          _buildEmailTextFormField(),
                        ],
                      ),
                    ),
                    _buildConfirmButton(context),
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

  Widget _buildConfirmButton(BuildContext context) {
    return CommonElevatedButton(
      text: S.current.confirm,
      onPressed: () {
        // TODO: confirm reset password
      },
    );
  }
}
