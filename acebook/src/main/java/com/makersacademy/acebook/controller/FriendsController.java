package com.makersacademy.acebook.controller;

import com.makersacademy.acebook.model.Friend;
import com.makersacademy.acebook.model.User;
import com.makersacademy.acebook.repository.FriendRepository;
import com.makersacademy.acebook.repository.UserRepository;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class FriendsController {

  @Autowired
  FriendRepository friendRepository;
  @Autowired
  UserRepository userRepository;

  @GetMapping("/friends/{username}")
  public String listFriends(Model model, @PathVariable String username) {
    User user = userRepository.findByUsername(username).get(0);
    List<Friend> sentRequests = friendRepository.findByUserIdAndAccepted(user.getId(), false);
    List<Friend> receivedRequests = friendRepository.findByTheFriendIdAndAccepted(user.getId(), false);
    List<Friend> friends = friendRepository.findByUserIdAndAccepted(user.getId(), true);

    model.addAttribute("friends", friends);
    model.addAttribute("requests", receivedRequests);
    model.addAttribute("sentRequests", sentRequests);
    return "friends/list";
  }

  @GetMapping("/friends/accept/{username}")
  public RedirectView acceptFriend(Model model, @PathVariable String username, Principal principal) {
    User user = userRepository.findByUsername(username).get(0);
    User theFriend = userRepository.findByUsername(principal.getName()).get(0);
    Long userId = user.getId();
    Long friendId = theFriend.getId();

    Friend acceptFriend = friendRepository.findByUserIdAndTheFriendIdAndAccepted(userId, friendId, false).get(0);

    acceptFriend.setAccepted(true);
    friendRepository.save(acceptFriend);

    Friend reverseFriend = new Friend(theFriend, user, true);
    friendRepository.save(reverseFriend);

    String redirect = "/friends/" + principal.getName();
    return new RedirectView(redirect);
  }

  @GetMapping("/friends/reject/{username}")
  public RedirectView rejectFriend(Model model, @PathVariable String username, Principal principal) {
    User user = userRepository.findByUsername(username).get(0);
    User theFriend = userRepository.findByUsername(principal.getName()).get(0);
    Long userId = user.getId();
    Long friendId = theFriend.getId();

    Friend acceptFriend = friendRepository.findByUserIdAndTheFriendIdAndAccepted(userId, friendId, false).get(0);

    friendRepository.deleteById(acceptFriend.getId());

    String redirect = "/friends/" + principal.getName();
    return new RedirectView(redirect);
  }

  @GetMapping("/friends/add/{username}")
  public RedirectView addFriend(Model model, Friend friend, @PathVariable String username, Principal principal,
      RedirectAttributes redirAttrs) {
    String message = null;

    User currentUser = userRepository.findByUsername(principal.getName()).get(0);
    User friendUser = userRepository.findByUsername(username).get(0);

    List<Friend> outgoingRequestList = friendRepository.findByUserIdAndTheFriendId(currentUser.getId(),
        friendUser.getId());
    List<Friend> incomingRequestList = friendRepository.findByUserIdAndTheFriendId(friendUser.getId(),
        currentUser.getId());

    if (outgoingRequestList.isEmpty() && incomingRequestList.isEmpty()) {
      if (currentUser.getId() == friendUser.getId()) {
        message = "You are already your own best friend!";
      } else {
        friend.setUser(currentUser);
        friend.setFriend(friendUser);
        friendRepository.save(friend);
      }
    } else {
      if (!outgoingRequestList.isEmpty()) {
        Friend outgoingRequest = outgoingRequestList.get(0);
        message = outgoingRequest.getAccepted() ? "You are already friends!" : "You have already sent a request!";
      }
      if (!incomingRequestList.isEmpty()) {
        Friend incomingRequest = incomingRequestList.get(0);
        message = incomingRequest.getAccepted() ? "You are already friends!"
            : "You already have a friend request from this user!";
      }
    }

    redirAttrs.addFlashAttribute("message", message);
    String redirect = "/friends/" + currentUser.getUsername();
    return new RedirectView(redirect);
  }

  @GetMapping("/friends/delete/{friendId}")
  public RedirectView delete(@PathVariable Long friendId, Principal principal) {
    Friend friend1 = friendRepository.findAllById(friendId).get(0);
    Friend friend2 = friendRepository.findByUserIdAndTheFriendId(
        friend1.getFriend().getId(), friend1.getUser().getId()).get(0);
    friendRepository.deleteById(friend1.getId());
    friendRepository.deleteById(friend2.getId());
    String redirect = "/friends/" + principal.getName();
    return new RedirectView(redirect);
  }
}
