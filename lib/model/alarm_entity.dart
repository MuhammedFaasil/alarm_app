import 'package:objectbox/objectbox.dart';

@Entity()
class AlarmEntity {
  @Id()
  int id = 0;

  final String time;
  final String label;

  AlarmEntity({required this.time, required this.label});
}