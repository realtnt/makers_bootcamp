import java.util.ArrayList;

public class Ex2 {
  public static void main(String[] args) {
    ArrayList<String> names = new ArrayList<String>();

    names.add("Kyle");
    names.add("Sophie");
    names.add("Graeme");

    String nameToFind = "Kyle";

    Ex2 ex2 = new Ex2();
    Boolean result = ex2.isInArray(names, nameToFind);

    if (result) {
      System.out.println("The name is in the array. Yay!");
    } else {
      System.out.println("The name couldn't be found in the array — sorry...");
    }
  }

  public Boolean isInArray(ArrayList<String> names, String nameToFind) {
    for (String name : names) {
      if (name == nameToFind) {
        return true;
      }
    }

    return false;
  }
}