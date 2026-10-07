package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import flash.utils.getDefinitionByName;
  import package_2.*;
  import package_4.*;
  import papaGame.data.*;

  public class ParadeScreen
  {

    public var gameObj:class_5;
    public var clip:MovieClip;
    public var didStart:Boolean = false;
    public var lastTime:Number = 0;
    public var customerSetsShown:Number = 0;
    public var allCustomerIDs:Array = [];
    public var allCustomerSkills:Array = [];
    public var whichOrder:Number = -1;
    public var paradeOrder:Array = ["all"];
    public var walkSpeed:Number = 2;
    public var runSpeed:Number = 4;
    public var movingParts:Array = [];
    public var movingPartsType:Array = [];
    public var startX:Number = -20;
    public var carStartY:Number = 351;
    public var customerStartY:Number = 270;
    public var customerScale:Number = 0.21;
    public var showWeapons:Boolean = false;

    public function ParadeScreen(param1:class_5, param2:Boolean)
    {
      super();
      this.gameObj = param1;
      this.showWeapons = param2;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      this.clip = new paradeScreenMC();
      this.gameObj.var_128.addChild(this.clip);
      this.setupCustomerGroups();
      this.releaseNextGroup();
      this.didStart = true;
      this.clip.addEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.gameObj.var_105.playTrack("TitleTrack", 1, 0, "crossfade");
      this.clip.iris.gotoAndPlay("irisin");
    }

    public function updateScreen(param1:Event = null):void
    {
      var _loc3_:* = 0;
      var _loc4_:MovieClip = null;
      if (this.didStart)
      {
        _loc3_ = int(this.movingParts.length - 1);
        for (; _loc3_ >= 0; _loc3_--)
        {
          _loc4_ = this.movingParts[_loc3_];
          if (this.showWeapons)
          {
            _loc4_.x += this.runSpeed;
          }
          else
          {
            _loc4_.x += this.walkSpeed;
          }
          if ((this.movingPartsType[_loc3_] == "customer" || this.movingPartsType[_loc3_] == "customermain") && _loc4_.x - _loc4_.width / 2 > 720)
          {
            if (this.showWeapons)
            {
              this.cleanupModel(_loc4_);
            }
            else
            {
              this.clearCustomer(_loc4_);
            }
            this.clip.holder.removeChild(_loc4_);
            this.movingParts.splice(_loc3_, 1);
            this.movingPartsType.splice(_loc3_, 1);
            if (this.movingParts.length == 0)
            {
              this.clip.iris.gotoAndPlay("irisout");
            }
          }
          else
          {
            if (this.showWeapons && this.movingPartsType[_loc3_] == "customermain" && _loc4_.x > 80 && this.whichOrder < this.allCustomerSkills.length - 1 && this.allCustomerSkills[this.whichOrder + 1] == this.allCustomerSkills[this.whichOrder])
            {
              this.releaseNextGroup();
              this.movingPartsType[_loc3_] = "customer";
              try
              {
                class_7.method_1("CLOSE -- Next: " + this.allCustomerSkills[this.whichOrder + 1] + ", This: " + this.allCustomerSkills[this.whichOrder]);
              }
              catch (err:Error)
              {
              }
              continue;
            }
            if (this.showWeapons && this.movingPartsType[_loc3_] == "customermain" && _loc4_.x > 200)
            {
              this.releaseNextGroup();
              this.movingPartsType[_loc3_] = "customer";
              try
              {
                class_7.method_1("FAR   -- Next: " + this.allCustomerSkills[this.whichOrder + 1] + ", This: " + this.allCustomerSkills[this.whichOrder]);
              }
              catch (err:Error)
              {
              }
              continue;
            }
            if (!this.showWeapons && this.movingPartsType[_loc3_] == "customermain" && _loc4_.x > 100)
            {
              this.releaseNextGroup();
              this.movingPartsType[_loc3_] = "customer";
            }
          }
        }
        if (this.clip.iris.currentFrame == 21)
        {
          this.gameObj.method_209();
          this.gameObj.method_182();
        }
      }
    }

    public function destroy():void
    {
      this.clip.removeEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.gameObj.var_128.removeChild(this.clip);
      this.clip = null;
    }

    public function releaseNextGroup():void
    {
      var _loc2_:Number = NaN;
      var _loc3_:Number = NaN;
      var _loc4_:MovieClip = null;
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc1_:ParadeScreen = this;
      ++_loc1_.whichOrder;
      if (_loc1_.whichOrder < _loc1_.allCustomerIDs.length)
      {
        _loc3_ = Number(_loc1_.allCustomerIDs[_loc1_.whichOrder]);
        if (_loc1_.showWeapons)
        {
          _loc4_ = _loc1_.buildModel(_loc3_);
        }
        else
        {
          _loc4_ = _loc1_.buildCustomer(_loc3_);
        }
        _loc4_.scaleX = _loc1_.customerScale * -1;
        _loc4_.scaleY = _loc1_.customerScale;
        _loc4_.x = _loc1_.startX;
        _loc4_.y = _loc1_.customerStartY;
        _loc5_ = Math.random();
        _loc6_ = Math.random();
        if (_loc1_.showWeapons == false)
        {
          if (_loc5_ > 0.7)
          {
            if (_loc6_ > 0.8)
            {
              _loc4_.gotoAndPlay("walkwave2");
            }
            else if (_loc6_ > 0.4)
            {
              _loc4_.gotoAndPlay("walkwave2_2");
            }
            else
            {
              _loc4_.gotoAndPlay("walkwave2_3");
            }
          }
          else if (_loc5_ > 0.4)
          {
            if (_loc6_ > 0.8)
            {
              _loc4_.gotoAndPlay("walkwave");
            }
            else if (_loc6_ > 0.5)
            {
              _loc4_.gotoAndPlay("walkwave_2");
            }
            else
            {
              _loc4_.gotoAndPlay("walkwave_3");
            }
          }
          else if (_loc6_ > 0.7)
          {
            _loc4_.gotoAndPlay("walk");
          }
          else if (_loc6_ > 0.4)
          {
            _loc4_.gotoAndPlay("walk_2");
          }
          else
          {
            _loc4_.gotoAndPlay("walk_3");
          }
        }
        if (_loc2_ > 0)
        {
          if (_loc2_ % 2 == 0)
          {
            _loc4_.y += 20;
            _loc1_.clip.holder.addChild(_loc4_);
          }
          else
          {
            _loc4_.y -= 20;
            _loc1_.clip.holder.addChildAt(_loc4_, 0);
          }
          _loc4_.y += Math.round(Math.random() * 12) - 6;
          _loc4_.x -= 20 + (20 * _loc2_ + Math.floor(Math.random() * 10));
        }
        else
        {
          _loc1_.clip.holder.addChild(_loc4_);
        }
        _loc1_.movingParts.push(_loc4_);
        _loc1_.movingPartsType.push("customermain");
      }
    }

    public function setupCustomerGroups():void
    {
      var _loc2_:UserData = this.gameObj.var_106;
      this.allCustomerIDs = [];
      this.allCustomerSkills = [];
      var _loc3_:int = 0;
      while (_loc3_ < _loc2_.customersUnlocked.length)
      {
        if (_loc2_.customersUnlocked[_loc3_] == 1)
        {
          this.allCustomerIDs.push(_loc3_);
          this.allCustomerSkills.push(this.gameObj.var_113.getCustomerSkill(_loc3_));
        }
        _loc3_++;
      }
    }

    public function getCustomerClipName(param1:Number):String
    {
      return this.gameObj.var_113.getCustomerClipName(param1);
    }

    public function buildCustomer(param1:Number):MovieClip
    {
      var _loc28_:Class = null;
      var _loc29_:MovieClip = null;
      var _loc30_:Class = null;
      var _loc31_:MovieClip = null;
      var _loc3_:MovieClip = new customerParadeMC();
      var _loc4_:String = this.getCustomerClipName(param1);
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
      try
      {
        _loc28_ = getDefinitionByName("customer_" + _loc4_ + "_hair") as Class;
        _loc29_ = new _loc28_();
        _loc29_.name = "clip";
        _loc3_.hair.addChild(_loc29_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc30_ = getDefinitionByName("customer_" + _loc4_ + "_back_hair") as Class;
        _loc31_ = new _loc30_();
        _loc31_.name = "clip";
        _loc3_.back_hair.addChild(_loc31_);
      }
      catch (err:Error)
      {
      }
      var _loc15_:Class = getDefinitionByName("customer_" + _loc4_ + "_foot") as Class;
      var _loc16_:MovieClip = new _loc15_();
      _loc16_.name = "clip";
      _loc3_.front_shoe.addChild(_loc16_);
      var _loc17_:MovieClip = new _loc15_();
      _loc17_.name = "clip";
      _loc3_.back_shoe.addChild(_loc17_);
      var _loc18_:Class = getDefinitionByName("customer_" + _loc4_ + "_hand") as Class;
      var _loc19_:MovieClip = new _loc18_();
      _loc19_.name = "clip";
      _loc3_.fronthand.addChild(_loc19_);
      var _loc20_:Class = getDefinitionByName("customer_" + _loc4_ + "_hand2") as Class;
      var _loc21_:MovieClip = new _loc20_();
      _loc21_.name = "clip";
      _loc3_.backhand.addChild(_loc21_);
      var _loc22_:Class = getDefinitionByName("customer_" + _loc4_ + "_upperarm") as Class;
      var _loc23_:MovieClip = new _loc22_();
      _loc23_.name = "clip";
      _loc3_.front_upperarm.addChild(_loc23_);
      var _loc24_:MovieClip = new _loc22_();
      _loc24_.name = "clip";
      _loc3_.back_upperarm.addChild(_loc24_);
      var _loc25_:Class = getDefinitionByName("customer_" + _loc4_ + "_forearm") as Class;
      var _loc26_:MovieClip = new _loc25_();
      _loc26_.name = "clip";
      _loc3_.front_forearm.addChild(_loc26_);
      var _loc27_:MovieClip = new _loc25_();
      _loc27_.name = "clip";
      _loc3_.back_forearm.addChild(_loc27_);
      return _loc3_;
    }

    public function clearCustomer(param1:MovieClip):void
    {
      try
      {
        param1.stop();
        param1.head.removeChildAt(0);
        param1.eyes.removeChildAt(0);
        param1.mouth.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        param1.body.removeChildAt(0);
        param1.neck.removeChildAt(0);
        param1.front_shoe.removeChildAt(0);
        param1.back_shoe.removeChildAt(0);
        param1.fronthand.removeChildAt(0);
        param1.backhand.removeChildAt(0);
        param1.front_upperarm.removeChildAt(0);
        param1.back_upperarm.removeChildAt(0);
        param1.front_forearm.removeChildAt(0);
        param1.back_forearm.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        param1.hair.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        param1.back_hair.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
    }

    private function buildModel(param1:Number):MovieClip
    {
      var _loc3_:MovieClip = null;
      var _loc35_:Class = null;
      var _loc36_:Class = null;
      var _loc37_:MovieClip = null;
      var _loc38_:MovieClip = null;
      var _loc39_:MovieClip = null;
      var _loc40_:MovieClip = null;
      var _loc41_:Class = null;
      var _loc42_:MovieClip = null;
      var _loc43_:MovieClip = null;
      var _loc4_:String = this.gameObj.var_113.getCustomerType(param1);
      if (_loc4_ == CustomerData.WEAPON_SWING1)
      {
        _loc3_ = new customerOneSwingMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_SWING2)
      {
        _loc3_ = new customerTwoSwingMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_SCOOTER)
      {
        _loc3_ = new customerScooterMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_KAHUNA)
      {
        _loc3_ = new customerKahunaMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_WHIP)
      {
        _loc3_ = new customerWhipMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_MELEE)
      {
        _loc3_ = new customerMeleeMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_TOSS)
      {
        _loc3_ = new customerTossMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_LONGGUN)
      {
        _loc3_ = new customerLongGunMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_PISTOL)
      {
        _loc3_ = new customerPistolMC();
      }
      else if (_loc4_ == CustomerData.WEAPON_BAZOOKA)
      {
        _loc3_ = new customerBazookaMC();
      }
      else
      {
        _loc3_ = new customerOneSwingMC();
      }
      var _loc5_:String = this.gameObj.var_113.getCustomerClipName(param1);
      var _loc6_:Class = getDefinitionByName("customer_" + _loc5_ + "_body") as Class;
      var _loc7_:MovieClip = new _loc6_();
      _loc7_.name = "clip";
      _loc3_.body.addChild(_loc7_);
      var _loc8_:Class = getDefinitionByName("customer_" + _loc5_ + "_head") as Class;
      var _loc9_:MovieClip = new _loc8_();
      _loc9_.name = "clip";
      _loc3_.head.addChild(_loc9_);
      var _loc10_:Class = getDefinitionByName("customer_" + _loc5_ + "_eyes") as Class;
      var _loc11_:MovieClip = new _loc10_();
      _loc11_.name = "clip";
      _loc3_.eyes.addChild(_loc11_);
      var _loc12_:Class = getDefinitionByName("customer_" + _loc5_ + "_mouth") as Class;
      var _loc13_:MovieClip = new _loc12_();
      _loc13_.name = "clip";
      _loc3_.mouth.addChild(_loc13_);
      var _loc14_:Class = getDefinitionByName("customer_" + _loc5_ + "_neck") as Class;
      var _loc15_:MovieClip = new _loc14_();
      _loc15_.name = "clip";
      _loc3_.neck.addChild(_loc15_);
      var _loc16_:MovieClip = null;
      try
      {
        _loc35_ = getDefinitionByName("customer_" + _loc5_ + "_hair") as Class;
        _loc16_ = new _loc35_();
        _loc16_.name = "clip";
        _loc3_.hair.addChild(_loc16_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc36_ = getDefinitionByName("customer_" + _loc5_ + "_back_hair") as Class;
        _loc37_ = new _loc36_();
        _loc37_.name = "clip";
        _loc3_.back_hair.addChild(_loc37_);
      }
      catch (err:Error)
      {
      }
      var _loc17_:Class = getDefinitionByName("customer_" + _loc5_ + "_foot") as Class;
      var _loc18_:MovieClip = new _loc17_();
      _loc18_.name = "clip";
      _loc3_.front_shoe.addChild(_loc18_);
      var _loc19_:MovieClip = new _loc17_();
      _loc19_.name = "clip";
      _loc3_.back_shoe.addChild(_loc19_);
      var _loc20_:String = "customer_" + _loc5_ + "_hand";
      var _loc21_:Class = getDefinitionByName(_loc20_) as Class;
      var _loc22_:MovieClip = new _loc21_();
      _loc22_.name = "clip";
      _loc3_.fronthand.addChild(_loc22_);
      var _loc23_:Class = getDefinitionByName("customer_" + _loc5_ + "_hand2") as Class;
      var _loc24_:MovieClip = new _loc23_();
      _loc24_.name = "clip";
      _loc3_.backhand.addChild(_loc24_);
      var _loc25_:Class = getDefinitionByName("customer_" + _loc5_ + "_upperarm") as Class;
      var _loc26_:MovieClip = new _loc25_();
      _loc26_.name = "clip";
      _loc3_.front_upperarm.addChild(_loc26_);
      var _loc27_:MovieClip = new _loc25_();
      _loc27_.name = "clip";
      _loc3_.back_upperarm.addChild(_loc27_);
      var _loc28_:Class = getDefinitionByName("customer_" + _loc5_ + "_forearm") as Class;
      var _loc29_:MovieClip = new _loc28_();
      _loc29_.name = "clip";
      _loc3_.front_forearm.addChild(_loc29_);
      var _loc30_:MovieClip = new _loc28_();
      _loc30_.name = "clip";
      _loc3_.back_forearm.addChild(_loc30_);
      try
      {
        _loc38_ = new _loc28_();
        _loc38_.name = "clip";
        _loc3_.cross_backforearm.addChild(_loc38_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc39_ = new _loc23_();
        _loc39_.name = "clip";
        _loc3_.cross_back_hand.addChild(_loc39_);
      }
      catch (err:Error)
      {
      }
      var _loc31_:String = this.gameObj.var_113.getWeaponClipName(param1, 1);
      var _loc32_:Class = getDefinitionByName("weapon_" + _loc31_) as Class;
      var _loc33_:MovieClip = new _loc32_();
      _loc33_.name = "clip";
      _loc3_.weapon.addChild(_loc33_);
      try
      {
        _loc40_ = new _loc32_();
        _loc40_.name = "clip";
        _loc3_.cross_back_weap.addChild(_loc40_);
      }
      catch (err:Error)
      {
      }
      var _loc34_:String = this.gameObj.var_113.getCustomerClipName(param1);
      if (_loc34_ == "Boomer")
      {
        _loc41_ = getDefinitionByName("glider_" + _loc34_) as Class;
        _loc42_ = new _loc41_();
        _loc42_.name = "clip";
        _loc3_.glider.addChild(_loc42_);
      }
      else
      {
        _loc43_ = new MovieClip();
        _loc43_.name = "clip";
        _loc3_.glider.addChild(_loc43_);
      }
      _loc3_.gotoAndStop(1);
      _loc3_.gotoAndPlay("run");
      if (this.gameObj.var_113.getCustomerClipName(param1) == "Connor")
      {
        _loc3_.gotoAndPlay("runconnor");
      }
      _loc3_.mouseEnabled = false;
      _loc3_.mouseChildren = false;
      return _loc3_;
    }

    private function cleanupModel(param1:MovieClip):void
    {
      var whichModel:MovieClip = param1;
      var ob:ParadeScreen = this;
      whichModel.gotoAndStop(1);
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
      whichModel = null;
    }
  }
}
