package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import mochi.as3.*;
  import package_2.class_3;
  import package_3.class_4;

  public dynamic class class_2
  {

    public var container:MovieClip;

    public var clip:MovieClip;

    public var maxSpeed:Number = 60;

    public var var_67:Number = 10;

    public var var_38:Number = 604;

    public var licenseAutoPlay:Boolean = true;

    public var var_101:Boolean = true;

    public var var_102:Boolean = true;

    public var shouldAutoPlay:Boolean = false;

    public var playButton:MovieClip;

    public var var_97:Boolean = false;

    public var completeFunction:Function = null;

    public function class_2(param1:MovieClip, param2:Function)
    {
      super();
      var _loc3_:class_2 = this;
      _loc3_.container = param1;
      _loc3_.completeFunction = param2;
      class_4.method_50(_loc3_.container.loaderInfo, "papalouie2", "2.1", 700, 416, _loc3_.container);
      // class_4.method_30(class_4.const_5,"http://www.flipline.com/games/papaspastaria/index.html?utm_source=newgame_default&utm_medium=papalouie2&utm_campaign=papaspastaria");
      // class_4.method_30(class_4.const_4,"https://itunes.apple.com/app/id600626116?ls=1&mt=8");
      // class_4.method_30(class_4.const_6,"http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8");
      if (class_3.method_32())
      {
        _loc3_.setupScreen();
      }
      else
      {
        class_4.method_58(_loc3_.container, _loc3_.setupScreen);
      }
    }

    public function method_69():void
    {
    }

    private function getMainLoaderInfo():LoaderInfo
    {
      return this.container.loaderInfo;
    }

    public function method_70(param1:Event = null):void
    {
    }

    public function method_76(param1:Event = null):void
    {
    }

    public function setupScreen(param1:Event = null):void
    {
      var _loc2_:class_2 = this;
      _loc2_.clip = new loadingMC();
      _loc2_.container.addChild(_loc2_.clip);
      _loc2_.clip.addEventListener(Event.ENTER_FRAME, _loc2_.updateScreen);
      _loc2_.clip.loader_bar.percent_txt.text = "0%";
      _loc2_.playButton = new MovieClip();
      _loc2_.playButton.x = 252;
      _loc2_.playButton.y = 379;
      _loc2_.clip.addChild(_loc2_.playButton);
      _loc2_.playButton.visible = false;
      _loc2_.playButton.addEventListener("clickPlayBtn", _loc2_.clickPlayButton);
      if (class_3.method_53())
      {
        _loc2_.shouldAutoPlay = this.var_101;
      }
      else if (class_3.method_47())
      {
        _loc2_.shouldAutoPlay = this.licenseAutoPlay;
      }
      else
      {
        _loc2_.shouldAutoPlay = this.var_102;
      }
      if (class_3.method_32() == false)
      {
        class_4.method_39();
      }
    }

    public function showPlayButton():void
    {
      var _loc1_:class_2 = this;
      if (!_loc1_.var_97)
      {
        _loc1_.var_97 = true;
        if (_loc1_.shouldAutoPlay)
        {
          if (_loc1_.completeFunction != null)
          {
            _loc1_.completeFunction();
          }
        }
        else
        {
          _loc1_.playButton.visible = true;
        }
      }
    }

    public function clickPlayButton(param1:Event = null):void
    {
      var _loc2_:class_2 = this;
      if (_loc2_.completeFunction != null)
      {
        _loc2_.completeFunction();
      }
    }

    public function method_71(param1:Event = null):void
    {
      var _loc2_:class_2 = this;
      _loc2_.setupScreen();
    }

    public function updateScreen(param1:Event):void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc2_:class_2 = this;
      if (_loc2_.clip.currentFrame == 28)
      {
        _loc3_ = _loc2_.getMainLoaderInfo().bytesLoaded / _loc2_.getMainLoaderInfo().bytesTotal;
        _loc4_ = (_loc2_.clip.loader_bar.x - _loc2_.var_67) / _loc2_.var_38;
        _loc5_ = 0;
        if (_loc3_ * _loc2_.var_38 - _loc4_ * _loc2_.var_38 <= _loc2_.maxSpeed)
        {
          _loc2_.clip.loader_bar.x = _loc2_.var_67 + _loc3_ * _loc2_.var_38;
          _loc5_ = _loc3_;
        }
        else
        {
          _loc2_.clip.loader_bar.x += _loc2_.maxSpeed;
          _loc5_ = (_loc2_.clip.loader_bar.x - _loc2_.var_67) / _loc2_.var_38;
        }
        _loc2_.clip.loader_bar.percent_txt.text = String(Math.round(_loc5_ * 100)) + "%";
        if (_loc2_.clip.loader_bar.x >= _loc2_.var_67 + _loc2_.var_38)
        {
          _loc2_.clip.loader_bar.x = 2000;
          _loc2_.clip.gotoAndPlay("animout");
        }
      }
      else if (_loc2_.clip.currentFrame == _loc2_.clip.totalFrames)
      {
        _loc2_.showPlayButton();
      }
    }

    public function destroy():void
    {
      var _loc1_:class_2 = this;
      // _loc1_.playButton.removeEventListener("clickPlayBtn", _loc1_.clickPlayButton);
      _loc1_.clickPlayButton();
      _loc1_.playButton = null;
      _loc1_.clip.removeEventListener(Event.ENTER_FRAME, _loc1_.updateScreen);
      _loc1_.container.removeChild(_loc1_.clip);
      _loc1_.clip = null;
    }
  }
}
