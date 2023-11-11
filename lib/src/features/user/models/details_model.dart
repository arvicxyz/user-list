import 'package:equatable/equatable.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';

class DetailsModel extends Equatable {
  final UserModel? user;

  const DetailsModel({this.user});

  DetailsModel copyWith({UserModel? user}) {
    return DetailsModel(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
