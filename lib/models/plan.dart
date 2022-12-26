import 'package:hive/hive.dart';
part 'plan.g.dart';


@HiveType(typeId: 1)
class PlanItem extends HiveObject {
  @HiveField(0)
  String? planDuration;

  @HiveField(1)
  String? planType;

  PlanItem({this.planDuration, this.planType});
}
