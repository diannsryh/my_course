class CustomerService {
  //Mengkonversi data dari json
  int idCs;
  String nim;
  String titleIssues;
  String descriptionIssues;
  int rating;
  String? imageUrl;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  CustomerService(
      {required this.idCs,
      required this.nim,
      required this.titleIssues,
      required this.descriptionIssues,
      required this.rating,
      this.imageUrl,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  factory CustomerService.fromJson(Map<String, dynamic> json) =>
      CustomerService(
          idCs: json['id_customer_service'],
          nim: json['nim'],
          titleIssues: json['title_issues'],
          descriptionIssues: json['description_issues'],
          rating: json['rating'],
          imageUrl: json['image_url'],
          createdAt: DateTime.parse(json['created_at']),
          updatedAt: DateTime.parse(json['updated_at']),
          deletedAt: json['deleted_at']
          // ? DateTime.parse(json['deleted_at'] as String)
          // : null,
          );
}
