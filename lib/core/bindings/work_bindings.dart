import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../external/datasources/datasource.dart';
import '../../infra/repositories/repositories.dart';
import '../../presentation/pages/work/work.dart';

class WorkBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkController>(
      () => WorkController(
        SaveWork(
          repository: WorkRepositoryImpl(
            dataSourcers: DataSourceWorking(),
          ),
        ),
      ),
    );
  }
}
