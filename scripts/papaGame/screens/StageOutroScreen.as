package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import flash.filters.GlowFilter;
  import flash.utils.getDefinitionByName;
  import package_2.class_7;
  import package_4.class_5;

  public class StageOutroScreen
  {

    public var gameObj:class_5;
    public var clip:MovieClip;
    public var playerMC:MovieClip = null;
    public var savedMC:MovieClip = null;

    public function StageOutroScreen(param1:class_5)
    {
      super();
      this.gameObj = param1;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      var _loc2_:* = 0;
      this.clip = new stageOutroMC();
      this.gameObj.var_128.addChild(this.clip);
      this.clip.x = 350;
      this.clip.y = 208;
      this.playerMC = this.buildModel(this.gameObj.var_106.selectedCharacter, this.gameObj.var_106.selectedStyle);
      this.playerMC.gotoAndStop(1);
      this.playerMC.gotoAndStop("fall");
      this.clip.inside.addChild(this.playerMC);
      if (this.gameObj.var_106.savedCharacterIndex > 0 && this.gameObj.var_106.savedCharacterWasUnlocked == false)
      {
        this.savedMC = this.buildModel(this.gameObj.var_106.savedCharacterIndex, 1);
        this.savedMC.gotoAndStop(1);
        this.savedMC.gotoAndStop("fall");
        this.savedMC.rotation = 180;
        this.savedMC.x = -640;
        this.savedMC.y = 100;
        this.clip.inside.addChild(this.savedMC);
      }
      _loc2_ = 1;
      while (_loc2_ <= 3)
      {
        if (this.gameObj.var_106.warpCoinsEarned.value >= _loc2_)
        {
          this.clip.inside["warpcoin" + _loc2_].visible = true;
        }
        else
        {
          this.clip.inside["warpcoin" + _loc2_].visible = false;
        }
        _loc2_++;
      }
      _loc2_ = 8;
      while (_loc2_ >= 1)
      {
        if (this.gameObj.var_106.money.value >= _loc2_ * 10)
        {
          this.clip.inside["coin" + _loc2_].visible = true;
        }
        else
        {
          this.clip.inside["coin" + _loc2_].visible = false;
        }
        _loc2_--;
      }
      if (this.gameObj.var_106.money.value > 0)
      {
        this.clip.inside.coin1.visible = true;
      }
      this.clip.addEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.clip.gotoAndStop(this.clip.totalFrames);
    }

    public function updateScreen(param1:Event):void
    {
      if (this.clip.currentFrame == this.clip.totalFrames)
      {
        if (this.gameObj.var_109.currentLevel == 8)
        {
          this.gameObj.method_121();
        }
        else
        {
          this.gameObj.var_107.api.method_85("EndOfDay");
        }
        this.gameObj.method_195();
      }
    }

    public function destroy():void
    {
      if (this.playerMC)
      {
        this.clip.inside.removeChild(this.playerMC);
        this.cleanupModel(this.playerMC);
        this.playerMC = null;
      }
      if (this.savedMC)
      {
        this.clip.inside.removeChild(this.savedMC);
        this.cleanupModel(this.savedMC);
        this.savedMC = null;
      }
      try
      {
        this.clip.removeEventListener(Event.ENTER_FRAME, this.updateScreen);
      }
      catch (err:Error)
      {
      }
      this.gameObj.var_128.removeChild(this.clip);
      this.clip = null;
    }

    private function buildModel(param1:Number, param2:Number):MovieClip
    {
      var _loc4_:MovieClip = null;
      var _loc37_:Class = null;
      var _loc38_:Class = null;
      var _loc39_:MovieClip = null;
      var _loc40_:MovieClip = null;
      var _loc41_:MovieClip = null;
      var _loc42_:MovieClip = null;
      var _loc5_:String = this.gameObj.var_113.getCustomerClipName(param1);
      var _loc6_:String = this.gameObj.var_113.getCustomerType(param1);
      _loc4_ = new customerTrappedMC();
      var _loc7_:String = _loc5_;
      if (param2 == 2)
      {
        _loc7_ += "2";
      }
      else if (param2 == 3)
      {
        _loc7_ += "3";
      }
      var _loc8_:Class = getDefinitionByName("customer_" + _loc7_ + "_body") as Class;
      var _loc9_:MovieClip = new _loc8_();
      _loc9_.name = "clip";
      _loc4_.body.addChild(_loc9_);
      var _loc10_:Class = getDefinitionByName("customer_" + _loc7_ + "_head") as Class;
      var _loc11_:MovieClip = new _loc10_();
      _loc11_.name = "clip";
      _loc4_.head.addChild(_loc11_);
      var _loc12_:Class = getDefinitionByName("customer_" + _loc7_ + "_eyes") as Class;
      var _loc13_:MovieClip = new _loc12_();
      _loc13_.name = "clip";
      _loc4_.eyes.addChild(_loc13_);
      var _loc14_:Class = getDefinitionByName("customer_" + _loc7_ + "_mouth") as Class;
      var _loc15_:MovieClip = new _loc14_();
      _loc15_.name = "clip";
      _loc4_.mouth.addChild(_loc15_);
      var _loc16_:Class = getDefinitionByName("customer_" + _loc7_ + "_neck") as Class;
      var _loc17_:MovieClip = new _loc16_();
      _loc17_.name = "clip";
      _loc4_.neck.addChild(_loc17_);
      var _loc18_:MovieClip = null;
      try
      {
        _loc37_ = getDefinitionByName("customer_" + _loc7_ + "_hair") as Class;
        _loc18_ = new _loc37_();
        _loc18_.name = "clip";
        _loc4_.hair.addChild(_loc18_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc38_ = getDefinitionByName("customer_" + _loc7_ + "_back_hair") as Class;
        _loc39_ = new _loc38_();
        _loc39_.name = "clip";
        _loc4_.back_hair.addChild(_loc39_);
      }
      catch (err:Error)
      {
      }
      var _loc19_:Class = getDefinitionByName("customer_" + _loc7_ + "_foot") as Class;
      var _loc20_:MovieClip = new _loc19_();
      _loc20_.name = "clip";
      _loc4_.front_shoe.addChild(_loc20_);
      var _loc21_:MovieClip = new _loc19_();
      _loc21_.name = "clip";
      _loc4_.back_shoe.addChild(_loc21_);
      var _loc22_:String = "customer_" + _loc7_ + "_hand";
      var _loc23_:Class = getDefinitionByName(_loc22_) as Class;
      var _loc24_:MovieClip = new _loc23_();
      _loc24_.name = "clip";
      _loc4_.fronthand.addChild(_loc24_);
      var _loc25_:Class = getDefinitionByName("customer_" + _loc7_ + "_hand2") as Class;
      var _loc26_:MovieClip = new _loc25_();
      _loc26_.name = "clip";
      _loc4_.backhand.addChild(_loc26_);
      var _loc27_:Class = getDefinitionByName("customer_" + _loc7_ + "_upperarm") as Class;
      var _loc28_:MovieClip = new _loc27_();
      _loc28_.name = "clip";
      _loc4_.front_upperarm.addChild(_loc28_);
      var _loc29_:MovieClip = new _loc27_();
      _loc29_.name = "clip";
      _loc4_.back_upperarm.addChild(_loc29_);
      var _loc30_:Class = getDefinitionByName("customer_" + _loc7_ + "_forearm") as Class;
      var _loc31_:MovieClip = new _loc30_();
      _loc31_.name = "clip";
      _loc4_.front_forearm.addChild(_loc31_);
      var _loc32_:MovieClip = new _loc30_();
      _loc32_.name = "clip";
      _loc4_.back_forearm.addChild(_loc32_);
      try
      {
        _loc40_ = new _loc30_();
        _loc40_.name = "clip";
        _loc4_.cross_backforearm.addChild(_loc40_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc41_ = new _loc25_();
        _loc41_.name = "clip";
        _loc4_.cross_back_hand.addChild(_loc41_);
      }
      catch (err:Error)
      {
      }
      var _loc33_:String = this.gameObj.var_113.getWeaponClipName(this.gameObj.var_106.selectedCharacter, this.gameObj.var_106.selectedStyle);
      var _loc34_:Class = getDefinitionByName("weapon_" + _loc33_) as Class;
      var _loc35_:MovieClip = new _loc34_();
      _loc35_.name = "clip";
      try
      {
        _loc4_.weapon.addChild(_loc35_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc42_ = new _loc34_();
        _loc42_.name = "clip";
        _loc4_.cross_back_weap.addChild(_loc42_);
      }
      catch (err:Error)
      {
      }
      _loc4_.scaleX = 1;
      _loc4_.scaleY = 1;
      var _loc36_:GlowFilter = new GlowFilter(0, 1, 1.3, 1.3, 4.68);
      _loc4_.filters = [_loc36_];
      return _loc4_;
    }

    private function cleanupModel(param1:MovieClip):void
    {
      var whichModel:MovieClip = param1;
      var ob:StageOutroScreen = this;
      whichModel.stop();
      try
      {
        whichModel.body.removeChildAt(0);
        whichModel.head.removeChildAt(0);
        whichModel.eyes.removeChildAt(0);
        whichModel.mouth.removeChildAt(0);
        whichModel.neck.removeChildAt(0);
        whichModel.front_shoe.removeChildAt(0);
        whichModel.back_shoe.removeChildAt(0);
        whichModel.fronthand.removeChildAt(0);
        whichModel.backhand.removeChildAt(0);
        whichModel.front_upperarm.removeChildAt(0);
        whichModel.back_upperarm.removeChildAt(0);
        whichModel.front_forearm.removeChildAt(0);
        whichModel.back_forearm.removeChildAt(0);
      }
      catch (err:Error)
      {
        class_7.error("Error removing parts of customer");
      }
      try
      {
        whichModel.weapon.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.cross_backforearm.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.cross_back_hand.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.cross_back_weap.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.hair.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.back_hair.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.glider.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      whichModel = null;
    }
  }
}
