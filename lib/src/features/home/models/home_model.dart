import 'package:equatable/equatable.dart';
import 'package:user_list/src/features/home/models/api/user_model.dart';

class HomeModel extends Equatable {
  final List<UserModel>? user;

  const HomeModel({
    this.user,
  });

  HomeModel copyWith({
    List<UserModel>? user,
  }) {
    return HomeModel(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user];
}
