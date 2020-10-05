import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';

abstract class WorkRepository {
  Future<Either<Failure, List<Working>>> getWorks();
  Future<Either<Failure, bool>> saveWork(Map work);
  Future<Either<Failure, bool>> deleteWork(String id);
}
