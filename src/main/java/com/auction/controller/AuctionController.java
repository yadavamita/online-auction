package com.auction.controller;

import com.auction.model.Trade;
import com.auction.model.User;
import com.auction.service.TradeService;
import com.auction.service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * This is a controller for all the auction routes
 */
@Controller
public class AuctionController {
    private static final Logger LOG = LoggerFactory.getLogger(AuctionController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private TradeService tradeService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    /**
     * This renders the login page
     * @Param It takes one parameter of type Model
     * @Return It returns the String
     */
    @RequestMapping(value= {"/"}, method=RequestMethod.GET)
    public String login(Model model) {
        User user =new User();
        model.addAttribute("userCredentials", user);
        return "index";
    }

    /**
     * This will use to do action after submission of the login form
     * @Param It takes four parameters. 3 of type String and 1 of type Model
     * @Return It returns the String
     */
    @RequestMapping(value ={"/login"} ,method=RequestMethod.POST)
    public String processLogin(HttpSession session, @RequestParam("user_email") String email, @RequestParam("password") String password, Model model) {
        User user = userService.findUserByEmail(email);

        if(user != null) {
            if (passwordEncoder.matches(password, user.getPassword())) {
                session.setAttribute("user", email);
                session.setAttribute("name", user.getName());
                session.setAttribute("userId", user.getUserId());
                return "dashboard";
            }else {
            model.addAttribute("msg", "invalid email or password");
            return "index";
            }
        }else {
            model.addAttribute("msg", "user doesn't exists");
            return "redirect:/register";
        }
    }

    /**
     * This renders the registration form
     * @Param It takes one parameter of type Model
     * @Return It returns the String
     */
    @RequestMapping(value= {"/register"}, method=RequestMethod.GET)
    public String viewRegister(Model model) {
        return "register";
    }

    /**
     * This will use to do action after submission of the registration form
     * @Param It takes four parameters. 3 of type String and 1 of type Model
     * @Return It returns the String
     */
    @RequestMapping(value= {"/register"}, method=RequestMethod.POST)
    public String processRegister(@RequestParam("public_name") String name, @RequestParam("user_email") String email, @RequestParam("user_password") String password, Model model) {

        User user = new User();
        user.setName(name);
        user.setEmailId(email);
        user.setPassword(passwordEncoder.encode(password));

        User userExists = userService.findUserByEmail(email);
        if (userExists != null) {
            model.addAttribute("msg", "user already exists");
            return "register";
        }
        userService.saveUser(user);
        return "redirect:/";

    }

    /**
     * This will renders the user list
     * @Param It takes one parameter of type Model
     * @Return It returns the String
     */
    @GetMapping(value = "/user-list")
    public String listUsers(Model model) {
        List<User> users = this.userService.getUsers();
        model.addAttribute("users", users);
        return "user-list";
    }

    /**
     * This is a route for logout
     * @Param It takes one parameter of type HttpSession
     * @Return It returns the String
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session ) {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/";
    }

    /**
     * This renders the trade form
     * @Param It takes one parameter of type Model
     * @Return It returns the String
     */
    @RequestMapping(value= {"/add-trade"}, method= RequestMethod.GET)
    public String addTrade(Model model) {
        Trade trade = new Trade();
        model.addAttribute("tradeForm", trade);
        return "trade-form";
    }

    /**
     * This will use to do action after submission of the trade form
     * @Param It takes four parameters. 1 of type String, 2 of type double and 1 of type Model
     * @Return It returns the String
     */
    @RequestMapping(value= {"/add-trade"}, method=RequestMethod.POST)
    public String processTrade(@RequestParam("public_name") String name, @RequestParam("quantity") double quantity, @RequestParam("price") double price, Model model) {
        Trade tradeExists = tradeService.findTradeByName(name);
        if(tradeExists != null){
            model.addAttribute("msg", "order with this user already exists");
            return "trade-form";
        }
        Trade trade = new Trade(name, quantity,price);
        tradeService.saveTrade(trade);
        return "dashboard";
    }

    /**
     * This will renders the trade list
     * @Param It takes one parameter of type Model
     * @Return It returns the String
     */
    @RequestMapping(value = "/trade-list")
    public String listTrades(Model model) {
        List<Trade> trades = this.tradeService.getTrades();
        model.addAttribute("trades", trades);
        return "trade-list";
    }

    /**
     * This will delete the trade from trade list
     * @Param It takes one parameter of type String
     * @Return It returns the String
     */
    @RequestMapping(value = "/delete-{name}", method = RequestMethod.GET)
    public String deleteTrade(@PathVariable("name") String name) {
        tradeService.deleteTrade(name);
        return "redirect:/trade-list";
    }
}
