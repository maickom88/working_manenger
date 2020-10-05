import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../entities/entities.dart';
import '../errors/errors.dart';
import '../repositories/repositories.dart';

class GetWorks {
  WorkRepository repository;
  GetWorks({@required this.repository});

  Future<Either<Failure, List<Working>>> getWorks() async {
    return await repository.getWorks();
  }

  Future<Either<Failure, bool>> deleteWork(String id) async {
    return await repository.deleteWork(id);
  }
}
