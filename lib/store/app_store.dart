import 'dart:convert';
import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/helper/flash_helper.dart';
import 'package:moniepoint_task/helper/logger.dart';
import 'package:moniepoint_task/injection.dart';
import 'package:moniepoint_task/routes/route_list.dart';
import 'package:moniepoint_task/services/navigation_service.dart';
import 'package:moniepoint_task/services/services.dart';

import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  final PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  @action
  Future<void> changeTab({required int index}) async {
    currentIndex = index;
    controller.jumpToTab(currentIndex);
  }

  @observable
  ObservableList<Map<String, dynamic>> shipmentHistory = ObservableList()
    ..addAll([
      {
        'status': 'in-progress',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$1400 USD',
        'date': 'Sep 20, 2023',
      },
      {
        'status': 'pending',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$600 USD',
        'date': 'Sep 20, 2023',
      },
      {
        'status': 'loading',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$850 USD',
        'date': 'Sep 20, 2023',
      },
      {
        'status': 'in-progress',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$1400 USD',
        'date': 'Sep 20, 2023',
      },
      {
        'status': 'pending',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$600 USD',
        'date': 'Sep 20, 2023',
      },
      {
        'status': 'loading',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$850 USD',
        'date': 'Sep 20, 2023',
      },
      {
        'status': 'cancelled',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$850 USD',
        'date': 'Sep 20, 2023',
      },
      {
        'status': 'completed',
        'delivery_details': 'Arriving today!',
        'delivery_message':
            'Your delivery, #NEJ20089934122231 from Atlanta, is arriving today!',
        'charges': '\$850 USD',
        'date': 'Sep 20, 2023',
      },
    ]);

  @computed
  ObservableList<Map<String, dynamic>> get allOrders =>
      ObservableList()..addAll(shipmentHistory);

  @computed
  ObservableList<Map<String, dynamic>> get pending => ObservableList()
    ..addAll(shipmentHistory.where((e) => e['status'] == 'pending').toList());

  @computed
  ObservableList<Map<String, dynamic>> get inProgress => ObservableList()
    ..addAll(
        shipmentHistory.where((e) => e['status'] == 'in-progress').toList());

  @computed
  ObservableList<Map<String, dynamic>> get cancelled => ObservableList()
    ..addAll(shipmentHistory.where((e) => e['status'] == 'cancelled').toList());

  @computed
  ObservableList<Map<String, dynamic>> get completed => ObservableList()
    ..addAll(shipmentHistory.where((e) => e['status'] == 'completed').toList());
}
