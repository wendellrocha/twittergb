import 'package:collection/collection.dart';
import 'package:dependencies/dependencies.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0, defaultValue: 0)
  final int? userId;

  @HiveField(2)
  final String? name;

  @HiveField(1)
  final String? profilePicture;

  @HiveField(2)
  final String? imagePath;

  @HiveField(3, defaultValue: 'boticario@boticario.com')
  final String? email;

  @HiveField(4)
  final String? password;

  const UserModel({
    this.userId = 0,
    this.name,
    this.profilePicture,
    this.imagePath,
    this.email,
    this.password,
  });

  @override
  String toString() => 'UserModel(id: $userId, name: $name,'
      ' email: $email, profilePicture: $profilePicture)';

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json['userId'] as int?,
        name: json['name'] as String?,
        profilePicture: json['profile_picture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'email': email,
        'profile_picture': profilePicture,
      };

  UserModel copyWith({
    String? name,
    String? profilePicture,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      email: email ?? this.email,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => userId.hashCode ^ name.hashCode ^ profilePicture.hashCode;
}
