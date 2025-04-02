import 'package:quizapp/models/admin_model.dart';

abstract class AdminStatuses {}

class AdminInitStatus extends AdminStatuses {}

class AdminSuccessStatus extends AdminStatuses {
  final AdminModel admin;

  AdminSuccessStatus({required this.admin});
}

class AdminLoadingStatus extends AdminStatuses {}

class AdminFaliureStatus extends AdminStatuses {
  final String error;

  AdminFaliureStatus({required this.error});
}
