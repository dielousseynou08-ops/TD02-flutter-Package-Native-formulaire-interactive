import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Endroits {
  String id;
  String name;
  File? image;

  Endroits({required this.name, this.image}) : id = uuid.v4();
}
