package package_3
{
  import flash.external.ExternalInterface;
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
    // private var rowExtra:MovieClip;
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
      this.clip = new MovieClip();
      this.var_117 = this.api.var_132.method_91(this.var_296);
      this.var_123 = this.api.var_132.method_91(this.var_275);
      if (this.data.var_219)
      {
        this.var_145 = 0 - (this.var_117.height - this.var_316);
        this.var_140 = this.api.var_130 - this.var_272;
        this.var_117.y = 0 - this.var_117.height + this.api.var_130 / 2 - 30;
        this.var_123.y = this.api.var_130 - this.api.var_130 / 2 + 30;
      }
      else if (this.data.var_156)
      {
        this.var_145 = 0 - (this.var_117.height - this.var_268);
        this.var_140 = this.api.var_130 - this.var_301;
        this.var_117.y = 0 - this.var_117.height + this.api.var_130 / 2 - 30;
        this.var_123.y = this.api.var_130 - this.api.var_130 / 2 + 30;
      }
      else if (this.data.var_207)
      {
        this.var_145 = 0 - (this.var_117.height - this.var_307);
        this.var_140 = this.api.var_130 - this.var_293;
        this.var_117.y = 0 - this.var_117.height;
        this.var_123.y = this.api.var_130;
      }
      else if (this.data.var_220)
      {
        this.var_145 = 0 - (this.var_117.height - this.var_312);
        this.var_140 = this.api.var_130 - this.var_308;
        this.var_117.y = 0 - this.var_117.height;
        this.var_123.y = this.api.var_130;
      }
      else
      {
        this.var_145 = 0 - (this.var_117.height - this.var_274);
        this.var_140 = this.api.var_130 - this.var_289;
        this.var_117.y = 0 - this.var_117.height;
        this.var_123.y = this.api.var_130;
      }
      this.var_138 = new TextField();
      this.var_138.embedFonts = true;
      this.var_138.antiAliasType = AntiAliasType.ADVANCED;
      this.var_138.gridFitType = GridFitType.SUBPIXEL;
      this.var_138.wordWrap = false;
      this.var_138.multiline = false;
      this.var_138.defaultTextFormat = this.method_113();
      this.var_138.text = "";
      this.var_138.mouseEnabled = false;
      this.var_138.y = 0 - this.var_145 + this.var_311;
      if (this.data.var_256)
      {
        this.var_138.text = this.data.var_260;
      }
      this.var_138.height = this.var_138.textHeight + 4;
      this.var_138.width = this.api.var_137;
      this.var_117.addChild(this.var_138);
      // // new row of buttons below var_138
      // this.rowExtra = new MovieClip();
      // this.rowExtra.y = this.var_138.y + this.var_138.height + 8; // 8px gap, tweak to taste

      // var extraButtons:Array = [new class_16("zz", "small", false, false, "button", "clickEventName", "", null, false, false, this.api.var_143, -1)]; // array of button data objects, same shape as data.var_157 entries
      // var cursorX:Number = 0;
      // for (var i:int = 0; i < extraButtons.length; i++)
      // {
      // var btn:class_11 = new class_11(extraButtons[i]);
      // btn.x = cursorX;
      // this.rowExtra.addChild(btn);
      // cursorX += btn.width + this.var_209; // var_209 is the existing horizontal button gap
      // }

      // // center the row, same as var_131 does for the main buttons
      // this.rowExtra.x = Math.floor((this.api.var_137 - this.rowExtra.width) / 2);
      // this.var_117.addChild(this.rowExtra);
      this.var_131 = new MovieClip();
      if (this.data.var_219)
      {
        this.var_131.y = this.var_288;
      }
      else if (this.data.var_156)
      {
        this.var_131.y = this.var_271;
      }
      else
      {
        this.var_131.y = this.var_266;
      }
      if (this.data.var_157.length > 0)
      {
        _loc3_ = 0;
        while (_loc3_ < this.data.var_157.length)
        {
          _loc4_ = this.data.var_157[_loc3_];
          _loc5_ = new class_11(_loc4_);
          if (_loc4_.var_214)
          {
            _loc5_.x = this.var_167;
            _loc5_.y = 0 - this.var_145 + this.var_279;
            this.var_117.addChild(_loc5_);
            this.var_162 = _loc5_;
          }
          else if (_loc4_.size == "large")
          {
            _loc5_.x = Math.floor((this.api.var_137 - _loc5_.width) / 2);
            if (_loc4_.var_195)
            {
              _loc5_.y = this.var_247;
            }
            else if (this.data.var_207 || this.data.var_220)
            {
              _loc5_.y = this.var_267;
            }
            else
            {
              _loc5_.y = this.var_305;
            }
            if (_loc4_.var_195)
            {
              _loc6_ = this.api.var_132.method_91(this.var_270);
              _loc6_.x = _loc5_.x + this.var_284;
              _loc6_.y = _loc5_.y + this.var_241;
              this.var_123.addChild(_loc6_);
              this.var_276 = _loc6_;
              this.var_233 = true;
            }
            this.var_123.addChild(_loc5_);
            this.var_154 = _loc5_;
            if (this.data.var_156)
            {
              this.var_131.graphics.lineStyle(0, 0, 0);
              this.var_131.graphics.beginFill(0, 0);
              this.var_131.graphics.drawRect(0, 0, 1, 1);
              this.var_131.graphics.drawRect(this.api.var_137 - 1, 0, 1, 1);
            }
          }
          else
          {
            _loc5_.x = this.var_131.width + this.var_209;
            if (this.var_131.width == 0)
            {
              _loc5_.x = 0;
            }
            if (this.data.var_156 && this.var_154 != null)
            {
              if (_loc3_ == 1)
              {
                _loc5_.x = this.var_154.x - this.var_209 - _loc5_.width;
              }
              else if (_loc3_ == 0)
              {
                class_7.error("API ERROR: You must define the Large Button first for a Promo screen.");
              }
              else if (_loc3_ == 2)
              {
                _loc5_.x = this.var_154.x + this.var_154.width + this.var_209;
              }
              else
              {
                class_7.error("API ERROR: Too many extra buttons for a Promo screen.");
                _loc5_.x = 0;
              }
            }
            this.var_131.addChild(_loc5_);
          }
          _loc3_++;
        }
      }
      this.var_123.addChild(this.var_131);
      this.var_131.x = Math.floor((this.api.var_137 - this.var_131.width) / 2);
      if (this.data.var_234)
      {
        _loc7_ = this.data.var_244.split(" ");
        this.var_129 = this.api.var_132.method_145(this.var_273);
        this.var_151 = this.api.var_132.method_145(this.var_320);
        this.var_129.addEventListener(MouseEvent.CLICK, this.method_142);
        this.var_151.addEventListener(MouseEvent.CLICK, this.method_149);
        if (this.api.var_173)
        {
          this.var_129.visible = false;
          this.var_151.visible = true;
        }
        else
        {
          this.var_129.visible = true;
          this.var_151.visible = false;
        }
        if (_loc7_.indexOf("top") > -1)
        {
          this.var_129.y = 0 - this.var_145 + this.var_300;
        }
        else if (_loc7_.indexOf("bottom") > -1)
        {
          this.var_129.y = this.api.var_130 - this.var_140 - this.var_129.height - this.var_299;
          if (this.data.var_156)
          {
            this.var_129.y = this.var_302;
          }
        }
        if (_loc7_.indexOf("left") > -1)
        {
          this.var_129.x = this.var_232;
        }
        else if (_loc7_.indexOf("right") > -1)
        {
          this.var_129.x = this.api.var_137 - this.var_232 - this.var_129.width;
          if (this.data.var_156)
          {
            this.var_129.x = this.api.var_137 - this.var_306 - this.var_129.width;
          }
        }
        else if (_loc7_.indexOf("center") > -1)
        {
          this.var_129.x = (this.api.var_137 - this.var_129.width) / 2;
        }
        this.var_151.x = this.var_129.x;
        this.var_151.y = this.var_129.y;
        if (_loc7_.indexOf("top") > -1)
        {
          this.var_117.addChild(this.var_151);
          this.var_117.addChild(this.var_129);
        }
        else if (_loc7_.indexOf("bottom") > -1)
        {
          this.var_123.addChild(this.var_151);
          this.var_123.addChild(this.var_129);
        }
      }
      if (this.data.var_253)
      {
        if (this.data.var_156)
        {
          this.var_141 = this.api.var_132.method_91(this.var_317);
        }
        else
        {
          this.var_141 = this.api.var_132.method_91(this.var_309);
        }
        this.var_141.buttonMode = true;
        this.var_141.mouseEnabled = true;
        this.var_141.mouseChildren = false;
        this.var_141.useHandCursor = true;
        this.var_141.addEventListener(MouseEvent.CLICK, this.method_163);
        this.var_141.y = this.var_313;
        this.var_141.x = (this.api.var_137 - this.var_141.width) / 2;
        if (this.data.var_156)
        {
          this.var_141.y = this.var_287;
          this.var_141.x = this.var_281;
        }
        this.var_123.addChild(this.var_141);
      }
      if (this.data.var_245)
      {
        _loc8_ = new TextField();
        _loc8_.embedFonts = true;
        _loc8_.antiAliasType = AntiAliasType.ADVANCED;
        _loc8_.gridFitType = GridFitType.PIXEL;
        _loc8_.wordWrap = false;
        _loc8_.multiline = false;
        _loc8_.defaultTextFormat = this.method_132();
        _loc8_.text = this.data.var_231;
        _loc8_.mouseEnabled = false;
        _loc8_.tabEnabled = false;
        _loc8_.height = _loc8_.textHeight + 4;
        _loc8_.width = _loc8_.textWidth + 6;
        _loc8_.y = this.api.var_130 - this.var_140 - _loc8_.height - this.var_314;
        _loc8_.x = (this.api.var_137 - _loc8_.width) / 2;

        this.var_123.addChild(_loc8_);
      }
      if (this.data.var_250)
      {
        _loc9_ = new TextField();
        _loc9_.embedFonts = true;
        _loc9_.antiAliasType = AntiAliasType.ADVANCED;
        _loc9_.gridFitType = GridFitType.PIXEL;
        _loc9_.wordWrap = false;
        _loc9_.multiline = false;
        _loc9_.defaultTextFormat = this.method_132();
        _loc9_.text = this.data.var_255;
        _loc9_.mouseEnabled = false;
        _loc9_.tabEnabled = false;
        _loc9_.height = _loc9_.textHeight + 4;
        _loc9_.width = _loc9_.textWidth + 6;
        _loc9_.y = this.api.var_130 - this.var_140 - _loc9_.height - this.var_297;
        _loc9_.x = this.var_318;

        this.var_123.addChild(_loc9_);
      }
      if (this.data.var_258)
      {
        if (this.data.var_252 == "small")
        {
          this.var_121 = this.api.var_132.method_91(this.var_262);
        }
        else
        {
          this.var_121 = this.api.var_132.method_91(this.var_263);
        }
        _loc2_ = this.data.var_225.split(" ");
        if (_loc2_.indexOf("top") > -1)
        {
          this.var_121.y = this.var_212 - this.var_145;
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          this.var_121.y = this.api.var_130 - this.var_140 - this.var_121.height - this.var_223;
        }
        if (_loc2_.indexOf("left") > -1)
        {
          this.var_121.x = this.var_167;
        }
        else if (_loc2_.indexOf("right") > -1)
        {
          this.var_121.x = this.api.var_137 - this.var_121.width - this.var_167;
        }
        else if (_loc2_.indexOf("center") > -1)
        {
          this.var_121.x = (this.api.var_137 - this.var_121.width) / 2;
        }
        if (this.data.var_171 != null && this.data.var_171 != "")
        {
          this.var_121.buttonMode = true;
          this.var_121.mouseEnabled = true;
          this.var_121.mouseChildren = false;
          this.var_121.useHandCursor = true;
          this.var_121.addEventListener(MouseEvent.CLICK, this.method_165);
        }
        if (this.data.var_251)
        {
          _loc10_ = this.api.var_132.method_91(this.var_277);
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

            this.var_117.addChild(_loc10_);
          }
          else if (_loc2_.indexOf("bottom") > -1)
          {

            this.var_123.addChild(_loc10_);
          }
        }
        if (_loc2_.indexOf("top") > -1)
        {

          this.var_117.addChild(this.var_121);
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {

          this.var_123.addChild(this.var_121);
        }
      }
      if (this.data.var_230)
      {
        if (this.data.var_248 == "small")
        {
          this.var_125 = this.api.var_132.method_91(this.var_290);
        }
        else
        {
          this.var_125 = this.api.var_132.method_91(this.var_319);
        }
        _loc2_ = this.data.var_226.split(" ");
        if (_loc2_.indexOf("top") > -1)
        {
          this.var_125.y = this.var_212 - this.var_145;
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          this.var_125.y = this.api.var_130 - this.var_140 - this.var_125.height - this.var_223;
        }
        if (_loc2_.indexOf("left") > -1)
        {
          this.var_125.x = this.var_167;
        }
        else if (_loc2_.indexOf("right") > -1)
        {
          this.var_125.x = this.api.var_137 - this.var_125.width - this.var_167;
        }
        else if (_loc2_.indexOf("center") > -1)
        {
          this.var_125.x = (this.api.var_137 - this.var_125.width) / 2;
        }
        if (this.data.var_168 != null && this.data.var_168 != "")
        {
          this.var_125.buttonMode = true;
          this.var_125.mouseEnabled = true;
          this.var_125.mouseChildren = false;
          this.var_125.useHandCursor = true;
          this.var_125.addEventListener(MouseEvent.CLICK, this.clickSponsorLogo);
        }
        if (this.data.var_243)
        {
          _loc11_ = this.api.var_132.method_91(this.var_261);
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

            this.var_117.addChild(_loc11_);
          }
          else if (_loc2_.indexOf("bottom") > -1)
          {

            this.var_123.addChild(_loc11_);
          }
        }
        if (_loc2_.indexOf("top") > -1)
        {

          this.var_117.addChild(this.var_125);
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {

          this.var_123.addChild(this.var_125);
        }
      }
      if (this.data.var_236)
      {
        if (this.data.var_239 == "small")
        {
          this.var_133 = this.api.var_132.method_91(this.var_285);
        }
        else
        {
          this.var_133 = this.api.var_132.method_91(this.var_286);
        }
        _loc2_ = this.data.var_249.split(" ");
        if (_loc2_.indexOf("top") > -1)
        {
          this.var_133.y = this.var_212 - this.var_145;
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {
          this.var_133.y = this.api.var_130 - this.var_140 - this.var_133.height - this.var_223;
        }
        if (_loc2_.indexOf("left") > -1)
        {
          this.var_133.x = this.var_167;
        }
        else if (_loc2_.indexOf("right") > -1)
        {
          this.var_133.x = this.api.var_137 - this.var_133.width - this.var_167;
        }
        else if (_loc2_.indexOf("center") > -1)
        {
          this.var_133.x = (this.api.var_137 - this.var_133.width) / 2;
        }
        if (this.data.var_169 != null && this.data.var_169 != "")
        {
          this.var_133.buttonMode = true;
          this.var_133.mouseEnabled = true;
          this.var_133.mouseChildren = false;
          this.var_133.useHandCursor = true;
          this.var_133.addEventListener(MouseEvent.CLICK, this.clickLicenseLogo);
        }
        if (_loc2_.indexOf("top") > -1)
        {

          this.var_117.addChild(this.var_133);
        }
        else if (_loc2_.indexOf("bottom") > -1)
        {

          this.var_123.addChild(this.var_133);
        }
      }
      if (this.data.var_156 && this.data.var_124 != null)
      {
        if (this.data.var_124.var_183)
        {
          this.var_136 = this.api.var_132.method_91(this.var_269);
        }
        else
        {
          this.var_136 = this.api.var_132.method_91(this.var_264);
        }
        this.var_136.facebook_btn.addEventListener(MouseEvent.CLICK, this.method_144);
        this.var_136.twitter_btn.addEventListener(MouseEvent.CLICK, this.method_157);
        if (this.data.var_124.var_218 == false)
        {
          this.var_136.facebook_btn.visible = false;
          this.var_136.twitter_btn.y = 0;
        }
        if (this.data.var_124.var_221 == false)
        {
          this.var_136.twitter_btn.visible = false;
        }
        if (this.data.var_124.var_218 == false && this.data.var_124.var_221 == false)
        {
          this.var_136.inside.x = 0;
        }
        _loc12_ = 0;
        while (_loc12_ < this.data.var_124.var_182.length)
        {
          _loc13_ = this.var_136.inside["gamepanel" + (_loc12_ + 1)];
          _loc13_.buttonMode = true;
          _loc13_.mouseEnabled = true;
          _loc13_.mouseChildren = false;
          _loc13_.useHandCursor = true;
          _loc13_.addEventListener(MouseEvent.CLICK, this.method_162);
          _loc12_++;
        }
        this.var_136.y = this.var_292;
        this.var_136.x = Math.floor((this.api.var_137 - this.var_136.width) / 2);

        this.var_123.addChild(this.var_136);
      }
      if (this.data.var_201 != null && this.data.var_201 != "")
      {
        this.var_201 = this.api.var_132.method_219(this.data.var_201, this.api.var_204, this.clip, this.var_254);
      }

      this.clip.addChild(this.var_117);

      this.clip.addChild(this.var_123);
      // _loc1_.var_117.addEventListener(Event.ENTER_FRAME, _loc1_.method_120);
      this.var_117.y = this.var_145;
      this.var_123.y = this.var_140;
      //
      this.api.container.addChild(this.clip);
    }

    public function startTransitionOut():void
    {
      this.var_242 = true;
      this.disableButtons();
      this.var_145 = 0 - this.var_117.height - 5;
      this.var_140 = this.api.var_130 + 5;
      if (this.var_233)
      {
        this.var_140 += (this.var_247 + this.var_241) * -1;
      }
      this.var_117.y = this.var_145;
      this.var_123.y = this.var_140;
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
      if (Boolean(this.data.var_171) && this.data.var_171 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_171, "FliplineLogo", "LogoLinks");
      }
    }

    public function clickSponsorLogo(param1:MouseEvent):void
    {
      if (Boolean(this.data.var_168) && this.data.var_168 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_168, "SponsorLogo", "LogoLinks");
      }
    }

    public function clickLicenseLogo(param1:MouseEvent):void
    {
      if (Boolean(this.data.var_169) && this.data.var_169 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_169, "LicenseLogo", "LogoLinks");
      }
    }

    public function method_163(param1:MouseEvent):void
    {
      if (Boolean(this.data.var_187) && this.data.var_187 != "")
      {
        // _loc2_.api.method_83(_loc2_.data.var_187, "GetThisGame", "LogoLinks");
      }
    }

    public function method_142(param1:MouseEvent):void
    {
      this.api.method_88("ClickMute", "Screens", true);
      this.api.method_175();
      this.var_129.visible = false;
      this.var_151.visible = true;
    }

    public function method_149(param1:MouseEvent):void
    {
      this.api.method_88("ClickUnmute", "Screens", true);
      this.api.method_207();
      this.var_129.visible = true;
      this.var_151.visible = false;
    }

    public function method_144(param1:MouseEvent):void
    {
      var _loc3_:String = null;
      if (Boolean(this.data.var_124) && Boolean(this.data.var_124.var_206) && this.data.var_124.var_206 != "")
      {
        _loc3_ = "PromoFacebook";
        if (this.data.var_124.var_183)
        {
          _loc3_ = "PromoFacebookLicense";
        }
        // _loc2_.api.method_83(_loc2_.data.var_124.var_206, _loc3_, "PromoLinks");
      }
    }

    public function method_157(param1:MouseEvent):void
    {
      var _loc3_:String = null;
      if (Boolean(this.data.var_124) && Boolean(this.data.var_124.var_199) && this.data.var_124.var_199 != "")
      {
        _loc3_ = "PromoTwitter";
        if (this.data.var_124.var_183)
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
      var _loc3_:Number = -1;
      var _loc4_:Array = String(param1.currentTarget.name).split("gamepanel");
      if (_loc4_.length > 1)
      {
        _loc3_ = Number(_loc4_[1]);
      }
      if (_loc3_ > -1)
      {
        if (Boolean(this.data.var_124) && this.data.var_124.var_182.length >= _loc3_)
        {
          _loc5_ = this.data.var_124.var_182[_loc3_ - 1];
          _loc6_ = "PromoGameLink";
          if (this.data.var_124.var_183)
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
      if (this.var_201)
      {
        this.var_201.destroy();
        this.var_201 = null;
      }
      if (this.var_136)
      {
        try
        {
          this.var_136.facebook_btn.removeEventListener(MouseEvent.CLICK, this.method_144);
          this.var_136.twitter_btn.removeEventListener(MouseEvent.CLICK, this.method_157);
        }
        catch (err:Error)
        {
        }
        try
        {
          _loc3_ = 0;
          while (_loc3_ < this.var_136.inside.numChildren)
          {
            this.var_136.inside["gamepanel" + (_loc3_ + 1)].removeEventListener(MouseEvent.CLICK, this.method_162);
            _loc3_++;
          }
        }
        catch (err:Error)
        {
        }
      }
      _loc2_ = 0;
      while (_loc2_ < this.var_131.numChildren)
      {
        _loc4_ = this.var_131.getChildAt(_loc2_) as class_11;
        _loc4_.destroy();
        _loc4_ = null;
        _loc2_++;
      }
      if (this.var_154)
      {
        this.var_154.destroy();
        this.var_154 = null;
      }
      if (this.var_162)
      {
        this.var_162.destroy();
        this.var_162 = null;
      }
      if (Boolean(this.var_121) && this.var_121.hasEventListener(MouseEvent.CLICK))
      {
        this.var_121.removeEventListener(MouseEvent.CLICK, this.method_165);
      }
      if (Boolean(this.var_125) && this.var_125.hasEventListener(MouseEvent.CLICK))
      {
        this.var_125.removeEventListener(MouseEvent.CLICK, this.clickSponsorLogo);
      }
      if (Boolean(this.var_133) && this.var_133.hasEventListener(MouseEvent.CLICK))
      {
        this.var_133.removeEventListener(MouseEvent.CLICK, this.clickLicenseLogo);
      }
      if (Boolean(this.var_129) && this.var_129.hasEventListener(MouseEvent.CLICK))
      {
        this.var_129.removeEventListener(MouseEvent.CLICK, this.method_142);
      }
      if (Boolean(this.var_151) && this.var_151.hasEventListener(MouseEvent.CLICK))
      {
        this.var_151.removeEventListener(MouseEvent.CLICK, this.method_149);
      }
      if (Boolean(this.var_141) && this.var_141.hasEventListener(MouseEvent.CLICK))
      {
        this.var_141.removeEventListener(MouseEvent.CLICK, this.method_163);
      }
      this.api.container.removeChild(this.clip);
    }

    public function getLabel():String
    {
      return this.data.label;
    }

    public function disableButtons(param1:Array = null, param2:Boolean = true, param3:Boolean = true):void
    {
      var _loc6_:class_11 = null;
      if (Boolean(this.var_154) && param2)
      {
        this.var_154.method_114();
      }
      if (Boolean(this.var_162) && param3)
      {
        this.var_162.method_114();
      }
      var _loc5_:int = 0;
      while (_loc5_ < this.var_131.numChildren)
      {
        _loc6_ = this.var_131.getChildAt(_loc5_) as class_11;
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
      if (this.var_154)
      {
        this.var_154.method_118();
      }
      if (this.var_162)
      {
        this.var_162.method_118();
      }
      var _loc3_:int = 0;
      while (_loc3_ < this.var_131.numChildren)
      {
        _loc4_ = this.var_131.getChildAt(_loc3_) as class_11;
        if (param1 == null || param1.indexOf(_loc4_.getLabel()) > -1)
        {
          _loc4_.method_118();
        }
        _loc3_++;
      }
    }

    public function setTitle(param1:String):void
    {
      this.var_138.text = param1;
      this.var_138.height = this.var_138.textHeight + 4;
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
