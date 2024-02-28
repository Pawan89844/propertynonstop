// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OnBoardingModel<T> {
  final String id;
  final T icon;
  final String title;
  final String subtitle;

  OnBoardingModel(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.id});

  static List<OnBoardingModel> options = <OnBoardingModel>[
    OnBoardingModel(
        id: 'home',
        icon: const Icon(Icons.search),
        title: 'Home Search',
        subtitle: 'Buy or Rent'),
    OnBoardingModel(
        id: 'post-property',
        icon: const Icon(Icons.currency_rupee),
        title: 'Post your property',
        subtitle: 'Sell or Rent out your home'),
  ];
}
