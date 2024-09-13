import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/utils/app_router.dart';
import 'package:muslim/features/hadeth/data/models/hadeth_model.dart';

class AhadethListView extends StatefulWidget {
  const AhadethListView({super.key});

  @override
  State<AhadethListView> createState() => _AhadethListViewState();
}

class _AhadethListViewState extends State<AhadethListView> {
  List<HadethModel> hadethList = [];
  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty){
      readFile();
    }
    return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kHadethDetailsView,extra: hadethList[index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hadethList[index].title,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).colorScheme.onSecondary,
            thickness: 0.5,
            endIndent: 50,
            indent: 50,
          );
        },
        itemCount: hadethList.isEmpty?hadethList.length:hadethList.length-1,);
  }

  void readFile() async {
    String text = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeth = text.split('#');

    for (int i = 0; i < allHadeth.length; i++) {
      String singleHadeth = allHadeth[i].trim();
      String content = singleHadeth.substring(singleHadeth.indexOf('\n') + 1);
      String title = singleHadeth.substring(0, singleHadeth.indexOf('\n')+1);

      setState(() {
        hadethList.add(
          HadethModel(title: title, content: content),
        );
      });
    }
  }
}
