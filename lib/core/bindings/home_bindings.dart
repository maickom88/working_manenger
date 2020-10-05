import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../external/datasources/datasource.dart';
import '../../infra/repositories/repositories.dart';
import '../../presentation/pages/home/home.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        GetWorks(
          repository: WorkRepositoryImpl(
            dataSourcers: DataSourceWorking(),
          ),
        ),
      ),
    );
  }
}
