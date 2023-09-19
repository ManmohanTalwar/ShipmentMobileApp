import 'dart:convert';
import 'dart:developer';

import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/helper/flash_helper.dart';
import 'package:moniepoint_task/helper/logger.dart';
import 'package:moniepoint_task/injection.dart';
import 'package:moniepoint_task/routes/route_list.dart';
import 'package:moniepoint_task/services/navigation_service.dart';
import 'package:moniepoint_task/services/services.dart';

import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @action
  Future<void> changeTab({required int index}) async {
    currentIndex = index;
  }
}
