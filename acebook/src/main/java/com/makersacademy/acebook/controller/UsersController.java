package com.makersacademy.acebook.controller;

import com.makersacademy.acebook.model.Authority;
import com.makersacademy.acebook.model.Post;
import com.makersacademy.acebook.model.User;
import com.makersacademy.acebook.repository.AuthoritiesRepository;
import com.makersacademy.acebook.repository.PostRepository;
import com.makersacademy.acebook.repository.UserRepository;
import com.makersacademy.acebook.service.UserService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import java.security.Principal;
import org.springframework.web.bind.annotation.RequestParam;

// Image upload
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UsersController {

  @Autowired
  PostRepository postRepository;
  @Autowired
  UserRepository userRepository;
  @Autowired
  PasswordEncoder getPasswordEncoder;
  @Autowired
  AuthoritiesRepository authoritiesRepository;

  @GetMapping("/users/new")
  public String signup(Model model) {
    model.addAttribute("user", new User());
    return "users/new";
  }

  @PostMapping("/users")
  public RedirectView signup(@ModelAttribute User user, RedirectAttributes redirAttrs) {
    if (userRepository.existsByEmail(user.getEmail())) {
      redirAttrs.addFlashAttribute("message", "Email already exists!");
      return new RedirectView("/users/new");
    }

    user.setPassword(getPasswordEncoder.encode(user.getPassword()));
    user.setUsername(user.getEmail());

    userRepository.save(user);

    Authority authority = new Authority(user.getUsername(),
        "ROLE_USER");
    authoritiesRepository.save(authority);
    return new RedirectView("/login");
  }

  @GetMapping("/users/all")
  public String all(Model model) {
    model.addAttribute("users", userRepository.findAll());
    return "users/all";
  }

  @GetMapping("users/settings")
  public String settings(Model model, Principal principal) {
    User currentUser = userRepository.findByUsername(principal.getName()).get(0);
    model.addAttribute("user", currentUser);
    model.addAttribute("image", currentUser.getImageUrl());
    return "users/settings";
  }

  @GetMapping("/users/editDetails")
  public String showDetails(Model model, Principal principal) {
    User currentUser = userRepository.findByUsername(principal.getName()).get(0);
    model.addAttribute("user", currentUser);
    return "users/editDetails";
  }

  @PostMapping("/users/settings")
  public RedirectView saveDetails(
      Principal principal,
      @ModelAttribute User userForm,
      @RequestParam(name = "imageFile") MultipartFile imageFile) {
    User user = userRepository.findByUsername(principal.getName()).get(0);
    user.setName(userForm.getName());
    user.setAbout(userForm.getAbout());
    user.setEmail(userForm.getEmail());
    if (!imageFile.getOriginalFilename().isEmpty()) {
      user.setImageUrl(UserService.uploadImage(imageFile));
    }
    if (userForm.getPassword().equals(userForm.getPasswordConfirm())
        && userForm.getPassword().isEmpty()) {
      userRepository.save(user);
    } else if (userForm.getPassword().equals(userForm.getPasswordConfirm())) {
      user.setPassword(getPasswordEncoder.encode(userForm.getPassword()));
      userRepository.save(user);
    }

    return new RedirectView("/users/settings");
  }

  @GetMapping("/users/{username}")
  public String profile(Model model, @PathVariable String username, @ModelAttribute Post formPost) {
    User user = userRepository.findByUsername(username).get(0);
    List<Post> allPosts = postRepository.findAllByOrderByTimeDesc();
    List<Post> myPosts = new ArrayList<Post>();
    for (Post post : allPosts) {
      if (username.equals(post.getUser().getUsername())) {
        myPosts.add(post);
      }
    }
    model.addAttribute("myPosts", myPosts);
    model.addAttribute("user", user);
    return "users/profile";
  }

  @GetMapping("/users/search")
  public String showSearchResults(Model model, String keyword) {
    List<User> users = userRepository.findByUsernameContains(keyword);
    model.addAttribute("users", users);
    return "users/search";
  }
}
