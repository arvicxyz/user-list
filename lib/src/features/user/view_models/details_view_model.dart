import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';
import 'package:user_list/src/features/user/models/details_model.dart';

class DetailsViewModel extends Notifier<DetailsModel> {
  DetailsViewModel();

  @override
  DetailsModel build() {
    return const DetailsModel();
  }

  UserModel? get user => state.user;
  set user(UserModel? user) => state = state.copyWith(user: user);
}
