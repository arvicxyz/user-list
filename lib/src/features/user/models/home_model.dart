import 'package:equatable/equatable.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';

class HomeModel extends Equatable {
  final List<UserModel>? users;

  const HomeModel({this.users});

  HomeModel copyWith({List<UserModel>? users}) {
    return HomeModel(users: users ?? this.users);
  }

  @override
  List<Object?> get props => [users];
}
