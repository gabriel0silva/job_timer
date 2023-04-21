import '../entities/project.dart';
import '../entities/project_status.dart';
import 'project_task_model.dart';

class ProjectModel {
  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> task;

  ProjectModel(
      {this.id,
      required this.name,
      required this.estimate,
      required this.status,
      required this.task});

  factory ProjectModel.fromEntity(Project project) {

    project.tasks.loadSync();

    return ProjectModel(
      id: project.id,
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      task: project.tasks.map(ProjectTaskModel.fromEntity).toList(),
    );
  }
}
