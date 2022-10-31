import 'package:dream11/constants.dart';
import 'package:dream11/default_button_widget.dart';
import 'package:dream11/match_tile_widget.dart';
import 'package:dream11/player_model.dart';
import 'package:dream11/room_model.dart';
import 'package:flutter/material.dart';
import 'package:dream11/match_model.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sizer/sizer.dart';

class RoomScreen extends StatefulWidget {
  final Match match;
  final Room room;
  const RoomScreen({Key? key, required this.match, required this.room})
      : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen>
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
      body: Container(
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(
                      // text: "Upcoming",
                      icon: Text(
                        widget.match.teamOne!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        widget.match.teamTwo!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50 * 11,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      itemCount: cricketers
                          .where((element) => element.teamNo == 1)
                          .toList()
                          .length,
                      itemBuilder: (context, index) {
                        var player = cricketers
                            .where((element) => element.teamNo == 1)
                            .toList()[index];

                        return _getPlayerWidget(player);
                      },
                    ),
                    ListView.builder(
                      itemCount: cricketers
                          .where((element) => element.teamNo == 2)
                          .toList()
                          .length,
                      itemBuilder: (context, index) {
                        var player = cricketers
                            .where((element) => element.teamNo == 2)
                            .toList()[index];

                        return _getPlayerWidget(player);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPlayerWidget(Player player) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.tileBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.name!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).primaryColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  Constants.getPlayerRoleText(player.role!),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const AppDefaultButton(
            title: Icon(Icons.add),
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
