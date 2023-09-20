import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/widgets/tracking_card.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/widgets/vehicles_wrapper.dart';
import 'package:moniepoint_task/presentation/widgets/animated_app_bar.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AppStore appStore;
  // Adapter ad = ChangeNotifierAdapter(notifier, () => null)
  // ChangeNotifierAdapter adapter = ChangeNotifierAdapter(animated: false,direction: Direction.forward);

  late AnimationController appBarController;
  late AnimationController trackingController;
  late AnimationController vehicleController;

  @override
  void initState() {
    super.initState();
    appBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    trackingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    vehicleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  Widget build(BuildContext context) {
    appStore = context.watch<AppStore>();

    return Observer(builder: (context) {
      if (appStore.currentIndex == 0) {
        appBarController
          ..reset()
          ..forward(from: 0);

        trackingController
          ..reset()
          ..forward(from: 0);
        vehicleController
          ..reset()
          ..forward(from: 0);
      }
      return Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                AnimatedAppBar(
                  isNormal: false,
                  controller: appBarController,
                ),
                UIHelper.verticalSpace(10.0),
                TrackingCard(
                  controller: trackingController,
                ),
                UIHelper.verticalSpace(20.0),
                AvailableVehicles(
                  controller: vehicleController,
                ),
                UIHelper.verticalSpace(50.0),
              ],
            ),
          ],
        ),
      );
    });
  }
}
