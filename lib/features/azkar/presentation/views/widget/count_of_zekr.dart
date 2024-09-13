import 'package:flutter/material.dart';
import 'package:muslim/features/azkar/data/models/zekr_model.dart';

class CountOfZekr extends StatefulWidget {
  const CountOfZekr({super.key, required this.zekr});
  final ZekrModel zekr;

  @override
  State<CountOfZekr> createState() => _CountOfZekrState();
}

class _CountOfZekrState extends State<CountOfZekr> {
  int count=0;
  @override
  void initState() {
   count= int.parse(widget.zekr.count!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: count==0?Colors.green: Theme.of(context).colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: (){
          if(count>0){
            count--;
          setState(() { });
          }
        },
        child:count==0?const Icon(Icons.done,color: Colors.black,): Text(
          '$count',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
