package com.makersacademy.acebook.controller;

import com.makersacademy.acebook.model.Post;
import com.makersacademy.acebook.model.User;
import com.makersacademy.acebook.model.Friend;
import com.makersacademy.acebook.repository.PostRepository;
import com.makersacademy.acebook.repository.UserRepository;
import com.makersacademy.acebook.service.UserService;
import com.makersacademy.acebook.repository.FriendRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PostsController {

  @Autowired
  PostRepository postRepository;
  @Autowired
  UserRepository userRepository;
  @Autowired
  FriendRepository friendRepository;

  @GetMapping("/posts")
  public String index(Model model, Principal principal, @ModelAttribute Post formPost) {
    User user = userRepository.findByUsername(principal.getName()).get(0);
    List<Post> allPosts = postRepository.findAllByOrderByTimeDesc();
    List<Friend> friends = friendRepository.findByUserIdAndAccepted(user.getId(), true);
    List<Long> friendsIds = new ArrayList<Long>();
    List<Post> friendPosts = new ArrayList<Post>();

    friendsIds.add(user.getId());
    for (Friend friend : friends) {
      friendsIds.add(friend.getFriend().getId());
    }

    for (Post post : allPosts) {
      if (friendsIds.contains(post.getUser().getId())) {
        friendPosts.add(post);
      }
    }

    model.addAttribute("currentUser", user);
    model.addAttribute("posts", friendPosts);
    return "posts/feed";
  }

  @PostMapping("/posts")
  public RedirectView create(@ModelAttribute Post post, Principal principal,
      @RequestParam(name = "imageFile") MultipartFile imageFile) {
    User user = userRepository.findByUsername(principal.getName()).get(0);
    post.setUser(user);

    if (!imageFile.getOriginalFilename().isEmpty()) {
      post.setImageUrl(UserService.uploadImage(imageFile));
    }

    if (!post.getMessage().isEmpty()) {
      postRepository.save(post);
    }
    return new RedirectView("/posts");
  }

  @GetMapping("/posts/delete/{postId}")
  public RedirectView delete(@PathVariable Long postId, Principal principal) {
    Post post = postRepository.findAllById(postId).get(0);
    User user = userRepository.findByUsername(principal.getName()).get(0);

    if (post.getUser().getId() == user.getId()) {
      postRepository.deleteById(postId);
    }
    return new RedirectView("/posts");
  }
}
