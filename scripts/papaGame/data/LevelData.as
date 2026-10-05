package papaGame.data
{
  import flash.external.ExternalInterface;
  import flash.display.*;
  import flash.events.Event;
  import flash.utils.getDefinitionByName;
  import flash.utils.getTimer;
  import package_2.class_7;

  public class LevelData
  {

    private var xml:XML;

    private var encodedBitmapName:String = "levelMasterBitmap";

    private var colorTable:Array = [0, 14089725, 1023142, 16579589, 890871, 896347, 526934, 16158734, 11390496, 509947, 5704204, 10816013, 16189453, 718087, 985590, 5633289, 5831062, 9894494, 8344567, 11730429, 16274960, 6052364, 11229298, 16274563, 11405944, 15733745, 10593032, 762890, 261323, 11271122, 11116967, 16645165, 460550, 783695, 876119, 10704907, 13171970, 678314, 1270008, 723877, 16284664, 6818727, 6070876, 13761149, 8453318, 11048016, 6773415, 678409, 392444, 16226395, 16711031, 5871609, 16385912, 6026832, 7735287, 13748469, 6290682, 12909643, 3275967, 16566277, 16645321, 6071561, 5637469, 13289219, 4179959, 772791, 16448673, 5660506, 16710909, 8506108, 9762569, 16370048, 13761472, 16631548, 9239804, 9096887, 16579917, 16700240, 10981109, 3210749, 16435245, 719762, 16420776, 11008156, 6463143, 11126780, 11782751, 16172225, 13171753, 13171752];

    private var textTable:Array = ["", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "=", "~", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "<", ">", ",", ".", ";", ":", "\'", "\"", "?", "|", "\\", "/", " "];

    private var callbackFunction:Function;

    private var progressBar:MovieClip;

    private var startThreadTime:Number = 0;

    private var latest_i:Number = 0;

    private var latest_j:Number = 0;

    private var target_MS_per_frame:Number = 30;

    private var bmp:BitmapData;

    private var text:String;

    public function LevelData()
    {
      super();
    }

    public function prepareXML(param1:Function, param2:MovieClip):void
    {
      var _loc3_:LevelData = this;
      class_7.method_1("[Prepare XML]");
      var _loc4_:Class = getDefinitionByName(_loc3_.encodedBitmapName) as Class;
      _loc3_.bmp = new _loc4_(0, 0);
      _loc3_.startThreadTime = getTimer();
      _loc3_.callbackFunction = param1;
      _loc3_.progressBar = param2;

      // color -> character. Walk backwards so the first match wins, like indexOf did.
      var lookup:Object = {};
      var k:int = _loc3_.colorTable.length - 1;
      while (k >= 0)
      {
        lookup[_loc3_.colorTable[k]] = k < _loc3_.textTable.length ? _loc3_.textTable[k] : "";
        k--;
      }

      var pixels:Vector.<uint> = _loc3_.bmp.getVector(_loc3_.bmp.rect);
      var parts:Array = [];
      var n:int = pixels.length;
      var i:int = 0;
      while (i < n)
      {
        var c:uint = pixels[i] & 0xFFFFFF;
        if (c in lookup)
        {
          parts.push(lookup[c]);
        }
        i++;
      }
      _loc3_.text = parts.join("");
      _loc3_.bmp.dispose();
      _loc3_.bmp = null;
      _loc3_.progressBar.scaleX = 1;
      _loc3_.progressBar.addEventListener(Event.ENTER_FRAME, _loc3_.finishXML);
    }

    public function finishXML(param1:Event):void
    {
      var _loc2_:LevelData = this;
      _loc2_.progressBar.removeEventListener(Event.ENTER_FRAME, _loc2_.finishXML);
      _loc2_.xml = new XML(_loc2_.text);
      ExternalInterface.call("log", _loc2_.text)
      _loc2_.callbackFunction(null, true);
      class_7.info("Generated Level Data from Bitmap >> " + (getTimer() - _loc2_.startThreadTime) + " ms.");
    }

    private function getCharacter(param1:uint):String
    {
      var _loc2_:LevelData = this;
      var _loc3_:Number = _loc2_.colorTable.indexOf(param1);
      if (_loc3_ == -1)
      {
        return "";
      }
      if (_loc2_.textTable.length > _loc3_)
      {
        return _loc2_.textTable[_loc3_];
      }
      return "";
    }

    public function getLevelXMLList():XMLList
    {
      return this.xml.levels.level;
    }

    public function getWorldXMLList():XMLList
    {
      return this.xml.worlds.world;
    }
  }
}
