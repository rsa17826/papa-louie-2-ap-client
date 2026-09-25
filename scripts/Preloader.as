package
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.utils.getDefinitionByName;
   import package_1.class_1;
   import papaGame.screens.class_2;

   public dynamic class Preloader extends MovieClip
   {

      private var loadingScreen:class_2;

      public function Preloader()
      {
         super();
         stop();
         this.addEventListener(Event.ENTER_FRAME,this.initPreloader);
      }

      private function initPreloader(param1:Event) : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.initPreloader);
         class_1.init(loaderInfo);
         loaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         stop();
         this.graphics.beginFill(0);
         this.graphics.drawRect(0,0,1024,768);
         this.graphics.endFill();
         this.loadingScreen = new class_2(this,this.loadingFinished);
      }

      private function ioError(param1:IOErrorEvent) : void
      {
         trace(param1.text);
      }

      private function loadingFinished() : void
      {
         gotoAndStop(2);
         loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this.startup();
      }

      private function startup() : void
      {
         var _loc1_:Class = getDefinitionByName("Main") as Class;
         addChild(new _loc1_() as DisplayObject);
         if(this.loadingScreen)
         {
            this.loadingScreen.destroy();
            this.loadingScreen = null;
         }
      }
   }
}

