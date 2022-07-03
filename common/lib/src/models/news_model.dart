import 'package:collection/collection.dart';

import 'news_message_model.dart';
import 'user_model.dart';

class NewsModel {
  final UserModel? user;
  final NewsMessageModel? message;

  const NewsModel({this.user, this.message});

  @override
  String toString() => 'NewsModel(user: $user, message: $message)';

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
        message: json['message'] == null
            ? null
            : NewsMessageModel.fromJson(
                json['message'] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'message': message?.toJson(),
      };

  NewsModel copyWith({
    UserModel? user,
    NewsMessageModel? message,
  }) {
    return NewsModel(
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NewsModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => user.hashCode ^ message.hashCode;
}
