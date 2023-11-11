import 'dart:convert';
import 'package:user_list/src/constants/api.dart';
import 'package:user_list/src/core/extensions/list_extensions.dart';
import 'package:user_list/src/core/logger.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';
import 'package:user_list/src/features/user/services/user_service.dart';
import 'package:http/http.dart' as http;

class UserServiceImpl implements IUserService {
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.userEndpoint}');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> result = (json.decode(response.body) as List)
            .map((data) => UserModel.fromJson(data))
            .toList();
        return result;
      }
    } on Exception catch (e) {
      Logger.logException(e);
    }
    return List.empty();
  }

  @override
  List<UserModel> removeDuplicates(List<UserModel> users) {
    return users.removeDuplicates((x) => x.id);
  }
}
