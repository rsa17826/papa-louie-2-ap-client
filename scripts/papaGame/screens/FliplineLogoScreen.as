package papaGame.screens
{
  import Playtomic.*;
  import flash.display.*;
  import flash.events.*;
  import package_4.class_5;

  public class FliplineLogoScreen
  {

    public var gameObj:class_5;

    public var clip:MovieClip;

    public function FliplineLogoScreen(param1:class_5)
    {
      super();
      var _loc2_:FliplineLogoScreen = this;
      _loc2_.gameObj = param1;
      _loc2_.setupScreen();
      _loc2_.gameObj.var_107.api.method_88("FliplineLogoScreen", "PreGame");
    }

    public function setupScreen():void
    {
      var _loc1_:FliplineLogoScreen = this;
      _loc1_.clip = new fliplineLogoMC();
      _loc1_.gameObj.addChild(_loc1_.clip);
      _loc1_.clip.gotoAndStop("stopframe");
      _loc1_.clip.addEventListener(Event.ENTER_FRAME, _loc1_.updateScreen);
      // _loc1_.clip.btn.addEventListener(MouseEvent.CLICK, _loc1_.method_99);
      _loc1_.gameObj.stage.frameRate = 24;
    }

    public function updateScreen(param1:Event):void
    {
      var _loc2_:FliplineLogoScreen = this;
      if (_loc2_.clip.currentLabel == "stopframe")
      {
        _loc2_.clip.stop();
        _loc2_.gameObj.stage.frameRate = 30;
        _loc2_.gameObj.var_107.api.method_85("SplashScreen");
        _loc2_.gameObj.var_107.api.method_88("SplashScreen", "PreGame");
        _loc2_.gameObj.method_179();
      }
    }

    public function method_99(param1:MouseEvent):void
    {
      var _loc2_:FliplineLogoScreen = this;
      // _loc2_.gameObj.var_107.api.method_83("http://www.flipline.com/?utm_source=game_links&utm_medium=game_intro&utm_campaign=papalouie2", "FliplinePreroll", "LogoLinks");
    }

    public function destroy():void
    {
      var _loc1_:FliplineLogoScreen = this;
      _loc1_.clip.removeEventListener(Event.ENTER_FRAME, _loc1_.updateScreen);
      _loc1_.clip.btn.removeEventListener(MouseEvent.CLICK, _loc1_.method_99);
      _loc1_.gameObj.removeChild(_loc1_.clip);
      _loc1_.clip = null;
    }
  }
}
