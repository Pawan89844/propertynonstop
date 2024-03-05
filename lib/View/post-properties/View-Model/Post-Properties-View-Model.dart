// ignore_for_file: file_names

import 'package:propertynonstop/View/post-properties/Model/Post-Properties-Model.dart';

class PostPropertiesViewModel {
  int selectedType = 0;
  List<PostPropertiesModel> properties() => PostPropertiesModel.propertyTypes;
}
