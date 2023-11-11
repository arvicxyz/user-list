import 'package:user_list/src/features/user/models/api/user_model.dart';

abstract class IUserService {
  Future<List<UserModel>> getUsers();
  List<UserModel> removeDuplicates(List<UserModel> users);
}
