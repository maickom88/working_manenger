import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class WorkRepositoryImpl implements WorkRepository {
  final DataSourcers dataSourcers;
  WorkRepositoryImpl({@required this.dataSourcers});

  @override
  Future<Either<Failure, List<Working>>> getWorks() async {
    try {
      final result = await dataSourcers.getAllworks();
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> saveWork(Map work) async {
    try {
      final result = await dataSourcers.saveData(work);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteWork(String id) async {
    try {
      final result = await dataSourcers.delete(id);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError(error: e.toString()));
    }
  }
}
