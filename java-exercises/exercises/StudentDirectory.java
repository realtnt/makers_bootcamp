// StudentDirectory.java

import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

public class StudentDirectory {

  // This is a "nested" static class made for convenience here -
  // you can assume the following line is right!
  static class Student {
    // Properties
    private String name;
    private String cohortName;

    // Constructor
    public Student(String name, String cohortName) {
      this.name = name;
      this.cohortName = cohortName;
    }

    // Getters
    public String getName() {
      return this.name;
    }

    public String getCohortName() {
      return this.cohortName;
    }
  }

  public static void main(String[] args) {
    ArrayList<Student> studentList = new ArrayList<Student>();
    studentList.add(new Student("Alex", "January 2020"));
    studentList.add(new Student("Maria", "January 2020"));
    studentList.add(new Student("Lisa", "January 2020"));

    Enumeration<Student> enumeration = Collections.enumeration(studentList);

    System.out.println("List of students:");
    while (enumeration.hasMoreElements()) {
      Student currentStudent = enumeration.nextElement();
      String line = String.format(" * %s - %s", currentStudent.name,
          currentStudent.cohortName);
      System.out.println(line);
    }
  }
}
