// Prefer using lowerCamelCase for constant names
enum Status { pending, inProgress, done }

enum Direction { north, south, east, west }

void main(List<String> args) {
  Status currentStatus = Status.inProgress;

  if (currentStatus == Status.inProgress) {
    print("In progress ...");
  }

  // To get a list of all the enumerated values, use the enum’s values constant.
  List<Direction> directions = Direction.values;
  for (var direction in directions) {
    decideBasedOnEnum(direction);
  }
}

void decideBasedOnEnum(Direction dir) {
  // You can use enums in switch statements.
  // You’ll get a warning if you don’t handle all of the enum’s values:
  switch (dir) {
    case Direction.north:
      print("Going North");
      break;
    default: // Without this, you see a WARNING.
      print("Not North? Alright, going $dir..");
  }
}
