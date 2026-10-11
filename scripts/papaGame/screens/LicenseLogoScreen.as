package papaGame.screens
{
  import Playtomic.*;
  import flash.display.*;
  import flash.events.*;
  import package_1.class_1;
  import package_4.class_5;

  public class LicenseLogoScreen
  {

    public var gameObj:class_5;
    public var clip:MovieClip;

    public function LicenseLogoScreen(param1:class_5)
    {
      super();
      this.gameObj = param1;
      this.setupScreen();
      this.gameObj.var_107.api.method_88("LicenseLogoScreen", "PreGame");
    }

    public function setupScreen():void
    {
      this.clip = new licenseLogoMC();
      this.gameObj.addChild(this.clip);
      this.clip.gotoAndStop(this.clip.totalFrames);
      this.clip.addEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.clip.btn.addEventListener(MouseEvent.CLICK, this.method_99);
      this.gameObj.stage.frameRate = 45;
    }

    public function updateScreen(param1:Event):void
    {
      if (this.clip.currentFrame == this.clip.totalFrames)
      {
        this.gameObj.stage.frameRate = 30;
        this.gameObj.method_155();
        this.gameObj.method_194();
      }
    }

    public function method_99(param1:MouseEvent):void
    {
      // _loc2_.gameObj.var_107.api.method_83(class_1.method_73(), "LicensePreroll", "LogoLinks");
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
