import "dart:math";

class KeyArea {
  final Point<int> start;
  final int rowSpan;
  final int colSpan;

  const KeyArea(this.start, {this.rowSpan = 1, this.colSpan = 1});

  bool contains(Point<int> p) {
    return p.x >= start.x && p.y >= start.y && p.x < start.x + rowSpan && p.y < start.y + colSpan;
  }

  Point<int> get center => Point(start.x + rowSpan ~/ 2, start.y + colSpan ~/ 2);
}