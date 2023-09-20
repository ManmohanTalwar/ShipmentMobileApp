import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/helper/Helper.dart';
import 'package:moniepoint_task/helper/app_constants.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/screens/nav_pages/home/widgets/information_card.dart';
import 'package:moniepoint_task/presentation/widgets/entry_field.dart';
import 'package:moniepoint_task/presentation/widgets/prefix_icon_widget.dart';

class DestinationWrapper extends StatefulWidget {
  final AnimationController controller;
  const DestinationWrapper({
    super.key,
    required this.controller,
  });

  @override
  State<DestinationWrapper> createState() => _DestinationWrapperState();
}

class _DestinationWrapperState extends State<DestinationWrapper> {
  final TextEditingController senderLocationController =
      TextEditingController();
  final TextEditingController receiverLocationController =
      TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final FocusNode senderNode = FocusNode();
  final FocusNode receiverNode = FocusNode();
  final FocusNode weightNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    senderLocationController.dispose();
    receiverLocationController.dispose();
    weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 12.0,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Destination',
            style: context.customStyle(
              color: context.black(),
              size: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12.0),
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 20.0,
                  offset: const Offset(-4, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EntryField(
                  controller: senderLocationController,
                  focusNode: senderNode,
                  hint: 'Sender Location',
                  bgColor: context.greyBgColor(),
                  radius: 8.0,
                  prefixWidget: const PrefixIconWidget(
                    icon: Icons.drive_folder_upload_rounded,
                  ),
                  onSubmitted: (val) {
                    FocusScope.of(context).requestFocus(receiverNode);
                  },
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  borderColor: Colors.transparent,
                  hintColor: darkGreyColor!,
                  hintWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                EntryField(
                  controller: receiverLocationController,
                  focusNode: receiverNode,
                  hint: 'Receiver Location',
                  bgColor: context.greyBgColor(),
                  radius: 8.0,
                  prefixWidget: const PrefixIconWidget(
                    icon: Icons.drive_folder_upload_rounded,
                  ),
                  onSubmitted: (val) {
                    FocusScope.of(context).requestFocus(weightNode);
                  },
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  borderColor: Colors.transparent,
                  hintColor: darkGreyColor!,
                  hintWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                EntryField(
                  controller: weightController,
                  focusNode: weightNode,
                  hint: 'Approx Weight',
                  bgColor: context.greyBgColor(),
                  radius: 8.0,
                  prefixWidget: const PrefixIconWidget(
                    icon: Icons.monitor_weight_outlined,
                  ),
                  onSubmitted: (val) {
                    weightNode.unfocus();
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  borderColor: Colors.transparent,
                  hintColor: darkGreyColor!,
                  hintWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate(controller: widget.controller)
        .fadeIn(duration: 250.ms)
        .then()
        .slideY(
          begin: 0.2,
          end: 0,
          duration: 350.ms,
        );
  }
}
