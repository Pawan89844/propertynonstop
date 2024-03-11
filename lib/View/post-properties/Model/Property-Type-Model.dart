// ignore_for_file: file_names

class PropertyTypeModel {
  final int id;
  final String name;

  PropertyTypeModel({required this.id, required this.name});

  static List<PropertyTypeModel> types = <PropertyTypeModel>[
    PropertyTypeModel(id: 1, name: 'Apartment'),
    PropertyTypeModel(id: 2, name: 'Independent Floor'),
    PropertyTypeModel(id: 3, name: 'Independent House'),
    PropertyTypeModel(id: 4, name: 'Villa'),
  ];

  static List<PropertyBHK> bhk = <PropertyBHK>[
    PropertyBHK(1, '1 RK'),
    PropertyBHK(2, '1 BHK'),
    PropertyBHK(3, '2 BHK'),
    PropertyBHK(4, '3+ BHK'),
  ];

  static List<FurnishType> furnishType = <FurnishType>[
    FurnishType(1, 'Fully Furnished'),
    FurnishType(2, 'Semi Furnished'),
    FurnishType(3, 'Unfurnished'),
  ];
}

class PropertyBHK {
  final int id;
  final String bhk;

  PropertyBHK(this.id, this.bhk);
}

class FurnishType {
  final int id;
  final String type;

  FurnishType(this.id, this.type);
}
