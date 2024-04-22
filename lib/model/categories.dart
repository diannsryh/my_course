enum CategoriesStatus { uiUx, webDev, dataAnalyst, computerNet, cloudComputing }

class CourseCategories {
  final int id;
  final String title;
  final String lecture;
  final String fee;
  final CategoriesStatus status;

  CourseCategories({
    required this.id,
    required this.title,
    required this.lecture,
    required this.fee,
    required this.status,
  });
}
