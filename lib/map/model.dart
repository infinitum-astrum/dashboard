class Floor {
  final int level;
  final List<Room> rooms;

  Floor({required this.level, this.rooms = const []});

  String getName() {
    if (level < 0) return "Level " + level.toString();
    switch (level % 10) {
      case 1: return level.toString() + "st Floor";
      case 2: return level.toString() + "nd Floor";
      case 3: return level.toString() + "rd Floor";
      default: return level.toString() + "th Floor";
    }
  }
}

class Room {
  final String name;
  final List<Computer> computers;

  Room({required this.name, this.computers = const []});
}

class Computer {
  final String name;

  Computer({required this.name});
}

List<Floor> floor = [
  Floor(
    level: -1,
    rooms: [
      Room(
        name: "Room #5",
        computers: [
          Computer(name: 'iMac-001'),
          Computer(name: 'iMac-002'),
          Computer(name: 'iMac-003'),
          Computer(name: 'iMac-004'),
        ],
      ),
      Room(
        name: "Room #11",
        computers: [
          Computer(name: 'iMac-005'),
          Computer(name: 'iMac-006'),
          Computer(name: 'iMac-007'),
          Computer(name: 'iMac-008'),
        ],
      ),
    ],
  ),
];
