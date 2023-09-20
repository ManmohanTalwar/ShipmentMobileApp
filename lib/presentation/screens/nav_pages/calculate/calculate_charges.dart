import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/home.dart';
import 'package:moniepoint_task/presentation/widgets/animated_app_bar.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:provider/provider.dart';

class CalculateCharges extends StatefulWidget {
  const CalculateCharges({Key? key}) : super(key: key);

  @override
  State<CalculateCharges> createState() => _CalculateChargesState();
}

class _CalculateChargesState extends State<CalculateCharges>
    with TickerProviderStateMixin {
  late AppStore appStore;

  late AnimationController appBarController;

  @override
  void initState() {
    super.initState();
    appBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    super.dispose();
    appBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appStore = context.watch<AppStore>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Observer(builder: (context) {
        if (appStore.currentIndex == 1) {
          appBarController
            ..reset()
            ..forward(from: 0);
        }
        return CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                AnimatedAppBar(
                  isNormal: true,
                  title: 'Calculate',
                  controller: appBarController,
                ),
                UIHelper.verticalSpace(10.0),
              ],
            ),
          ],
        );
      }),
    );
  }
}
