// import 'package:baseapp_getx/index.dart';
///모바일 DB
// class DatabaseHelper {
//   late Database _database;
//
//   Future<Database> initializeDatabase() async {
//     final path = await getDatabasesPath();
//     final databasePath = '$path/user_database.db';
//
//     _database = await openDatabase(
//       databasePath,
//       version: 1,
//       onCreate: (db, version) {
//         db.execute('CREATE TABLE accessToken(id INTEGER PRIMARY KEY, token TEXT)');
//       },
//     );
//
//     return _database;
//   }
//
//   Future<void> insertAccessToken(String accessToken) async {
//     await _database.delete('accessToken'); // Clear previous access tokens
//     await _database.insert('accessToken', {'token': accessToken});
//   }
//
//   Future<String?> getAccessToken(Database database) async {
//     final List<Map<String, dynamic>> result = await database.query('accessToken');
//     if (result.isNotEmpty) {
//       return result.first['token'] as String?;
//     }
//     return null;
//   }
//
//   Future<void> clearAccessToken() async {
//     await _database.delete('accessToken');
//   }
// }
//
