import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/features/hadeth/data/models/hadeth_model.dart';
import 'package:muslim/features/hadeth/presentation/views/widgets/hadeth_deatails_view_body.dart';
import 'package:muslim/features/settings/presentation/view_model/change_theme_cubit/change_theme_cubit.dart';

class HadethDetailsView extends StatelessWidget {
  const HadethDetailsView({super.key, required this.hadethModel});
  final HadethModel hadethModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: BlocProvider.of<ChangeThemeCubit>(context).isDarkMode
              ? const AssetImage('assets/images/background_dark.png')
              : const AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            hadethModel.title.substring(
              0,
              hadethModel.title.indexOf('\n'),
            ),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(Icons.arrow_back,color:Theme.of(context).colorScheme.onSecondary,),
          ),
        ),
        body: HadethDeatailsViewBody(
          hadeth: hadethModel,
        ),
      ),
    );
  }
}
