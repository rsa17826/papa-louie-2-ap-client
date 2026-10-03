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
      var _loc4_:SplashScreen = this;
      _loc4_.gameObj = param1;
      _loc4_.container = param2;
      _loc4_.setupScreen();
    }

    public function setupScreen():void
    {
      var _loc1_:SplashScreen = this;
      _loc1_.clip = new splashScreenMC();
      _loc1_.clip.iris.gotoAndStop(1);
      _loc1_.container.addChild(_loc1_.clip);
      _loc1_.container.addEventListener("clickStart", _loc1_.clickStart);
      _loc1_.container.addEventListener("clickCredits", _loc1_.clickCredits);
      _loc1_.container.addEventListener("clickHighScores", _loc1_.clickHighScores);
      _loc1_.clip.credits.y = 416;
      _loc1_.clip.credits.addEventListener(MouseEvent.CLICK, _loc1_.hideCredits);
      if (_loc1_.gameObj.var_105.hasShownTitleScreen)
      {
        _loc1_.gameObj.var_105.playTrack("TitleTrack", 1, 0, "outin");
      }
      else
      {
        _loc1_.gameObj.var_105.playTrack("TitleTrack", 1, 0, "crossfade");
        _loc1_.gameObj.var_105.hasShownTitleScreen = true;
      }
      _loc1_.clip.addEventListener(Event.ENTER_FRAME, _loc1_.animateScreen);
      var _loc2_:SplashScreen = this;
      _loc2_.closeSplashScreen();
      if (_loc2_.isShowingCredits)
      {
        _loc2_.hideCredits();
      }
      _loc2_.gameObj.var_107.closeLeaderboard();
      _loc2_.gameObj.var_107.api.method_226();
      _loc2_.clip.iris.gotoAndPlay("irisout");
      _loc2_.gameObj.var_107.api.method_105("SplashScreen");
      class_4.method_74();
      // _loc1_.clip.promo_holder.promo_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc1_.clickPromo);
      // _loc1_.clip.promo2_holder.promo_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc1_.clickPromoTwo);
      // _loc1_.clip.promo3_holder.promo_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc1_.clickPromoThree);
      _loc1_.clip.promo_holder.visible = false;
      _loc1_.clip.promo2_holder.visible = false;
      _loc1_.clip.promo3_holder.visible = false;
      if (class_3.method_47() == false)
      {
        class_4.method_62(class_4.const_5, _loc1_.gameObj, 628, 207);
        if (Math.random() > 0.5)
        {
          class_4.method_62(class_4.const_4, _loc1_.gameObj, 71, 207);
        }
        else
        {
          class_4.method_62(class_4.const_6, _loc1_.gameObj, 71, 207);
        }
      }
    }

    public function animateScreen(param1:Event):void
    {
      var _loc2_:SplashScreen = this;
      var _loc3_:Number = 999;
      if (_loc2_.isShowingCredits && _loc2_.clip.credits.y > 0)
      {
        _loc3_ = Number(_loc2_.clip.credits.y);
        _loc2_.clip.credits.y -= _loc3_ / _loc2_.creditsDivisor;
      }
      else if (!_loc2_.isShowingCredits && _loc2_.clip.credits.y < 416)
      {
        _loc3_ = 416 - _loc2_.clip.credits.y;
        _loc2_.clip.credits.y += _loc3_ / _loc2_.creditsDivisor;
      }
      if (_loc2_.clip.iris.currentFrame == 21)
      {
        _loc2_.closeSplashScreen();
      }
    }

    public function clickStart(param1:Event):void
    {
      var _loc2_:SplashScreen = this;
      if (_loc2_.isShowingCredits)
      {
        _loc2_.hideCredits();
      }
      _loc2_.gameObj.var_107.closeLeaderboard();
      _loc2_.gameObj.var_107.api.method_226();
      _loc2_.clip.iris.gotoAndPlay("irisout");
      _loc2_.gameObj.var_107.api.method_105("SplashScreen");
      class_4.method_74();
    }

    public function clickHighScores(param1:Event):void
    {
      var _loc2_:SplashScreen = this;
      _loc2_.gameObj.var_107.showLeaderboard();
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
      var _loc2_:SplashScreen = this;
      _loc2_.gameObj.var_107.closeLeaderboard();
      _loc2_.isShowingCredits = !_loc2_.isShowingCredits;
    }

    public function hideCredits(param1:MouseEvent = null):void
    {
      var _loc2_:SplashScreen = this;
      _loc2_.isShowingCredits = false;
    }

    public function destroy():void
    {
      var _loc1_:SplashScreen = this;
      _loc1_.clip.promo_holder.promo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc1_.clickPromo);
      _loc1_.clip.promo2_holder.promo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc1_.clickPromoTwo);
      _loc1_.clip.promo3_holder.promo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc1_.clickPromoThree);
      _loc1_.container.removeEventListener("clickStart", _loc1_.clickStart);
      _loc1_.container.removeEventListener("clickCredits", _loc1_.clickCredits);
      _loc1_.container.removeEventListener("clickHighScores", _loc1_.clickHighScores);
      _loc1_.clip.credits.removeEventListener(MouseEvent.CLICK, _loc1_.hideCredits);
      _loc1_.clip.removeEventListener(Event.ENTER_FRAME, _loc1_.animateScreen);
      _loc1_.container.removeChild(_loc1_.clip);
      _loc1_.clip = null;
    }

    public function closeSplashScreen(param1:MouseEvent = null):void
    {
      var _loc2_:SplashScreen = this;
      _loc2_.gameObj.var_107.api.method_85("SlotSelect");
      _loc2_.gameObj.var_107.api.method_86("SplashScreen");
    }

    public function clickPromo(param1:MouseEvent):void
    {
      var _loc2_:SplashScreen = this;
      _loc2_.gameObj.var_107.api.method_83("http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8", "iPadPromoSplash", "Links");
    }

    public function clickPromoThree(param1:MouseEvent):void
    {
      var _loc2_:SplashScreen = this;
      _loc2_.gameObj.var_107.api.method_83("https://itunes.apple.com/us/app/papas-burgeria-to-go!/id600626116?ls=1&mt=8", "ToGoPromoSplash", "Links");
    }

    public function clickPromoTwo(param1:MouseEvent):void
    {
      var _loc2_:SplashScreen = this;
      _loc2_.gameObj.var_107.api.method_83("http://www.flipline.com/games/papashotdoggeria/index.html?utm_source=newgame_promo&utm_medium=papaswingeria&utm_campaign=papashotdoggeria", "PromoHotDoggeria", "Links");
    }
  }
}
