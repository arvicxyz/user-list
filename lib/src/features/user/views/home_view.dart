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
      appBar: const MaterialAppBar(
        title: Text(
          "User List",
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
              return const Center(
                child: Text(
                  'No data available',
                  style: StyleConstants.defaultLightTextStyle,
                ),
              );
            }
          },
          error: (err, stack) {
            var errorMessage = 'Error: $err';
            var stackMessage = 'Stack: $stack';
            Logger.logException(Exception('$errorMessage\n$stackMessage'));
            return Center(
              child: Text(
                'Error: $errorMessage',
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
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      itemCount: users.length,
      itemBuilder: ((context, index) {
        final user = users[index];
        return InkWell(
          onTap: () => _viewModel.navigateToDetailsView(context, user),
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Container(
              padding: const EdgeInsets.all(8),
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
