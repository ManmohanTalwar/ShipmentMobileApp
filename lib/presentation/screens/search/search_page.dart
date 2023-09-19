import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:moniepoint_task/helper/Helper.dart';
import 'package:moniepoint_task/helper/ui_helpers.dart';
import 'package:moniepoint_task/main.dart';
import 'package:moniepoint_task/presentation/widgets/entry_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool showList = true;
  List<Map<String, dynamic>> searchData = [
    {
      'shipment_name': 'Macbook Pro M2',
      'shipment_id': '#NE43765875',
      'from': 'Paris',
      'to': 'Morocco'
    },
    {
      'shipment_name': 'Summer Jacket',
      'shipment_id': '#NE44965875',
      'from': 'Barcelona',
      'to': 'Paris'
    },
    {
      'shipment_name': 'Tapered Jeans',
      'shipment_id': '#NE86865875',
      'from': 'Colombia',
      'to': 'Paris'
    },
    {
      'shipment_name': 'Slim Fit Jeans AW',
      'shipment_id': '#NE98765875',
      'from': 'Bogota',
      'to': 'Dhaka'
    },
    {
      'shipment_name': 'Office Desk',
      'shipment_id': '#NE99786875',
      'from': 'France',
      'to': 'Germany'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'Search-Container',
              child: SearchContainer(
                isSearch: true,
                onSearched: (val) {
                  setState(() {
                    showList = false;
                  });
                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      showList = true;
                    });
                  });
                },
              ),
            ),
            if (showList)
              Flexible(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 20.0,
                          offset: const Offset(-4, 0)),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...searchData
                            .map((e) => SearchWidget(
                                  data: e,
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ).animate().fadeIn(duration: 350.ms).then().slideY(
                    duration: 300.ms,
                    begin: 0.3,
                    end: 0,
                  ),
          ],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  final Map data;
  const SearchWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: context.primaryColor(),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.card_giftcard_outlined,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['shipment_name'],
                    style: context.customStyle(
                      color: Colors.black,
                      size: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '${data['shipment_id']} · ${data['from']} -> ${data['to']}',
                    style: context.customStyle(
                      color: Colors.grey,
                      size: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Helper.divider(
            right: 0.0,
            left: 0.0,
            color: context.dividerColor(),
          ),
        ],
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  final bool isSearch;
  final Function(String)? onSearched;
  const SearchContainer({Key? key, this.isSearch = false, this.onSearched})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: context.primaryColor(),
        padding: isSearch ? const EdgeInsets.symmetric(vertical: 12.0) : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSearch) ...{
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: EntryField(
                      hint: 'Enter the receipt number ...',
                      prefixWidget: Icon(
                        Icons.search,
                        color: context.primaryColor(),
                        size: 20.0,
                      ),
                      radius: 24.0,
                      textColor: Colors.grey,
                      onSubmitted: (val) {
                        if (onSearched != null) {
                          onSearched!(val);
                        }
                      },
                      suffixWidget: Container(
                        padding: const EdgeInsets.all(8.0),
                        width: 30.0,
                        margin: const EdgeInsets.only(
                          right: 4.0,
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: context.accentColor(),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.qr_code_scanner_rounded,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                ],
              )
            } else
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                height: 48.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 6.0,
                        ),
                        Icon(
                          Icons.search,
                          color: context.primaryColor(),
                          size: 20.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          'Enter the receipt number ...',
                          style: context.customStyle(
                            color: Colors.grey,
                            size: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: context.accentColor(),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
