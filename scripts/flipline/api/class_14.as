package flipline.api
{
  import Playtomic.*;
  import flash.display.*;
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.net.URLRequest;
  import flash.net.navigateToURL;
  import mochi.as3.*;
  import package_2.*;
  import package_3.*;
  import package_5.class_13;

  public class class_14 extends EventDispatcher
  {

    public static const const_8:String = "Arial Black";

    public static const const_10:uint = 7224074;

    public static const const_21:uint = 3355443;

    public static const const_15:uint = 9904417;

    public static const const_23:Number = 12;

    public static const const_20:Number = 24;

    public static const const_14:Boolean = false;

    public static const const_19:String = "Arial";

    public static const const_22:uint = 11513774;

    public static const const_11:Number = 10;

    public static const const_16:Boolean = true;

    public var var_204:*;

    public var container:DisplayObjectContainer;

    public var var_132:class_22;

    public var var_137:Number = 1;

    public var var_130:Number = 1;

    public var var_170:Array = [];

    public var var_118:Array = [];

    public var var_173:Boolean = false;

    private var var_164:Scoreboard;

    private var var_172:class_20;

    private var backup:class_19;

    public var var_143:Boolean = false;

    public var var_295:Number = -1;

    public var var_283:String = "";

    public var var_211:Boolean = false;

    public var var_216:Boolean = false;

    public var var_265:String = "";

    public var var_282:String = "";

    public function class_14(param1:*, param2:DisplayObjectContainer, param3:Number, param4:Number)
    {
      super();
      this.var_204 = param1;
      this.container = param2;
      this.var_137 = param3;
      this.var_130 = param4;
      this.method_130();
    }

    public function method_130():void
    {
      var _loc1_:class_14 = this;
      this.var_132 = new class_22();
      this.backup = new class_19(_loc1_);
      class_7.info("[Flipline API]: API Initialized.");
    }

    public function method_125(param1:*):void
    {
      var _loc2_:class_14 = this;
      param1.addEventListener("soundIsMuted", _loc2_.method_176);
      param1.addEventListener("soundIsNotMuted", _loc2_.method_199);
    }

    public function method_246(param1:Number, param2:String, param3:String = null):void
    {
      var _loc4_:class_14 = this;
      _loc4_.var_143 = true;
      _loc4_.var_295 = param1;
      _loc4_.var_283 = param2;
      if (param3 != null)
      {
        Log.View(param1, param2, param3, _loc4_.getMainLoaderInfo());
      }
      else
      {
        class_7.error("OLD PLAYTOMIC");
      }
    }

    public function method_239(param1:Boolean, param2:String, param3:String):void
    {
      var _loc4_:class_14 = this;
      _loc4_.var_216 = true;
      _loc4_.var_211 = param1;
      _loc4_.var_265 = param2;
      _loc4_.var_282 = param3;
      MochiServices.connect(param2, _loc4_.var_204, _loc4_.method_192);
    }

    public function method_192(param1:String):void
    {
      class_7.error("Mochi Services Error: " + param1);
    }

    public function method_100(param1:String, param2:Number, param3:String = "counter", param4:Number = -1):void
    {
      if (this.var_143)
      {
        if (param3 == "counter")
        {
          Log.LevelCounterMetric(param1, param2);
        }
        else if (param3 == "average")
        {
          Log.LevelAverageMetric(param1, param2, param4);
        }
        else if (param3 == "ranged")
        {
          Log.LevelRangedMetric(param1, param2, param4);
        }
      }
    }

    public function method_88(param1:String, param2:String = null, param3:Boolean = false):void
    {
      if (this.var_143)
      {
        Log.CustomMetric(param1, param2, param3);
      }
    }

    public function method_242(param1:String, param2:String, param3:Number, param4:Number):void
    {
      if (this.var_143)
      {
        Log.Heatmap(param1, param2, param3, param4);
      }
    }

    public function method_226():void
    {
      var _loc1_:class_14 = this;
      if (_loc1_.var_143)
      {
        Log.Play();
      }
    }

    public function method_190(param1:Number = 1):void
    {
      var _loc2_:class_14 = this;
      if (_loc2_.var_216)
      {
        MochiEvents.startPlay("Level" + param1);
      }
    }

    public function method_117():void
    {
      var _loc1_:class_14 = this;
      if (_loc1_.var_216)
      {
        MochiEvents.endPlay();
      }
    }

    public function method_153():void
    {
      var _loc1_:class_14 = this;
      if (_loc1_.var_143)
      {
        Log.ForceSend();
      }
    }

    public function method_83(param1:String, param2:String, param3:String = "Links"):void
    {
      return;
      // if (this.var_143)
      // {
      // Link.Open(param1, param2, param3);
      // }
      // else
      // {
      // navigateToURL(new URLRequest(param1), "_blank");
      // }
    }

    public function method_97(param1:String, param2:String, param3:Boolean = false, param4:String = "", param5:Boolean = true, param6:String = "top right", param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false):class_13
    {
      var _loc11_:class_14 = this;
      var _loc12_:class_13 = new class_13(_loc11_, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10);
      _loc11_.var_170.push(_loc12_);
      return _loc12_;
    }

    public function method_85(param1:String, param2:Object = null):void
    {
      var i:class_13 = null;
      var _loc3_:class_14 = this;
      if (_loc3_.var_170.length > 0)
      {
        i = _loc3_.method_188(param1);
        if (i != null)
        {
          _loc3_.method_228(i, param2);
        }
        else
        {
          this.method_167("Could not find a Menu Screen for " + param1 + ".");
        }
      }
      else
      {
        this.method_167("No Menu Screens are set up!");
      }
    }

    public function method_228(param1:class_13, param2:Object):void
    {
      var _loc3_:class_14 = this;
      var _loc4_:class_21 = new class_21(_loc3_, param1, param2);
      _loc3_.var_118.push(_loc4_);
    }

    public function method_188(param1:String):class_13
    {
      var _loc4_:int = 0;
      var i:class_13 = null;
      var _loc2_:class_14 = this;
      var _loc3_:class_13 = null;
      if (_loc2_.var_170.length > 0)
      {
        _loc4_ = 0;
        while (_loc4_ < _loc2_.var_170.length)
        {
          i = _loc2_.var_170[_loc4_];
          if (i.label == param1)
          {
            _loc3_ = i;
            break;
          }
          _loc4_++;
        }
      }
      return _loc3_;
    }

    public function method_86(param1:String = null, param2:class_13 = null, param3:class_21 = null):void
    {
      var i:Number = NaN;
      var _loc4_:class_14 = this;
      var _loc6_:Number = -1;
      var _loc7_:class_21 = null;
      if (param1 != null)
      {
        i = 0;
        while (i < _loc4_.var_118.length)
        {
          if (_loc4_.var_118[i].getLabel() == param1)
          {
            _loc7_ = _loc4_.var_118[i];
            _loc6_ = i;
            break;
          }
          i++;
        }
      }
      else if (param2 != null)
      {
        i = 0;
        while (i < _loc4_.var_118.length)
        {
          if (_loc4_.var_118[i].getLabel() == param2.label)
          {
            _loc7_ = _loc4_.var_118[i];
            _loc6_ = i;
            break;
          }
          i++;
        }
      }
      else if (param3 != null)
      {
        i = 0;
        while (i < _loc4_.var_118.length)
        {
          if (_loc4_.var_118[i].getLabel() == param3.getLabel())
          {
            _loc7_ = _loc4_.var_118[i];
            _loc6_ = i;
            break;
          }
          i++;
        }
      }
      if (_loc7_)
      {
        _loc7_.destroy();
        _loc7_ = null;
      }
      if (_loc6_ > -1)
      {
        _loc4_.var_118.splice(_loc6_, 1);
      }
    }

    public function method_243(param1:String):Boolean
    {
      var _loc4_:int = 0;
      var _loc2_:class_14 = this;
      var _loc3_:Boolean = false;
      if (_loc2_.var_118.length > 0)
      {
        _loc4_ = 0;
        while (_loc4_ < _loc2_.var_118.length)
        {
          if (_loc2_.var_118[_loc4_].getLabel() == param1)
          {
            _loc3_ = true;
            break;
          }
          _loc4_++;
        }
      }
      return _loc3_;
    }

    public function disableButtons(param1:String = "all", param2:Array = null, param3:Boolean = true, param4:Boolean = true):void
    {
      var _loc6_:int = 0;
      var i:class_14 = this;
      if (i.var_118.length > 0)
      {
        _loc6_ = 0;
        while (_loc6_ < i.var_118.length)
        {
          if (i.var_118[_loc6_].getLabel() == param1 || param1 == "all")
          {
            i.var_118[_loc6_].disableButtons(param2, param3, param4);
            if (param1 != "all")
            {
              break;
            }
          }
          _loc6_++;
        }
      }
    }

    public function enableButtons(param1:String = "all", param2:Array = null):void
    {
      var _loc4_:int = 0;
      var _loc3_:class_14 = this;
      if (_loc3_.var_118.length > 0)
      {
        _loc4_ = 0;
        while (_loc4_ < _loc3_.var_118.length)
        {
          if (_loc3_.var_118[_loc4_].getLabel() == param1 || param1 == "all")
          {
            _loc3_.var_118[_loc4_].enableButtons(param2);
            if (param1 != "all")
            {
              break;
            }
          }
          _loc4_++;
        }
      }
    }

    public function method_115(param1:String, param2:String = "all"):void
    {
      var _loc4_:int = 0;
      var _loc3_:class_14 = this;
      if (_loc3_.var_118.length > 0)
      {
        _loc4_ = 0;
        while (_loc4_ < _loc3_.var_118.length)
        {
          if (_loc3_.var_118[_loc4_].getLabel() == param2 || param2 == "all")
          {
            _loc3_.var_118[_loc4_].setTitle(param1);
            if (param2 != "all")
            {
              break;
            }
          }
          _loc4_++;
        }
      }
    }

    public function method_105(param1:String = "all"):void
    {
      var _loc3_:int = 0;
      var _loc2_:class_14 = this;
      if (_loc2_.var_118.length > 0)
      {
        _loc3_ = 0;
        while (_loc3_ < _loc2_.var_118.length)
        {
          if (_loc2_.var_118[_loc3_].getLabel() == param1 || param1 == "all")
          {
            _loc2_.var_118[_loc3_].startTransitionOut();
            if (param1 != "all")
            {
              break;
            }
          }
          _loc3_++;
        }
      }
    }

    public function method_167(param1:String):void
    {
      class_7.method_143("[Flipline API]: " + param1);
    }

    public function method_248(param1:String):void
    {
      class_7.info("Broadcast an event: " + param1);
      dispatchEvent(new Event(param1, true));
    }

    public function method_176(param1:Event):void
    {
      var _loc2_:class_14 = this;
      _loc2_.var_173 = true;
    }

    public function method_199(param1:Event):void
    {
      var _loc2_:class_14 = this;
      _loc2_.var_173 = false;
    }

    public function method_175():void
    {
      var _loc1_:class_14 = this;
      dispatchEvent(new Event("muteSound", true));
      _loc1_.var_173 = true;
    }

    public function method_207():void
    {
      var _loc1_:class_14 = this;
      dispatchEvent(new Event("unmuteSound", true));
      _loc1_.var_173 = false;
    }

    private function getMainLoaderInfo():LoaderInfo
    {
      var _loc1_:LoaderInfo = this.container.root.loaderInfo;
      if (_loc1_.loader != null)
      {
        _loc1_ = _loc1_.loader.loaderInfo;
      }
      return _loc1_;
    }

    public function method_231(param1:String, param2:Function, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:String = "Anonymous", param7:Number = 0, param8:Object = null):void
    {
      var _loc9_:class_14 = this;
      if (_loc9_.var_164)
      {
        class_7.method_1("Scoreboard Already Existed, Remove.");
        _loc9_.method_133();
        if (param3)
        {
          _loc9_.var_164 = new Scoreboard(_loc9_, param1, param2, param3, param4, param5, param6, param7, param8);
        }
      }
      else
      {
        _loc9_.var_164 = new Scoreboard(_loc9_, param1, param2, param3, param4, param5, param6, param7, param8);
      }
    }

    public function method_133():void
    {
      var _loc1_:class_14 = this;
      if (_loc1_.var_164)
      {
        _loc1_.var_164.destroy();
        _loc1_.var_164 = null;
      }
    }

    public function method_232():Boolean
    {
      var _loc1_:class_14 = this;
      if (_loc1_.var_164)
      {
        return true;
      }
      return false;
    }

    public function method_112(param1:String):void
    {
      var _loc2_:class_14 = this;
      if (_loc2_.var_172)
      {
        _loc2_.method_111();
      }
      _loc2_.var_172 = new class_20(_loc2_, param1);
    }

    public function method_111():void
    {
      var _loc1_:class_14 = this;
      if (_loc1_.var_172)
      {
        _loc1_.var_172.destroy();
        _loc1_.var_172 = null;
      }
    }

    public function method_122(param1:Object, param2:String, param3:String = "backup", param4:Function = null):void
    {
      this.backup.method_122(param1, param2, param3, param4);
    }

    public function method_123(param1:Number, param2:String, param3:String, param4:Function = null):void
    {
      this.backup.method_123(param1, param2, param3, param4);
    }

    public function method_223(param1:Boolean = true):void
    {
      var _loc2_:class_14 = this;
      _loc2_.backup.method_177(param1);
    }
  }
}
