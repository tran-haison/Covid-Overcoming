import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/presentation/pages/chat_detail/chat_detail_page.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';

class ChatRouter implements IRouterProvider {
  final accountMeParam = 'account-me';
  final accountOtherParam = 'account-other';

  static void goChatDetail(
    context, {
    required AccountModel accountMe,
    required AccountModel accountOther,
  }) {
    NavigatorUtils.push(
      context,
      NavigatorPaths.chatDetail,
      sendData: {
        ChatRouter().accountMeParam: accountMe,
        ChatRouter().accountOtherParam: accountOther,
      },
    );
  }

  @override
  void defineRoutes(FluroRouter router) {
    router.define(
      NavigatorPaths.chatDetail,
      handler: Handler(handlerFunc: (context, _) {
        final data = context?.settings?.arguments as Map<String, dynamic>;
        return ChatDetailPage(
          accountMe: data[accountMeParam],
          accountOther: data[accountOtherParam],
        );
      }),
    );
  }
}
