import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/errors/errors.dart';
import '../../infra/datasources/datasources.dart';
import '../../infra/models/models.dart';

class DataSourceWorking implements DataSourcers {
  @override
  Future<List<WorkingModel>> getAllworks() async {
    try {
      FirebaseFirestore instance = FirebaseFirestore.instance;
      final worksCollection = instance.collection('works');
      final querySnapshot = await worksCollection.get();
      List<Map> docs = [];
      querySnapshot.docs.forEach((document) {
        var mapDoc = document.data();
        mapDoc["id"] = document.id;
        docs.add(mapDoc);
      });
      print(docs);
      final result = docs.map((e) => WorkingModel.fromMap(e)).toList();
      return result;
    } catch (e) {
      throw DataSourceError(error: e.toString());
    }
  }

  @override
  Future<bool> saveData(Map work) async {
    try {
      FirebaseFirestore instance = FirebaseFirestore.instance;
      final worksCollection = instance.collection('works');
      final result =
          await worksCollection.add(WorkingModel.fromMap(work).toMap());
      if (result.id.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      throw DataSourceError(error: e.toString());
    }
  }

  @override
  Future<bool> delete(String id) {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    final worksCollection = instance.collection('works');
    return worksCollection.doc(id).delete().then((value) => true);
  }
}
