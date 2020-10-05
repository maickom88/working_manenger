import 'package:meta/meta.dart';

class WorkingDetails {
  final String status;
  final String hoursWorking;
  final String observation;

  WorkingDetails({
    @required this.status,
    @required this.hoursWorking,
    this.observation,
  });
}
