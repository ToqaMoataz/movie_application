
import 'package:flutter/cupertino.dart';
import 'package:movie_app/Features/Authentication/domain/repo.dart';

import '../assets/App Components/widgets.dart';

class BaseViewModel<T extends BaseConnector> extends ChangeNotifier{
  T? connector;
  AuthRepository repo=AuthRepositoryImplementation();
}

abstract class BaseConnector{
  onLoading();
  onError(String message);
  onSuccess({String? message});
}

abstract class BaseView<ST extends StatefulWidget,T extends BaseViewModel> extends State<ST> implements BaseConnector {
  late T viewModel;

  T initializeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel=initializeViewModel();
    viewModel.connector = this;
  }

  @override
  onError(String message) {
    AppWidgets.errorDialogWidget(context, message);
  }

  @override
  onLoading() {
    AppWidgets.loadingDialogWidget(context);
  }

  @override
  onSuccess({String? message})
  {
    AppWidgets.successDialogWidget(context);
  }


}