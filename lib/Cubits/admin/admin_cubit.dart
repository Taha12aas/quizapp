import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapp/Cubits/admin/admin_statuses.dart';
import 'package:quizapp/models/admin_model.dart';
import 'package:quizapp/services/admin_service.dart';

class AdminCubit extends Cubit<AdminStatuses> {
  AdminCubit() : super(AdminInitStatus());
  late AdminModel admin;
  Future<void> featchAdmin(int adminNumber) async {
    emit(AdminLoadingStatus());
    try {
      List<Map<String, dynamic>> res =
          await AdminService.fetchAdmin(adminNumber);
      admin = AdminModel.fromJson(res[0]);
      emit(
        AdminSuccessStatus(
          admin: AdminModel.fromJson(
            res[0],
          ),
        ),
      );
    } catch (e) {
      log(e.toString());
      emit(AdminFaliureStatus(error: e.toString()));
    }
  }

  void updateAdmin(String columnName, int adminPhone, dynamic value) async {
    emit(AdminLoadingStatus());
    try {
      await AdminService.updateAdmin(columnName, adminPhone, value);
      emit(AdminSuccessStatus(admin: admin));
    } catch (e) {
      emit(AdminFaliureStatus(error: e.toString()));
    }
  }
}
