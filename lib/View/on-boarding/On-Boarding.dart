// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/View/on-boarding/View-Model/On-Boarding-View-Model.dart';
import 'package:propertynonstop/Widget/AppText/AppHeadingText.dart';
import 'package:propertynonstop/Widget/AppText/AppText.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Placeholder(
            fallbackHeight: 200.0,
            fallbackWidth: double.infinity,
          ),
          const SizedBox(height: 20.0),
          Column(
            children: [
              const AppText(data: 'Hey there,'),
              Container(
                alignment: Alignment.center,
                child: const AppHeadingText(
                    data: 'Welcome to Property Non Stop',
                    fontSize: 17.0,
                    textAlign: TextAlign.start),
              ),
              Container(
                alignment: Alignment.center,
                child: const AppHeadingText(
                    data: 'Let us help you find the right choce!',
                    fontSize: 17.0,
                    textAlign: TextAlign.start),
              ),
              Container(
                  alignment: Alignment.center,
                  child: const AppText(data: 'Choose the options below'))
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: _viewModel
                  .listOptions()
                  .map(
                    (property) => Card(
                      borderOnForeground: true,
                      elevation: 3.0,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        leading: property.icon,
                        title: Container(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              data: property.title,
                              fontWeight: FontWeight.w600,
                            )),
                        subtitle: Container(
                            alignment: Alignment.centerLeft,
                            child: AppText(
                              data: property.subtitle,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      )),
    );
  }
}
