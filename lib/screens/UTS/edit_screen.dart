import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_course/screens/UTS/cs_screen.dart';
// import 'package:my_course/services/data_service.dart';
import 'package:my_course/dto/cs.dart';
import 'package:my_course/endpoints/endpoints.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required this.editCs}) : super(key: key);
  final CustomerService editCs;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _titleController = TextEditingController();
  String _title = "";

  final _descriptionController = TextEditingController();
  String _description = "";

  final _ratingController = TextEditingController();
  int _rating = 0;

  File? galleryFile;
  final picker = ImagePicker();

  _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.editCs.titleIssues;
    _descriptionController.text = widget.editCs.descriptionIssues;
    _ratingController.text = widget.editCs.rating
        .toString(); //menggunakan toString karena tipe data ratingadalah integer
  }

  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  saveData() {
    debugPrint(_title);
    debugPrint(_description);
  }

  Future<void> _updateCustomerService(BuildContext context) async {
    if (galleryFile == null) {
      return;
    }

    var request = MultipartRequest(
        'POST', Uri.parse('${Endpoints.cs}/${widget.editCs.idCs}'));
    request.fields['title_issues'] = _titleController.text;
    request.fields['description_issues'] = _descriptionController.text;
    request.fields['rating'] = _ratingController.text.toString();

    var multipartFile = await MultipartFile.fromPath(
      'image',
      galleryFile!.path,
    );
    request.files.add(multipartFile);

    request.send().then((response) {
      //hande response success or error
      if (response.statusCode == 200) {
        debugPrint('Issue edited successfully');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const CsScreen()));
      } else {
        debugPrint('Error: ${response.statusCode}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Issue'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/cs-screen'); // Default back button behavior
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Issue Title',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 102, 7, 128)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Issue Description',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 102, 7, 128)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // maxLines: 5,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _ratingController,
                  decoration: InputDecoration(
                    labelText: 'Rating (1-5)',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1.0, color: Color.fromARGB(255, 102, 7, 128)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // maxLines: 5,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    _showPicker(context: context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 100, bottom: 100),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 102, 7, 128)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: galleryFile == null
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_photo_alternate_outlined,
                                  color: Colors.grey, size: 50),
                              SizedBox(width: 10),
                              Text(
                                'Choose Updated Picture',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        : Center(
                            child: Image.file(galleryFile!),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 88, 161, 209),
        tooltip: 'Save',
        onPressed: () {
          _updateCustomerService(context);
        },
        child: const Icon(Icons.save, color: Colors.white, size: 28),
      ),
    );
  }
}
