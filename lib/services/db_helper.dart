import 'package:flutter/foundation.dart';
import 'package:my_course/dto/courses.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _db;

  factory DBHelper() => _instance;

  DBHelper._internal();

  Future<Database> get db async {
    _db ??= await initDatabase();
    return _db!; // Use the already initialized _db
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'db_courses.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE courses (id INTEGER PRIMARY KEY, title TEXT)');
  }

  Future<Courses> add(Courses courses) async {
    var dbClient = await db;
    courses.id = await dbClient.insert('courses', courses.toMap());
    return courses;
  }

  Future<List<Courses>> getCourses() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps =
        await dbClient.query('courses', orderBy: 'id DESC');
    List<Courses> courses = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        courses.add(Courses.fromMap(maps[i]));
      }
    }
    return courses;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Courses courses) async {
    var dbClient = await db;
    return await dbClient.update(
      'courses',
      courses.toMap(),
      where: 'id = ?',
      whereArgs: [courses.id],
    );
  }

  Future<void> close() async {
    try {
      // Access database client
      var dbClient = await db;
      _db = null;
      await dbClient.close();
    } catch (error) {
      // Handle potential errors during closure
      debugPrint('Error closing database: $error');
    }
  }
}
