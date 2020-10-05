import '../models/models.dart';

abstract class DataSourcers {
  Future<List<WorkingModel>> getAllworks();
  Future<bool> saveData(Map work);
  Future<bool> delete(String id);
}
