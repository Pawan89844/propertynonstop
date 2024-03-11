// ignore_for_file: file_names

import 'package:propertynonstop/View/post-properties/Model/Post-Properties-Model.dart';

import '../Model/Property-Type-Model.dart';

class PostPropertiesViewModel {
  int selectedType = 0;
  List<PostPropertiesModel> properties() => PostPropertiesModel.propertyTypes;
  List<PropertyTypeModel> propertyTypes() => PropertyTypeModel.types;
  List<PropertyBHK> propertyBHK() => PropertyTypeModel.bhk;
  List<FurnishType> furnishType() => PropertyTypeModel.furnishType;
}
