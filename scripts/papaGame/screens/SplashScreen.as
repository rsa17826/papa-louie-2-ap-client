package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import flash.ui.*;
  import package_2.class_3;
  import package_2.class_7;
  import package_3.class_4;
  import package_4.class_5;

  public class SplashScreen
  {

    public var gameObj:class_5;
    public var container:MovieClip;
    public var clip:MovieClip;
    public var bgSpeed:Number = 1;
    public var mgSpeed:Number = 2;
    public var isShowingCredits:Boolean = false;
    public var creditsDivisor:Number = 4;

    public function SplashScreen(param1:class_5, param2:MovieClip, param3:Object = null)
    {
      super();
      this.gameObj = param1;
      this.container = param2;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      this.clip = new splashScreenMC();
      this.clip.iris.gotoAndStop(1);
      this.container.addChild(this.clip);
      this.container.addEventListener("clickStart", this.clickStart);
      this.container.addEventListener("clickCredits", this.clickCredits);
      this.container.addEventListener("clickHighScores", this.clickHighScores);
      this.clip.credits.y = 416;
      this.clip.credits.addEventListener(MouseEvent.CLICK, this.hideCredits);
      if (this.gameObj.var_105.hasShownTitleScreen)
      {
        this.gameObj.var_105.playTrack("TitleTrack", 1, 0, "outin");
      }
      else
      {
        this.gameObj.var_105.playTrack("TitleTrack", 1, 0, "crossfade");
        this.gameObj.var_105.hasShownTitleScreen = true;
      }
      this.clip.addEventListener(Event.ENTER_FRAME, this.animateScreen);
      this.closeSplashScreen();
      if (this.isShowingCredits)
      {
        this.hideCredits();
      }
      this.gameObj.var_107.closeLeaderboard();
      this.gameObj.var_107.api.method_226();
      this.clip.iris.gotoAndPlay("irisout");
      this.gameObj.var_107.api.method_105("SplashScreen");
      class_4.method_74();
    }

    public function animateScreen(param1:Event):void
    {
      var _loc3_:Number = 999;
      if (this.isShowingCredits && this.clip.credits.y > 0)
      {
        _loc3_ = Number(this.clip.credits.y);
        this.clip.credits.y -= _loc3_ / this.creditsDivisor;
      }
      else if (!this.isShowingCredits && this.clip.credits.y < 416)
      {
        _loc3_ = 416 - this.clip.credits.y;
        this.clip.credits.y += _loc3_ / this.creditsDivisor;
      }
      this.closeSplashScreen();
    }

    public function clickStart(param1:Event):void
    {
      if (this.isShowingCredits)
      {
        this.hideCredits();
      }
      this.gameObj.var_107.closeLeaderboard();
      this.gameObj.var_107.api.method_226();
      this.clip.iris.gotoAndPlay("irisout");
      this.gameObj.var_107.api.method_105("SplashScreen");
      class_4.method_74();
    }

    public function clickHighScores(param1:Event):void
    {
      this.gameObj.var_107.showLeaderboard();
    }

    public function closedHighScores(param1:Event = null):void
    {
    }

    public function errorHighScores(param1:Event = null):void
    {
      class_7.error("Error with High Scores!");
    }

    public function clickCredits(param1:Event):void
    {
      this.gameObj.var_107.closeLeaderboard();
      this.isShowingCredits = !this.isShowingCredits;
    }

    public function hideCredits(param1:MouseEvent = null):void
    {
      this.isShowingCredits = false;
    }

    public function destroy():void
    {
      this.clip.promo_holder.promo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickPromo);
      this.clip.promo2_holder.promo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickPromoTwo);
      this.clip.promo3_holder.promo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickPromoThree);
      this.container.removeEventListener("clickStart", this.clickStart);
      this.container.removeEventListener("clickCredits", this.clickCredits);
      this.container.removeEventListener("clickHighScores", this.clickHighScores);
      this.clip.credits.removeEventListener(MouseEvent.CLICK, this.hideCredits);
      this.clip.removeEventListener(Event.ENTER_FRAME, this.animateScreen);
      this.container.removeChild(this.clip);
      this.clip = null;
    }

    public function closeSplashScreen(param1:MouseEvent = null):void
    {
      this.gameObj.var_107.api.method_85("SlotSelect");
      this.gameObj.var_107.api.method_86("SplashScreen");
    }

    public function clickPromo(param1:MouseEvent):void
    {
      // _loc2_.gameObj.var_107.api.method_83("http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8", "iPadPromoSplash", "Links");
    }

    public function clickPromoThree(param1:MouseEvent):void
    {
      // _loc2_.gameObj.var_107.api.method_83("https://itunes.apple.com/us/app/papas-burgeria-to-go!/id600626116?ls=1&mt=8", "ToGoPromoSplash", "Links");
    }

    public function clickPromoTwo(param1:MouseEvent):void
    {
      // _loc2_.gameObj.var_107.api.method_83("http://www.flipline.com/games/papashotdoggeria/index.html?utm_source=newgame_promo&utm_medium=papaswingeria&utm_campaign=papashotdoggeria", "PromoHotDoggeria", "Links");
    }
  }
}
