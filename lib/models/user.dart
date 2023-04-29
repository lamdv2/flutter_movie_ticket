import 'package:flutter/material.dart';

class User {
  String id;
  String name;
  Image image;
  int sdt;

  User(
    this.id,
    this.name,
    this.image,
    this.sdt,
  );

  @override
  String toString() {
    return 'User{id: $id, name: $name, image: $image, sdt: $sdt}';
  }
}
