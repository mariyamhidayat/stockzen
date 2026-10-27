import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import 'features/shell/viewmodels/shell_view_model.dart';
import 'features/shell/views/stockzen_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ShellViewModel viewModel;
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    viewModel = const ShellViewModel.ready();
  } catch (_) {
    viewModel = const ShellViewModel.error();
  }

  runApp(StockZenApp(viewModel: viewModel));
}
