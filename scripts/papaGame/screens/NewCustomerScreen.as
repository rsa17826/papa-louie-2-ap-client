package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import flash.utils.getDefinitionByName;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.*;

  public class NewCustomerScreen
  {

    public var gameObj:class_5;
    public var clip:MovieClip;
    public var whichCustomer:Number = -1;
    public var model:MovieClip;

    public function NewCustomerScreen(param1:class_5, param2:Number)
    {
      super();
      this.gameObj = param1;
      this.whichCustomer = param2;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      this.clip = new newCustomerScreenMC();
      this.gameObj.var_105.endMusic();
      this.gameObj.var_105.playSound("customer_overjoyed.wav");
      this.gameObj.var_128.addChild(this.clip);
      this.buildModel();
      var _loc2_:CustomerDataFile = this.gameObj.var_113.getCustomerData(this.whichCustomer);
      var _loc3_:String = _loc2_.skillType;
      if (_loc3_ != CustomerData.SKILL_NONE)
      {
        this.clip.skillbox.visible = true;
        this.clip.skillbox.gotoAndStop(_loc3_);
      }
      else
      {
        this.clip.skillbox.visible = false;
        this.clip.skillbox.stop();
      }
      this.clip.name_txt.text = this.gameObj.var_113.getCustomerName(this.whichCustomer);

      // End screen instantly
      this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      this.gameObj.method_198();
    }

    public function updateScreen(param1:Event):void
    {
      if (this.clip.currentFrame == this.clip.totalFrames)
      {
        this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
        this.gameObj.method_198();
      }
    }

    public function destroy():void
    {
      this.clip.removeEventListener(Event.ENTER_FRAME, this.updateScreen);
      if (this.model)
      {
        this.clip.charholder.removeChild(this.model);
        this.cleanupModel(this.model);
        this.model = null;
      }
      this.gameObj.var_128.removeChild(this.clip);
      this.clip = null;
    }

    private function buildModel():void
    {
      var _loc34_:Class = null;
      var _loc35_:Class = null;
      var _loc36_:MovieClip = null;
      var _loc37_:MovieClip = null;
      var _loc38_:MovieClip = null;
      var _loc39_:MovieClip = null;
      var _loc40_:Class = null;
      var _loc41_:MovieClip = null;
      var _loc42_:MovieClip = null;
      var _loc2_:String = this.gameObj.var_113.getCustomerType(this.whichCustomer);
      if (_loc2_ == CustomerData.WEAPON_SWING1)
      {
        this.model = new customerOneSwingMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_SWING2)
      {
        this.model = new customerTwoSwingMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_SCOOTER)
      {
        this.model = new customerScooterMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_KAHUNA)
      {
        this.model = new customerKahunaMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_WHIP)
      {
        this.model = new customerWhipMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_MELEE)
      {
        this.model = new customerMeleeMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_TOSS)
      {
        this.model = new customerTossMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_LONGGUN)
      {
        this.model = new customerLongGunMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_PISTOL)
      {
        this.model = new customerPistolMC();
      }
      else if (_loc2_ == CustomerData.WEAPON_BAZOOKA)
      {
        this.model = new customerBazookaMC();
      }
      else
      {
        this.model = new customerOneSwingMC();
      }
      this.model.scaleX = -0.6;
      this.model.scaleY = 0.6;
      this.model.x = 400;
      this.model.y = 119;
      this.clip.charholder.addChild(this.model);
      var _loc3_:MovieClip = this.model;
      var _loc4_:String = this.gameObj.var_113.getCustomerClipName(this.whichCustomer);
      var _loc5_:Class = getDefinitionByName("customer_" + _loc4_ + "_body") as Class;
      var _loc6_:MovieClip = new _loc5_();
      _loc6_.name = "clip";
      _loc3_.body.addChild(_loc6_);
      var _loc7_:Class = getDefinitionByName("customer_" + _loc4_ + "_head") as Class;
      var _loc8_:MovieClip = new _loc7_();
      _loc8_.name = "clip";
      _loc3_.head.addChild(_loc8_);
      var _loc9_:Class = getDefinitionByName("customer_" + _loc4_ + "_eyes") as Class;
      var _loc10_:MovieClip = new _loc9_();
      _loc10_.name = "clip";
      _loc3_.eyes.addChild(_loc10_);
      var _loc11_:Class = getDefinitionByName("customer_" + _loc4_ + "_mouth") as Class;
      var _loc12_:MovieClip = new _loc11_();
      _loc12_.name = "clip";
      _loc3_.mouth.addChild(_loc12_);
      var _loc13_:Class = getDefinitionByName("customer_" + _loc4_ + "_neck") as Class;
      var _loc14_:MovieClip = new _loc13_();
      _loc14_.name = "clip";
      _loc3_.neck.addChild(_loc14_);
      var _loc15_:MovieClip = null;
      try
      {
        _loc34_ = getDefinitionByName("customer_" + _loc4_ + "_hair") as Class;
        _loc15_ = new _loc34_();
        _loc15_.name = "clip";
        _loc3_.hair.addChild(_loc15_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc35_ = getDefinitionByName("customer_" + _loc4_ + "_back_hair") as Class;
        _loc36_ = new _loc35_();
        _loc36_.name = "clip";
        _loc3_.back_hair.addChild(_loc36_);
      }
      catch (err:Error)
      {
      }
      var _loc16_:Class = getDefinitionByName("customer_" + _loc4_ + "_foot") as Class;
      var _loc17_:MovieClip = new _loc16_();
      _loc17_.name = "clip";
      _loc3_.front_shoe.addChild(_loc17_);
      var _loc18_:MovieClip = new _loc16_();
      _loc18_.name = "clip";
      _loc3_.back_shoe.addChild(_loc18_);
      var _loc19_:String = "customer_" + _loc4_ + "_hand";
      var _loc20_:Class = getDefinitionByName(_loc19_) as Class;
      var _loc21_:MovieClip = new _loc20_();
      _loc21_.name = "clip";
      _loc3_.fronthand.addChild(_loc21_);
      var _loc22_:Class = getDefinitionByName("customer_" + _loc4_ + "_hand2") as Class;
      var _loc23_:MovieClip = new _loc22_();
      _loc23_.name = "clip";
      _loc3_.backhand.addChild(_loc23_);
      var _loc24_:Class = getDefinitionByName("customer_" + _loc4_ + "_upperarm") as Class;
      var _loc25_:MovieClip = new _loc24_();
      _loc25_.name = "clip";
      _loc3_.front_upperarm.addChild(_loc25_);
      var _loc26_:MovieClip = new _loc24_();
      _loc26_.name = "clip";
      _loc3_.back_upperarm.addChild(_loc26_);
      var _loc27_:Class = getDefinitionByName("customer_" + _loc4_ + "_forearm") as Class;
      var _loc28_:MovieClip = new _loc27_();
      _loc28_.name = "clip";
      _loc3_.front_forearm.addChild(_loc28_);
      var _loc29_:MovieClip = new _loc27_();
      _loc29_.name = "clip";
      _loc3_.back_forearm.addChild(_loc29_);
      try
      {
        _loc37_ = new _loc27_();
        _loc37_.name = "clip";
        _loc3_.cross_backforearm.addChild(_loc37_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc38_ = new _loc22_();
        _loc38_.name = "clip";
        _loc3_.cross_back_hand.addChild(_loc38_);
      }
      catch (err:Error)
      {
      }
      var _loc30_:String = this.gameObj.var_113.getWeaponClipName(this.whichCustomer, 1);
      var _loc31_:Class = getDefinitionByName("weapon_" + _loc30_) as Class;
      var _loc32_:MovieClip = new _loc31_();
      _loc32_.name = "clip";
      _loc3_.weapon.addChild(_loc32_);
      try
      {
        _loc39_ = new _loc31_();
        _loc39_.name = "clip";
        _loc3_.cross_back_weap.addChild(_loc39_);
      }
      catch (err:Error)
      {
      }
      var _loc33_:String = this.gameObj.var_113.getCustomerClipName(this.whichCustomer);
      if (_loc33_ == "Boomer")
      {
        _loc40_ = getDefinitionByName("glider_" + _loc33_) as Class;
        _loc41_ = new _loc40_();
        _loc41_.name = "clip";
        _loc3_.glider.addChild(_loc41_);
      }
      else
      {
        _loc42_ = new MovieClip();
        _loc42_.name = "clip";
        _loc3_.glider.addChild(_loc42_);
      }
      _loc3_.gotoAndStop(1);
      _loc3_.gotoAndPlay("run");
      if (this.gameObj.var_113.getCustomerClipName(this.whichCustomer) == "Connor")
      {
        _loc3_.gotoAndPlay("runconnor");
      }
    }

    private function cleanupModel(param1:MovieClip):void
    {
      var whichModel:MovieClip = param1;
      var ob:NewCustomerScreen = this;
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
        whichModel.weapon.removeChildAt(0);
      }
      catch (err:Error)
      {
        class_7.error("Error removing parts of customer");
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
        whichModel.glider.removeChildAt(0);
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
    }
  }
}
