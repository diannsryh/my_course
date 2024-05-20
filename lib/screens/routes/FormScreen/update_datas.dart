// import 'dart:io';

// import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:my_course/dto/datas.dart';
// import 'package:my_course/endpoints/endpoints.dart';

// class UpdateDatas extends StatefulWidget {
//   final Datas dataToUpdate; // Replace MyData with your actual data structure

//   const UpdateDatas({Key? key, required this.dataToUpdate}) : super(key: key);

//   @override
//   _UpdateDatasState createState() => _UpdateDatasState();
// }

// class _UpdateDatasState extends State<UpdateDatas> {
//   final _titleController = TextEditingController();
//   String _title = "";

//   File? galleryFile;
//   final picker = ImagePicker();

//   _showPicker({
//     required BuildContext context,
//   }) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Photo Library'),
//                 onTap: () {
//                   getImage(ImageSource.gallery);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_camera),
//                 title: const Text('Camera'),
//                 onTap: () {
//                   getImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future getImage(
//     ImageSource img,
//   ) async {
//     final pickedFile = await picker.pickImage(source: img);
//     XFile? xfilePick = pickedFile;
//     setState(
//       () {
//         if (xfilePick != null) {
//           galleryFile = File(pickedFile!.path);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Nothing is selected')),
//           );
//         }
//       },
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Pre-fill the form with data from dataToUpdate
//     _titleController.text = widget.dataToUpdate.name; // Replace with your property name
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     super.dispose();
//   }

//   Future<void> _putDataWithImage(BuildContext context) async {
//     if (galleryFile == null) {
//       return; // Handle case where no image is selected
//     }

//     var request = MultipartRequest('PUT', Uri.parse(Endpoints.datas(widget.dataToUpdate.idDatas))); // Update URL with ID
//     request.fields['name'] = _titleController.text; // Add other data fields
//     // ... potentially update other fields based on your data structure

//     var multipartFile = await MultipartFile.fromPath(
//       'image',
//       galleryFile!.path,
//     );
//     request.files.add(multipartFile);

//     request.send().then((response) {
//       // Handle response (success or error)
//       if (response.statusCode == 200) {
//         debugPrint('Data and image updated successfully!');
//         Navigator.pop(context); // Assuming you want to pop back after update
//       } else {
//         debugPrint('Error updating data: ${response.statusCode}');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade900,
//       appBar: AppBar(
//         title: null,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         iconTheme: const IconThemeData(color: Colors.white), // recolor the icon
//       ),
//     );
//   }
//       // ignore: sized_box_for_whitespace
//       body: Container(
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Create datas",
//                     style: GoogleFonts.poppins(
//                       fontSize: 32,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   Text(
//                     "Fill the datas below, make sure you add titles and upload the images",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
