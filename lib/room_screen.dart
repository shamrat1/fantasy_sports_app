import 'package:dream11/constants.dart';
import 'package:dream11/default_button_widget.dart';
import 'package:dream11/player_model.dart';
import 'package:dream11/room_model.dart';
import 'package:dream11/states/my_temp_team_state.dart';
import 'package:dream11/widgets/my_temp_team_view.dart';
import 'package:dream11/widgets/player_list_item_view.dart';
import 'package:flutter/material.dart';
import 'package:dream11/match_model.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomScreen extends ConsumerStatefulWidget {
  final Match match;
  final Room room;
  const RoomScreen({Key? key, required this.match, required this.room})
      : super(key: key);

  @override
  ConsumerState<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends ConsumerState<RoomScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              widget.room.name!,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _getSingleItem(widget.room),
                  Container(
                    decoration: BoxDecoration(
                      color: Constants.tileBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: TabBar(
                      controller: tabController,
                      tabs: [
                        Tab(
                          // text: "Upcoming",
                          icon: Text(
                            widget.match.teamOne!,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            widget.match.teamTwo!,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60 * 11 + 60,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Column(children: [
                          for (var i = 0;
                              i <
                                  cricketers
                                      .where((element) => element.teamNo == 1)
                                      .toList()
                                      .length;
                              i++)
                            PlayerListItemWidget(
                              player: cricketers
                                  .where((element) => element.teamNo == 1)
                                  .toList()[i],
                              actionWidget: AppDefaultButton(
                                title: const Icon(Icons.add),
                                onTap: () {
                                  ref.read(myTempTeamProvider.notifier).add(
                                      cricketers
                                          .where(
                                              (element) => element.teamNo == 1)
                                          .toList()[i]);
                                },
                              ),
                            )
                        ]),
                        Column(children: [
                          for (var i = 0;
                              i <
                                  cricketers
                                      .where((element) => element.teamNo == 2)
                                      .toList()
                                      .length;
                              i++)
                            PlayerListItemWidget(
                              player: cricketers
                                  .where((element) => element.teamNo == 2)
                                  .toList()[i],
                              actionWidget: AppDefaultButton(
                                title: const Icon(Icons.add),
                                onTap: () {
                                  ref.read(myTempTeamProvider.notifier).add(
                                      cricketers
                                          .where(
                                              (element) => element.teamNo == 2)
                                          .toList()[i]);
                                },
                              ),
                            ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: MyTempTeamView(),
          ),
        ],
      ),
    );
  }

  Path _buildBoatPath(Size size) {
    Path path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 8, size.width, size.height), Radius.circular(16)));
    return path;
  }

  Widget _getSingleItem(Room room) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.match.teamOne! + " V " + widget.match.teamTwo!,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LiquidCustomProgressIndicator(
              value: room.currentParticipents! / room.maxParticipents!,
              backgroundColor: Constants.tileBgColor,
              valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).primaryColor.withOpacity(0.5)),
              direction: Axis.vertical,
              shapePath: _buildBoatPath(Size(90.w, 13.3.h)),
              center: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.amber,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Prize",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.black, fontSize: 9.sp),
                              ),
                              Text(
                                Constants.currency +
                                    " " +
                                    room.totalWinnings.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 11.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 20.w,
                          child: Column(
                            children: [
                              Text(
                                "Entry " + room.entryFee.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.black, fontSize: 9.sp),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        children: [
                          Text(
                            "Total " +
                                room.totalWinners.toString() +
                                " Winners",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.black, fontSize: 9.sp),
                          ),
                          const Spacer(),
                          Text(
                            (room.maxParticipents! - room.currentParticipents!)
                                    .toString() +
                                " Spots Left",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.black, fontSize: 9.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
