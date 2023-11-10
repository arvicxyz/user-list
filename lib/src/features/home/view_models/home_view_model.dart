import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:user_list/src/features/home/models/api/user_model.dart';
import 'package:user_list/src/features/home/models/home_model.dart';
import 'package:user_list/src/features/home/services/user_service.dart';

final homeViewProvider = NotifierProvider<HomeViewModel, HomeModel>(HomeViewModel.new);

class HomeViewModel extends Notifier<HomeModel> {
  late UserService _userService;

  HomeViewModel() {
    _userService = UserService();
  }

  @override
  HomeModel build() {
    return const HomeModel();
  }

  Future getUsers() async {
    List<UserModel>? user = await _userService.getUsers();
    state = state.copyWith(
      user: user,
    );
  }

  String getFormattedDateTime(int? seconds, String format, {bool convertToLocal = true}) {
    var utcTime = DateTime.fromMillisecondsSinceEpoch(
      (seconds ?? 0) * 1000,
      isUtc: true,
    );
    if (convertToLocal) {
      var localTime = utcTime.toLocal();
      return DateFormat(format).format(localTime);
    } else {
      return DateFormat(format).format(utcTime);
    }
  }
}
