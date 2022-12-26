import 'package:hive/hive.dart';
import 'package:plan_list_demo/models/plan.dart';

class PlanList {
  static late Box<PlanItem> box;
  static List<PlanItem> planData = [];

  static Future openPlanItemBox() async {
    box = await Hive.openBox<PlanItem>('planList');
  }

  static getplans() {
    planData = box.values.toList();
  }

  static Future addPlan({PlanItem? planItems}) async {
    await box.add(planItems!);
  }

  static Future updatePlan(int index, PlanItem planItem) async {
    box.putAt(index, planItem);
    getplans();
  }

  static deletePlan(int index) {
    box.deleteAt(index);
    getplans();
  }
}
