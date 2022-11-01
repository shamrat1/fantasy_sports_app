import 'package:dream11/constants.dart';
import 'package:dream11/player_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlayerListItemWidget extends StatelessWidget {
  const PlayerListItemWidget({
    Key? key,
    required this.player,
    required this.actionWidget,
  }) : super(key: key);

  final Player player;
  final Widget actionWidget;

  @override
  Widget build(BuildContext context) {
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
          actionWidget,
        ],
      ),
    );
  }
}
