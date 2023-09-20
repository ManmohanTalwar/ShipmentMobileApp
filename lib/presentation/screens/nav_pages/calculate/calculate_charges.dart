import 'package:flutter/material.dart';
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

class _CalculateChargesState extends State<CalculateCharges> {
  late AppStore appStore;

  @override
  Widget build(BuildContext context) {
    appStore = context.watch<AppStore>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              const AnimatedAppBar(
                isNormal: true,
                title: 'Calculate',
              ),
              UIHelper.verticalSpace(10.0),
            ],
          ),
        ],
      ),
    );
  }
}
