import 'dart:convert';

List<ConsumptionPoint> welcomeFromJson(String str) =>
    List<ConsumptionPoint>.from(
        json.decode(str).map((x) => ConsumptionPoint.fromJson(x)));

class ConsumptionPoint {
  ConsumptionPoint({
    this.id,
    this.consumption,
    this.createdAt,
    this.date,
  });

  String id;
  double consumption;
  DateTime createdAt;
  DateTime date;

  factory ConsumptionPoint.fromJson(Map<String, dynamic> json) =>
      ConsumptionPoint(
        id: json["_id"],
        consumption: json["consumption"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        date: DateTime.parse(json["date"]),
      );
}
