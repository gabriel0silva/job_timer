import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/database_impl.dart';
import 'package:job_timer/app/modules/project/project_module.dart';
import 'package:job_timer/app/modules/splash/splash_page.dart';
import 'package:job_timer/app/repositories/projects/project_repositoriy.dart';
import 'package:job_timer/app/repositories/projects/project_repositoriy_impl.dart';
import 'package:job_timer/app/services/auth/auth_service_impl.dart';
import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/services/projects/project_service_impl.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AuthServiceImpl()),
        Bind.lazySingleton((i) => DatabaseImpl()),
        Bind.lazySingleton<ProjectRepository>(
            (i) => ProjectRepositoryImpl(database: i())),
        Bind.lazySingleton<ProjectService>(
            (i) => ProjectServiceImpl(projectRepository: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/project', module: ProjectModule()),
        
      ];
}
