import 'package:dream11/constants.dart';
import 'package:dream11/default_button_widget.dart';
import 'package:dream11/match_tile_widget.dart';
import 'package:dream11/room_model.dart';
import 'package:flutter/material.dart';
import 'package:dream11/match_model.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sizer/sizer.dart';

class MatchScreen extends StatefulWidget {
  final Match match;
  const MatchScreen({Key? key, required this.match}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.match.teamOne! + " V " + widget.match.teamTwo!,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MatchTileWidget(match: widget.match),
              for (var i = 0; i < rooms.length; i++) _getSingleItem(rooms[i]),
            ],
          ),
        ),
      ),
    );
  }

  Path _buildBoatPath(Size size) {
    // return Path()
    //   // ..moveTo(15, 120)
    //   ..lineTo(0, 85)
    //   ..lineTo(50, 85)
    //   ..lineTo(50, 0)
    //   ..lineTo(105, 80)
    //   ..lineTo(60, 80)
    //   ..lineTo(60, 85)
    //   ..lineTo(120, 85)
    //   ..lineTo(105, 120)
    //   ..close();
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
            room.name!,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black),
          ),
          Text(
            room.subtitle!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LiquidCustomProgressIndicator(
              value: room.currentParticipents! / room.maxParticipents!,
              backgroundColor: Constants.tileBgColor,
              valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).primaryColor.withOpacity(0.5)),
              direction: Axis.vertical,
              shapePath: _buildBoatPath(Size(90.w, 11.h)),
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
                              AppDefaultButton(
                                  title: Text(
                                "Join Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
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
