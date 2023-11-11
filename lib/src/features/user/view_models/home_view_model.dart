import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';
import 'package:user_list/src/features/user/models/home_model.dart';
import 'package:user_list/src/features/user/providers/home_provider.dart';
import 'package:user_list/src/routing/app_route.dart';

class HomeViewModel extends Notifier<HomeModel> {
  HomeViewModel();

  @override
  HomeModel build() {
    return const HomeModel();
  }

  List<UserModel> removeDuplicates(List<UserModel> users) {
    var userService = ref.watch(userServiceProvider);
    users = userService.removeDuplicates(users);
    return users;
  }

  void navigateToDetailsView(BuildContext context, UserModel user) {
    ref.read(detailsViewModelProvider.notifier).user = user;
    AppRoute.navigate(context, AppRoute.detailsRoute);
  }
}
