import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_course/dto/cs.dart';
import 'package:my_course/dto/datas.dart';
import 'package:my_course/dto/news.dart';
import 'package:my_course/endpoints/endpoints.dart';

class DataService {
  static Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(Endpoints.news));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => News.fromJson(item)).toList();
    } else {
      //handle error
      throw Exception('Failed to load news');
    }
  }

  // static Future<void> sendNews(String title, String body) async {
  //   Map<String, String> newsData = {
  //     "title": title,
  //     "body": body,
  //   };
  //   String jsonData = jsonEncode(newsData);
  //   await http.post(Uri.parse(Endpoints.news),
  //       body: jsonData, headers: {'Content-Type': 'application/json'});
  // }

  static Future<List<Datas>> fetchDatas() async {
    final response = await http.get(Uri.parse(Endpoints.datas));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => Datas.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  static Future<List<CustomerService>> fetchCustomerService() async {
    final response = await http.get(Uri.parse(Endpoints.cs));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return (data['datas'] as List<dynamic>)
          .map((item) => CustomerService.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  //Update
  // static Future<CustomerService> updateCustomerServie(
  //     int idCs,
  //     String titleIssues,
  //     String desciptionIssues,
  //     int rating,
  //     String? imageUrl) async {
  //   final url = Uri.parse('${Endpoints.cs}/$idCs');
  //   debugPrint('idCs: $idCs');
  //   debugPrint('titleIssues: $titleIssues');
  //   debugPrint('descriptionIssues: $desciptionIssues');
  //   debugPrint('rating: $rating');
  //   debugPrint('imageUrl: $imageUrl');

  //   final request = http.MultipartRequest('POST', url);

  //   request.fields['title_issues'] = titleIssues;
  //   request.fields['description_issues'] = desciptionIssues;
  //   request.fields['rating'] = rating.toString();

  //   if (imageUrl != null) {
  //     request.files.add(await http.MultipartFile.fromPath('image', imageUrl));
  //   }

  //   final response = await request.send();
  //   final responseBody = await response.stream.bytesToString();

  //   if (response.statusCode == 200) {
  //     final jsonResponse = jsonDecode(responseBody);
  //     return CustomerService.fromJson(jsonResponse);
  //   } else {
  //     throw Exception('Failed to update data: ${response.statusCode}');
  //   }
  // }

//   static Future<void> deleteDatas(int id) async {
//     await http.delete(Uri.parse('${Endpoints.datas}/$id'),
//         headers: {'Content-type': 'aplication/json'});
//   }

//   static Future<void> updateDatas(String id, String title, String body) async {
//     Map<String, String> data = {"id": id, "title": title, "body": body};
//     String jsonData = jsonEncode(data);
//     await http.put(Uri.parse('${Endpoints.datas}/$id'),
//         body: jsonData, headers: {'Content-type': 'application/json'});
//   }

//   // post data to endpoint news
//   static Future<News> createNews(String title, String body) async {
//     final response = await http.post(
//       Uri.parse(Endpoints.news),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'title': title,
//         'body': body,
//       }),
//     );
//     if (response.statusCode == 201) {
//       // Check for creation success (201 Created)
//       final jsonResponse = jsonDecode(response.body);
//       return News.fromJson(jsonResponse);
//     } else {
//       // Handle error
//       throw Exception('Failed to create post: ${response.statusCode}');
//     }
//   }
// }
}
