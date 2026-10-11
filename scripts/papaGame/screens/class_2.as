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
    public var maxSpeed:Number = 10000;
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
      this.container = param1;
      this.completeFunction = param2;
      class_4.method_50(this.container.loaderInfo, "papalouie2", "2.1", 700, 416, this.container);
      // class_4.method_30(class_4.const_5,"http://www.flipline.com/games/papaspastaria/index.html?utm_source=newgame_default&utm_medium=papalouie2&utm_campaign=papaspastaria");
      // class_4.method_30(class_4.const_4,"https://itunes.apple.com/app/id600626116?ls=1&mt=8");
      // class_4.method_30(class_4.const_6,"http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8");
      if (class_3.method_32())
      {
        this.setupScreen();
      }
      else
      {
        class_4.method_58(this.container, this.setupScreen);
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
      this.clip = new loadingMC();
      this.container.addChild(this.clip);
      this.clip.gotoAndStop(28);
      this.clip.addEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.clip.loader_bar.percent_txt.text = "0%";
      this.playButton = new MovieClip();
      this.playButton.x = 252;
      this.playButton.y = 379;
      this.clip.addChild(this.playButton);
      this.playButton.visible = false;
      this.playButton.addEventListener("clickPlayBtn", this.clickPlayButton);
      if (class_3.method_53())
      {
        this.shouldAutoPlay = this.var_101;
      }
      else if (class_3.method_47())
      {
        this.shouldAutoPlay = this.licenseAutoPlay;
      }
      else
      {
        this.shouldAutoPlay = this.var_102;
      }
      if (class_3.method_32() == false)
      {
        class_4.method_39();
      }
    }

    public function showPlayButton():void
    {
      if (!this.var_97)
      {
        this.var_97 = true;
        if (this.shouldAutoPlay)
        {
          if (this.completeFunction != null)
          {
            this.completeFunction();
          }
        }
        else
        {
          this.playButton.visible = true;
        }
      }
    }

    public function clickPlayButton(param1:Event = null):void
    {
      if (this.completeFunction != null)
      {
        this.completeFunction();
      }
    }

    public function method_71(param1:Event = null):void
    {
      this.setupScreen();
    }

    public function updateScreen(param1:Event):void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      if (this.clip.currentFrame == 28)
      {
        _loc3_ = this.getMainLoaderInfo().bytesLoaded / this.getMainLoaderInfo().bytesTotal;
        _loc4_ = (this.clip.loader_bar.x - this.var_67) / this.var_38;
        _loc5_ = 0;
        if (_loc3_ * this.var_38 - _loc4_ * this.var_38 <= this.maxSpeed)
        {
          this.clip.loader_bar.x = this.var_67 + _loc3_ * this.var_38;
          _loc5_ = _loc3_;
        }
        else
        {
          this.clip.loader_bar.x += this.maxSpeed;
          _loc5_ = (this.clip.loader_bar.x - this.var_67) / this.var_38;
        }
        this.clip.loader_bar.percent_txt.text = String(Math.round(_loc5_ * 100)) + "%";
        if (this.clip.loader_bar.x >= this.var_67 + this.var_38)
        {
          this.clip.loader_bar.x = 2000;
          this.var_97 = true;
          this.clip.visible = false;
          this.completeFunction();
        }
      }
      else if (this.clip.currentFrame == this.clip.totalFrames)
      {
        if (!this.var_97)
        {
          this.var_97 = true;
          this.clip.visible = false;
          this.completeFunction();
        }
      }
    }

    public function destroy():void
    {
      this.playButton.removeEventListener("clickPlayBtn", this.clickPlayButton);
      this.playButton = null;
      this.clip.removeEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.container.removeChild(this.clip);
      this.clip = null;
    }
  }
}
