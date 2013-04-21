package controllers;

import play.*;
import play.mvc.*;

import views.html.*;
import models.*;

public class Application extends Controller {
//	static DABGame DABgame = new DABGame();
  
    public static Result index() {
        return ok(index.render("Let's Play Dots and Boxes!"));
    }
    
    public static Result playDAB(int mode) {
    	return ok(game.render("Let's Play Dots and Boxes!", mode));
    }
    
    public static Result difficulty() {
        return ok(difficulty.render("Let's Play Dots & Boxes!"));
    }
    public static Result rules() {
        return ok(rules.render("Let's Play Dots & Boxes"));
    }
    public static Result pvp() {
        return ok(pvp.render("Let's Play Dots & Boxes!"));
    }
    public static Result easy() {
        return ok(easy.render("Let's Play Dots & Boxes!"));
    }
    public static Result hard() {
        return ok(hard.render("Let's Play Dots & Boxes!"));
    }    
  
}
