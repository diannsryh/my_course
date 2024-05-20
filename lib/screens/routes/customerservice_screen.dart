// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_course/component/assets_image_widget.dart';
// // import 'package:my_course/dto/cs.dart';
// // import 'package:my_course/endpoints/endpoints.dart';
// // import 'package:my_course/screens/routes/FormScreen/form_create.dart';
// // import 'package:my_course/screens/routes/FormScreen/form_update.dart';
// // import 'package:my_course/services/data_service.dart';
// // import 'package:my_course/component/bottom_up_transition.dart';
// // import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class CsScreen extends StatefulWidget {
//   const CsScreen({super.key});

//   @override
//   State<CsScreen> createState() => _CsScreenState();
// }

// class _CsScreenState extends State<CsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Customer Service',
//           style: GoogleFonts.kodchasan(
//             fontSize: 26,
//             fontWeight: FontWeight.w800,
//             color: const Color.fromARGB(255, 140, 31, 236),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const AssetImageWidget(
//                 imagePath: 'assets/images/mobile3.png',
//                 height: 300,
//                 width: 300,
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Text(
//                 'Customer Service',
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//                 textAlign: TextAlign.justify,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromARGB(255, 210, 229, 244)),
//                 child: const Text('Back'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class CsSceen extends StatefulWidget {
// //   const CsSceen({Key? key}) : super(key: key);

// //   @override
// //   State<CsSceen> createState() => _CsSceenState();
// // }

// // class _CsSceenState extends State<CsSceen> {
// //   // Future<List<CustomerService>>? _customerservice;

// //   // void iniState() {
// //   //   super.initState();
// //   //   _customerservice = DataService.fetchCustomerService();
// //   // }

// //   // Function(double)? onRatingUpdate;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Customer Service'),
// //         leading: IconButton(
// //           icon: const Icon(Icons
// //               .arrow_back), // Customize icon (optional)// Customize color (optional)
// //           onPressed: () {
// //             // Your custom back button functionality here
// //             Navigator.pushReplacementNamed(
// //                 context, '/'); // Default back button behavior
// //             // You can add additional actions here (e.g., show confirmation dialog)
// //           },
// //         ),
// //       ),
// //       // body: FutureBuilder<List<CustomerService>>(
// //       //   future: _customerservice,
// //       //   builder: (context, snapshot) {
// //       //     if (snapshot.hasData) {
// //       //       final data = snapshot.data!;
// //       //       return ListView.builder(
// //       //         itemCount: data.length,
// //       //         itemBuilder: (context, index) {
// //       //           final item = data[index];
// //       //           return ListTile(
// //       //             title: Column(
// //       //               crossAxisAlignment: CrossAxisAlignment.start,
// //       //               children: [
// //       //                 Text('Issues Title: ${item.issuesTitle}',
// //       //                     style: GoogleFonts.poppins(
// //       //                       fontSize: 14,
// //       //                       color: const Color.fromARGB(255, 36, 31, 31),
// //       //                       fontWeight: FontWeight.normal,
// //       //                     )),
// //       //                 Text('Issues Description: ${item.issuesDescription}',
// //       //                     style: GoogleFonts.poppins(
// //       //                       fontSize: 12,
// //       //                       color: const Color.fromARGB(255, 36, 31, 31),
// //       //                     )),
// //       //                 RatingBar.builder(
// //       //                     initialRating: 0,
// //       //                     minRating: 1,
// //       //                     direction: Axis.horizontal,
// //       //                     allowHalfRating: true,
// //       //                     itemCount: 5,
// //       //                     itemPadding: EdgeInsets.symmetric(horizontal: 4),
// //       //                     itemBuilder: (context, _) =>
// //       //                         Icon(Icons.star, color: Colors.amber),
// //       //                     onRatingUpdate: (rating) {
// //       //                       print(rating);
// //       //                     }),
// //       //               ],
// //       //             ),
// //       //             subtitle: item.imageUrl != null
// //       //                 ? Row(
// //       //                     children: [
// //       //                       Image.network(
// //       //                         fit: BoxFit.fitWidth,
// //       //                         width: 350,
// //       //                         Uri.parse(
// //       //                                 '${Endpoints.baseURLLive}/public/${item.imageUrl!}')
// //       //                             .toString(),
// //       //                         errorBuilder: (context, error, stackTrace) =>
// //       //                             const Icon(Icons
// //       //                                 .error), // Display error icon if image fails to load
// //       //                       ),
// //       //                     ],
// //       //                   )
// //       //                 : null,
// //       //           );
// //       //         },
// //       //       );
// //       //     } else if (snapshot.hasError) {
// //       //       return Center(child: Text('${snapshot.error}'));
// //       //     }
// //       //     return const Center(child: CircularProgressIndicator());
// //       //   },
// //       // ),
// //       // floatingActionButton: Column(
// //       //   mainAxisAlignment: MainAxisAlignment.end,
// //       //   crossAxisAlignment: CrossAxisAlignment.end,
// //       //   children: [
// //       //     FloatingActionButton(
// //       //       backgroundColor: const Color.fromARGB(255, 54, 40, 176),
// //       //       tooltip: 'Create Issue',
// //       //       onPressed: () {
// //       //         // Navigator.pushNamed(context, '/form-screen');
// //       //         // BottomUpRoute(page: const FormScreen());
// //       //         Navigator.push(context, BottomUpRoute(page: const FormCreate()));
// //       //       },
// //       //       child: const Icon(Icons.add, color: Colors.white, size: 28),
// //       //     ),
// //       //     const SizedBox(height: 10),
// //       //     FloatingActionButton(
// //       //       backgroundColor: const Color.fromARGB(255, 54, 40, 176),
// //       //       tooltip: 'Edit Issue',
// //       //       onPressed: () {
// //       //         // Navigator.pushNamed(context, '/form-screen');
// //       //         // BottomUpRoute(page: const FormScreen());
// //       //         Navigator.push(context, BottomUpRoute(page: const FormUpdate()));
// //       //       },
// //       //       child: const Icon(Icons.edit, color: Colors.white, size: 28),
// //       //     ),
// //       //   ],
// //       // ),
// //     );
// //   }
// // }
