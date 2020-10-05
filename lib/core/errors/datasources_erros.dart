import '../../domain/errors/errors.dart';

class DataSourceError implements Failure {
  final String error;

  DataSourceError({this.error});
}
