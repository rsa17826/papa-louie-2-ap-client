package package_3
{
  import Playtomic.*;
  import flash.display.*;
  import flash.events.*;
  import flash.filters.GlowFilter;
  import flash.geom.*;
  import flash.net.URLRequest;
  import flash.net.navigateToURL;
  import flash.text.*;
  import flash.utils.getDefinitionByName;
  import flipline.api.*;
  import flipline.api.events.*;
  import package_5.class_16;
  import flash.external.ExternalInterface;

  public class class_11 extends MovieClip
  {

    private static var var_176:Array = ["api_smallbutton_left", "api_smallbutton_middle", "api_smallbutton_right"];

    private static var var_175:Array = ["api_largebutton_left", "api_largebutton_middle", "api_largebutton_right"];

    private static var var_180:Array = ["api_redbutton_left", "api_redbutton_middle", "api_redbutton_right"];

    private static var var_163:Array = ["api_smallbutton_left_overlay", "api_smallbutton_middle_overlay", "api_smallbutton_right_overlay"];

    private static var var_178:Array = ["api_largebutton_left_overlay", "api_largebutton_middle_overlay", "api_largebutton_right_overlay"];

    private static var var_228:Array = ["api_smallbutton_left_overlay", "api_smallbutton_middle_overlay", "api_smallbutton_right_overlay"];

    private var label:String;

    private var size:String;

    private var type:String;

    private var linkURL:String = null;

    private var var_235:*;

    private var var_147:Boolean = false;

    private var var_177:Boolean = false;

    private var var_195:Boolean = false;

    private var var_214:Boolean = false;

    private var var_184:Number = 0;

    private var var_217:String;

    private var var_143:Boolean = false;

    private var var_148:Number = 16;

    private var var_160:Number = 23;

    private var var_298:Number = 3;

    private var var_315:Number = 3;

    private var var_304:Number = 7;

    private var var_139:MovieClip;

    private var var_135:MovieClip;

    private var var_126:TextField;

    private var var_166:Boolean = true;

    private var var_161:Boolean = false;

    private var var_146:MovieClip = null;

    public function class_11(param1:class_16 = null, param2:String = null, param3:String = null, param4:String = "button", param5:String = null, param6:String = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:* = null, param11:Boolean = false, param12:Number = 0, param13:Boolean = false)
    {
      super();
      var _loc14_:class_11 = this;
      if (param1 != null)
      {
        _loc14_.label = param1.label;
        _loc14_.size = param1.size;
        _loc14_.type = param1.var_257;
        _loc14_.var_217 = param1.var_217;
        _loc14_.linkURL = param1.linkURL;
        _loc14_.var_177 = param1.var_177;
        _loc14_.var_195 = param1.var_195;
        _loc14_.var_214 = param1.var_214;
        _loc14_.var_235 = param1.var_235;
        _loc14_.var_147 = param1.var_147;
        _loc14_.var_166 = !_loc14_.var_147;
        _loc14_.var_143 = param1.var_143;
        _loc14_.var_184 = param1.var_184;
        _loc14_.var_161 = param1.var_161;
      }
      else
      {
        _loc14_.label = param2;
        _loc14_.size = param3;
        _loc14_.type = param4;
        _loc14_.var_217 = param5;
        _loc14_.linkURL = param6;
        _loc14_.var_177 = param7;
        _loc14_.var_195 = param8;
        _loc14_.var_214 = param9;
        _loc14_.var_235 = param10;
        _loc14_.var_147 = param11;
        _loc14_.var_166 = !param11;
        _loc14_.var_184 = param12;
        _loc14_.var_161 = param13;
      }
      _loc14_.method_201();
      ExternalInterface.call("log", this.label);
    }

    private function method_201():void
    {
      var _loc2_:Number = NaN;
      var _loc5_:Class = null;
      var _loc6_:Class = null;
      var _loc7_:Class = null;
      var _loc8_:MovieClip = null;
      var _loc9_:MovieClip = null;
      var _loc10_:MovieClip = null;
      var _loc11_:Class = null;
      var _loc12_:Class = null;
      var _loc13_:Class = null;
      var _loc14_:MovieClip = null;
      var _loc15_:MovieClip = null;
      var _loc16_:MovieClip = null;
      var _loc17_:MovieClip = null;
      var _loc18_:MovieClip = null;
      var _loc19_:MovieClip = null;
      var _loc1_:class_11 = this;
      if (_loc1_.var_195)
      {
        _loc1_.var_184 = 184;
      }
      _loc1_.buttonMode = true;
      _loc1_.useHandCursor = true;
      _loc1_.mouseEnabled = true;
      _loc1_.mouseChildren = false;
      _loc1_.tabEnabled = false;
      _loc1_.addEventListener(MouseEvent.CLICK, _loc1_.method_158);
      _loc1_.addEventListener(MouseEvent.ROLL_OVER, _loc1_.method_160);
      _loc1_.addEventListener(MouseEvent.ROLL_OUT, _loc1_.method_164);
      _loc1_.var_126 = new TextField();
      _loc1_.var_126.embedFonts = true;
      _loc1_.var_126.antiAliasType = AntiAliasType.ADVANCED;
      _loc1_.var_126.gridFitType = GridFitType.SUBPIXEL;
      _loc1_.var_126.wordWrap = false;
      _loc1_.var_126.multiline = false;
      _loc1_.var_126.text = _loc1_.label;
      _loc1_.var_126.setTextFormat(_loc1_.method_113(_loc1_.var_147));
      _loc1_.var_126.height = _loc1_.var_126.textHeight + 4;
      _loc1_.method_126(_loc1_.var_147);
      var _loc3_:Number = _loc1_.var_126.textWidth + 4 + _loc1_.var_304 * 2;
      if (_loc1_.var_184 > 0)
      {
        _loc3_ = _loc1_.var_184;
      }
      if (_loc1_.size == "small")
      {
        _loc1_.var_126.width = Math.ceil(_loc3_ / _loc1_.var_148) * _loc1_.var_148;
        _loc1_.var_126.x = 0;
        _loc1_.var_126.y = _loc1_.var_298;
      }
      else if (_loc1_.size == "large")
      {
        _loc1_.var_126.width = Math.ceil(_loc3_ / _loc1_.var_160) * _loc1_.var_160;
        _loc1_.var_126.x = 0;
        _loc1_.var_126.y = _loc1_.var_315;
      }
      _loc1_.var_139 = new MovieClip();
      _loc1_.var_135 = new MovieClip();
      _loc1_.var_135.blendMode = "overlay";
      _loc1_.var_135.alpha = 0.5;
      _loc1_.var_135.visible = false;
      _loc1_.addChild(_loc1_.var_139);
      _loc1_.addChild(_loc1_.var_126);
      _loc1_.addChild(_loc1_.var_135);
      if (_loc1_.var_161)
      {
        _loc1_.var_146 = new api_button_flasher();
        _loc1_.var_146.blendMode = "overlay";
        _loc1_.var_146.alpha = 0.4;
        _loc1_.var_146.visible = true;
        _loc1_.addChild(_loc1_.var_146);
      }
      var _loc4_:Number = 1;
      if (_loc1_.var_177)
      {
        _loc4_ = Math.ceil(_loc1_.var_126.width / this.var_148) - 2;
        _loc5_ = getDefinitionByName(class_11.var_180[0]) as Class;
        _loc8_ = new _loc5_();
        _loc11_ = getDefinitionByName(class_11.var_163[0]) as Class;
        _loc14_ = new _loc11_();
        _loc1_.var_139.addChild(_loc8_);
        _loc1_.var_135.addChild(_loc14_);
        if (_loc1_.var_147)
        {
          _loc8_.gotoAndStop("disabled");
        }
        else
        {
          _loc8_.gotoAndStop("up");
        }
        _loc6_ = getDefinitionByName(class_11.var_180[1]) as Class;
        _loc13_ = getDefinitionByName(class_11.var_163[1]) as Class;
        _loc15_ = new _loc13_();
        _loc15_.x = _loc1_.var_148;
        _loc15_.width = _loc1_.var_148 * _loc4_;
        _loc1_.var_135.addChild(_loc15_);
        _loc2_ = 0;
        while (_loc2_ < _loc4_)
        {
          _loc9_ = new _loc6_();
          _loc9_.x = _loc1_.var_148 + _loc2_ * _loc1_.var_148;
          _loc1_.var_139.addChild(_loc9_);
          if (_loc1_.var_147)
          {
            _loc9_.gotoAndStop("disabled");
          }
          else
          {
            _loc9_.gotoAndStop("up");
          }
          _loc2_++;
        }
        _loc7_ = getDefinitionByName(class_11.var_180[2]) as Class;
        _loc10_ = new _loc7_();
        _loc12_ = getDefinitionByName(class_11.var_163[2]) as Class;
        _loc16_ = new _loc12_();
        _loc10_.x = _loc1_.var_148 * (_loc4_ + 1);
        _loc16_.x = _loc10_.x;
        _loc1_.var_139.addChild(_loc10_);
        _loc1_.var_135.addChild(_loc16_);
        if (_loc1_.var_147)
        {
          _loc10_.gotoAndStop("disabled");
        }
        else
        {
          _loc10_.gotoAndStop("up");
        }
      }
      else if (_loc1_.size == "small")
      {
        _loc4_ = Math.ceil(_loc1_.var_126.width / this.var_148) - 2;
        _loc5_ = getDefinitionByName(class_11.var_176[0]) as Class;
        _loc8_ = new _loc5_();
        _loc11_ = getDefinitionByName(class_11.var_163[0]) as Class;
        _loc14_ = new _loc11_();
        _loc1_.var_139.addChild(_loc8_);
        _loc1_.var_135.addChild(_loc14_);
        if (_loc1_.var_147)
        {
          _loc8_.gotoAndStop("disabled");
        }
        else
        {
          _loc8_.gotoAndStop("up");
        }
        _loc6_ = getDefinitionByName(class_11.var_176[1]) as Class;
        _loc13_ = getDefinitionByName(class_11.var_163[1]) as Class;
        _loc15_ = new _loc13_();
        _loc15_.x = _loc1_.var_148;
        _loc15_.width = _loc1_.var_148 * _loc4_;
        _loc1_.var_135.addChild(_loc15_);
        _loc2_ = 0;
        while (_loc2_ < _loc4_)
        {
          _loc9_ = new _loc6_();
          _loc9_.x = _loc1_.var_148 + _loc2_ * _loc1_.var_148;
          _loc1_.var_139.addChild(_loc9_);
          if (_loc1_.var_147)
          {
            _loc9_.gotoAndStop("disabled");
          }
          else
          {
            _loc9_.gotoAndStop("up");
          }
          _loc2_++;
        }
        _loc7_ = getDefinitionByName(class_11.var_176[2]) as Class;
        _loc10_ = new _loc7_();
        _loc12_ = getDefinitionByName(class_11.var_163[2]) as Class;
        _loc16_ = new _loc12_();
        _loc10_.x = _loc1_.var_148 * (_loc4_ + 1);
        _loc16_.x = _loc10_.x;
        _loc1_.var_139.addChild(_loc10_);
        _loc1_.var_135.addChild(_loc16_);
        if (_loc1_.var_147)
        {
          _loc10_.gotoAndStop("disabled");
        }
        else
        {
          _loc10_.gotoAndStop("up");
        }
      }
      else if (_loc1_.size == "large")
      {
        _loc4_ = Math.ceil(_loc1_.var_126.width / this.var_160) - 2;
        _loc5_ = getDefinitionByName(class_11.var_175[0]) as Class;
        _loc8_ = new _loc5_();
        _loc11_ = getDefinitionByName(class_11.var_178[0]) as Class;
        _loc14_ = new _loc11_();
        _loc1_.var_139.addChild(_loc8_);
        _loc1_.var_135.addChild(_loc14_);
        if (_loc1_.var_161)
        {
          _loc17_ = new _loc11_();
          _loc1_.var_146.inside.addChild(_loc17_);
        }
        if (_loc1_.var_147)
        {
          _loc8_.gotoAndStop("disabled");
        }
        else
        {
          _loc8_.gotoAndStop("up");
        }
        _loc6_ = getDefinitionByName(class_11.var_175[1]) as Class;
        _loc13_ = getDefinitionByName(class_11.var_178[1]) as Class;
        _loc15_ = new _loc13_();
        _loc15_.x = _loc1_.var_160;
        _loc15_.width = _loc1_.var_160 * _loc4_;
        _loc1_.var_135.addChild(_loc15_);
        if (_loc1_.var_161)
        {
          _loc18_ = new _loc13_();
          _loc18_.x = _loc1_.var_160;
          _loc18_.width = _loc1_.var_160 * _loc4_;
          _loc1_.var_146.inside.addChild(_loc18_);
        }
        _loc2_ = 0;
        while (_loc2_ < _loc4_)
        {
          _loc9_ = new _loc6_();
          _loc9_.x = _loc1_.var_160 + _loc2_ * _loc1_.var_160;
          _loc1_.var_139.addChild(_loc9_);
          if (_loc1_.var_147)
          {
            _loc9_.gotoAndStop("disabled");
          }
          else
          {
            _loc9_.gotoAndStop("up");
          }
          _loc2_++;
        }
        _loc7_ = getDefinitionByName(class_11.var_175[2]) as Class;
        _loc10_ = new _loc7_();
        _loc12_ = getDefinitionByName(class_11.var_178[2]) as Class;
        _loc16_ = new _loc12_();
        _loc10_.x = _loc1_.var_160 * (_loc4_ + 1);
        _loc16_.x = _loc10_.x;
        _loc1_.var_139.addChild(_loc10_);
        _loc1_.var_135.addChild(_loc16_);
        if (_loc1_.var_147)
        {
          _loc10_.gotoAndStop("disabled");
        }
        else
        {
          _loc10_.gotoAndStop("up");
        }
        if (_loc1_.var_161)
        {
          _loc19_ = new _loc12_();
          _loc19_.x = _loc10_.x;
          _loc1_.var_146.inside.addChild(_loc19_);
        }
      }
      if (_loc1_.var_161)
      {
      }
      dispatchEvent(new MenuButtonEvent(this.var_217, true));
    }

    private function method_126(param1:Boolean = false):void
    {
      var _loc3_:GlowFilter = null;
      var _loc2_:class_11 = this;
      if (param1)
      {
        _loc2_.var_126.filters = [];
      }
      else
      {
        _loc3_ = new GlowFilter(16774818, 1, 2, 2, 255);
        if (_loc2_.var_177)
        {
          _loc3_.color = 15258579;
        }
        _loc2_.var_126.filters = [_loc3_];
      }
    }

    private function method_113(param1:Boolean = false):TextFormat
    {
      var _loc2_:class_11 = this;
      var _loc3_:TextFormat = new TextFormat();
      _loc3_.font = class_14.const_8;
      if (param1)
      {
        _loc3_.color = class_14.const_21;
      }
      else if (_loc2_.var_177)
      {
        _loc3_.color = class_14.const_15;
      }
      else
      {
        _loc3_.color = class_14.const_10;
      }
      if (_loc2_.size == "large")
      {
        _loc3_.size = class_14.const_20;
      }
      else
      {
        _loc3_.size = class_14.const_23;
      }
      _loc3_.bold = class_14.const_14;
      _loc3_.align = TextFormatAlign.CENTER;
      _loc3_.kerning = true;
      _loc3_.letterSpacing = -0.5;
      return _loc3_;
    }

    public function destroy():void
    {
      var _loc1_:class_11 = this;
      if (Boolean(_loc1_.parent) && _loc1_.parent.contains(_loc1_))
      {
        _loc1_.parent.removeChild(_loc1_);
      }
      _loc1_.removeChild(_loc1_.var_139);
      _loc1_.removeChild(_loc1_.var_135);
      _loc1_.removeChild(_loc1_.var_126);
      if (_loc1_.var_146 != null)
      {
        _loc1_.removeChild(_loc1_.var_146);
        _loc1_.var_146 = null;
      }
      _loc1_.var_139 = null;
      _loc1_.var_135 = null;
      _loc1_.removeEventListener(MouseEvent.ROLL_OVER, _loc1_.method_160);
      _loc1_.removeEventListener(MouseEvent.ROLL_OUT, _loc1_.method_164);
      _loc1_.removeEventListener(MouseEvent.CLICK, _loc1_.method_158);
    }

    private function method_158(param1:MouseEvent):void
    {
      var _loc2_:class_11 = this;
      if (_loc2_.var_166)
      {
        if (_loc2_.type == "link")
        {
          if (_loc2_.var_143)
          {
            Link.Open(_loc2_.linkURL, _loc2_.label, "LinkButtons");
          }
          else
          {
            navigateToURL(new URLRequest(_loc2_.linkURL), "_blank");
          }
        }
        else if (_loc2_.type == "button")
        {
          dispatchEvent(new MenuButtonEvent(_loc2_.var_217, true));
        }
        else if (_loc2_.type == "custom")
        {
        }
      }
    }

    private function method_160(param1:MouseEvent):void
    {
      var _loc2_:class_11 = this;
      if (_loc2_.var_166)
      {
        _loc2_.var_135.visible = true;
        if (_loc2_.var_161 && _loc2_.var_146 != null)
        {
          _loc2_.var_146.visible = false;
        }
      }
    }

    private function method_164(param1:MouseEvent):void
    {
      var _loc2_:class_11 = this;
      if (_loc2_.var_166)
      {
        _loc2_.var_135.visible = false;
        if (_loc2_.var_161 && _loc2_.var_146 != null)
        {
          _loc2_.var_146.visible = true;
        }
      }
    }

    public function method_118():void
    {
      var _loc1_:class_11 = this;
      _loc1_.var_166 = true;
      _loc1_.var_126.setTextFormat(_loc1_.method_113());
      _loc1_.method_126();
      var _loc2_:int = 0;
      while (_loc2_ < _loc1_.var_139.numChildren)
      {
        MovieClip(_loc1_.var_139.getChildAt(_loc2_)).gotoAndStop("up");
        _loc2_++;
      }
    }

    public function method_114():void
    {
      var _loc1_:class_11 = this;
      _loc1_.var_166 = false;
      _loc1_.var_135.visible = false;
      _loc1_.var_126.setTextFormat(_loc1_.method_113(true));
      _loc1_.method_126(true);
      var _loc2_:int = 0;
      while (_loc2_ < _loc1_.var_139.numChildren)
      {
        MovieClip(_loc1_.var_139.getChildAt(_loc2_)).gotoAndStop("disabled");
        _loc2_++;
      }
    }

    public function getLabel():String
    {
      var _loc1_:class_11 = this;
      return _loc1_.label;
    }
  }
}
