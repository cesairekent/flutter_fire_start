import 'package:flutter_fire_starter/src/models/base_model.dart';

class Model extends BaseModel
{
  final String description;

  const Model({
    id = 0,
    createdAt = 0,
    updatedAt = 0,
    deletedAt = 0,
    required this.description,
  }) : super(id: id, createdAt: createdAt, updatedAt: updatedAt, deletedAt: deletedAt);

  @override
  List<Object?> get props =>
  [
    id,
    createdAt,
    updatedAt,
    deletedAt,
    description
  ];

  factory Model.fromMap(Map<String, dynamic> map)
  {
    return Model(
      id: map['id'] ?? 0,
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      deletedAt: map['deletedAt'] ?? 0,
      description: map['description'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
    'description': description
  };
}