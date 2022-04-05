import 'package:equatable/equatable.dart';

class BaseModel extends Equatable
{
  final int id;
  final int? createdAt;
  final int? updatedAt;
  final int? deletedAt;

  const BaseModel({
    required this.id,
    this.createdAt = 0,
    this.updatedAt = 0,
    this.deletedAt = 0
  });

  @override
  List<Object?> get props => [id, createdAt, updatedAt, deletedAt];

  factory BaseModel.fromMap(Map<String, dynamic> map)
  {
    return BaseModel(
      id: map['id'],
      createdAt: map['createdAt'] ?? 0,
      updatedAt: map['updatedAt'] ?? 0,
      deletedAt: map['deletedAt'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'deletedAt': deletedAt,
  };
}