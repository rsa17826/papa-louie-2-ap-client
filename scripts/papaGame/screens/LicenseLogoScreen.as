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
      var _loc2_:LicenseLogoScreen = this;
      _loc2_.gameObj = param1;
      _loc2_.setupScreen();
      _loc2_.gameObj.var_107.api.method_88("LicenseLogoScreen", "PreGame");
    }

    public function setupScreen():void
    {
      var _loc1_:LicenseLogoScreen = this;
      _loc1_.clip = new licenseLogoMC();
      _loc1_.gameObj.addChild(_loc1_.clip);
      _loc1_.clip.gotoAndStop(_loc1_.clip.totalFrames);
      _loc1_.clip.addEventListener(Event.ENTER_FRAME, _loc1_.updateScreen);
      _loc1_.clip.btn.addEventListener(MouseEvent.CLICK, _loc1_.method_99);
      _loc1_.gameObj.stage.frameRate = 45;
    }

    public function updateScreen(param1:Event):void
    {
      var _loc2_:LicenseLogoScreen = this;
      if (_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
      {
        _loc2_.gameObj.stage.frameRate = 30;
        _loc2_.gameObj.method_155();
        _loc2_.gameObj.method_194();
      }
    }

    public function method_99(param1:MouseEvent):void
    {
      var _loc2_:LicenseLogoScreen = this;
      // _loc2_.gameObj.var_107.api.method_83(class_1.method_73(), "LicensePreroll", "LogoLinks");
    }

    public function destroy():void
    {
      var _loc1_:LicenseLogoScreen = this;
      _loc1_.clip.removeEventListener(Event.ENTER_FRAME, _loc1_.updateScreen);
      _loc1_.clip.btn.removeEventListener(MouseEvent.CLICK, _loc1_.method_99);
      _loc1_.gameObj.removeChild(_loc1_.clip);
      _loc1_.clip = null;
    }
  }
}
