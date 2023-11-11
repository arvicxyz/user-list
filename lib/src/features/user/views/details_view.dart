import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list/src/constants/colors.dart';
import 'package:user_list/src/constants/styles.dart';
import 'package:user_list/src/core/extensions/string_extensions.dart';
import 'package:user_list/src/features/user/providers/home_provider.dart';
import 'package:user_list/src/features/user/view_models/details_view_model.dart';
import 'package:user_list/src/widgets/material_app_bar.dart';

class DetailsView extends ConsumerStatefulWidget {
  const DetailsView({super.key});

  @override
  ConsumerState<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends ConsumerState<DetailsView> {
  late DetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(detailsViewModelProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MaterialAppBar(
        title: Text(
          _viewModel.user?.name?.capitalize() ?? "",
          style: StyleConstants.titleTextStyle,
        ),
        overlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorConstants.primaryColor,
      ),
      backgroundColor: ColorConstants.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _viewModel.user?.imageUrl != null
                ? Image.network(
                    _viewModel.user?.imageUrl ?? "",
                    width: double.infinity,
                  )
                : const SizedBox(),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                _viewModel.user?.name ?? "",
                style: StyleConstants.defaultLightTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
