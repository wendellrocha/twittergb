import 'package:collection/collection.dart';

class UserModel {
  final String? userId;
  final String? name;
  final String? profilePicture;
  final String? email;
  final String? password;

  const UserModel({
    this.userId,
    this.name,
    this.profilePicture,
    this.email = 'boticario@boticario.com',
    this.password,
  });

  @override
  String toString() => 'UserModel(id: $userId, name: $name,'
      ' email: $email, profilePicture: $profilePicture)';

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json['userId'] as String?,
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
    String? userId,
    String? name,
    String? profilePicture,
    String? email,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
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
  int get hashCode =>
      userId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      profilePicture.hashCode;
}
