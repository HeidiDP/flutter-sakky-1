import 'package:flutter/material.dart';
import 'package:monivalinta/questions_summary/summary_item.dart';

//tulos widget jossa scrollable sizedbox johon generoidaan rivejä. summary Item widgettejä

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,{super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            return SummaryItem(data);
          },
        ).toList(),
        ),
      ),
    );
  }
}
