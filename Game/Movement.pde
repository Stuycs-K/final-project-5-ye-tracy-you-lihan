import java.util.*;

void move(PVector position, PVector velocity, String dir) 
{
  if (dir.equals("L")) {
    position.add(PVector.mult(velocity,-1));
  }
  else if (dir.equals("R")) {
    position.add(velocity);
  }
  else if (dir.equals("D")) {
    position.add(velocity);
  }
  else if (dir.equals("U")) {
    position.add(PVector.mult(velocity,-1));
  }
  else {
    println("invalid direction");
  }
}
