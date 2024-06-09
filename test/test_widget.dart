import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/presentation/pages/task_page.dart';

void main() {
  testWidgets('TrackerPage has a title and a tracker list',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const ProviderScope(child: MaterialApp(home: TaskPage())));

    expect(find.text('Tracker Manager'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
