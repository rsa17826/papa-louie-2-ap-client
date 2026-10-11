package papaGame.screens
{
  import Playtomic.*;
  import flash.display.*;
  import flash.events.*;
  import package_1.class_1;
  import package_4.class_5;

  public class SponsorLogoScreen
  {

    public var gameObj:class_5;
    public var clip:MovieClip;

    public function SponsorLogoScreen(param1:class_5)
    {
      super();
      this.gameObj = param1;
      this.setupScreen();
      this.gameObj.var_107.api.method_88("SponsorLogoScreen", "PreGame");
    }

    public function setupScreen():void
    {
      this.clip = new sponsorLogoMC();
      this.gameObj.addChild(this.clip);
      this.clip.gotoAndStop(this.clip.totalFrames);
      this.clip.btn.visible = true;
      this.clip.addEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.clip.btn.addEventListener(MouseEvent.CLICK, this.method_99);
    }

    public function updateScreen(param1:Event):void
    {
      if (this.clip.currentFrame == this.clip.totalFrames)
      {
        this.gameObj.method_155();
        this.gameObj.method_187();
      }
    }

    public function method_99(param1:MouseEvent):void
    {
      // _loc2_.gameObj.var_107.api.method_83(class_1.method_82(), "SponsorPreroll", "LogoLinks");
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
