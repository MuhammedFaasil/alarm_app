class AlarmModel {
  final String time;
  final String label;
  final int? id;

  AlarmModel({
    required this.time,
    required this.label,
    this.id,
  });
}
