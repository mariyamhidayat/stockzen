import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockzen/features/shell/viewmodels/shell_view_model.dart';
import 'package:stockzen/features/shell/views/stockzen_app.dart';

void main() {
  testWidgets('shell shows the home placeholder', (tester) async {
    await tester.pumpWidget(
      const StockZenApp(viewModel: ShellViewModel.ready()),
    );

    expect(find.text('StockZen'), findsOneWidget);
    expect(find.text('Your shop workspace will open here.'), findsOneWidget);
  });

  testWidgets('shell shows a loading indicator', (tester) async {
    await tester.pumpWidget(
      const StockZenApp(viewModel: ShellViewModel.loading()),
    );

    expect(find.text('Loading'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shell shows a startup error', (tester) async {
    await tester.pumpWidget(
      const StockZenApp(viewModel: ShellViewModel.error()),
    );

    expect(find.text('StockZen could not start.'), findsOneWidget);
  });
}
