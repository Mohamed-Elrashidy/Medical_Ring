import 'package:medical_ring_app/features/ring/domain/entity/table_header_data.dart';
import 'package:medical_ring_app/features/ring/domain/enum/header_type.dart';

abstract class Constants{
  static List <TableHeaderData> get ringTableHeaderData => [
    TableHeaderData(type: HeaderType.text,text: '#', id: 'id'),
    TableHeaderData(type: HeaderType.icon,icon: "assets/svg_images/oxygen.svg",id: 'oxygen'),
    TableHeaderData(type: HeaderType.text,text: 'َض . ت',id: "pressure"),
    TableHeaderData(type: HeaderType.icon,icon:"assets/svg_images/heart.svg" ,id: "heartRate"),
    TableHeaderData(type: HeaderType.text,text: 'كوفيد', id: "covid"),
    TableHeaderData(type: HeaderType.icon,icon: "assets/svg_images/temp.svg", id: "temperature"),
    TableHeaderData(type: HeaderType.text,text: ' جلطة', id : "stroke"),
    TableHeaderData(type: HeaderType.icon,icon: "assets/svg_images/steps.svg", id: "steps"),

  ];
}