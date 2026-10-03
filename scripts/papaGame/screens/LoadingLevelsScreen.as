package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import mochi.as3.*;
  import package_1.class_1;
  import package_2.class_3;
  import package_3.class_11;
  import package_4.class_5;

  public class LoadingLevelsScreen
  {

    public var licenseAutoPlay:Boolean = true;

    public var normalAutoPlay:Boolean = true;

    public var gameObj:class_5;

    public var clip:MovieClip;

    public var shouldAutoPlay:Boolean = false;

    public var playButton:class_11;

    public function LoadingLevelsScreen(param1:class_5)
    {
      super();
      var _loc2_:LoadingLevelsScreen = this;
      _loc2_.gameObj = param1;
      _loc2_.setupScreen();
      _loc2_.gameObj.var_107.api.method_88("LoadingLevelsScreen", "PreGame");
    }

    public function setupScreen():void
    {
      var _loc1_:LoadingLevelsScreen = this;
      _loc1_.clip = new loadingLevelsMC();
      _loc1_.clip.bar.scaleX = 0;
      _loc1_.gameObj.addChild(_loc1_.clip);
      _loc1_.playButton = new class_11(null, "Play!", "large", "button", "clickPlayBtn", null, false, false, false, null, false, 120);
      _loc1_.playButton.x = 290;
      _loc1_.playButton.y = 316;
      _loc1_.clip.addChild(_loc1_.playButton);
      _loc1_.playButton.visible = false;
      _loc1_.playButton.addEventListener("clickPlayBtn", _loc1_.clickPlayButton);
      if (class_3.method_47())
      {
        _loc1_.shouldAutoPlay = this.licenseAutoPlay;
      }
      else
      {
        _loc1_.shouldAutoPlay = this.normalAutoPlay;
      }
    }

    public function clickSponsorLogo(param1:MouseEvent):void
    {
      var _loc2_:LoadingLevelsScreen = this;
      // _loc2_.gameObj.var_107.api.method_83(class_1.method_82(), "SponsorLoadingLevelsLogo", "LogoLinks");
    }

    public function clickLicenseLogo(param1:MouseEvent):void
    {
      var _loc2_:LoadingLevelsScreen = this;
      // _loc2_.gameObj.var_107.api.method_83(class_1.method_73(), "LicenseLoadingLevelsLogo", "LogoLinks");
    }

    public function showPlayButton():void
    {
      var _loc1_:LoadingLevelsScreen = this;
      _loc1_.gameObj.var_105.playTrack("TitleTrack", 1, 0, "crossfade");
      _loc1_.gameObj.var_105.hasShownTitleScreen = true;
      _loc1_.gameObj.var_107.api.method_85("SlotSelect");
      _loc1_.gameObj.method_129();
    }

    public function clickPlayButton(param1:Event = null):void
    {
      var _loc2_:LoadingLevelsScreen = this;
      if (class_3.method_47())
      {
        _loc2_.gameObj.method_137();
      }
      else
      {
        _loc2_.gameObj.method_169();
      }
      _loc2_.gameObj.method_129();
    }

    public function destroy():void
    {
      var _loc1_:LoadingLevelsScreen = this;
      _loc1_.playButton.removeEventListener("clickPlayBtn", _loc1_.clickPlayButton);
      _loc1_.playButton.destroy();
      _loc1_.playButton = null;
      _loc1_.gameObj.removeChild(_loc1_.clip);
      _loc1_.clip = null;
      try
      {
        _loc1_.gameObj.var_109.loadingClip = null;
      }
      catch (err:Error)
      {
      }
    }
  }
}
