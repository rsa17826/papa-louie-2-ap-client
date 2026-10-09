package
{
  import flash.display.DisplayObject;
  import flash.display.MovieClip;
  import flash.external.ExternalInterface;
  import flash.utils.getTimer;
  import flash.events.Event;
  import flash.events.IOErrorEvent;
  import flash.utils.getDefinitionByName;
  import package_1.class_1;
  import papaGame.screens.class_2;
  import package_3.class_4;
  import flash.system.ApplicationDomain;
  import flash.events.ProgressEvent;
  public dynamic class Preloader extends MovieClip
  {
    private var framesWaited:int = 0;

    public function Preloader()
    {
      super();
      var self:Preloader = this;
      loaderInfo.addEventListener(ProgressEvent.PROGRESS, function(e:ProgressEvent):void
        {
          ExternalInterface.call("log", "bytes " + e.bytesLoaded + "/" + e.bytesTotal + " @ " + getTimer());
        });
      loaderInfo.addEventListener(Event.COMPLETE, function(e:Event):void
        {
          ExternalInterface.call("log", "complete @ " + getTimer());
          self.waitForMain(e);
        });
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
      this.addEventListener(Event.ENTER_FRAME, this.waitForMain);
    }

    private function waitForMain(e:Event):void
    {
      if (framesLoaded < totalFrames)
        return; // still downloading
      this.removeEventListener(Event.ENTER_FRAME, this.waitForMain);
      gotoAndStop(2);
      this.startup();
    }

    private function startup():void
    {
      var _loc1_:Class = getDefinitionByName("Main") as Class;
      addChild(new _loc1_() as DisplayObject);
    }
  }
}
