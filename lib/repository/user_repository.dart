import 'package:avaliacao_wk_tecnology_crud/models/user.dart';
import 'package:avaliacao_wk_tecnology_crud/repository/parse_errors.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class UserRepository {
  void saveUser(User user) async {
    final parseUser = ParseObject('NewUser');
    parseUser.set<String>('name', user.name);
    parseUser.set<String>('phoneNumber', user.phoneNumber);
    parseUser.set<String>('email', user.email);
    parseUser.set<String>('occupation', user.occupation);
    parseUser.set<String>('imageUrl', user.imageUrl);

    await parseUser.save();
  }

  void updateUser(User user) async {
    final parseUser = ParseObject('NewUser')..objectId = user.id;
    parseUser.set<String>('name', user.name);
    parseUser.set<String>('phoneNumber', user.phoneNumber);
    parseUser.set<String>('email', user.email);
    parseUser.set<String>('occupation', user.occupation);
    parseUser.set<String>('imageUrl', user.imageUrl);

    await parseUser.save();
  }

  Future<Map<String, User>> getUsersList() async {
    final queryBuilder = QueryBuilder(ParseObject('NewUser'));

    final response = await queryBuilder.query();
    if (response.success) {
      var responseMap = <String, User>{};

      var userList = response.results.map((p) => User.fromParse(p)).toList();
      userList.forEach((user) => responseMap.putIfAbsent(user.id, () => user));
      return responseMap;
    } else {
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}
