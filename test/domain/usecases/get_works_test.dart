import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:works_manenger/domain/entities/entities.dart';
import 'package:works_manenger/domain/errors/errors.dart';
import 'package:works_manenger/domain/repositories/repositories.dart';
import 'package:works_manenger/domain/usecases/usecases.dart';

class WorkRepositorySpy extends Mock implements WorkRepository {}

class FailureSpy extends Mock implements Failure {}

void main() {
  FailureSpy failure;
  WorkRepositorySpy repository;
  GetWorks sut;

  setUp(() {
    failure = FailureSpy();
    repository = WorkRepositorySpy();
    sut = GetWorks(repository: repository);
  });
  test('Should call reporitory with correct method', () async {
    await sut.getWorks();
    verify(repository.getWorks()).called(1);
  });
  test('Should return List the Working if is correct', () async {
    when(repository.getWorks()).thenAnswer((_) async => Right(<Working>[]));
    final result = await sut.getWorks();
    expect(result | null, isA<List<Working>>());
  });
  test('Should return Failure if an error occurs ', () async {
    when(repository.getWorks()).thenAnswer((_) async => Left(failure));
    final result = await sut.getWorks();
    expect(result.isLeft(), true);
    expect(result.fold(id, id), failure);
  });
}
