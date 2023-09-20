import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/shipment/widgets/shipment_card.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/shipment/widgets/tab_bar_wrapper.dart';
import 'package:moniepoint_task/presentation/widgets/animated_app_bar.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:provider/provider.dart';

class ShipmentHistory extends StatefulWidget {
  const ShipmentHistory({Key? key}) : super(key: key);

  @override
  State<ShipmentHistory> createState() => _ShipmentHistoryState();
}

class _ShipmentHistoryState extends State<ShipmentHistory>
    with SingleTickerProviderStateMixin {
  late AppStore appStore;
  late TabController controller;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  static Tween<Offset> offset =
      Tween<Offset>(end: const Offset(0, 0), begin: const Offset(0, 1));

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appStore = context.watch<AppStore>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          AnimatedAppBar(
            title: 'Shipment History',
            isNormal: true,
            onBackPressed: () {
              appStore.changeTab(index: 0);
            },
            bottom: Observer(builder: (context) {
              return TabBar(
                indicatorColor: context.accentColor(),
                indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.center,
                controller: controller,
                indicatorWeight: 2,
                dividerColor: Colors.transparent,
                onTap: (index) async {
                  setState(() {});
                },
                isScrollable: true,
                enableFeedback: true,
                labelColor: context.white(),
                unselectedLabelColor: context.white().withOpacity(0.6),
                tabs: [
                  Tab(
                    child: TabChild(
                      count: appStore.allOrders.length,
                      label: ' All ',
                      isSelected: controller.index == 0,
                    ),
                  ),
                  Tab(
                    child: TabChild(
                      count: appStore.inProgress.length,
                      label: 'In Progress',
                      isSelected: controller.index == 1,
                    ),
                  ),
                  Tab(
                    child: TabChild(
                      count: appStore.pending.length,
                      label: 'Pending Order',
                      isSelected: controller.index == 2,
                    ),
                  ),
                  Tab(
                    child: TabChild(
                      count: appStore.cancelled.length,
                      label: 'Cancelled',
                      isSelected: controller.index == 3,
                    ),
                  ),
                  Tab(
                    child: TabChild(
                      count: appStore.completed.length,
                      label: 'Completed',
                      isSelected: controller.index == 4,
                    ),
                  ),
                ],
              );
            }),
          ),
          UIHelper.verticalSpace(10.0),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Observer(builder: (context) {
                  return AnimatedList(
                    initialItemCount: appStore.allOrders.length,
                    itemBuilder: (context, index, animation) => SlideTransition(
                      position: animation.drive(offset),
                      child: ShipmentCard(
                        data: appStore.allOrders[index],
                      ),
                    ),
                  );
                }),
                AnimatedList(
                  initialItemCount: appStore.inProgress.length,
                  itemBuilder: (context, index, animation) => SlideTransition(
                    position: animation.drive(offset),
                    child: ShipmentCard(
                      data: appStore.inProgress[index],
                    ),
                  ),
                ),
                AnimatedList(
                  initialItemCount: appStore.pending.length,
                  itemBuilder: (context, index, animation) => SlideTransition(
                    position: animation.drive(offset),
                    child: ShipmentCard(
                      data: appStore.pending[index],
                    ),
                  ),
                ),
                AnimatedList(
                  initialItemCount: appStore.cancelled.length,
                  itemBuilder: (context, index, animation) => SlideTransition(
                    position: animation.drive(offset),
                    child: ShipmentCard(
                      data: appStore.cancelled[index],
                    ),
                  ),
                ),
                AnimatedList(
                  initialItemCount: appStore.completed.length,
                  itemBuilder: (context, index, animation) => SlideTransition(
                    position: animation.drive(offset),
                    child: ShipmentCard(
                      data: appStore.completed[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(30.0),
        ],
      ),
    );
  }
}
