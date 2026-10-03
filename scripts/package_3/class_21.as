package package_3
{
  import Playtomic.*;
  import flash.display.*;
  import flash.events.*;
  import flash.geom.*;
  import flash.text.*;
  import flipline.api.class_14;
  import package_2.class_7;
  import package_5.*;

  public class class_21
  {

    private var api:class_14;

    private var data:class_13;

    private var var_254:Object = null;

    private var clip:MovieClip;

    private var var_117:MovieClip;

    private var var_123:MovieClip;

    private var var_131:MovieClip;

    private var var_209:Number = 4;

    private var var_311:Number = 0;

    private var var_288:Number = 45;

    private var var_266:Number = 11;

    private var var_271:Number = 6;

    private var var_247:Number = -15;

    private var var_305:Number = 45;

    private var var_267:Number = 7;

    private var var_300:Number = 3;

    private var var_299:Number = 10;

    private var var_232:Number = 10;

    private var var_279:Number = 7;

    private var var_326:Number = 10;

    private var var_313:Number = 78;

    private var var_314:Number = 3;

    private var var_281:Number = 6;

    private var var_287:Number = 8;

    private var var_306:Number = -1;

    private var var_302:Number = 2;

    private var var_154:class_11 = null;

    private var var_162:class_11;

    private var var_121:MovieClip;

    private var var_125:MovieClip;

    private var var_133:MovieClip;

    private var var_129:SimpleButton;

    private var var_151:SimpleButton;

    private var var_141:MovieClip;

    private var var_276:MovieClip;

    private var var_233:Boolean = false;

    private var var_296:String = "api_menu_top_panel";

    private var var_275:String = "api_menu_bottom_panel";

    private var var_270:String = "startgame_bg";

    private var var_284:Number = -13;

    private var var_241:Number = -5;

    private var var_263:String = "flip_logo_large";

    private var var_262:String = "flip_logo_small";

    private var var_319:String = "sponsor_logo_large";

    private var var_290:String = "sponsor_logo_small";

    private var var_286:String = "license_logo_large";

    private var var_285:String = "license_logo_small";

    private var var_277:String = "developedby_tag";

    private var var_261:String = "sponsoredby_tag";

    private var var_273:String = "api_mute_btn";

    private var var_320:String = "api_unmute_btn";

    private var var_309:String = "api_getthisgame_button";

    private var var_317:String = "api_getthisgame_bigbutton";

    private var var_269:String = "api_promopanel_license";

    private var var_264:String = "api_promopanel_sponsor";

    private var var_136:MovieClip;

    private var var_292:Number = 46;

    private var var_167:Number = 12;

    private var var_212:Number = 15;

    private var var_223:Number = 10;

    private var var_321:Number = 2;

    private var var_316:Number = 73;

    private var var_272:Number = 120;

    private var var_274:Number = 43;

    private var var_289:Number = 101;

    private var var_307:Number = 43;

    private var var_293:Number = 60;

    private var var_312:Number = 0;

    private var var_308:Number = 60;

    private var var_268:Number = 73;

    private var var_301:Number = 137;

    private var var_318:Number = 3;

    private var var_297:Number = 3;

    private var var_145:Number = 0;

    private var var_140:Number = 0;

    private var var_246:Number = 4;

    private var var_291:Number = 0;

    private var var_208:Number = 0;

    private var var_242:Boolean = false;

    private var var_138:TextField;

    private var var_201:*;

    public function class_21(param1:class_14, param2:class_13, param3:Object = null)
    {
      super();
      this.api = param1;
      this.data = param2;
      this.var_254 = param3;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      var _loc2_:Array = null;
      var _loc3_:Number = NaN;
      var _loc4_:class_16 = null;
      var _loc5_:class_11 = null;
      var _loc6_:MovieClip = null;
      var _loc7_:Array = null;
      var _loc8_:TextField = null;
      var _loc9_:TextField = null;
      var _loc10_:MovieClip = null;
      var _loc11_:MovieClip = null;
      var _loc12_:int = 0;
      var _loc13_:MovieClip = null;
      var _loc1_:class_21 = this;
      _loc1_.clip = new MovieClip();
      _loc1_.var_117 = this.api.var_132.method_91(this.var_296);
      _loc1_.var_123 = this.api.var_132.method_91(this.var_275);
      if (this.data.var_219)
      {
        _loc1_.var_145 = 0 - (_loc1_.var_117.height - this.var_316);
        _loc1_.var_140 = this.api.var_130 - this.var_272;
        _loc1_.var_117.y = 0 - _loc1_.var_117.height + this.api.var_130 / 2 - 30;
        _loc1_.var_123.y = this.api.var_130 - this.api.var_130 / 2 + 30;
      }
      else if (this.data.var_156)
      {
        _loc1_.var_145 = 0 - (_loc1_.var_117.height - this.var_268);
        _loc1_.var_140 = this.api.var_130 - this.var_301;
        _loc1_.var_117.y = 0 - _loc1_.var_117.height + this.api.var_130 / 2 - 30;
        _loc1_.var_123.y = this.api.var_130 - this.api.var_130 / 2 + 30;
      }
      else if (this.data.var_207)
      {
        _loc1_.var_145 = 0 - (_loc1_.var_117.height - this.var_307);
        _loc1_.var_140 = this.api.var_130 - this.var_293;
        _loc1_.var_117.y = 0 - _loc1_.var_117.height;
        _loc1_.var_123.y = this.api.var_130;
      }
      else if (this.data.var_220)
      {
        _loc1_.var_145 = 0 - (_loc1_.var_117.height - this.var_312);
        _loc1_.var_140 = this.api.var_130 - this.var_308;
        _loc1_.var_117.y = 0 - _loc1_.var_117.height;
        _loc1_.var_123.y = this.api.var_130;
      }
      else
      {
        _loc1_.var_145 = 0 - (_loc1_.var_117.height - this.var_274);
        _loc1_.var_140 = this.api.var_130 - this.var_289;
        _loc1_.var_117.y = 0 - _loc1_.var_117.height;
        _loc1_.var_123.y = this.api.var_130;
      }
      _loc1_.var_138 = new TextField();
      _loc1_.var_138.embedFonts = true;
      _loc1_.var_138.antiAliasType = AntiAliasType.ADVANCED;
      _loc1_.var_138.gridFitType = GridFitType.SUBPIXEL;
      _loc1_.var_138.wordWrap = false;
      _loc1_.var_138.multiline = false;
      _loc1_.var_138.defaultTextFormat = _loc1_.method_113();
      _loc1_.var_138.text = "";
      _loc1_.var_138.mouseEnabled = false;
      _loc1_.var_138.y = 0 - _loc1_.var_145 + _loc1_.var_311;
      if (_loc1_.data.var_256)
      {
        _loc1_.var_138.text = _loc1_.data.var_260;
      }
      _loc1_.var_138.height = _loc1_.var_138.textHeight + 4;
      _loc1_.var_138.width = _loc1_.api.var_137;
      _loc1_.var_117.addChild(_loc1_.var_138);
      _loc1_.var_131 = new MovieClip();
      if (this.data.var_219)
      {
        _loc1_.var_131.y = _loc1_.var_288;
      }
      else if (this.data.var_156)
      {
        _loc1_.var_131.y = _loc1_.var_271;
      }
      else
      {
        _loc1_.var_131.y = _loc1_.var_266;
      }
      if (_loc1_.data.var_157.length > 0)
      {
        _loc3_ = 0;
        while (_loc3_ < _loc1_.data.var_157.length)
        {
          _loc4_ = _loc1_.data.var_157[_loc3_];
          _loc5_ = new class_11(_loc4_);
          if (_loc4_.var_214)
          {
            _loc5_.x = _loc1_.var_167;
            _loc5_.y = 0 - _loc1_.var_145 + _loc1_.var_279;
            _loc1_.var_117.addChild(_loc5_);
            _loc1_.var_162 = _loc5_;
          }
          else if (_loc4_.size == "large")
          {
            _loc5_.x = Math.floor((_loc1_.api.var_137 - _loc5_.width) / 2);
            if (_loc4_.var_195)
            {
              _loc5_.y = _loc1_.var_247;
            }
            else if (this.data.var_207 || this.data.var_220)
            {
              _loc5_.y = _loc1_.var_267;
            }
            else
            {
              _loc5_.y = _loc1_.var_305;
            }
            if (_loc4_.var_195)
            {
              _loc6_ = this.api.var_132.method_91(_loc1_.var_270);
              _loc6_.x = _loc5_.x + _loc1_.var_284;
              _loc6_.y = _loc5_.y + _loc1_.var_241;
              _loc1_.var_123.addChild(_loc6_);
              _loc1_.var_276 = _loc6_;
              _loc1_.var_233 = true;
            }
            _loc1_.var_123.addChild(_loc5_);
            _loc1_.var_154 = _loc5_;
            if (this.data.var_156)
            {
              _loc1_.var_131.graphics.lineStyle(0, 0, 0);
              _loc1_.var_131.graphics.beginFill(0, 0);
              _loc1_.var_131.graphics.drawRect(0, 0, 1, 1);
              _loc1_.var_131.graphics.drawRect(this.api.var_137 - 1, 0, 1, 1);
            }
          }
          else
          {
            _loc5_.x = _loc1_.var_131.width + _loc1_.var_209;
            if (_loc1_.var_131.width == 0)
            {
              _loc5_.x = 0;
            }
            if (this.data.var_156 && _loc1_.var_154 != null)
            {
              if (_loc3_ == 1)
              {
                _loc5_.x = _loc1_.var_154.x - _loc1_.var_209 - _loc5_.width;
              }
              else if (_loc3_ == 0)
              {
                class_7.error("API ERROR: You must define the Large Button first for a Promo screen.");
              }
              else if (_loc3_ == 2)
              {
                _loc5_.x = _loc1_.var_154.x + _loc1_.var_154.width + _loc1_.var_209;
              }
              else
              {
                class_7.error("API ERROR: Too many extra buttons for a Promo screen.");
                _loc5_.x = 0;
              }
            }
            _loc1_.var_131.addChild(_loc5_);
          }
          _loc3_++;
        }
      }
      _loc1_.var_123.addChild(_loc1_.var_131);
      _loc1_.var_131.x = Math.floor((_loc1_.api.var_137 - _loc1_.var_131.width) / 2);
      if (this.data.var_234)
      {
        _loc7_ = this.data.var_244.split(" ");
        _loc1_.var_129 = _loc1_.api.var_132.method_145(_loc1_.var_273);
        _loc1_.var_151 = _loc1_.api.var_132.method_145(_loc1_.var_320);
        _loc1_.var_129.addEventListener(MouseEvent.CLICK, _loc1_.method_142);
        _loc1_.var_151.addEventListener(MouseEvent.CLICK, _loc1_.method_149);
        if (_loc1_.api.var_173)
        {
          _loc1_.var_129.visible = false;
          _loc1_.var_151.visible = true;
        }
        else
        {
          _loc1_.var_129.visible = true;
          _loc1_.var_151.visible = false;
        }
        if (_loc7_.indexOf("top") > -1)
        {
          _loc1_.var_129.y = 0 - _loc1_.var_145 + _loc1_.var_300;
        }
        else if (_loc7_.indexOf("bottom") > -1)
        {
          _loc1_.var_129.y = _loc1_.api.var_130 - _loc1_.var_140 - _loc1_.var_129.height - _loc1_.var_299;
          if (this.data.var_156)
          {
            _loc1_.var_129.y = _loc1_.var_302;
          }
        }
        if (_loc7_.indexOf("left") > -1)
        {
          _loc1_.var_129.x = _loc1_.var_232;
        }
        else if (_loc7_.indexOf("right") > -1)
        {
          _loc1_.var_129.x = _loc1_.api.var_137 - _loc1_.var_232 - _loc1_.var_129.width;
          if (this.data.var_156)
          {
            _loc1_.var_129.x = _loc1_.api.var_137 - _loc1_.var_306 - _loc1_.var_129.width;
          }
        }
        else if (_loc7_.indexOf("center") > -1)
        {
          _loc1_.var_129.x = (_loc1_.api.var_137 - _loc1_.var_129.width) / 2;
        }
        _loc1_.var_151.x = _loc1_.var_129.x;
        _loc1_.var_151.y = _loc1_.var_129.y;
        if (_loc7_.indexOf("top") > -1)
        {
          _loc1_.var_117.addChild(_loc1_.var_151);
          _loc1_.var_117.addChild(_loc1_.var_129);
        }
        else if (_loc7_.indexOf("bottom") > -1)
        {
          _loc1_.var_123.addChild(_loc1_.var_151);
          _loc1_.var_123.addChild(_loc1_.var_129);
        }
      }
      if (this.data.var_253)
      {
        if (this.data.var_156)
        {
          _loc1_.var_141 = _loc1_.api.var_132.method_91(_loc1_.var_317);
        }
        else
        {
          _loc1_.var_141 = _loc1_.api.var_132.method_91(_loc1_.var_309);
        }
        _loc1_.var_141.buttonMode = true;
        _loc1_.var_141.mouseEnabled = true;
        _loc1_.var_141.mouseChildren = false;
        _loc1_.var_141.useHandCursor = true;
        _loc1_.var_141.addEventListener(MouseEvent.CLICK, _loc1_.method_163);
        _loc1_.var_141.y = _loc1_.var_313;
        _loc1_.var_141.x = (_loc1_.api.var_137 - _loc1_.var_141.width) / 2;
        if (this.data.var_156)
        {
          _loc1_.var_141.y = _loc1_.var_287;
          _loc1_.var_141.x = _loc1_.var_281;
        }
        _loc1_.var_123.addChild(_loc1_.var_141);
      }
      if (this.data.var_245)
      {
        _loc8_ = new TextField();
        _loc8_.embedFonts = true;
        _loc8_.antiAliasType = AntiAliasType.ADVANCED;
        _loc8_.gridFitType = GridFitType.PIXEL;
        _loc8_.wordWrap = false;
        _loc8_.multiline = false;
        _loc8_.defaultTextFormat = _loc1_.method_132();
        _loc8_.text = this.data.var_231;
        _loc8_.mouseEnabled = false;
        _loc8_.tabEnabled = false;
        _loc8_.height = _loc8_.textHeight + 4;
        _loc8_.width = _loc8_.textWidth + 6;
        _loc8_.y = _loc1_.api.var_130 - _loc1_.var_140 - _loc8_.height - _loc1_.var_314;
        _loc8_.x = (_loc1_.api.var_137 - _loc8_.width) / 2;
        _loc1_.var_123.addChild(_loc8_);
      }
      if (this.data.var_250)
      {
        _loc9_ = new TextField();
        _loc9_.embedFonts = true;
        _loc9_.antiAliasType = AntiAliasType.ADVANCED;
        _loc9_.gridFitType = GridFitType.PIXEL;
        _loc9_.wordWrap = false;
        _loc9_.multiline = false;
        _loc9_.defaultTextFormat = _loc1_.method_132();
        _loc9_.text = this.data.var_255;
        _loc9_.mouseEnabled = false;
        _loc9_.tabEnabled = false;
        _loc9_.height = _loc9_.textHeight + 4;
        _loc9_.width = _loc9_.textWidth + 6;
        _loc9_.y = _loc1_.api.var_130 - _loc1_.var_140 - _loc9_.height - _loc1_.var_297;
        _loc9_.x = _loc1_.var_318;
        _loc1_.var_123.addChild(_loc9_);
      }
      if (this.data.var_258)
      {
        if (this.data.var_252 == "small")
        {
          _loc1_.var_121 = _loc1_.api.var_132.method_91(_loc1_.var_262);
        }
        else
        {
          _loc1_.var_121 = _loc1_.api.var_132.method_91(_loc1_.var_263);
        }
        _loc2_ = this.data.var_225.split(" ");
        if (_loc2_.indexOf("top") > -1)
        {
          _loc1_.var_121.y = _loc1_.var_212 - _loc1_.var_145;
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          _loc1_.var_121.y = _loc1_.api.var_130 - _loc1_.var_140 - _loc1_.var_121.height - _loc1_.var_223;
        }
        if (_loc2_.indexOf("left") > -1)
        {
          _loc1_.var_121.x = _loc1_.var_167;
        }
        else if (_loc2_.indexOf("right") > -1)
        {
          _loc1_.var_121.x = _loc1_.api.var_137 - _loc1_.var_121.width - _loc1_.var_167;
        }
        else if (_loc2_.indexOf("center") > -1)
        {
          _loc1_.var_121.x = (_loc1_.api.var_137 - _loc1_.var_121.width) / 2;
        }
        if (this.data.var_171 != null && this.data.var_171 != "")
        {
          _loc1_.var_121.buttonMode = true;
          _loc1_.var_121.mouseEnabled = true;
          _loc1_.var_121.mouseChildren = false;
          _loc1_.var_121.useHandCursor = true;
          _loc1_.var_121.addEventListener(MouseEvent.CLICK, _loc1_.method_165);
        }
        if (this.data.var_251)
        {
          _loc10_ = _loc1_.api.var_132.method_91(_loc1_.var_277);
          _loc10_.y = this.var_121.y - _loc10_.height;
          if (_loc2_.indexOf("left") > -1)
          {
            _loc10_.x = this.var_121.x;
          }
          else if (_loc2_.indexOf("center") > -1)
          {
            _loc10_.x = this.var_121.x + (this.var_121.width - _loc10_.width) / 2;
          }
          else if (_loc2_.indexOf("right") > -1)
          {
            _loc10_.x = this.var_121.x + this.var_121.width - _loc10_.width;
          }
          if (_loc2_.indexOf("top") > -1)
          {
            _loc1_.var_117.addChild(_loc10_);
          }
          else if (_loc2_.indexOf("bottom") > -1)
          {
            _loc1_.var_123.addChild(_loc10_);
          }
        }
        if (_loc2_.indexOf("top") > -1)
        {
          _loc1_.var_117.addChild(_loc1_.var_121);
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          _loc1_.var_123.addChild(_loc1_.var_121);
        }
      }
      if (this.data.var_230)
      {
        if (this.data.var_248 == "small")
        {
          _loc1_.var_125 = _loc1_.api.var_132.method_91(_loc1_.var_290);
        }
        else
        {
          _loc1_.var_125 = _loc1_.api.var_132.method_91(_loc1_.var_319);
        }
        _loc2_ = this.data.var_226.split(" ");
        if (_loc2_.indexOf("top") > -1)
        {
          _loc1_.var_125.y = _loc1_.var_212 - _loc1_.var_145;
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          _loc1_.var_125.y = _loc1_.api.var_130 - _loc1_.var_140 - _loc1_.var_125.height - _loc1_.var_223;
        }
        if (_loc2_.indexOf("left") > -1)
        {
          _loc1_.var_125.x = _loc1_.var_167;
        }
        else if (_loc2_.indexOf("right") > -1)
        {
          _loc1_.var_125.x = _loc1_.api.var_137 - _loc1_.var_125.width - _loc1_.var_167;
        }
        else if (_loc2_.indexOf("center") > -1)
        {
          _loc1_.var_125.x = (_loc1_.api.var_137 - _loc1_.var_125.width) / 2;
        }
        if (this.data.var_168 != null && this.data.var_168 != "")
        {
          _loc1_.var_125.buttonMode = true;
          _loc1_.var_125.mouseEnabled = true;
          _loc1_.var_125.mouseChildren = false;
          _loc1_.var_125.useHandCursor = true;
          _loc1_.var_125.addEventListener(MouseEvent.CLICK, _loc1_.clickSponsorLogo);
        }
        if (this.data.var_243)
        {
          _loc11_ = _loc1_.api.var_132.method_91(_loc1_.var_261);
          _loc11_.y = this.var_125.y - _loc11_.height;
          if (_loc2_.indexOf("left") > -1)
          {
            _loc11_.x = this.var_125.x;
          }
          else if (_loc2_.indexOf("center") > -1)
          {
            _loc11_.x = this.var_125.x + (this.var_125.width - _loc11_.width) / 2;
          }
          else if (_loc2_.indexOf("right") > -1)
          {
            _loc11_.x = this.var_125.x + this.var_125.width - _loc11_.width;
          }
          if (_loc2_.indexOf("top") > -1)
          {
            _loc1_.var_117.addChild(_loc11_);
          }
          else if (_loc2_.indexOf("bottom") > -1)
          {
            _loc1_.var_123.addChild(_loc11_);
          }
        }
        if (_loc2_.indexOf("top") > -1)
        {
          _loc1_.var_117.addChild(_loc1_.var_125);
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          _loc1_.var_123.addChild(_loc1_.var_125);
        }
      }
      if (this.data.var_236)
      {
        if (this.data.var_239 == "small")
        {
          _loc1_.var_133 = _loc1_.api.var_132.method_91(_loc1_.var_285);
        }
        else
        {
          _loc1_.var_133 = _loc1_.api.var_132.method_91(_loc1_.var_286);
        }
        _loc2_ = this.data.var_249.split(" ");
        if (_loc2_.indexOf("top") > -1)
        {
          _loc1_.var_133.y = _loc1_.var_212 - _loc1_.var_145;
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          _loc1_.var_133.y = _loc1_.api.var_130 - _loc1_.var_140 - _loc1_.var_133.height - _loc1_.var_223;
        }
        if (_loc2_.indexOf("left") > -1)
        {
          _loc1_.var_133.x = _loc1_.var_167;
        }
        else if (_loc2_.indexOf("right") > -1)
        {
          _loc1_.var_133.x = _loc1_.api.var_137 - _loc1_.var_133.width - _loc1_.var_167;
        }
        else if (_loc2_.indexOf("center") > -1)
        {
          _loc1_.var_133.x = (_loc1_.api.var_137 - _loc1_.var_133.width) / 2;
        }
        if (this.data.var_169 != null && this.data.var_169 != "")
        {
          _loc1_.var_133.buttonMode = true;
          _loc1_.var_133.mouseEnabled = true;
          _loc1_.var_133.mouseChildren = false;
          _loc1_.var_133.useHandCursor = true;
          _loc1_.var_133.addEventListener(MouseEvent.CLICK, _loc1_.clickLicenseLogo);
        }
        if (_loc2_.indexOf("top") > -1)
        {
          _loc1_.var_117.addChild(_loc1_.var_133);
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          _loc1_.var_123.addChild(_loc1_.var_133);
        }
      }
      if (this.data.var_156 && this.data.var_124 != null)
      {
        if (this.data.var_124.var_183)
        {
          _loc1_.var_136 = _loc1_.api.var_132.method_91(_loc1_.var_269);
        }
        else
        {
          _loc1_.var_136 = _loc1_.api.var_132.method_91(_loc1_.var_264);
        }
        _loc1_.var_136.facebook_btn.addEventListener(MouseEvent.CLICK, _loc1_.method_144);
        _loc1_.var_136.twitter_btn.addEventListener(MouseEvent.CLICK, _loc1_.method_157);
        if (this.data.var_124.var_218 == false)
        {
          _loc1_.var_136.facebook_btn.visible = false;
          _loc1_.var_136.twitter_btn.y = 0;
        }
        if (this.data.var_124.var_221 == false)
        {
          _loc1_.var_136.twitter_btn.visible = false;
        }
        if (this.data.var_124.var_218 == false && this.data.var_124.var_221 == false)
        {
          _loc1_.var_136.inside.x = 0;
        }
        _loc12_ = 0;
        while (_loc12_ < this.data.var_124.var_182.length)
        {
          _loc13_ = _loc1_.var_136.inside["gamepanel" + (_loc12_ + 1)];
          _loc13_.buttonMode = true;
          _loc13_.mouseEnabled = true;
          _loc13_.mouseChildren = false;
          _loc13_.useHandCursor = true;
          _loc13_.addEventListener(MouseEvent.CLICK, _loc1_.method_162);
          _loc12_++;
        }
        _loc1_.var_136.y = _loc1_.var_292;
        _loc1_.var_136.x = Math.floor((_loc1_.api.var_137 - _loc1_.var_136.width) / 2);
        _loc1_.var_123.addChild(_loc1_.var_136);
      }
      if (this.data.var_201 != null && this.data.var_201 != "")
      {
        _loc1_.var_201 = _loc1_.api.var_132.method_219(this.data.var_201, _loc1_.api.var_204, _loc1_.clip, _loc1_.var_254);
      }
      _loc1_.clip.addChild(_loc1_.var_117);
      _loc1_.clip.addChild(_loc1_.var_123);
      // _loc1_.var_117.addEventListener(Event.ENTER_FRAME, _loc1_.method_120);
      _loc1_.var_117.y = _loc1_.var_145;
      _loc1_.var_123.y = _loc1_.var_140;
      //
      _loc1_.api.container.addChild(_loc1_.clip);
    }

    public function startTransitionOut():void
    {
      var _loc1_:class_21 = this;
      _loc1_.var_242 = true;
      _loc1_.disableButtons();
      _loc1_.var_145 = 0 - _loc1_.var_117.height - 5;
      _loc1_.var_140 = this.api.var_130 + 5;
      if (_loc1_.var_233)
      {
        _loc1_.var_140 += (_loc1_.var_247 + _loc1_.var_241) * -1;
      }
      _loc1_.var_117.y = _loc1_.var_145;
      _loc1_.var_123.y = _loc1_.var_140;
    }

    public function method_120(param1:Event):void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc2_:class_21 = this;
      ++_loc2_.var_208;
      if (_loc2_.var_208 > _loc2_.var_291 || _loc2_.var_242)
      {
        _loc3_ = _loc2_.var_145 - _loc2_.var_117.y;
        _loc4_ = _loc2_.var_140 - _loc2_.var_123.y;
        if (Math.abs(_loc3_) > 1)
        {
          _loc2_.var_117.y += _loc3_ / _loc2_.var_246;
        }
        else
        {
          _loc2_.var_117.y = _loc2_.var_145;
        }
        if (Math.abs(_loc4_) > 1)
        {
          _loc2_.var_123.y += _loc4_ / _loc2_.var_246;
        }
        else
        {
          _loc2_.var_123.y = _loc2_.var_140;
        }
        if (_loc2_.var_117.y == _loc2_.var_145 && _loc2_.var_123.y == _loc2_.var_140)
        {
          _loc2_.var_117.removeEventListener(Event.ENTER_FRAME, _loc2_.method_120);
        }
      }
    }

    public function method_165(param1:MouseEvent):void
    {
      var _loc2_:class_21 = this;
      if (Boolean(_loc2_.data.var_171) && _loc2_.data.var_171 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_171, "FliplineLogo", "LogoLinks");
      }
    }

    public function clickSponsorLogo(param1:MouseEvent):void
    {
      var _loc2_:class_21 = this;
      if (Boolean(_loc2_.data.var_168) && _loc2_.data.var_168 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_168, "SponsorLogo", "LogoLinks");
      }
    }

    public function clickLicenseLogo(param1:MouseEvent):void
    {
      var _loc2_:class_21 = this;
      if (Boolean(_loc2_.data.var_169) && _loc2_.data.var_169 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_169, "LicenseLogo", "LogoLinks");
      }
    }

    public function method_163(param1:MouseEvent):void
    {
      var _loc2_:class_21 = this;
      if (Boolean(_loc2_.data.var_187) && _loc2_.data.var_187 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_187, "GetThisGame", "LogoLinks");
      }
    }

    public function method_142(param1:MouseEvent):void
    {
      var _loc2_:class_21 = this;
      _loc2_.api.method_88("ClickMute", "Screens", true);
      _loc2_.api.method_175();
      _loc2_.var_129.visible = false;
      _loc2_.var_151.visible = true;
    }

    public function method_149(param1:MouseEvent):void
    {
      var _loc2_:class_21 = this;
      _loc2_.api.method_88("ClickUnmute", "Screens", true);
      _loc2_.api.method_207();
      _loc2_.var_129.visible = true;
      _loc2_.var_151.visible = false;
    }

    public function method_144(param1:MouseEvent):void
    {
      var _loc3_:String = null;
      var _loc2_:class_21 = this;
      if (Boolean(_loc2_.data.var_124) && Boolean(_loc2_.data.var_124.var_206) && _loc2_.data.var_124.var_206 != "")
      {
        _loc3_ = "PromoFacebook";
        if (_loc2_.data.var_124.var_183)
        {
          _loc3_ = "PromoFacebookLicense";
        }
        // _loc2_.api.method_83(_loc2_.data.var_124.var_206, _loc3_, "PromoLinks");
      }
    }

    public function method_157(param1:MouseEvent):void
    {
      var _loc3_:String = null;
      var _loc2_:class_21 = this;
      if (Boolean(_loc2_.data.var_124) && Boolean(_loc2_.data.var_124.var_199) && _loc2_.data.var_124.var_199 != "")
      {
        _loc3_ = "PromoTwitter";
        if (_loc2_.data.var_124.var_183)
        {
          _loc3_ = "PromoTwitterLicense";
        }
        // _loc2_.api.method_83(_loc2_.data.var_124.var_199, _loc3_, "PromoLinks");
      }
    }

    public function method_162(param1:MouseEvent):void
    {
      var _loc5_:String = null;
      var _loc6_:String = null;
      var _loc2_:class_21 = this;
      var _loc3_:Number = -1;
      var _loc4_:Array = String(param1.currentTarget.name).split("gamepanel");
      if (_loc4_.length > 1)
      {
        _loc3_ = Number(_loc4_[1]);
      }
      if (_loc3_ > -1)
      {
        if (Boolean(_loc2_.data.var_124) && _loc2_.data.var_124.var_182.length >= _loc3_)
        {
          _loc5_ = _loc2_.data.var_124.var_182[_loc3_ - 1];
          _loc6_ = "PromoGameLink";
          if (_loc2_.data.var_124.var_183)
          {
            _loc6_ = "PromoGameLinkLicense";
          }
          if (_loc5_ != null && _loc5_ != "")
          {
            // _loc2_.api.method_83(_loc5_, _loc6_, "PromoLinks");
          }
        }
      }
    }

    public function destroy():void
    {
      var _loc2_:Number = NaN;
      var _loc3_:int = 0;
      var _loc4_:class_11 = null;
      var _loc1_:class_21 = this;
      if (_loc1_.var_201)
      {
        _loc1_.var_201.destroy();
        _loc1_.var_201 = null;
      }
      if (_loc1_.var_136)
      {
        try
        {
          _loc1_.var_136.facebook_btn.removeEventListener(MouseEvent.CLICK, _loc1_.method_144);
          _loc1_.var_136.twitter_btn.removeEventListener(MouseEvent.CLICK, _loc1_.method_157);
        }
        catch (err:Error)
        {
        }
        try
        {
          _loc3_ = 0;
          while (_loc3_ < _loc1_.var_136.inside.numChildren)
          {
            _loc1_.var_136.inside["gamepanel" + (_loc3_ + 1)].removeEventListener(MouseEvent.CLICK, _loc1_.method_162);
            _loc3_++;
          }
        }
        catch (err:Error)
        {
        }
      }
      _loc2_ = 0;
      while (_loc2_ < _loc1_.var_131.numChildren)
      {
        _loc4_ = _loc1_.var_131.getChildAt(_loc2_) as class_11;
        _loc4_.destroy();
        _loc4_ = null;
        _loc2_++;
      }
      if (_loc1_.var_154)
      {
        _loc1_.var_154.destroy();
        _loc1_.var_154 = null;
      }
      if (_loc1_.var_162)
      {
        _loc1_.var_162.destroy();
        _loc1_.var_162 = null;
      }
      if (Boolean(_loc1_.var_121) && _loc1_.var_121.hasEventListener(MouseEvent.CLICK))
      {
        _loc1_.var_121.removeEventListener(MouseEvent.CLICK, _loc1_.method_165);
      }
      if (Boolean(_loc1_.var_125) && _loc1_.var_125.hasEventListener(MouseEvent.CLICK))
      {
        _loc1_.var_125.removeEventListener(MouseEvent.CLICK, _loc1_.clickSponsorLogo);
      }
      if (Boolean(_loc1_.var_133) && _loc1_.var_133.hasEventListener(MouseEvent.CLICK))
      {
        _loc1_.var_133.removeEventListener(MouseEvent.CLICK, _loc1_.clickLicenseLogo);
      }
      if (Boolean(_loc1_.var_129) && _loc1_.var_129.hasEventListener(MouseEvent.CLICK))
      {
        _loc1_.var_129.removeEventListener(MouseEvent.CLICK, _loc1_.method_142);
      }
      if (Boolean(_loc1_.var_151) && _loc1_.var_151.hasEventListener(MouseEvent.CLICK))
      {
        _loc1_.var_151.removeEventListener(MouseEvent.CLICK, _loc1_.method_149);
      }
      if (Boolean(_loc1_.var_141) && _loc1_.var_141.hasEventListener(MouseEvent.CLICK))
      {
        _loc1_.var_141.removeEventListener(MouseEvent.CLICK, _loc1_.method_163);
      }
      _loc1_.api.container.removeChild(_loc1_.clip);
    }

    public function getLabel():String
    {
      var _loc1_:class_21 = this;
      return _loc1_.data.label;
    }

    public function disableButtons(param1:Array = null, param2:Boolean = true, param3:Boolean = true):void
    {
      var _loc6_:class_11 = null;
      var _loc4_:class_21 = this;
      if (Boolean(_loc4_.var_154) && param2)
      {
        _loc4_.var_154.method_114();
      }
      if (Boolean(_loc4_.var_162) && param3)
      {
        _loc4_.var_162.method_114();
      }
      var _loc5_:int = 0;
      while (_loc5_ < _loc4_.var_131.numChildren)
      {
        _loc6_ = _loc4_.var_131.getChildAt(_loc5_) as class_11;
        if (param1 == null || param1.indexOf(_loc6_.getLabel()) > -1)
        {
          _loc6_.method_114();
        }
        _loc5_++;
      }
    }

    public function enableButtons(param1:Array = null):void
    {
      var _loc4_:class_11 = null;
      var _loc2_:class_21 = this;
      if (_loc2_.var_154)
      {
        _loc2_.var_154.method_118();
      }
      if (_loc2_.var_162)
      {
        _loc2_.var_162.method_118();
      }
      var _loc3_:int = 0;
      while (_loc3_ < _loc2_.var_131.numChildren)
      {
        _loc4_ = _loc2_.var_131.getChildAt(_loc3_) as class_11;
        if (param1 == null || param1.indexOf(_loc4_.getLabel()) > -1)
        {
          _loc4_.method_118();
        }
        _loc3_++;
      }
    }

    public function setTitle(param1:String):void
    {
      var _loc2_:class_21 = this;
      _loc2_.var_138.text = param1;
      _loc2_.var_138.height = _loc2_.var_138.textHeight + 4;
    }

    private function method_113():TextFormat
    {
      var _loc2_:TextFormat = new TextFormat();
      _loc2_.font = class_14.const_8;
      _loc2_.color = 11447982;
      _loc2_.size = 30;
      _loc2_.align = TextFormatAlign.CENTER;
      _loc2_.kerning = true;
      _loc2_.letterSpacing = -0.5;
      return _loc2_;
    }

    private function method_132():TextFormat
    {
      var _loc2_:TextFormat = new TextFormat();
      _loc2_.font = class_14.const_19;
      _loc2_.color = class_14.const_22;
      _loc2_.size = class_14.const_11;
      _loc2_.bold = class_14.const_16;
      _loc2_.align = TextFormatAlign.CENTER;
      _loc2_.kerning = true;
      _loc2_.letterSpacing = 0;
      return _loc2_;
    }
  }
}
