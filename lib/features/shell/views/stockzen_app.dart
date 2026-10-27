import 'package:flutter/material.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/theme/app_theme.dart';
import '../viewmodels/shell_view_model.dart';
import 'shell_view.dart';

class StockZenApp extends StatelessWidget {
  const StockZenApp({required this.viewModel, super.key});

  final ShellViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockZen',
      theme: AppTheme.light(),
      initialRoute: AppRoutes.shell,
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => ShellView(viewModel: viewModel),
        );
      },
    );
  }
}
