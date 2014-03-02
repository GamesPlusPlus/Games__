class enemy {
  PVector loc, vel, vel2;
  float distance, distance2, tolerance;

  enemy(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(2, 0);
    vel2 = new PVector(0, 2);
    distance = loc.x;
    distance2 = loc.y;
    tolerance = 100;
  }

  void walk() {
    image(tank, loc.x, loc.y);
    loc.add(vel);
    if (loc.x > distance + tolerance) {
      vel.mult(-1);
    }
    if (loc.x < distance - tolerance) {
      vel.mult(-1);
    }
  }

  void fly() {
    image(bat, loc.x, loc.y);
    loc.add(vel2);
    if (loc.y > distance2 + tolerance) {
      vel2.mult(-1);
    }
    if (loc.y < distance2 - tolerance) {
      vel2.mult(-1);
    }
  }
}
