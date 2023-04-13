import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/ui/app_config_ui.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: Asuka.builder,
        title: 'Job Timer',
        theme: AppConfigUi.theme,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
       );
  }
}