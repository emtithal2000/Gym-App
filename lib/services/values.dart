import 'package:first_app/models/chart_model.dart';
import 'package:first_app/models/items_model.dart';

String adminEmail = 'emtithalaljabri20@gmail.com';

final listSub = ['Bronze', 'Silver', 'Gold', 'Diamond'];
final listTime = ['3 Month', '6 Month', '1 Year', '2 Year'];
final listPrivileges = [
  'Machines - Shower',
  'Bronze + Parking Space',
  'Silver + Coach 6-Month',
  'Gold + Full Time Coach '
];
String activeSub = '';

List<ItemModel> list = [];

List<ChartModel> underWeight = [
  ChartModel(weight: 40, height: 140),
  ChartModel(weight: 50, height: 150),
  ChartModel(weight: 57, height: 160),
  ChartModel(weight: 62, height: 170),
  ChartModel(weight: 70, height: 180),
  ChartModel(weight: 80, height: 190),
  ChartModel(weight: 85, height: 200),
];
List<ChartModel> healthy = [
  ChartModel(weight: 50, height: 140),
  ChartModel(weight: 60, height: 150),
  ChartModel(weight: 70, height: 160),
  ChartModel(weight: 79, height: 170),
  ChartModel(weight: 89, height: 180),
  ChartModel(weight: 99, height: 190),
  ChartModel(weight: 108, height: 200),
];
List<ChartModel> overWeight = [
  ChartModel(weight: 60, height: 140),
  ChartModel(weight: 71, height: 150),
  ChartModel(weight: 83, height: 160),
  ChartModel(weight: 95, height: 170),
  ChartModel(weight: 108, height: 180),
  ChartModel(weight: 119, height: 190),
  ChartModel(weight: 130, height: 200),
];
List<ChartModel> obese = [
  ChartModel(weight: 130, height: 140),
  ChartModel(weight: 132, height: 150),
  ChartModel(weight: 134, height: 160),
  ChartModel(weight: 136, height: 170),
  ChartModel(weight: 138, height: 180),
  ChartModel(weight: 140, height: 190),
  ChartModel(weight: 142, height: 200),
];
