import 'package:flutter/cupertino.dart';
import 'package:medical_ring_app/features/ring/domain/enum/header_type.dart';

class TableHeaderData {
  HeaderType type;
  String id;
  String? text;
  String? icon;

  TableHeaderData({required this.type, this.text, this.icon, required this.id});
}
