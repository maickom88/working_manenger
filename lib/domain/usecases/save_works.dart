import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:works_manenger/domain/errors/errors.dart';
import 'package:works_manenger/domain/repositories/repositories.dart';

class SaveWork {
  WorkRepository repository;
  SaveWork({@required this.repository});

  Future<Either<Failure, bool>> saveWork(Map work) async {
    return await repository.saveWork(work);
  }
}
