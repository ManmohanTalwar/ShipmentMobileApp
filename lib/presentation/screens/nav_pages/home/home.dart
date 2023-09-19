import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_task/helper/app_prefs.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/widgets/custom_app_bar.dart';
import 'package:moniepoint_task/store/app_store.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AppStore appStore;
  List<Widget> trackerList = [];
  @override
  Widget build(BuildContext context) {
    appStore = context.watch<AppStore>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 12.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          text: 'Hi! \n',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Manmohan',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage('assets/images/profile_picture.png'),
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpace(30.0),
            ],
          ),
        ),
      ),
    );
  }
}
