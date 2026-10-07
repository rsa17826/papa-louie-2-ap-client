package papaGame.models
{
  import flash.display.*;
  import flash.events.*;
  import flash.filters.GlowFilter;
  import flash.geom.*;
  import flash.utils.getDefinitionByName;
  import package_1.class_1;
  import package_2.class_10;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.CustomerData;
  import papaGame.data.CustomerDataFile;
  import papaGame.data.UserData;
  import papaGame.display.GameDisplay;
  import papaGame.events.GameControls;
  import papaGame.managers.ChallengeManager;
  import papaGame.models.characters.CustomerChar;

  public class GameHUD
  {

    public var gameObj:class_5;
    public var clip:MovieClip;
    public var interfaceClip:MovieClip;
    public var gameplayClip:MovieClip;
    public var gameplayLocation:Point = new Point(0, 0);
    public var dialogTimer:Number = 0;
    public var dialogTimerMax:Number = 10;
    public var portraitMC:MovieClip = null;

    public function GameHUD(param1:class_5)
    {
      super();
      this.gameObj = param1;
      this.setupHUD();
    }

    public function setupHUD():void
    {
      this.clip = new MovieClip();
      this.gameplayClip = new MovieClip();
      this.clip.addChild(this.gameplayClip);
      this.gameplayClip.mouseEnabled = false;
      this.gameplayClip.mouseChildren = false;
      this.interfaceClip = new hudMC();
      this.interfaceClip.mouseEnabled = false;
      this.clip.addChild(this.interfaceClip);
      this.attachHUD();
      this.updateDisplay();
      this.updateTimer();
      this.interfaceClip.menu_btn.addEventListener(MouseEvent.CLICK, this.clickMenu);
      this.interfaceClip.mute_btn.addEventListener(MouseEvent.CLICK, this.clickMute);
      this.interfaceClip.unmute_btn.addEventListener(MouseEvent.CLICK, this.clickUnmute);
      this.interfaceClip.fps_txt.addEventListener(MouseEvent.CLICK, this.clickFPS);
      this.interfaceClip.fps_txt.alpha = 0;
      this.interfaceClip.menu_btn.tabEnabled = false;
      this.interfaceClip.mute_btn.tabEnabled = false;
      this.interfaceClip.unmute_btn.tabEnabled = false;
      if (this.gameObj.var_105.isMute)
      {
        this.interfaceClip.mute_btn.visible = false;
        this.interfaceClip.unmute_btn.visible = true;
      }
      else
      {
        this.interfaceClip.mute_btn.visible = true;
        this.interfaceClip.unmute_btn.visible = false;
      }
      var _loc2_:CustomerDataFile = this.gameObj.var_113.getCustomerData(this.gameObj.var_106.selectedCharacter);
      this.interfaceClip.skill.gotoAndStop(_loc2_.skillType);
      this.setupPortrait();
      this.setupBubbles();
      this.hideHUD();
    }

    public function attachHUD():void
    {
      this.gameObj.var_128.addChild(this.clip);
    }

    public function attachGameDisplay(param1:DisplayObject):void
    {
      this.gameplayClip.addChild(param1);
    }

    public function updateDisplay():void
    {
      var _loc2_:UserData = this.gameObj.var_106;
      if (this.interfaceClip)
      {
        this.interfaceClip.points_txt.htmlText = "<b>" + class_10.method_84(_loc2_.getCurrentPoints()) + " PTS</b>";
        if (this.gameObj.var_109.currentLevel < 8)
        {
          this.interfaceClip.coins_txt.htmlText = "<b>" + class_10.method_84(_loc2_.getCurrentMoney()) + "/" + this.gameObj.var_112.getChallengeTargetAmount(this.gameObj.var_109.currentLevel, 6) + "</b>";
          this.interfaceClip.burgers_txt.htmlText = "<b>" + _loc2_.getCurrentBurgerzillas() + "/" + this.gameObj.var_112.getChallengeTargetAmount(this.gameObj.var_109.currentLevel, 5) + "</b>";
          this.interfaceClip.special_txt.htmlText = "<b>" + _loc2_.getCurrentSpecialItems() + "/" + this.gameObj.var_112.getChallengeTargetAmount(this.gameObj.var_109.currentLevel, 4) + "</b>";
        }
        else
        {
          this.interfaceClip.coins_txt.htmlText = "<b>" + class_10.method_84(_loc2_.getCurrentMoney()) + "</b>";
          this.interfaceClip.burgers_txt.htmlText = "";
          this.interfaceClip.special_txt.htmlText = "";
          this.interfaceClip.burgericon.visible = false;
          this.interfaceClip.specialicon.visible = false;
        }
        this.interfaceClip.specialicon.gotoAndStop(this.gameObj.var_109.currentLevel + 1);
      }
    }

    public function updateTimer():void
    {
      var _loc3_:Number = NaN;
      var _loc2_:UserData = this.gameObj.var_106;
      if (this.interfaceClip)
      {
        _loc3_ = 0;
        if (this.gameObj.var_108)
        {
          _loc3_ = this.gameObj.var_108.gameplayTimer;
        }
        this.interfaceClip.timer_txt.text = class_10.method_109(_loc3_, true);
      }
    }

    public function updateMessageFPS(param1:String):void
    {
      if (this.interfaceClip)
      {
        this.interfaceClip.fps_txt.text = param1;
      }
    }

    public function hideHUD():void
    {
      if (this.interfaceClip)
      {
        this.interfaceClip.visible = false;
      }
    }

    public function showHUD():void
    {
      if (this.interfaceClip)
      {
        this.interfaceClip.visible = true;
        this.updateAdjustmentNumbers();
      }
    }

    public function clickMenu(param1:MouseEvent):void
    {
      if (!this.gameObj.var_103.isTransitioningIn && !this.gameObj.var_103.isTransitionOut)
      {
        this.gameObj.var_108.pauseGame();
        this.gameObj.var_107.api.method_85("PauseMenu", {"section": "info"});
      }
    }

    public function clickMute(param1:MouseEvent):void
    {
      this.gameObj.var_105.muteSound(true);
      this.updateMuteButton();
    }

    public function clickUnmute(param1:MouseEvent):void
    {
      this.gameObj.var_105.unmuteSound(true);
      this.updateMuteButton();
    }

    public function updateMuteButton():void
    {
      if (this.interfaceClip)
      {
        this.interfaceClip.mute_btn.visible = !this.gameObj.var_105.isMute;
        this.interfaceClip.unmute_btn.visible = this.gameObj.var_105.isMute;
      }
    }

    public function clickPause(param1:MouseEvent = null):void
    {
      var _loc3_:GameControls = this.gameObj.var_108;
      if (_loc3_ != null)
      {
        if (!_loc3_.isPaused)
        {
          _loc3_.pauseGame();
        }
        else if (_loc3_.isPaused)
        {
          _loc3_.resumeGame();
        }
      }
    }

    public function clickFPS(param1:MouseEvent = null):void
    {
      if (this.interfaceClip)
      {
        if (param1.shiftKey)
        {
          if (this.interfaceClip.fps_txt.alpha == 0)
          {
            this.interfaceClip.fps_txt.alpha = 1;
          }
          else
          {
            this.interfaceClip.fps_txt.alpha = 0;
          }
        }
      }
    }

    public function clickSponsorLogo(param1:MouseEvent = null):void
    {
      var _loc3_:GameControls = this.gameObj.var_108;
      if (_loc3_ != null)
      {
        if (!_loc3_.isPaused)
        {
          _loc3_.pauseGame();
        }
      }
      // _loc2_.gameObj.var_107.api.method_83(class_1.method_82(),"SponsorHUDLogo","LogoLinks");
    }

    public function clickLicenseLogo(param1:MouseEvent = null):void
    {
      var _loc3_:GameControls = this.gameObj.var_108;
      if (_loc3_ != null)
      {
        if (!_loc3_.isPaused)
        {
          _loc3_.pauseGame();
        }
      }
      // _loc2_.gameObj.var_107.api.method_83(class_1.method_73(),"LicenseHUDLogo","LogoLinks");
    }

    public function updatePlayerHealth(param1:Number):void
    {
      var _loc3_:int = 0;
      if (this.interfaceClip)
      {
        _loc3_ = 1;
        while (_loc3_ <= 3)
        {
          if (param1 >= _loc3_)
          {
            this.interfaceClip["heart" + _loc3_].visible = true;
          }
          else
          {
            this.interfaceClip["heart" + _loc3_].visible = false;
          }
          _loc3_++;
        }
      }
    }

    public function destroy():void
    {
      this.setupBubbles(false);
      this.cleanupModel();
      this.clip.removeChild(this.gameplayClip);
      this.gameplayClip = null;
      if (this.interfaceClip)
      {
        if (this.interfaceClip.menu_btn)
        {
          this.interfaceClip.menu_btn.removeEventListener(MouseEvent.CLICK, this.clickMenu);
        }
        this.interfaceClip.mute_btn.removeEventListener(MouseEvent.CLICK, this.clickMute);
        this.interfaceClip.unmute_btn.removeEventListener(MouseEvent.CLICK, this.clickUnmute);
        this.interfaceClip.fps_txt.removeEventListener(MouseEvent.CLICK, this.clickFPS);
        this.interfaceClip.mouseEnabled = false;
      }
      this.clip.removeChild(this.interfaceClip);
      this.interfaceClip = null;
      this.gameObj.var_128.removeChild(this.clip);
      this.clip = null;
    }

    public function clickAdjustment(param1:MouseEvent):void
    {
    }

    public function updateAdjustmentNumbers():void
    {
      var _loc2_:CustomerChar = CustomerChar(this.gameObj.playerObj);
    }

    public function showTally(param1:Number, param2:Number):void
    {
    }

    public function animateTally(param1:Event):void
    {
      var _loc3_:PlayerChar = this.gameObj.playerObj;
      var _loc4_:GameDisplay = this.gameObj.var_103;
    }

    public function setupBubbles(param1:Boolean = true):void
    {
      var _loc4_:String = null;
      var _loc5_:String = null;
      var _loc6_:String = null;
      var _loc3_:ChallengeManager = this.gameObj.var_112;
      if (param1)
      {
        _loc4_ = _loc3_.getChallengeSkillNeeded(_loc3_.gameObj.var_158, 4);
        _loc5_ = _loc3_.getChallengeSkillNeeded(_loc3_.gameObj.var_158, 5);
        _loc6_ = _loc3_.getChallengeSkillNeeded(_loc3_.gameObj.var_158, 6);
        if (_loc4_ == CustomerData.SKILL_NONE)
        {
          this.interfaceClip.bubble_special.visible = false;
        }
        else
        {
          this.interfaceClip.bubble_special.inside.skill.gotoAndStop(_loc4_);
        }
        if (_loc5_ == CustomerData.SKILL_NONE)
        {
          this.interfaceClip.bubble_burgers.visible = false;
        }
        else
        {
          this.interfaceClip.bubble_burgers.inside.skill.gotoAndStop(_loc5_);
        }
        if (_loc6_ == CustomerData.SKILL_NONE)
        {
          this.interfaceClip.bubble_coins.visible = false;
        }
        else
        {
          this.interfaceClip.bubble_coins.inside.skill.gotoAndStop(_loc6_);
        }
        this.interfaceClip.bubble_coins.mouseEnabled = true;
        this.interfaceClip.bubble_coins.buttonMode = true;
        this.interfaceClip.bubble_burgers.mouseEnabled = true;
        this.interfaceClip.bubble_burgers.buttonMode = true;
        this.interfaceClip.bubble_special.mouseEnabled = true;
        this.interfaceClip.bubble_special.buttonMode = true;
        this.interfaceClip.bubble_coins.addEventListener(MouseEvent.ROLL_OVER, this.rolloverBubble);
        this.interfaceClip.bubble_coins.addEventListener(MouseEvent.ROLL_OUT, this.rolloutBubble);
        this.interfaceClip.bubble_burgers.addEventListener(MouseEvent.ROLL_OVER, this.rolloverBubble);
        this.interfaceClip.bubble_burgers.addEventListener(MouseEvent.ROLL_OUT, this.rolloutBubble);
        this.interfaceClip.bubble_special.addEventListener(MouseEvent.ROLL_OVER, this.rolloverBubble);
        this.interfaceClip.bubble_special.addEventListener(MouseEvent.ROLL_OUT, this.rolloutBubble);
      }
      else
      {
        this.interfaceClip.bubble_coins.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverBubble);
        this.interfaceClip.bubble_coins.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutBubble);
        this.interfaceClip.bubble_burgers.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverBubble);
        this.interfaceClip.bubble_burgers.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutBubble);
        this.interfaceClip.bubble_special.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverBubble);
        this.interfaceClip.bubble_special.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutBubble);
      }
    }

    public function rolloverBubble(param1:MouseEvent):void
    {
      param1.currentTarget.gotoAndPlay("show");
    }

    public function rolloutBubble(param1:MouseEvent):void
    {
      param1.currentTarget.gotoAndPlay("hide");
    }

    public function setupPortrait():void
    {
      var _loc15_:Class = null;
      var _loc16_:Class = null;
      var _loc17_:MovieClip = null;
      var _loc2_:MovieClip = new customerPortraitMC();
      var _loc3_:String = this.gameObj.var_113.getCustomerClipName(this.gameObj.var_106.selectedCharacter);
      if (this.gameObj.var_106.selectedStyle == 2)
      {
        _loc3_ += "2";
      }
      else if (this.gameObj.var_106.selectedStyle == 3)
      {
        _loc3_ += "3";
      }
      var _loc4_:Class = getDefinitionByName("customer_" + _loc3_ + "_head") as Class;
      var _loc5_:MovieClip = new _loc4_();
      _loc5_.name = "clip";
      _loc2_.head.addChild(_loc5_);
      var _loc6_:Class = getDefinitionByName("customer_" + _loc3_ + "_eyes") as Class;
      var _loc7_:MovieClip = new _loc6_();
      _loc7_.name = "clip";
      _loc2_.eyes.addChild(_loc7_);
      var _loc8_:Class = getDefinitionByName("customer_" + _loc3_ + "_mouth") as Class;
      var _loc9_:MovieClip = new _loc8_();
      _loc9_.name = "clip";
      _loc2_.mouth.addChild(_loc9_);
      var _loc10_:MovieClip = null;
      try
      {
        _loc15_ = getDefinitionByName("customer_" + _loc3_ + "_hair") as Class;
        _loc10_ = new _loc15_();
        _loc10_.name = "clip";
        _loc2_.hair.addChild(_loc10_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc16_ = getDefinitionByName("customer_" + _loc3_ + "_back_hair") as Class;
        _loc17_ = new _loc16_();
        _loc17_.name = "clip";
        _loc2_.back_hair.addChild(_loc17_);
      }
      catch (err:Error)
      {
      }
      var _loc11_:GlowFilter = new GlowFilter(0, 1, 1.3, 1.3, 4.68);
      _loc2_.filters = [_loc11_];
      _loc2_.scaleX = 0.35;
      _loc2_.scaleY = 0.35;
      _loc2_.x = 0;
      _loc2_.y = 0;
      var _loc12_:Rectangle = _loc2_.head.getChildAt(0).getBounds(_loc2_.head.getChildAt(0));
      _loc2_.x -= (57 - (_loc12_.x + _loc12_.width)) * _loc2_.scaleX;
      _loc2_.y += (19 - (_loc12_.y + _loc12_.height)) * _loc2_.scaleY;
      this.interfaceClip.portraitholder.addChild(_loc2_);
      this.portraitMC = _loc2_;
      this.portraitMC.mouseEnabled = false;
      this.portraitMC.mouseChildren = false;
    }

    public function cleanupModel():void
    {
      if (this.portraitMC)
      {
        try
        {
          this.portraitMC.head.removeChildAt(0);
          this.portraitMC.eyes.removeChildAt(0);
          this.portraitMC.mouth.removeChildAt(0);
        }
        catch (err:Error)
        {
        }
        try
        {
          this.portraitMC.hair.removeChildAt(0);
        }
        catch (err:Error)
        {
        }
        try
        {
          this.portraitMC.back_hair.removeChildAt(0);
        }
        catch (err:Error)
        {
        }
        this.interfaceClip.portraitholder.removeChild(this.portraitMC);
        this.portraitMC = null;
      }
    }

    public function tempRemoveInterface():void
    {
      class_7.method_1("TEMP REMOVE INTERFACE!");
      if (this.interfaceClip)
      {
        this.clip.removeChild(this.interfaceClip);
        this.interfaceClip = null;
      }
    }
  }
}
