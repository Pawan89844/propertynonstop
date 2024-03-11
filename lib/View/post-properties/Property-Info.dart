// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:propertynonstop/View/post-properties/View-Model/Post-Properties-View-Model.dart';
import 'package:propertynonstop/Widget/AppButtons/AppElevatedButton.dart';
import 'package:propertynonstop/Widget/AppInputField/AppInputField.dart';
import 'package:propertynonstop/Widget/AppText/AppText.dart';

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stepper(
            elevation: 0.2,
            physics: const BouncingScrollPhysics(),
            type: StepperType.horizontal,
            controlsBuilder: (context, details) {
              return AppElevatedButton(
                onPressed: () {},
                data: 'Next',
              );
            },
            steps: [
              const Step(
                  title: AppText(data: 'Property Details'),
                  content: StepPropertyDetails()),
              Step(
                  title: const AppText(data: 'Price Details'),
                  content: Container()),
            ]),
      ),
    );
  }
}

class StepPropertyDetails extends StatefulWidget {
  const StepPropertyDetails({super.key});

  @override
  State<StepPropertyDetails> createState() => _StepPropertyDetailsState();
}

class _StepPropertyDetailsState extends State<StepPropertyDetails> {
  final PostPropertiesViewModel _viewModel = PostPropertiesViewModel();
  int? _selectedType;
  int? _selectedBHK;
  int? _selectedFurnishedType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const AppText(data: 'Property Type'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: _viewModel
                .propertyTypes()
                .map((types) => Row(
                      children: [
                        Radio(
                          value: types.id,
                          groupValue: _selectedType,
                          onChanged: (propType) {
                            _selectedType = propType;
                            setState(() {});
                          },
                        ),
                        AppText(data: types.name)
                      ],
                    ))
                .toList(),
          ),
        ),
        const AppInputField(hintText: 'Building/Project/Society'),
        const SizedBox(height: 8.0),
        const AppInputField(hintText: 'Locality'),
        // const SizedBox(height: 8.0),
        Visibility(
          visible: _selectedType != null && _selectedType! > 1 ? true : false,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: AppInputField(hintText: 'Built Up Area'),
          ),
        ),
        Visibility(
          visible: _selectedType != null && _selectedType! > 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const AppText(data: 'BHK'),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: _viewModel
                        .propertyBHK()
                        .map((propBHK) => Row(
                              children: [
                                Radio(
                                  value: propBHK.id,
                                  groupValue: _selectedBHK,
                                  onChanged: (propSize) {
                                    _selectedBHK = propSize;
                                    setState(() {});
                                  },
                                ),
                                AppText(data: propBHK.bhk)
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(height: 8.0),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical:
                  _selectedType != null && _selectedType! > 1 ? 0.0 : 8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const AppText(data: 'Furnish Type'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: _viewModel
                      .furnishType()
                      .map((fType) => Row(
                            children: [
                              Radio(
                                value: fType.id,
                                groupValue: _selectedFurnishedType,
                                onChanged: (propSize) {
                                  _selectedBHK = propSize;
                                  setState(() {});
                                },
                              ),
                              AppText(data: fType.type)
                            ],
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
