class LongestName {
  public String longestName(String[] names) {
    String longest = "";
    for (String name : names) {
      if (longest.length() < name.length()) {
        longest = name;
      }
    }
    return longest;
  }
}

class RunMe {
  public static void main(String[] args) {
    String[] people = { "Adam", "Clara", "George", "Jane" };
    LongestName l = new LongestName();
    String longest = l.longestName(people);

    System.out.printf("%s\n", longest);
  }
}