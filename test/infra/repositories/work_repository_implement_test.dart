import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:works_manenger/core/errors/errors.dart';
import 'package:works_manenger/domain/errors/errors.dart';
import 'package:works_manenger/infra/datasources/datasources.dart';
import 'package:works_manenger/infra/models/models.dart';
import 'package:works_manenger/infra/repositories/repositories.dart';

class DataSourcersSpy extends Mock implements DataSourcers {}

class FailureSpy extends Mock implements Failure {}

void main() {
  DataSourcersSpy sourcersSpy;
  WorkRepositoryImpl sut;

  setUp(() {
    sourcersSpy = DataSourcersSpy();
    sut = WorkRepositoryImpl(dataSourcers: sourcersSpy);
  });
  test('Should call method datasources', () async {
    await sut.getWorks();
    verify(sourcersSpy.getAllworks()).called(1);
  });
  test('Should return DataSourceError if error occurs', () async {
    when(sourcersSpy.getAllworks()).thenThrow(Exception);

    final result = await sut.getWorks();
    expect(result.fold(id, id), isA<DataSourceError>());
  });
  test('Should return List WorkingModel', () async {
    when(sourcersSpy.getAllworks()).thenAnswer((_) async => <WorkingModel>[]);

    final result = await sut.getWorks();
    expect(result | null, isA<List<WorkingModel>>());
    expect(result.isRight(), true);
  });
}
