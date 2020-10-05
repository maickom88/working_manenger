import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';
import 'models.dart';

class WorkingModel extends Working {
  final String id;
  final String dataWorking;
  final String hoursWorking;
  final String description;
  final List<WorkingDetailsModel> workingDetails;

  WorkingModel({
    @required this.id,
    @required this.dataWorking,
    @required this.hoursWorking,
    this.description,
    @required this.workingDetails,
  });

  factory WorkingModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WorkingModel(
      id: map['id'],
      dataWorking: map['dataWorking'],
      hoursWorking: map['hoursWorking'],
      description: map['description'],
      workingDetails: List<WorkingDetailsModel>.from(
          map['workingDetails']?.map((x) => WorkingDetailsModel.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dataWorking': dataWorking,
      'hoursWorking': hoursWorking,
      'description': description,
      'workingDetails': workingDetails?.map((x) => x?.toMap())?.toList(),
    };
  }
}
