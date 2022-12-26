import 'package:flutter/material.dart';
import 'package:plan_list_demo/db/plan_collection.dart';
import 'package:plan_list_demo/models/plan.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  TextEditingController planDurationController = TextEditingController();
  TextEditingController planTypeController = TextEditingController();

  @override
  void initState() {
    PlanList.getplans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('PlanList Demo')),
      body: buildContent(context, PlanList.planData),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: SizedBox(
                        height: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: planDurationController,
                              decoration: InputDecoration(
                                  label: const Text('Plan Duration'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: planTypeController,
                              decoration: InputDecoration(
                                  label: const Text('Plan Type'),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                                onPressed: () async {
                                  await PlanList.addPlan(
                                      planItems: PlanItem(
                                          planDuration:
                                              planDurationController.text,
                                          planType: planTypeController.text));

                                  planDurationController.clear();
                                  planTypeController.clear();
                                  await PlanList.getplans();
                                  setState(() {});
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    Navigator.pop(context);
                                  });
                                },
                                icon: const Icon(Icons.save),
                                label: const Text('Save')),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildContent(BuildContext context, List<PlanItem> planData) =>
      ListView.builder(
          itemCount: planData.length,
          itemBuilder: (context, index) => Container(
                height: 65,
                color: Colors.red,
                margin: const EdgeInsets.only(bottom: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(planData[index].planDuration!),
                        Text(planData[index].planType!),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await PlanList.updatePlan(
                                index,
                                PlanItem(
                                    planDuration: 'asd', planType: 'asdf'));
                            setState(() {});
                          },
                          child: const Text('Edit'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await PlanList.deletePlan(
                              index,
                            );
                            setState(() {});
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
}
