import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_model/model/uzumModel.dart';
import 'package:hive_model/service/UzumService.dart';
import 'package:path_provider/path_provider.dart';

class UzumDBService {
  UzumService uzumService = UzumService();
  Box<UzumModel>? uzumBox;

  Future<dynamic> checkBox() async {
    await openBox();
    if (uzumBox!.isNotEmpty) {
      return uzumBox!.get('uzum');
    } else {
      return getUzumData();
    }
  }

  Future<dynamic> getUzumData() async {
    dynamic response = await uzumService.getUzum();
    if (response is UzumModel) {
      await openBox();
      await writeToBox(response);
      return uzumBox!.get('uzum');
    } else {
      return response;
    }
  }

  static void registerAdapter() {
    Hive.registerAdapter(UzumModelAdapter());
    Hive.registerAdapter(List1Adapter());
    Hive.registerAdapter(YozgisavdoAdapter());
    Hive.registerAdapter(TopAdapter());
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    uzumBox = await Hive.openBox<UzumModel>("db");
  }

  Future<void> writeToBox(UzumModel model) async {
    print(model.list1!.length);
    print("hello");
    await uzumBox!.put("uzum", model);
    print("hello");
  }
}


// class DBService {
//   UserService userService = UserService();
//   Box? userBox;

//   Future<dynamic> checkBox() async {
//     await openBox();
//     if (userBox != null && userBox!.isNotEmpty) {
//       return userBox!.get('users')['users'];
//     } else {
//       return getUsers();
//     }
//   }

//   Future<dynamic> getUsers() async {
//     dynamic response = await userService.getUser();
//     if (response is Map<String, dynamic>) {
//       await openBox();
//       await writeToBox(response);
//       print(userBox!.get('users')['users']);
//       return userBox!.get('users')['users'];
//     } else {
//       return response;
//     }
//   }

//   Future<void> openBox() async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     Hive.init(appDocDir.path);
//     userBox = await Hive.openBox("user");
//   }

//   Future<void> writeToBox(Map<String, dynamic> users) async {
//     await userBox!.put("users", users);
//   }
// }
