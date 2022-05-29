import 'package:dream11/constants.dart';
import 'package:dream11/match_model.dart';
import 'package:dream11/match_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MatchTileWidget extends StatefulWidget {
  final Match match;
  final VoidCallback? onTap;
  const MatchTileWidget({Key? key, required this.match, this.onTap})
      : super(key: key);

  @override
  State<MatchTileWidget> createState() => _MatchTileWidgetState();
}

class _MatchTileWidgetState extends State<MatchTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.match.teamOne! + "_" + widget.match.teamTwo!,
      child: Material(
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            margin: const EdgeInsets.only(
              top: 12,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Constants.tileBgColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30.w,
                        child: Column(
                          children: [
                            widget.match.teamOneIcon!,
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.match.teamOne!,
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "VS",
                        style: GoogleFonts.aladin(fontSize: 20.sp),
                      ),
                      SizedBox(
                        width: 30.w,
                        child: Column(
                          children: [
                            widget.match.teamTwoIcon!,
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.match.teamTwo!,
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.match.matchTime != null)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        widget.match.matchTime!.fromNow(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      widget.match.category!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
