class ProjectModel {
  final String title;
  final String subTitle;
  final List<String> tech;
  final String gitHub;
  final String playStore;
  final List<String> points;
  final String imageURL;

  ProjectModel({
    required this.imageURL,
    required this.title,
    required this.tech,
    required this.subTitle,
    required this.points,
    required this.gitHub,
    required this.playStore,
  });
}
