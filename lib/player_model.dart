enum PLAYERROLE {
  BATSMAN,
  BOWLER,
  AllROUNDER,
  WICKETKEEPER,
  GOALKEEPER,
  DEFENDER,
  STRICKER,
  MIDFIELD,
}

class Player {
  PLAYERROLE? role;
  String? name;
  int? teamNo;
  bool? captaincy;

  Player({
    this.role,
    this.name,
    this.teamNo,
    this.captaincy = false,
  });
}

List<Player> cricketers = [
  Player(role: PLAYERROLE.BATSMAN, name: "Liton Das", teamNo: 1),
  Player(
      role: PLAYERROLE.BATSMAN,
      name: "Tamim Iqbal",
      teamNo: 1,
      captaincy: true),
  Player(role: PLAYERROLE.BATSMAN, name: "Nazmul Islam Shanto", teamNo: 1),
  Player(role: PLAYERROLE.BATSMAN, name: "Mushfiqur Rahim", teamNo: 1),
  Player(role: PLAYERROLE.BATSMAN, name: "Anamul Haque Bijoy", teamNo: 1),
  Player(role: PLAYERROLE.AllROUNDER, name: "Shakib Al Hasan", teamNo: 1),
  Player(role: PLAYERROLE.AllROUNDER, name: "Rakib Al Hasan", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "Mustafiz", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "Mashrafe", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "Rubel", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "Taskin", teamNo: 1),
  Player(
      role: PLAYERROLE.BATSMAN, name: "MS Dhoni", teamNo: 2, captaincy: true),
  Player(role: PLAYERROLE.BATSMAN, name: "Gautam Ghambir", teamNo: 2),
  Player(role: PLAYERROLE.BATSMAN, name: "Shewag", teamNo: 2),
  Player(role: PLAYERROLE.BATSMAN, name: "Tendulkar", teamNo: 2),
  Player(role: PLAYERROLE.BATSMAN, name: "Azharuddin", teamNo: 2),
  Player(role: PLAYERROLE.AllROUNDER, name: "Yubraj Singh", teamNo: 2),
  Player(role: PLAYERROLE.AllROUNDER, name: "Hardik Pandiya", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "Harbajan Singh", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "Bhubeneshwar Kumar", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "Mohammad Shami", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "RP Singh", teamNo: 2),
];

List<Player> footballers = [
  Player(role: PLAYERROLE.BATSMAN, name: "PlayerA", teamNo: 1),
  Player(
      role: PLAYERROLE.BATSMAN,
      name: "Tamim Iqbal",
      teamNo: 1,
      captaincy: true),
  Player(role: PLAYERROLE.BATSMAN, name: "PlayerB", teamNo: 1),
  Player(role: PLAYERROLE.BATSMAN, name: "PlayerC", teamNo: 1),
  Player(role: PLAYERROLE.BATSMAN, name: "PlayerD", teamNo: 1),
  Player(role: PLAYERROLE.AllROUNDER, name: "PlayerE", teamNo: 1),
  Player(role: PLAYERROLE.AllROUNDER, name: "PlayerF", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "PlayerG", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "PlayerH", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "PlayerI", teamNo: 1),
  Player(role: PLAYERROLE.BOWLER, name: "PlayerJ", teamNo: 1),
  Player(role: PLAYERROLE.BATSMAN, name: "Player1", teamNo: 2, captaincy: true),
  Player(role: PLAYERROLE.BATSMAN, name: "Player2", teamNo: 2),
  Player(role: PLAYERROLE.BATSMAN, name: "Player3", teamNo: 2),
  Player(role: PLAYERROLE.BATSMAN, name: "Player4", teamNo: 2),
  Player(role: PLAYERROLE.BATSMAN, name: "Player5", teamNo: 2),
  Player(role: PLAYERROLE.AllROUNDER, name: "Player6", teamNo: 2),
  Player(role: PLAYERROLE.AllROUNDER, name: "Player7", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "Player8", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "Player9", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "Player10", teamNo: 2),
  Player(role: PLAYERROLE.BOWLER, name: "Player11", teamNo: 2),
];
