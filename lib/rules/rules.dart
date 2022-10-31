class Rule {
  Rule({
    this.name,
    this.conditionType,
    this.conditionValue,
  });

  String? name;
  String? conditionType;
  double? conditionValue;
}

final cricketRules = [
  Rule(name: "Players", conditionType: "total-players", conditionValue: 11),
  Rule(name: "Captain", conditionType: "team-captain", conditionValue: 1),
  Rule(name: "Batsman", conditionType: "pure-batsman", conditionValue: 5),
  Rule(name: "Bowler", conditionType: "pure-bowler", conditionValue: 5),
  Rule(name: "Allrounder", conditionType: "allrounder", conditionValue: 3),
  Rule(
      name: "Wicket Keeper", conditionType: "wicket-keeper", conditionValue: 1),
];
