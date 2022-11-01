import 'package:dream11/player_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myTempTeamProvider =
    StateNotifierProvider<MyTempTeamProvider, List<Player>>((ref) {
  return MyTempTeamProvider();
});

class MyTempTeamProvider extends StateNotifier<List<Player>> {
  MyTempTeamProvider() : super([]);

  add(Player player) {
    state = [...state, player];
  }

  remove(Player player) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (player.name != state[i].name) state[i]
    ];
  }
}
