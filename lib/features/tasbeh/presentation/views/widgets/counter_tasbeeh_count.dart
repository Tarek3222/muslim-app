import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/core/constants/language_constants.dart';
import 'package:muslim/features/tasbeh/presentation/view_model/change_count_and_save_cubit/change_count_and_save_cubit.dart';

class CounterTasbeehCount extends StatelessWidget {
  const CounterTasbeehCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 120,
      alignment: Alignment.center,
      margin: const EdgeInsetsDirectional.only(
        top: 50,
        start: 13,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 2,
          ),
          Text(
            'zekrmatic',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white, fontSize: 13),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsetsDirectional.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            width: 180,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: BlocBuilder<ChangeCountAndSaveCubit, ChangeCountAndSaveState>(
              builder: (context, state) {
                return Text(
                  BlocProvider.of<ChangeCountAndSaveCubit>(context).count.toString(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black, fontSize: 32, fontFamily: ""),
                );
              },
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 1,
              ),
              Text(
                translate(context).count,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white, fontSize: 13),
              ),
              Text(
                translate(context).reset,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(
                width: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
