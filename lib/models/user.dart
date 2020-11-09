import 'package:parse_server_sdk/parse_server_sdk.dart';

class User {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final String occupation;
  final String imageUrl;
  User({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.occupation,
    this.imageUrl,
  });

  User.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        name = parseObject.get('name'),
        phoneNumber = parseObject.get('phoneNumber'),
        email = parseObject.get('email'),
        occupation = parseObject.get('occupation'),
        imageUrl = parseObject.get('imageUrl');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'occupation': occupation,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, phoneNumber: $phoneNumber, email: $email, occupation: $occupation, imageUrl: $imageUrl}';
  }
}
