// ignore_for_file: file_names

class PostPropertiesModel {
  final int id;
  final String type;

  PostPropertiesModel({required this.id, required this.type});

  static List<PostPropertiesModel> propertyTypes = <PostPropertiesModel>[
    PostPropertiesModel(id: 1, type: 'Owner'),
    PostPropertiesModel(id: 2, type: 'Broker'),
    PostPropertiesModel(id: 3, type: 'Builder'),
  ];
}
