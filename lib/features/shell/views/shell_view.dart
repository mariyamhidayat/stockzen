import 'package:flutter/material.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../viewmodels/shell_view_model.dart';

class ShellView extends StatelessWidget {
  const ShellView({required this.viewModel, super.key});

  final ShellViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    switch (viewModel.status) {
      case ShellStatus.loading:
        return const LoadingView();
      case ShellStatus.error:
        return ErrorView(message: viewModel.errorMessage!);
      case ShellStatus.ready:
        return const _ShellHome();
    }
  }
}

class _ShellHome extends StatelessWidget {
  const _ShellHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StockZen')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Text(
            'Your shop workspace will open here.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
