import 'package:meta/meta.dart';

import 'entities.dart';

class Working {
  final String dataWorking;
  final String id;
  final String hoursWorking;
  final String description;
  final List<WorkingDetails> workingDetails;

  Working({
    @required this.id,
    @required this.dataWorking,
    @required this.hoursWorking,
    this.description,
    @required this.workingDetails,
  });
}
