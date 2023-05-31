import 'package:hive/hive.dart';

part 'uzumModel.g.dart';

@HiveType(typeId: 0)
class UzumModel {
  @HiveField(0)
  bool? status;
  @HiveField(1)
  List<List1>? list1;
  @HiveField(2)
  List<Yozgisavdo>? yozgisavdo;
  @HiveField(3)
  List<Top>? top;

  UzumModel({this.status, this.list1, this.yozgisavdo, this.top});

  UzumModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['List1'] != null) {
      list1 = <List1>[];
      json['List1'].forEach((v) {
        list1!.add(List1.fromJson(v));
      });
    }
    if (json['yozgisavdo'] != null) {
      yozgisavdo = <Yozgisavdo>[];
      json['yozgisavdo'].forEach((v) {
        yozgisavdo!.add(Yozgisavdo.fromJson(v));
      });
    }
    if (json['top'] != null) {
      top = <Top>[];
      json['top'].forEach((v) {
        top!.add(Top.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    if (list1 != null) {
      data['List1'] = list1!.map((v) => v.toJson()).toList();
    }
    if (yozgisavdo != null) {
      data['yozgisavdo'] = yozgisavdo!.map((v) => v.toJson()).toList();
    }
    if (top != null) {
      data['top'] = top!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 1)
class List1 {
  @HiveField(0)
  String? img;

  List1({this.img});

  List1.fromJson(Map<String, dynamic> json) {
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = img;
    return data;
  }
}

@HiveType(typeId: 2)
class Yozgisavdo {
  @HiveField(0)
  String? img;
  @HiveField(1)
  String? title;

  @HiveField(2)
  String? narx;

  Yozgisavdo({this.img, this.title, this.narx});

  Yozgisavdo.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    narx = json['narx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = img;
    data['title'] = title;
    data['narx'] = narx;
    return data;
  }
}

@HiveType(typeId: 3)
class Top {
  @HiveField(0)
  String? img;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? narx;

  Top({this.img, this.title, this.narx});

  Top.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    narx = json['narx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = img;
    data['title'] = title;
    data['narx'] = narx;
    return data;
  }
}
