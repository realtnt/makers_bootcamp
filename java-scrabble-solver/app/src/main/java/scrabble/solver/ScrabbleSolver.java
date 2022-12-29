package scrabble.solver;

import java.util.HashMap;

public class ScrabbleSolver {
  HashMap<Character, Integer> letterValue = new HashMap<Character, Integer>() {
    {
      put('a', 1);
      put('e', 1);
      put('i', 1);
      put('o', 1);
      put('u', 1);
      put('l', 1);
      put('n', 1);
      put('r', 1);
      put('s', 1);
      put('t', 1);
      put('d', 2);
      put('g', 2);
      put('b', 3);
      put('c', 3);
      put('m', 3);
      put('p', 3);
      put('f', 4);
      put('h', 4);
      put('v', 4);
      put('w', 4);
      put('y', 4);
      put('k', 5);
      put('j', 8);
      put('x', 8);
      put('q', 10);
      put('z', 10);
    }
  };

  String word;

  public ScrabbleSolver(String word) {
    this.word = word;
  }

  public Integer score() {
    if (word == null || !word.matches("[a-zA-Z]+")) {
      return 0;
    }
    Integer total = 0;

    for (Integer i = 0; i < word.length(); i++) {
      total += letterValue.get(Character.toLowerCase(word.charAt(i)));
    }
    return total;
  }

  public static void main(String[] args) {

  }
}
