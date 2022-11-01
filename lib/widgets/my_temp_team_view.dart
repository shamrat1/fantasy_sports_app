import 'package:dream11/constants.dart';
import 'package:dream11/default_button_widget.dart';
import 'package:dream11/states/my_temp_team_state.dart';
import 'package:dream11/widgets/player_list_item_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyTempTeamView extends StatefulWidget {
  MyTempTeamView({Key? key}) : super(key: key);

  @override
  State<MyTempTeamView> createState() => _MyTempTeamViewState();
}

class _MyTempTeamViewState extends State<MyTempTeamView> {
  bool _sheetOpen = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (context, ref, _) {
      var myTempTeamProviderState = ref.watch(myTempTeamProvider);
      if (myTempTeamProviderState.isEmpty) {
        return Container();
      }
      return GestureDetector(
        onTap: () {
          setState(() {
            _sheetOpen = !_sheetOpen;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _sheetOpen ? 50.h : 6.h,
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
          child: Column(
            children: [
              Row(
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
              if (_sheetOpen)
                SizedBox(
                  height: 40.h,
                  child: ListView(
                    children: [
                      for (var i = 0; i < myTempTeamProviderState.length; i++)
                        AnimatedOpacity(
                          opacity: _sheetOpen ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: PlayerListItemWidget(
                              player: myTempTeamProviderState[i],
                              actionWidget: AppDefaultButton(
                                title: const Icon(Icons.minimize_rounded),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
