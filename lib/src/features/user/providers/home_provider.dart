import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';
import 'package:user_list/src/features/user/models/details_model.dart';
import 'package:user_list/src/features/user/models/home_model.dart';
import 'package:user_list/src/features/user/services/user_service.dart';
import 'package:user_list/src/features/user/services/user_service_impl.dart';
import 'package:user_list/src/features/user/view_models/details_view_model.dart';
import 'package:user_list/src/features/user/view_models/home_view_model.dart';

// Home

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeModel>(HomeViewModel.new);
final detailsViewModelProvider = NotifierProvider<DetailsViewModel, DetailsModel>(DetailsViewModel.new);

// User

final userFutureProvider = FutureProvider.autoDispose<List<UserModel>?>((ref) async {
  final userService = ref.watch(userServiceProvider);
  return userService.getUsers();
});

final userServiceProvider = Provider<IUserService>((ref) {
  return UserServiceImpl();
});
