class Room {
  String? name;
  String? subtitle;
  int? maxParticipents;
  int? minParticipents;
  int? currentParticipents;
  int? entryFee;
  int? totalWinnings;
  int? totalWinners;

  Room(
      {this.name,
      this.subtitle,
      this.maxParticipents,
      this.minParticipents,
      this.currentParticipents,
      this.entryFee,
      this.totalWinnings,
      this.totalWinners});
}

List<Room> rooms = [
  Room(
      name: "Grand Room",
      subtitle: "Grandest room of Winners",
      maxParticipents: 10000,
      minParticipents: 1000,
      currentParticipents: 4007,
      entryFee: 1003,
      totalWinners: 500,
      totalWinnings: 1000000),
  Room(
      name: "Humble Room",
      subtitle: "Humble Room For Humble players",
      maxParticipents: 500,
      minParticipents: 50,
      currentParticipents: 33,
      entryFee: 100,
      totalWinners: 5,
      totalWinnings: 5000),
  Room(
      name: "Not so Humble Room",
      subtitle: "Rough & Tough Terrain for hungry players",
      maxParticipents: 5000,
      minParticipents: 500,
      currentParticipents: 350,
      entryFee: 12333,
      totalWinners: 50,
      totalWinnings: 5000000),
  Room(
      name: "Aladin",
      subtitle: "Just Another meh room",
      maxParticipents: 100,
      minParticipents: 70,
      currentParticipents: 100,
      entryFee: 10000,
      totalWinners: 25,
      totalWinnings: 100000),
];
