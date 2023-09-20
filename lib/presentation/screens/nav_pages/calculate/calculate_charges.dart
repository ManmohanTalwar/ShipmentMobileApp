import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/calculate/widgets/categories_wrapper.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/calculate/widgets/destination_wrapper.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/calculate/widgets/packaging_wrapper.dart';
import 'package:moniepoint_task/presentation/widgets/animated_app_bar.dart';
import 'package:moniepoint_task/presentation/widgets/custom_button.dart';
import 'package:moniepoint_task/routes/route_list.dart';
import 'package:moniepoint_task/services/navigation_service.dart';
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
  late AnimationController destinationController;
  late AnimationController packageController;
  late AnimationController categoryController;
  late AnimationController buttonController;

  @override
  void initState() {
    super.initState();
    appBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    destinationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    packageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    categoryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    super.dispose();
    appBarController.dispose();
    destinationController.dispose();
    packageController.dispose();
    categoryController.dispose();
    buttonController.dispose();
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
          destinationController
            ..reset()
            ..forward(from: 0);
          packageController
            ..reset()
            ..forward(from: 0);
          categoryController
            ..reset()
            ..forward(from: 0);
          buttonController
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
                const SizedBox(
                  height: 10.0,
                ),
                DestinationWrapper(
                  controller: destinationController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                PackagingWrapper(
                  controller: packageController,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CategoriesWrapper(
                  controller: categoryController,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomButton(
                  onTap: () {
                    locator<NavigationService>()
                        .navigateTo(RouteList.estimateScreen);
                  },
                  textColor: context.white(),
                  text: 'Calculate',
                  radius: 24.0,
                  controller: buttonController,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
