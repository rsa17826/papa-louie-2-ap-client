package
{
  import flash.display.DisplayObject;
  import flash.display.MovieClip;
  import flash.events.Event;
  import flash.events.IOErrorEvent;
  import flash.utils.getDefinitionByName;
  import package_1.class_1;
  import papaGame.screens.class_2;
  import package_3.class_4;
  import flash.system.ApplicationDomain;
  import Main;
  import main;

  public dynamic class Preloader extends MovieClip
  {
    private var framesWaited:int = 0;

    private var loadingScreen:class_2;

    public function Preloader()
    {
      super();
      stop();
      this.addEventListener(Event.ENTER_FRAME, this.initPreloader);
    }

    private function initPreloader(param1:Event):void
    {
      this.removeEventListener(Event.ENTER_FRAME, this.initPreloader);
      class_1.init(loaderInfo);
      loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioError);
      stop();
      class_4.method_50(loaderInfo, "papalouie2", "2.1", 700, 416, this);
      this.addEventListener(Event.ENTER_FRAME, this.gotoGame);
    }

    private function gotoGame(param1:Event):void
    {
      this.removeEventListener(Event.ENTER_FRAME, this.gotoGame);
      this.loadingFinished();
    }

    private function ioError(param1:IOErrorEvent):void
    {
      trace(param1.text);
    }

    private function loadingFinished():void
    {
      loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioError);
      gotoAndStop(2);
      this.addEventListener(Event.ENTER_FRAME, this.waitForMain);
    }

    private function waitForMain(param1:Event):void
    {
      if (!ApplicationDomain.currentDomain.hasDefinition("Main"))
      {
        gotoAndStop(2);
        if (++this.framesWaited > 60)
        {
          throw new Error("Main still not defined after " + this.framesWaited + " frames; currentFrame=" + currentFrame + " framesLoaded=" + framesLoaded + " totalFrames=" + totalFrames);
        }
        return;
      }
      this.removeEventListener(Event.ENTER_FRAME, this.waitForMain);
      this.startup();
    }

    private function startup():void
    {
      var _loc1_:Class = getDefinitionByName("Main") as Class;
      addChild(new _loc1_() as DisplayObject);
      if (this.loadingScreen)
      {
        this.loadingScreen.destroy();
        this.loadingScreen = null;
      }
    }
  }
}
