// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/View/post-properties/View-Model/Post-Properties-View-Model.dart';
import 'package:propertynonstop/Widget/AppInputField/AppInputField.dart';
import 'package:propertynonstop/Widget/AppText/AppHeadingText.dart';
import 'package:propertynonstop/Widget/AppText/AppText.dart';

class PostProperties extends StatefulWidget {
  const PostProperties({super.key});

  @override
  State<PostProperties> createState() => _PostPropertiesState();
}

class _PostPropertiesState extends State<PostProperties> {
  PostPropertiesViewModel propertiesViewModel = PostPropertiesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          Card(
            margin: const EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const AppHeadingText(
                        data: 'Posting as?', fontSize: 16.0),
                  ),
                  Row(
                    children: propertiesViewModel
                        .properties()
                        .map((property) => Row(
                              children: [
                                Radio(
                                    value: property.id,
                                    groupValue:
                                        propertiesViewModel.selectedType,
                                    onChanged: (value) {
                                      propertiesViewModel.selectedType =
                                          value as int;
                                      setState(() {});
                                    }),
                                AppText(data: property.type)
                              ],
                            ))
                        .toList(),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: const AppHeadingText(
                          data: 'Select your city', fontSize: 16.0)),
                  const SizedBox(height: 10.0),
                  const AppInputField(hintText: 'Search your city here'),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
