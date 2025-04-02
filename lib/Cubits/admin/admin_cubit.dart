import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/admin/admin_statuses.dart';
import 'package:quizapp/models/admin_model.dart';
import 'package:quizapp/services/admin_service.dart';

class AdminCubit extends Cubit<AdminStatuses> {
  AdminCubit() : super(AdminInitStatus());
  Future<void> featchAdmin(int adminNumber) async {
    try {
      emit(AdminLoadingStatus());
      emit(
        AdminSuccessStatus(
          admin: AdminModel.fromJson(
            await AdminService.fetchAdmin(adminNumber),
          ),
        ),
      );
    } catch (e) {
      emit(AdminFaliureStatus(error: e.toString()));
    }
  }
}
