import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list/src/constants/colors.dart';
import 'package:user_list/src/constants/dimens.dart';
import 'package:user_list/src/constants/styles.dart';
import 'package:user_list/src/core/logger.dart';
import 'package:user_list/src/features/user/models/api/user_model.dart';
import 'package:user_list/src/features/user/providers/home_provider.dart';
import 'package:user_list/src/features/user/view_models/home_view_model.dart';
import 'package:user_list/src/localization/app_locale.dart';
import 'package:user_list/src/widgets/material_app_bar.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(homeViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    var usersAsync = ref.watch(userFutureProvider);
    return Scaffold(
      appBar: MaterialAppBar(
        title: Text(
          AppLocale.of(context).userList,
          style: StyleConstants.titleTextStyle,
        ),
        overlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorConstants.primaryColor,
      ),
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: usersAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (users) {
            if (users != null) {
              var uniqueUsers = _viewModel.removeDuplicates(users);
              return _buildUserList(uniqueUsers);
            } else {
              return Center(
                child: Text(
                  AppLocale.of(context).noDataAvailable,
                  style: StyleConstants.defaultLightTextStyle,
                ),
              );
            }
          },
          error: (err, stack) {
            var errorMessage = '${AppLocale.of(context).error} $err';
            var stackMessage = '${AppLocale.of(context).stack} $stack';
            Logger.logException(Exception('$errorMessage\n$stackMessage'));
            return Center(
              child: Text(
                '${AppLocale.of(context).error} $errorMessage',
                style: StyleConstants.defaultLightTextStyle,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildUserList(List<UserModel> users) {
    return ListView.builder(
      padding: DimenConstants.userListPadding,
      itemCount: users.length,
      itemBuilder: ((context, index) {
        final user = users[index];
        return InkWell(
          onTap: () => _viewModel.navigateToDetailsView(context, user),
          child: Card(
            margin: DimenConstants.userListCardMargin,
            child: Container(
              padding: DimenConstants.userListCardPadding,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        user.imageUrl ?? "",
                      ),
                    ),
                  ),
                  const SizedBox(width: DimenConstants.largeSpacing),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user.name ?? "",
                        style: StyleConstants.defaultLightTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
