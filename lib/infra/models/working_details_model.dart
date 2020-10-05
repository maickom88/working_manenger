import 'package:meta/meta.dart';

import '../../domain/entities/entities.dart';

class WorkingDetailsModel extends WorkingDetails {
  final String status;
  final String hoursWorking;
  final String observation;

  WorkingDetailsModel({
    @required this.status,
    @required this.hoursWorking,
    this.observation,
  });

  factory WorkingDetailsModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WorkingDetailsModel(
      status: map['status'],
      hoursWorking: map['hoursWorking'],
      observation: map['observation'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'hoursWorking': hoursWorking,
      'observation': observation,
    };
  }
}
