import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/presentation/widgets/common_loading_dialog.dart';
import 'package:flutter/material.dart';

/// Used with StatefulWidget to trace log and show/hide loading dialog
mixin BaseStateMixin<T extends StatefulWidget> on State<T> {
  void showLoadingProgress() {
    showLoadingDialog(context: context);
  }

  void hideLoadingProgress() {
    hideLoadingDialog(context: context);
  }

  @override
  void didChangeDependencies() {
    Log.d('$T ==> didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Log.d('$T ==> dispose');
    super.dispose();
  }

  @override
  void deactivate() {
    Log.d('$T ==> deactivate');
    super.deactivate();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    Log.d('$T ==> didUpdateWidgets');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    Log.d('$T ==> initState');
    super.initState();
  }
}
