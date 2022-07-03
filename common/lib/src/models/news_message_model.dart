import 'package:collection/collection.dart';

class NewsMessageModel {
  final String? content;
  final DateTime? createdAt;

  const NewsMessageModel({this.content, this.createdAt});

  @override
  String toString() =>
      'NewsMessageModel(content: $content, createdAt: $createdAt)';

  factory NewsMessageModel.fromJson(Map<String, dynamic> json) =>
      NewsMessageModel(
        content: json['content'] as String?,
        createdAt: json['created_at'] == null
            ? DateTime.now().subtract(
                const Duration(seconds: 15),
              )
            : DateTime.parse(
                json['created_at'] as String,
              ).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'created_at': createdAt,
      };

  NewsMessageModel copyWith({
    String? content,
    DateTime? createdAt,
  }) {
    return NewsMessageModel(
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! NewsMessageModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => content.hashCode ^ createdAt.hashCode;
}
