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
      this.gameObj = param1;
      this.setupScreen();
      this.gameObj.var_107.api.method_88("FliplineLogoScreen", "PreGame");
    }

    public function setupScreen():void
    {
      this.clip = new fliplineLogoMC();
      this.gameObj.addChild(this.clip);
      this.clip.gotoAndStop("stopframe");
      this.clip.addEventListener(Event.ENTER_FRAME, this.updateScreen);
      // _loc1_.clip.btn.addEventListener(MouseEvent.CLICK, _loc1_.method_99);
      this.gameObj.stage.frameRate = 24;
    }

    public function updateScreen(param1:Event):void
    {
      if (this.clip.currentLabel == "stopframe")
      {
        this.clip.stop();
        this.gameObj.stage.frameRate = 30;
        this.gameObj.var_107.api.method_85("SplashScreen");
        this.gameObj.var_107.api.method_88("SplashScreen", "PreGame");
        this.gameObj.method_179();
      }
    }

    public function method_99(param1:MouseEvent):void
    {
      // _loc2_.gameObj.var_107.api.method_83("http://www.flipline.com/?utm_source=game_links&utm_medium=game_intro&utm_campaign=papalouie2", "FliplinePreroll", "LogoLinks");
    }

    public function destroy():void
    {
      this.clip.removeEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.clip.btn.removeEventListener(MouseEvent.CLICK, this.method_99);
      this.gameObj.removeChild(this.clip);
      this.clip = null;
    }
  }
}
