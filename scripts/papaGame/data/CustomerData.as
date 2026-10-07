package papaGame.data
{
  import flash.external.ExternalInterface;
  import flash.display.BitmapData;
  import flash.display.MovieClip;
  import flash.filters.DropShadowFilter;
  import flash.geom.*;
  import flash.utils.getDefinitionByName;
  import flash.utils.getTimer;
  import package_4.class_5;
  import papaGame.data.customers.*;

  public class CustomerData
  {

    public static const SKILL_NONE:String = "none";

    public static const SKILL_POUND:String = "pound";

    public static const SKILL_GLIDE:String = "glide";

    public static const SKILL_PUSH:String = "push";

    public static const SKILL_DOUBLEJUMP:String = "doublejump";

    public static const SKILL_WALLJUMP:String = "walljump";

    public static const SKILL_CRAWL:String = "crawl";

    public static const WEAPON_SWING1:String = "swing1";

    public static const WEAPON_SWING2:String = "swing2";

    public static const WEAPON_KAHUNA:String = "kahuna";

    public static const WEAPON_SCOOTER:String = "scooter";

    public static const WEAPON_MELEE:String = "melee";

    public static const WEAPON_WHIP:String = "whip";

    public static const WEAPON_TOSS:String = "toss";

    public static const WEAPON_PISTOL:String = "pistol";

    public static const WEAPON_LONGGUN:String = "longgun";

    public static const WEAPON_BAZOOKA:String = "bazooka";

    public var gameObj:class_5;

    private var customersIncluded:Array = [CustomerMarty, CustomerRita, CustomerPrudence, CustomerTaylor, CustomerClover, CustomerMindy, CustomerAkari, CustomerZoe, CustomerBigPauly, CustomerKahuna, CustomerKingsley, CustomerNinjoy, CustomerPenny, CustomerSargeFan, CustomerJames, CustomerScooter, CustomerConnor, CustomerPeggy, CustomerGeorgito, CustomerYippy, CustomerGreg, CustomerCaptainCori, CustomerRico, CustomerBoomer, CustomerProfessorFitz, CustomerFoodini, CustomerPapaLouie, CustomerXandra];
    private var customerDataFiles:Array = [];
    private var thumbBMP:BitmapData = null;

    public function CustomerData(param1:class_5)
    {
      super();
      this.gameObj = param1;
      this.setupCustomerData();
    }

    public function setupCustomerData():void
    {
      var _loc3_:Class = null;
      var _loc4_:CustomerDataFile = null;
      this.customerDataFiles = [];
      var _loc2_:int = 0;
      while (_loc2_ < this.customersIncluded.length)
      {
        _loc3_ = this.customersIncluded[_loc2_];
        _loc4_ = new _loc3_();
        this.customerDataFiles.push(_loc4_);
        _loc2_++;
      }
      // getCustomerIndex("asd");
    }

    public function getCustomerIndex(param1:String):Number
    {
      var _loc3_:Number = -1;
      var _loc4_:int = 0;
      while (_loc4_ < this.customerDataFiles.length)
      {
        // ExternalInterface.call("log", this.customerDataFiles[_loc4_].customerName, this.customerDataFiles[_loc4_].customerClipName, _loc4_)
        if (_loc2_.customerDataFiles[_loc4_].customerName == param1 || _loc2_.customerDataFiles[_loc4_].customerClipName == param1)
        {
          _loc3_ = _loc4_;
          break;
        }
        _loc4_++;
      }
      return _loc3_;
    }

    public function getCustomerName(param1:Number):String
    {
      var _loc3_:CustomerDataFile = this.customerDataFiles[param1];
      return _loc3_.customerName;
    }

    public function getCustomerClipName(param1:Number):String
    {
      var _loc3_:CustomerDataFile = this.customerDataFiles[param1];
      return _loc3_.customerClipName;
    }

    public function getCustomerType(param1:Number):String
    {
      var _loc3_:CustomerDataFile = this.customerDataFiles[param1];
      return _loc3_.weaponType;
    }

    public function getCustomerSkill(param1:Number):String
    {
      var _loc3_:CustomerDataFile = this.customerDataFiles[param1];
      return _loc3_.skillType;
    }

    public function getCustomerFirstGame(param1:Number):String
    {
      var _loc3_:CustomerDataFile = this.customerDataFiles[param1];
      return _loc3_.customerFirstGame;
    }

    public function getWeaponClipName(param1:Number, param2:Number):String
    {
      var _loc4_:CustomerDataFile = this.customerDataFiles[param1];
      var _loc5_:String = _loc4_.weaponClipName;
      if (_loc4_.weaponHasStyles)
      {
        if (param2 > 1)
        {
          _loc5_ += param2;
        }
      }
      return _loc5_;
    }

    public function getCustomerData(param1:Number):CustomerDataFile
    {
      if (param1 < this.customerDataFiles.length)
      {
        return this.customerDataFiles[param1];
      }
      return null;
    }

    public function generateCustomerBitmap():void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:BitmapData = null;
      var _loc8_:MovieClip = null;
      var _loc9_:DropShadowFilter = null;
      var _loc10_:int = 0;
      var _loc11_:Number = NaN;
      var _loc12_:String = null;
      var _loc13_:Class = null;
      var _loc14_:MovieClip = null;
      var _loc15_:Class = null;
      var _loc16_:MovieClip = null;
      var _loc17_:Class = null;
      var _loc18_:MovieClip = null;
      var _loc19_:Class = null;
      var _loc20_:MovieClip = null;
      var _loc21_:Class = null;
      var _loc22_:MovieClip = null;
      var _loc23_:Class = null;
      var _loc24_:MovieClip = null;
      var _loc25_:Class = null;
      var _loc26_:MovieClip = null;
      var _loc27_:Class = null;
      var _loc28_:MovieClip = null;
      var _loc29_:MovieClip = null;
      var _loc30_:Rectangle = null;
      var _loc31_:Number = NaN;
      var _loc2_:Number = getTimer();
      if (this.thumbBMP == null)
      {
        _loc3_ = this.customersIncluded.length;
        _loc4_ = 45;
        _loc5_ = 45;
        _loc6_ = 0;
        this.thumbBMP = new BitmapData(_loc4_ * _loc3_, _loc5_ * 1, true, 0);
        _loc7_ = new BitmapData(_loc4_, _loc5_, true, 0);
        _loc9_ = new DropShadowFilter(4, 45, 0, 0.5);
        _loc10_ = 0;
        while (_loc10_ < _loc3_)
        {
          _loc8_ = null;
          _loc8_ = new customerOneSwingMC();
          _loc12_ = this.getCustomerClipName(_loc10_);
          _loc13_ = getDefinitionByName("customer_" + _loc12_ + "_body") as Class;
          _loc14_ = new _loc13_();
          _loc14_.name = "clip";
          _loc8_.body.addChild(_loc14_);
          _loc15_ = getDefinitionByName("customer_" + _loc12_ + "_head") as Class;
          _loc16_ = new _loc15_();
          _loc16_.name = "clip";
          _loc8_.head.addChild(_loc16_);
          _loc17_ = getDefinitionByName("customer_" + _loc12_ + "_eyes") as Class;
          _loc18_ = new _loc17_();
          _loc18_.name = "clip";
          _loc8_.eyes.addChild(_loc18_);
          _loc19_ = getDefinitionByName("customer_" + _loc12_ + "_mouth") as Class;
          _loc20_ = new _loc19_();
          _loc20_.name = "clip";
          _loc8_.mouth.addChild(_loc20_);
          _loc21_ = getDefinitionByName("customer_" + _loc12_ + "_neck") as Class;
          _loc22_ = new _loc21_();
          _loc22_.name = "clip";
          _loc8_.neck.addChild(_loc22_);
          try
          {
            _loc23_ = getDefinitionByName("customer_" + _loc12_ + "_hair") as Class;
            _loc24_ = new _loc23_();
            _loc24_.name = "clip";
            _loc8_.hair.addChild(_loc24_);
          }
          catch (err:Error)
          {
          }
          try
          {
            _loc25_ = getDefinitionByName("customer_" + _loc12_ + "_back_hair") as Class;
            _loc26_ = new _loc25_();
            _loc26_.name = "clip";
            _loc8_.back_hair.addChild(_loc26_);
          }
          catch (err:Error)
          {
          }
          _loc27_ = getDefinitionByName("customer_" + _loc12_ + "_upperarm") as Class;
          _loc28_ = new _loc27_();
          _loc28_.name = "clip";
          _loc8_.front_upperarm.addChild(_loc28_);
          _loc29_ = new _loc27_();
          _loc29_.name = "clip";
          _loc8_.back_upperarm.addChild(_loc29_);
          _loc8_.gotoAndStop("stand");
          _loc8_.filters = [_loc9_];
          _loc8_.scaleX = 0.3;
          _loc8_.scaleY = 0.3;
          _loc30_ = _loc8_.head.getChildAt(0).getBounds(_loc8_.head.getChildAt(0));
          _loc31_ = -25;
          _loc8_.x = (_loc31_ - _loc30_.x) * _loc8_.scaleX;
          _loc7_.fillRect(_loc7_.rect, 0);
          _loc7_.draw(_loc8_, _loc8_.transform.matrix, _loc8_.transform.colorTransform);
          this.thumbBMP.copyPixels(_loc7_, _loc7_.rect, new Point(_loc10_ * _loc4_, 0), null, null, true);
          _loc13_ = null;
          _loc14_ = null;
          _loc15_ = null;
          _loc16_ = null;
          _loc17_ = null;
          _loc18_ = null;
          _loc23_ = null;
          _loc24_ = null;
          _loc21_ = null;
          _loc22_ = null;
          _loc19_ = null;
          _loc20_ = null;
          _loc25_ = null;
          _loc26_ = null;
          _loc27_ = null;
          _loc28_ = null;
          _loc29_ = null;
          _loc10_++;
        }
        _loc7_.dispose();
        _loc7_ = null;
        _loc8_ = null;
        _loc9_ = null;
        _loc11_ = getTimer() - _loc2_;
      }
    }

    public function getCustomerBitmap(param1:Number, param2:Boolean = false):BitmapData
    {
      var _loc6_:BitmapData = new BitmapData(45, 45, true, 0);
      var _loc7_:Number = param1 * 45;
      var _loc8_:Number = 0;
      if (param2)
      {
        _loc8_ = 45;
      }
      _loc6_.copyPixels(this.thumbBMP, new Rectangle(_loc7_, _loc8_, 45, 45), new Point(0, 0), null, null, true);
      return _loc6_;
    }

    public function getTrappedCustomerIndex(param1:Number, param2:Number):Number
    {
      var _loc4_:Number = -1;
      var _loc5_:CustomerDataFile = null;
      var _loc6_:int = 0;
      while (_loc6_ < this.customerDataFiles.length)
      {
        _loc5_ = this.customerDataFiles[_loc6_];
        if (_loc5_.trappedWorld == param1 + 1 && _loc5_.trappedChar == param2)
        {
          _loc4_ = _loc6_;
          break;
        }
        _loc6_++;
      }
      return _loc4_;
    }
  }
}
