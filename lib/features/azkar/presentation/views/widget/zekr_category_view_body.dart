import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim/core/widgets/custom_error_widget.dart';
import 'package:muslim/features/azkar/data/models/zekr_model.dart';
import 'package:muslim/features/azkar/presentation/views/widget/content_zekr_card.dart';
import 'package:muslim/features/azkar/presentation/views/widget/count_of_zekr.dart';

class ZekrCategoryViewBody extends StatelessWidget {
  const ZekrCategoryViewBody({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJson(category: category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                  child: CustomErrorWidget(error: 'something went wrong'));
            } else if (snapshot.hasData) {
              List<ZekrModel> zekrList = snapshot.data as List<ZekrModel>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ContentZekrCard(
                        zekr: zekrList[index],
                      ),
                      if (category == "أذكار الصباح" ||
                          category == "أذكار المساء" ||
                          category == "أذكار الاستيقاظ")
                        CountOfZekr(
                          zekr: zekrList[index],
                        ),
                    ],
                  );
                },
                itemCount: zekrList.length,
              );
            } else {
              return const Center(child: Text('Empty data'));
            }
          } else {
            return Center(child: Text('State: ${snapshot.connectionState}'));
          }
        });
  }

  readJson({required String category}) async {
    final String response =
        await rootBundle.loadString('assets/json/azkar.json');
    final data = json.decode(response);
    List<ZekrModel> zekrList = [];
    for (var zekr in data[category]) {
      zekrList.add(ZekrModel.fromJson(zekr));
    }
    return zekrList;
  }
}
