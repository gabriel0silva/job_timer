part of 'home_controller.dart';

enum HomeStatus {
  initial,
  loading,
  complete,
  failure;
}

class HomeState extends Equatable {
  final List<ProjectModel> projects;
  final HomeStatus status;
  final ProjectStatus projectFilter;
  final String? errorMessage;

  const HomeState._({
    required this.projects,
    required this.status,
    required this.projectFilter,
    this.errorMessage,
  });

  HomeState.initial()
      : this._(
          projects: [],
          projectFilter: ProjectStatus.em_andamento,
          status: HomeStatus.initial,
        );

  @override
  List<Object?> get props => [projects, status, projectFilter];

  HomeState copyWith({
    List<ProjectModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectFilter,
    String? errorMessage
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectFilter: projectFilter ?? this.projectFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
