// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heytea_kit/http/dior.dart';
import 'package:heytea_kit/logger.dart';

import '../lib/api/gemi_client.dart';
import '../lib/api/laixin_client.dart';
import '../lib/entity/opening_ad_entity.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Verify Platform version', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that platform version is retrieved.
    expect(
      find.byWidgetPredicate(
        (Widget widget) => widget is Text &&
                           widget.data.startsWith('Running on:'),
      ),
      findsOneWidget,
    );
  });

  test('Factory constructor function test', () async {
    final loggerA = HeyTeaLogger();
    final loggerB = HeyTeaLogger();
    expect(loggerA == loggerB, true);

    final clientA = GemiClient.shared as GemiClient;
    final clientB = GemiClient(Dior.appDio);
    expect(clientA == clientB, true);
  });

  test('dio test', () async {
    LaixinClient.shared()
        .openingAd(5)
        .then(Dior.verifyResponse)
        .then((response) => OpeningAdEntity.fromJson(response.data))
        .then((data) => HeyTeaLogger().d(data.adGroupName))
        .catchError(Dior.handleError);
  });
}
