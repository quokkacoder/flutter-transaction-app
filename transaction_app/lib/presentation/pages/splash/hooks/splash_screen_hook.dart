import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:transaction_app/di_containter.dart';
import 'package:transaction_app/domain/repositories/transaction_repo.dart';
import 'package:transaction_app/presentation/route/named_route.dart';

void useAddFrameCallBackSplashScreenHook() =>
    use(_AddFrameCallBackSplashScreenHook());

class _AddFrameCallBackSplashScreenHook extends Hook<void> {
  @override
  HookState<void, Hook<void>> createState() => _FrameCallBackState();
}

class _FrameCallBackState
    extends HookState<void, _AddFrameCallBackSplashScreenHook> {
  @override
  void initHook() {
    // TODO: implement initHook
    super.initHook();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      locator<TransactionRepo>()
        ..fetchTransactions()
            .then(
              (value) => value.fold(
                  (failure) => Navigator.pushReplacementNamed(
                      context, NamedRoute.appFailed,
                      arguments: {'message': failure.message}),
                  (data) => Navigator.pushReplacementNamed(context, NamedRoute.listTrans,
                      arguments: {'transactions': data})),
            )
            .catchError((err) => Navigator.pushReplacementNamed(
                context, NamedRoute.appFailed,
                arguments: {'message': err.toString()}));
    });
  }

  @override
  void build(BuildContext context) {
    // TODO: implement build
  }
}
