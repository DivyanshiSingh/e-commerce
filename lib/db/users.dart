import 'package:firebase_database/firebase_database.dart';

class UserServices {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(Map value) {
    String id = value["userId"];
    _database
        .reference()
        .child("$ref/$id")
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }
}
