import 'package:collection/collection.dart';

import '../user_model.dart';

class PostModel {
  final String? id;
  final String? message;
  final UserModel? user;
  final DateTime? editedAt;
  final DateTime? createdAt;

  PostModel({
    this.id,
    this.message,
    this.user,
    this.editedAt,
    this.createdAt,
  });

  @override
  String toString() {
    return 'PostModel(id: $id, message: $message, user: $user, editedAt:'
        ' $editedAt, createdAt: $createdAt)';
  }

  factory PostModel.fromFirestore(String id, Map<String, dynamic> json) {
    return PostModel(
      id: id,
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      editedAt: json['edited_at'] == null
          ? null
          : DateTime.parse(json['edited_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
        editedAt: json['edited_at'] == null
            ? null
            : DateTime.parse(json['edited_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'user': user?.toJson(),
        'edited_at': editedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
      };

  PostModel copyWith({
    String? id,
    String? message,
    UserModel? user,
    DateTime? editedAt,
    DateTime? createdAt,
  }) {
    return PostModel(
      id: id ?? this.id,
      message: message ?? this.message,
      user: user ?? this.user,
      editedAt: editedAt ?? this.editedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PostModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      message.hashCode ^
      user.hashCode ^
      editedAt.hashCode ^
      createdAt.hashCode;
}
