import 'package:flutter_test/flutter_test.dart';

import 'package:works_manenger/domain/entities/entities.dart';
import 'package:works_manenger/external/datasources/datasource.dart';

Future<void> main() async {
  DataSourceWorking dataSourceWorking;
  setUp(() async {
    dataSourceWorking = DataSourceWorking();
  });
  test('Should return List Workig Model', () async {
    final result = await dataSourceWorking.getAllworks();
    print(result);
    expect(result, isA<List<Working>>());
  });
}
