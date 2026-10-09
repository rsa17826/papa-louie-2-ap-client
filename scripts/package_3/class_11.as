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

    public var label:String;

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
      if (param1 != null)
      {
        this.label = param1.label;
        this.size = param1.size;
        this.type = param1.var_257;
        this.var_217 = param1.var_217;
        this.linkURL = param1.linkURL;
        this.var_177 = param1.var_177;
        this.var_195 = param1.var_195;
        this.var_214 = param1.var_214;
        this.var_235 = param1.var_235;
        this.var_147 = param1.var_147;
        this.var_166 = !this.var_147;
        this.var_143 = param1.var_143;
        this.var_184 = param1.var_184;
        this.var_161 = param1.var_161;
      }
      else
      {
        this.label = param2;
        this.size = param3;
        this.type = param4;
        this.var_217 = param5;
        this.linkURL = param6;
        this.var_177 = param7;
        this.var_195 = param8;
        this.var_214 = param9;
        this.var_235 = param10;
        this.var_147 = param11;
        this.var_166 = !param11;
        this.var_184 = param12;
        this.var_161 = param13;
      }
      this.method_201();
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
      if (this.var_195)
      {
        this.var_184 = 184;
      }
      this.buttonMode = true;
      this.useHandCursor = true;
      this.mouseEnabled = true;
      this.mouseChildren = false;
      this.tabEnabled = false;
      this.addEventListener(MouseEvent.CLICK, this.method_158);
      this.addEventListener(MouseEvent.ROLL_OVER, this.method_160);
      this.addEventListener(MouseEvent.ROLL_OUT, this.method_164);
      this.var_126 = new TextField();
      this.var_126.embedFonts = true;
      this.var_126.antiAliasType = AntiAliasType.ADVANCED;
      this.var_126.gridFitType = GridFitType.SUBPIXEL;
      this.var_126.wordWrap = false;
      this.var_126.multiline = false;
      this.var_126.text = this.label;
      this.var_126.setTextFormat(this.method_113(this.var_147));
      this.var_126.height = this.var_126.textHeight + 4;
      this.method_126(this.var_147);
      var _loc3_:Number = this.var_126.textWidth + 4 + this.var_304 * 2;
      if (this.var_184 > 0)
      {
        _loc3_ = this.var_184;
      }
      if (this.size == "small")
      {
        this.var_126.width = Math.ceil(_loc3_ / this.var_148) * this.var_148;
        this.var_126.x = 0;
        this.var_126.y = this.var_298;
      }
      else if (this.size == "large")
      {
        this.var_126.width = Math.ceil(_loc3_ / this.var_160) * this.var_160;
        this.var_126.x = 0;
        this.var_126.y = this.var_315;
      }
      this.var_139 = new MovieClip();
      this.var_135 = new MovieClip();
      this.var_135.blendMode = "overlay";
      this.var_135.alpha = 0.5;
      this.var_135.visible = false;
      this.addChild(this.var_139);
      this.addChild(this.var_126);
      this.addChild(this.var_135);
      if (this.var_161)
      {
        this.var_146 = new api_button_flasher();
        this.var_146.blendMode = "overlay";
        this.var_146.alpha = 0.4;
        this.var_146.visible = true;
        this.addChild(this.var_146);
      }
      var _loc4_:Number = 1;
      if (this.var_177)
      {
        _loc4_ = Math.ceil(this.var_126.width / this.var_148) - 2;
        _loc5_ = getDefinitionByName(class_11.var_180[0]) as Class;
        _loc8_ = new _loc5_();
        _loc11_ = getDefinitionByName(class_11.var_163[0]) as Class;
        _loc14_ = new _loc11_();
        this.var_139.addChild(_loc8_);
        this.var_135.addChild(_loc14_);
        if (this.var_147)
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
        _loc15_.x = this.var_148;
        _loc15_.width = this.var_148 * _loc4_;
        this.var_135.addChild(_loc15_);
        _loc2_ = 0;
        while (_loc2_ < _loc4_)
        {
          _loc9_ = new _loc6_();
          _loc9_.x = this.var_148 + _loc2_ * this.var_148;
          this.var_139.addChild(_loc9_);
          if (this.var_147)
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
        _loc10_.x = this.var_148 * (_loc4_ + 1);
        _loc16_.x = _loc10_.x;
        this.var_139.addChild(_loc10_);
        this.var_135.addChild(_loc16_);
        if (this.var_147)
        {
          _loc10_.gotoAndStop("disabled");
        }
        else
        {
          _loc10_.gotoAndStop("up");
        }
      }
      else if (this.size == "small")
      {
        _loc4_ = Math.ceil(this.var_126.width / this.var_148) - 2;
        _loc5_ = getDefinitionByName(class_11.var_176[0]) as Class;
        _loc8_ = new _loc5_();
        _loc11_ = getDefinitionByName(class_11.var_163[0]) as Class;
        _loc14_ = new _loc11_();
        this.var_139.addChild(_loc8_);
        this.var_135.addChild(_loc14_);
        if (this.var_147)
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
        _loc15_.x = this.var_148;
        _loc15_.width = this.var_148 * _loc4_;
        this.var_135.addChild(_loc15_);
        _loc2_ = 0;
        while (_loc2_ < _loc4_)
        {
          _loc9_ = new _loc6_();
          _loc9_.x = this.var_148 + _loc2_ * this.var_148;
          this.var_139.addChild(_loc9_);
          if (this.var_147)
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
        _loc10_.x = this.var_148 * (_loc4_ + 1);
        _loc16_.x = _loc10_.x;
        this.var_139.addChild(_loc10_);
        this.var_135.addChild(_loc16_);
        if (this.var_147)
        {
          _loc10_.gotoAndStop("disabled");
        }
        else
        {
          _loc10_.gotoAndStop("up");
        }
      }
      else if (this.size == "large")
      {
        _loc4_ = Math.ceil(this.var_126.width / this.var_160) - 2;
        _loc5_ = getDefinitionByName(class_11.var_175[0]) as Class;
        _loc8_ = new _loc5_();
        _loc11_ = getDefinitionByName(class_11.var_178[0]) as Class;
        _loc14_ = new _loc11_();
        this.var_139.addChild(_loc8_);
        this.var_135.addChild(_loc14_);
        if (this.var_161)
        {
          _loc17_ = new _loc11_();
          this.var_146.inside.addChild(_loc17_);
        }
        if (this.var_147)
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
        _loc15_.x = this.var_160;
        _loc15_.width = this.var_160 * _loc4_;
        this.var_135.addChild(_loc15_);
        if (this.var_161)
        {
          _loc18_ = new _loc13_();
          _loc18_.x = this.var_160;
          _loc18_.width = this.var_160 * _loc4_;
          this.var_146.inside.addChild(_loc18_);
        }
        _loc2_ = 0;
        while (_loc2_ < _loc4_)
        {
          _loc9_ = new _loc6_();
          _loc9_.x = this.var_160 + _loc2_ * this.var_160;
          this.var_139.addChild(_loc9_);
          if (this.var_147)
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
        _loc10_.x = this.var_160 * (_loc4_ + 1);
        _loc16_.x = _loc10_.x;
        this.var_139.addChild(_loc10_);
        this.var_135.addChild(_loc16_);
        if (this.var_147)
        {
          _loc10_.gotoAndStop("disabled");
        }
        else
        {
          _loc10_.gotoAndStop("up");
        }
        if (this.var_161)
        {
          _loc19_ = new _loc12_();
          _loc19_.x = _loc10_.x;
          this.var_146.inside.addChild(_loc19_);
        }
      }
      if (this.var_161)
      {
      }
      dispatchEvent(new MenuButtonEvent(this.var_217, true));
    }

    private function method_126(param1:Boolean = false):void
    {
      var _loc3_:GlowFilter = null;
      if (param1)
      {
        this.var_126.filters = [];
      }
      else
      {
        _loc3_ = new GlowFilter(16774818, 1, 2, 2, 255);
        if (this.var_177)
        {
          _loc3_.color = 15258579;
        }
        this.var_126.filters = [_loc3_];
      }
    }

    private function method_113(param1:Boolean = false):TextFormat
    {
      var _loc3_:TextFormat = new TextFormat();
      _loc3_.font = class_14.const_8;
      if (param1)
      {
        _loc3_.color = class_14.const_21;
      }
      else if (this.var_177)
      {
        _loc3_.color = class_14.const_15;
      }
      else
      {
        _loc3_.color = class_14.const_10;
      }
      if (this.size == "large")
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
      if (Boolean(this.parent) && this.parent.contains(this))
      {
        this.parent.removeChild(this);
      }
      this.removeChild(this.var_139);
      this.removeChild(this.var_135);
      this.removeChild(this.var_126);
      if (this.var_146 != null)
      {
        this.removeChild(this.var_146);
        this.var_146 = null;
      }
      this.var_139 = null;
      this.var_135 = null;
      this.removeEventListener(MouseEvent.ROLL_OVER, this.method_160);
      this.removeEventListener(MouseEvent.ROLL_OUT, this.method_164);
      this.removeEventListener(MouseEvent.CLICK, this.method_158);
    }

    private function method_158(param1:MouseEvent):void
    {
      if (this.var_166)
      {
        if (this.type == "link")
        {
          if (this.var_143)
          {
            Link.Open(this.linkURL, this.label, "LinkButtons");
          }
          else
          {
            navigateToURL(new URLRequest(this.linkURL), "_blank");
          }
        }
        else if (this.type == "button")
        {
          dispatchEvent(new MenuButtonEvent(this.var_217, true));
        }
        else if (this.type == "custom")
        {
        }
      }
    }

    private function method_160(param1:MouseEvent):void
    {
      if (this.var_166)
      {
        this.var_135.visible = true;
        if (this.var_161 && this.var_146 != null)
        {
          this.var_146.visible = false;
        }
      }
    }

    private function method_164(param1:MouseEvent):void
    {
      if (this.var_166)
      {
        this.var_135.visible = false;
        if (this.var_161 && this.var_146 != null)
        {
          this.var_146.visible = true;
        }
      }
    }

    public function method_118():void
    {
      this.var_166 = true;
      this.var_126.setTextFormat(this.method_113());
      this.method_126();
      var _loc2_:int = 0;
      while (_loc2_ < this.var_139.numChildren)
      {
        MovieClip(this.var_139.getChildAt(_loc2_)).gotoAndStop("up");
        _loc2_++;
      }
    }

    public function method_114():void
    {
      this.var_166 = false;
      this.var_135.visible = false;
      this.var_126.setTextFormat(this.method_113(true));
      this.method_126(true);
      var _loc2_:int = 0;
      while (_loc2_ < this.var_139.numChildren)
      {
        MovieClip(this.var_139.getChildAt(_loc2_)).gotoAndStop("disabled");
        _loc2_++;
      }
    }

    public function getLabel():String
    {
      return this.label;
    }
  }
}
