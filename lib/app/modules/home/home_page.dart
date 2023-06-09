import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/view_models/project_model.dart';
import '../../core/ui/app_config_ui.dart';
import 'controller/home_controller.dart';
import 'widgets/drawer_header_detail.dart';
import 'widgets/header_projects_menu.dart';
import 'widgets/project_tile.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao buscar os projetos').show();
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                BlocSelector<HomeController, HomeState, bool>(
                  bloc: controller,
                  selector: (state) {
                    return state.status == HomeStatus.loading;
                  },
                  builder: (context, show) {
                    return Visibility(
                      visible: show,
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                BlocSelector<HomeController, HomeState, bool>(
                  bloc: controller,
                  selector: (state) {
                    return state.status != HomeStatus.loading;
                  },
                  builder: (context, show) {
                    return Visibility(
                      visible: show,
                      child: InkWell(
                        onTap: () => controller.signOut(),
                        child: const Text('Sair'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text("Projetos"),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              )),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(controller: controller),
              pinned: true,
            ),
            BlocSelector<HomeController, HomeState, bool>(
              bloc: controller,
              selector: (state) => state.status == HomeStatus.loading,
              builder: (context, showLoading) {
                return SliverVisibility(
                  visible: showLoading,
                  sliver: const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: AppConfigUi.primarySwatch,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            BlocSelector<HomeController, HomeState, List<ProjectModel>>(
              bloc: controller,
              selector: (state) => state.projects,
              builder: (context, projects) {
                return SliverList(
                  delegate: SliverChildListDelegate(projects
                      .map((project) => ProjectTile(projectModel: project))
                      .toList()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
