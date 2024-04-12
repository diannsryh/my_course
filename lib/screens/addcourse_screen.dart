import 'package:flutter/material.dart';
import 'package:my_course/dto/courses.dart';
import 'package:my_course/services/db_helper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Courses>>? courses;
  late String _title;
  bool isUpdate = false;
  late int? coursesIdForUpdate;
  late DBHelper dbHelper;
  final _coursesTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshCoursesLists();
  }

  @override
  void dispose() {
    _coursesTitleController.dispose();
    dbHelper.close();
    super.dispose();
  }

  void cancelTextEditing() {
    _coursesTitleController.text = '';
    setState(() {
      isUpdate = false;
      coursesIdForUpdate = null;
    });
    closeKeyboard();
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> refreshCoursesLists() async {
    try {
      await dbHelper.initDatabase();
      setState(() {
        courses = dbHelper.getCourses();
        isUpdate = false;
      });
    } catch (error) {
      debugPrint('Error fetching courses: $error');
    }
  }

  void createOrUpdateCourses() {
    _formStateKey.currentState?.save();
    if (!isUpdate) {
      dbHelper.add(Courses(null, _title));
    } else {
      dbHelper.update(Courses(coursesIdForUpdate, _title));
    }
    _coursesTitleController.text = '';
    refreshCoursesLists();
  }

  void editFormCourses(BuildContext context, Courses courses) {
    setState(() {
      isUpdate = true;
      coursesIdForUpdate = courses.id!;
    });
    _coursesTitleController.text = courses.title;
  }

  void deleteCourses(BuildContext context, int coursesID) {
    setState(() {
      isUpdate = false;
    });
    _coursesTitleController.text = '';
    dbHelper.delete(coursesID);
    refreshCoursesLists();
  }

  @override
  Widget build(BuildContext context) {
    var textFormField = TextFormField(
      onSaved: (value) {
        _title = value!;
      },
      autofocus: false,
      controller: _coursesTitleController,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: !isUpdate ? Colors.purple : Colors.blue,
                  width: 2,
                  style: BorderStyle.solid)),
          labelText: !isUpdate ? 'Add Courses Title' : 'Edit Courses Title',
          icon:
              Icon(Icons.book, color: !isUpdate ? Colors.purple : Colors.blue),
          fillColor: Colors.white,
          labelStyle:
              TextStyle(color: !isUpdate ? Colors.purple : Colors.blue)),
    );
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Form(
            key: _formStateKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: textFormField,
                ),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  createOrUpdateCourses();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isUpdate
                      ? Colors.purple
                      : Colors.blue, // Set background color
                  foregroundColor: Colors.white,
                ),
                child: !isUpdate ? const Text('Save') : const Text('Update')),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                cancelTextEditing();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Set background color
                foregroundColor: Colors.white,
              ),
              child: const Text('Cancel',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            )
          ],
        ),
        const Divider(),
        Expanded(
            child: FutureBuilder(
          future: courses,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text('No Data');
            }
            if (snapshot.hasData) {
              return generateList(snapshot.data!);
            }
            return const CircularProgressIndicator();
          },
        ))
      ],
    ));
  }

  Widget generateList(List<Courses> courses) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) => Slidable(
        // Customize appearance and behavior as needed
        key: ValueKey(index),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) => editFormCourses(context, courses[index]),
              backgroundColor: Colors.blue,
              foregroundColor: Color.fromARGB(255, 254, 254, 254),
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              // An action can be bigger than the others.
              onPressed: (context) =>
                  deleteCourses(context, courses[index].id!),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ), // Assuming each book has a unique id
        child: ListTile(title: Text(courses[index].title)),
      ),
    );
  }
}
