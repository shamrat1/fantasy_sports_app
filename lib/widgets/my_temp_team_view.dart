import 'package:dream11/constants.dart';
import 'package:dream11/states/my_temp_team_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MyTempTeamView extends StatelessWidget {
  const MyTempTeamView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, _) {
      var myTempTeamProviderState = ref.watch(myTempTeamProvider);
      print("rebuilding...");
      if (myTempTeamProviderState.isEmpty) {
        return Container();
      }
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 3,
              spreadRadius: 3,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            Text(
              "Total Players Selected " +
                  myTempTeamProviderState.length.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      );
    });
  }
}
