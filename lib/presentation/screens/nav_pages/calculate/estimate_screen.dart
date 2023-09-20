import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/widgets/custom_button.dart';
import 'package:moniepoint_task/services/navigation_service.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:provider/provider.dart';

class EstimateScreen extends StatefulWidget {
  const EstimateScreen({Key? key}) : super(key: key);

  @override
  State<EstimateScreen> createState() => _EstimateScreenState();
}

class _EstimateScreenState extends State<EstimateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MoveMate',
                  style: context.customStyle(
                    color: context.primaryColor(),
                    fontWeight: FontWeight.bold,
                    size: 30.0,
                    style: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                SvgPicture.asset(
                  'assets/svg/icons/truck.svg',
                  color: context.accentColor(),
                  width: 50.0,
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
            Image.asset('assets/images/parcel.png'),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'Total Estimate Amount',
              style: context.customStyle(
                color: context.black(),
                fontWeight: FontWeight.w500,
                size: 24.0,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Countup(
              begin: 0,
              end: 1599,
              duration: const Duration(milliseconds: 1200),
              separator: ',',
              prefix: '\$',
              suffix: ' USD',
              style: context.customStyle(
                size: 22.0,
                color: context.greenTextColor(),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
              ),
              child: Text(
                'This amount is estimated. This will vary if you change your location or weight',
                textAlign: TextAlign.center,
                style: context.customStyle(
                  color: context.darkTextColor(),
                  fontWeight: FontWeight.w500,
                  size: 14.0,
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            CustomButton(
              onTap: () {
                context.read<AppStore>().changeTab(index: 0);
                locator<NavigationService>().goBack();
              },
              textColor: context.white(),
              text: 'Back to home',
              radius: 24.0,
            ),
            const SizedBox(
              height: 60.0,
            ),
          ],
        )
            .animate()
            .fadeIn(duration: 350.ms)
            .then()
            .slideY(begin: 0.5, end: 0, duration: 250.ms)
            .fadeIn(duration: 350.ms),
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$1559 USD',
      style: context.customStyle(
        size: 22.0,
        color: context.greenTextColor(),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
