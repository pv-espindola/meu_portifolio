
import '../enums.dart';

class PostModel {
  String? id;
  String name;
  String role;
  String email;
  String message;
  PostType type;
  DateTime creationDate;

  PostModel({
    this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.message,
    required this.type,
    required this.creationDate,
  });

  factory PostModel.empty() => PostModel(
      name: '',
      role: '',
      email: '',
      message: '',
      type: PostType.note,
      creationDate: DateTime.now());

  Map<String, dynamic> toMap() {
    return {
      jsonName: name,
      jsonRole: role,
      jsonEmail: email,
      jsonMessage: message,
      jsonType: type.name,
      jsonCreationDate: creationDate.toIso8601String()
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
        id: map['id'],
        name: map[jsonName] as String,
        role: map[jsonRole] as String,
        email: map[jsonEmail] as String,
        message: map[jsonMessage] as String,
        type: _getPostType(map[jsonType]),
        creationDate: DateTime.parse(map[jsonCreationDate]));
  }

  static PostType _getPostType(String value) {
    switch (value) {
      case 'question':
        return PostType.question;
      case 'challenge':
        return PostType.challenge;
      default:
        return PostType.note;
    }
  }

  PostModel copyWith({
    String? name,
    String? role,
    String? email,
    String? message,
    PostType? type,
    DateTime? creationDate,
  }) {
    return PostModel(
      id: id,
      name: name ?? this.name,
      role: role ?? this.role,
      email: email ?? this.email,
      message: message ?? this.message,
      type: this.type,
      creationDate: creationDate ?? this.creationDate,
    );
  }
}

const String jsonName = 'name';
const String jsonRole = 'role';
const String jsonEmail = 'email';
const String jsonMessage = 'message';
const String jsonType = 'type';
const String jsonCreationDate = 'creation_date';
