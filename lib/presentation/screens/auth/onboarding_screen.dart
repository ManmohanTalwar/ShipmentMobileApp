import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/helper/on_boarding.dart';
import 'package:moniepoint_task/helper/sizes_helpers.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/home_page.dart';
import 'package:moniepoint_task/presentation/widgets/custom_button.dart';
import 'package:moniepoint_task/presentation/widgets/slide_tile.dart';
import 'package:moniepoint_task/routes/route_list.dart';
import 'package:moniepoint_task/services/navigation_service.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  ///THIS VARIABLE IS REQUIRED TO CONTROL THE PAGEVIEW
  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 4.0,
      width: isCurrentPage ? 10.0 : 4.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? AppConstants.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: slideIndex,
      keepPage: true,
    );
    locator<AppPrefs>().isFirstOpen.setValue(false);
  }

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<bool>(
      preference: locator<AppPrefs>().isLoggedIn,
      builder: (context, snapshot) {
        ///check if user is logged in or not by using SharedPreference. if user is looged in the it will go to homepage else it will go to intro page
        if (snapshot) {
          return const HomePage();
        }
        return Scaffold(
          backgroundColor: context.white(),
          body: Container(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    UIHelper.verticalSpace(50.0),
                    Container(
                      alignment: Alignment.center,
                      height: displayHeight(context) * 0.45,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (index) {
                          setState(() {
                            slideIndex = index;
                          });
                        },
                        children: <Widget>[
                          SlideTile(
                            imagePath: kOnBoarding[0]['image']!,
                            title: kOnBoarding[0]['title']!,
                            desc: kOnBoarding[0]['desc']!,
                          ),
                          SlideTile(
                            imagePath: kOnBoarding[1]['image']!,
                            title: kOnBoarding[1]['title']!,
                            desc: kOnBoarding[1]['desc']!,
                          ),
                          SlideTile(
                            imagePath: kOnBoarding[2]['image']!,
                            title: kOnBoarding[2]['title']!,
                            desc: kOnBoarding[2]['desc']!,
                          ),
                          // SlideTile(
                          //   imagePath: kOnBoarding[3]['image'],
                          // ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(30.0),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Find best ',
                        style: AppConstants.customNormal(
                          size: 20.0,
                          color: AppConstants.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Shipment Solution \n ',
                            style: AppConstants.customNormal(
                              size: 20.0,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: 'with Us',
                            style: AppConstants.customNormal(
                              size: 20.0,
                              color: AppConstants.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   slideIndex == 0
                    //       ? kOnBoarding[0]['title']!
                    //       : slideIndex == 1
                    //           ? kOnBoarding[1]['title']!
                    //           : kOnBoarding[2]['title']!,
                    //   textAlign: TextAlign.center,
                    //   style: AppConstants.customNormal(
                    //     size: 20.0,
                    //     color: AppConstants.black,
                    //   ),
                    // ),
                    UIHelper.verticalSpace(20.0),
                    SizedBox(
                      width: displayWidth(context) * 0.7,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        child: getDesc(),
                      ),
                    ),
                    UIHelper.verticalSpace(50.0),
                    CustomButton(
                      bg: AppConstants.accentColor,
                      textColor: Colors.white,
                      radius: 20.0,
                      showMargin: true,
                      text: 'Continue',
                      onTap: () {
                        locator<NavigationService>()
                            .navigateReplacementTo(RouteList.home);
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < kOnBoarding.length; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.05,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getDesc() {
    switch (slideIndex) {
      case 0:
        return Text(
          kOnBoarding[0]['desc']!,
          textAlign: TextAlign.center,
          style: AppConstants.customNormal(
            size: 14.0,
            color: AppConstants.black.withOpacity(0.6),
          ),
        ).animate().fadeIn(duration: 500.ms).then().slide(duration: 500.ms);
      case 1:
        return Text(
          kOnBoarding[1]['desc']!,
          textAlign: TextAlign.center,
          style: AppConstants.customNormal(
            size: 14.0,
            color: AppConstants.black.withOpacity(0.6),
          ),
        ).animate().fadeIn(duration: 500.ms).then().slide(duration: 500.ms);
      case 2:
        return Text(
          kOnBoarding[2]['desc']!,
          textAlign: TextAlign.center,
          style: AppConstants.customNormal(
            size: 14.0,
            color: AppConstants.black.withOpacity(0.6),
          ),
        ).animate().fadeIn(duration: 500.ms).then().slide(duration: 500.ms);
      default:
        return Text(
          kOnBoarding[0]['desc']!,
          textAlign: TextAlign.center,
          style: AppConstants.customNormal(
            size: 14.0,
            color: AppConstants.black.withOpacity(0.6),
          ),
        ).animate().fadeIn(duration: 500.ms).then().slide(duration: 500.ms);
    }
  }
}
