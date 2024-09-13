import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/tasbeh/presentation/view_model/change_count_and_save_cubit/change_count_and_save_cubit.dart';
import 'package:muslim/features/tasbeh/presentation/views/widgets/counter_tasbeeh_count.dart';
import 'package:muslim/features/tasbeh/presentation/views/widgets/custom_button.dart';

class TasbehBodyView extends StatefulWidget {
  const TasbehBodyView({super.key});

  @override
  State<TasbehBodyView> createState() => _TasbehBodyViewState();
}

class _TasbehBodyViewState extends State<TasbehBodyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/tasbeeh_counter_layout.svg',
            width: MediaQuery.of(context).size.width * 0.73,
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const CounterTasbeehCount(),
           //Reset Button
           CustomButton(
            onPressed: (){
              showDialogBox(context);
            },
            padding:const EdgeInsetsDirectional.only(
              top: 175,
              start: 140,
            ),
            minimumSize:const Size(38, 38),
            width: 28,
            height: 28,
          ),
          // Count Button
           CustomButton(
            onPressed: (){
              setState(() {
               BlocProvider.of<ChangeCountAndSaveCubit>(context).increaseCount();
              });
            },
            padding:const EdgeInsetsDirectional.only(
              top: 230,
              start: 77,
            ),
            minimumSize:const Size(65, 65),
            width: 55,
            height: 55,
          ),
        ],
      ),
    );
  }

  showDialogBox(context) {
    AlertDialog alertDialog =AlertDialog(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        translate(context).count_will_reset,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      content: Text(
        translate(context).are_you_sure,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            translate(context).cancel,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue[400],
          ),
          onPressed: () {
            setState(() {
              BlocProvider.of<ChangeCountAndSaveCubit>(context).reset();
            });
            Navigator.pop(context);
          },
          child: Text(
            translate(context).reset,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ]
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

}
