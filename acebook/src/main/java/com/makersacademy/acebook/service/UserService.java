package com.makersacademy.acebook.service;

import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.Path;
import java.nio.file.Files;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

public class UserService {
  private static Path root = Paths.get("src/main/resources/static/images/uploads/");

  public static String uploadImage(MultipartFile file) {
    try {
      Files.copy(file.getInputStream(), root.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
      return "/images/uploads/" + file.getOriginalFilename().toString();
    } catch (IOException e) {
      e.printStackTrace();
      return null;
    }
  }
}
