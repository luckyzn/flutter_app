
import 'package:flutter_app/models/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  final databaseName = 'note.db';
  String usersTable = "CREATE TABLE users (idUser INTEGER PRIMARY KEY AUTOINCREMENT, userEmail TEXT, userPassword TEXT)";
    Future<Database> initDB()async{
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, databaseName);

      return openDatabase(path,version: 1,onCreate: (db,version) async {
          await db.execute(usersTable);
      });
    }

Future<bool> login(Users user)async{
  final Database db = await initDB();
  var result = await db.rawQuery("select * from users where userEmail = '${user.userEmail}' AND userPassword = '${user.userpassword}'");

  if (result.isNotEmpty){
      return true;
  }else{
    return false;
  }
}

Future<int> newUser(Users user)async{
  final Database db = await initDB();

  var existingUser = await db.query('users', where: 'userEmail = ?', whereArgs: [user.userEmail]);

  if (existingUser.isNotEmpty) {
    
    return 0;
  } else {
    return db.insert('users', user.toMap());
  }
}

Future<List<Users>> showUsers()async{
  final Database db = await initDB();
  List<Map<String, Object?>> result = await db.query('userEmail');
  return result.map((e) => Users.fromMap(e)).toList();
}

}