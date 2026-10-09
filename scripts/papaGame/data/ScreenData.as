package papaGame.data
{
  import flash.display.*;
  import flash.geom.*;
  import package_4.class_5;
  import papaGame.display.GameDisplay;
  import papaGame.managers.BitmapManager;
  import flash.external.ExternalInterface;

  public dynamic class ScreenData
  {

    public var gameObj:class_5;
    public var tileArray:Array;
    public var eventArray:Array;
    public var doorArray:Array;
    public var startPoint:Array;
    public var enemyArray:Array;
    public var objectArray:Array;
    public var itemArray:Array;
    public var roomID:Number;
    public var whichTileset:Number = 0;
    public var tileBMP:BitmapData;
    public var bgBMP:BitmapData;
    public var bgClip:MovieClip;
    public var objectsInitialized:Boolean = false;
    public var objectTotal:Number = 0;
    public var bgStartX:Number = 0;
    public var bgSpeed:Number = 1;
    public var roomIndex:Number = -1;

    public function ScreenData(param1:class_5, param2:XML = null, param3:Number = 0, param4:Number = -1)
    {
      super();
      this.gameObj = param1;
      var _loc6_:BitmapManager = this.gameObj.bitmapManager;
      this.whichTileset = param3;
      this.objectsInitialized = false;
      this.roomIndex = param4;
      if (param2 != null)
      {
        this.populateData(param2);
      }
    }

    public function populateData(param1:XML):void
    {
      var _loc10_:int = 0;
      var _loc11_:int = 0;
      var _loc12_:int = 0;
      var _loc3_:Array = param1.tileArray.split("|");
      var _loc4_:Array = param1.itemArray.split("|");
      var _loc5_:Array = param1.enemyArray.split("|");
      var _loc6_:Array = param1.objectArray.split("|");
      var _loc7_:Array = param1.eventArray.split("|");
      var _loc8_:Array = param1.doorArray.split("|");
      var _loc9_:Array = param1.startPoint.split(",");
      this.enemyArray = [];
      this.itemArray = [];
      this.tileArray = [];
      this.objectArray = [];
      this.eventArray = [];
      this.doorArray = [];
      this.startPoint = [];
      _loc10_ = 0;
      while (_loc10_ < _loc3_.length)
      {
        this.tileArray[_loc10_] = _loc3_[_loc10_].split(",");
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < _loc4_.length)
      {
        this.itemArray[_loc10_] = _loc4_[_loc10_].split(",");
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < _loc5_.length)
      {
        this.enemyArray[_loc10_] = _loc5_[_loc10_].split(",");
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < _loc6_.length)
      {
        this.objectArray[_loc10_] = _loc6_[_loc10_].split(",");
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < _loc8_.length)
      {
        this.doorArray[_loc10_] = _loc8_[_loc10_].split(",");
        _loc10_++;
      }
      this.startPoint = _loc9_;
      _loc10_ = 0;
      while (_loc10_ < this.tileArray.length)
      {
        _loc11_ = 0;
        while (_loc11_ < this.tileArray[_loc10_].length)
        {
          this.tileArray[_loc10_][_loc11_] = String(this.tileArray[_loc10_][_loc11_]).split("#");
          _loc12_ = 0;
          while (_loc12_ < this.tileArray[_loc10_][_loc11_].length)
          {
            this.tileArray[_loc10_][_loc11_][_loc12_] = Number(this.tileArray[_loc10_][_loc11_][_loc12_]);
            _loc12_++;
          }
          _loc11_++;
        }
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < this.itemArray.length)
      {
        _loc11_ = 0;
        while (_loc11_ < this.itemArray[_loc10_].length)
        {
          this.itemArray[_loc10_][_loc11_] = Number(this.itemArray[_loc10_][_loc11_]);
          _loc11_++;
        }
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < this.enemyArray.length)
      {
        _loc11_ = 0;
        while (_loc11_ < this.enemyArray[_loc10_].length)
        {
          if (_loc11_ < 4)
          {
            this.enemyArray[_loc10_][_loc11_] = Number(this.enemyArray[_loc10_][_loc11_]);
          }
          _loc11_++;
        }
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < this.objectArray.length)
      {
        _loc11_ = 0;
        while (_loc11_ < this.objectArray[_loc10_].length)
        {
          if (_loc11_ < 4)
          {
            this.objectArray[_loc10_][_loc11_] = Number(this.objectArray[_loc10_][_loc11_]);
          }
          _loc11_++;
        }
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < this.doorArray.length)
      {
        _loc11_ = 0;
        while (_loc11_ < this.doorArray[_loc10_].length)
        {
          this.doorArray[_loc10_][_loc11_] = Number(this.doorArray[_loc10_][_loc11_]);
          _loc11_++;
        }
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < this.startPoint.length)
      {
        this.startPoint[_loc10_] = Number(this.startPoint[_loc10_]);
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < _loc7_.length)
      {
        this.eventArray[_loc10_] = _loc7_[_loc10_].split(",");
        if (this.eventArray[_loc10_].length > 0)
        {
          this.eventArray[_loc10_][0] = this.eventArray[_loc10_][0].split(")");
          _loc11_ = 0;
          while (_loc11_ < this.eventArray[_loc10_][0].length)
          {
            this.eventArray[_loc10_][0][_loc11_] = this.eventArray[_loc10_][0][_loc11_].split("-");
            _loc11_++;
          }
          _loc11_ = 0;
          while (_loc11_ < this.eventArray[_loc10_][0].length)
          {
            _loc12_ = 0;
            while (_loc12_ < this.eventArray[_loc10_][0][_loc11_].length)
            {
              this.eventArray[_loc10_][0][_loc11_][_loc12_] = Number(this.eventArray[_loc10_][0][_loc11_][_loc12_]);
              _loc12_++;
            }
            _loc11_++;
          }
        }
        if (this.eventArray[_loc10_].length > 1)
        {
          this.eventArray[_loc10_][1] = this.eventArray[_loc10_][1].split(")");
          _loc11_ = 0;
          while (_loc11_ < this.eventArray[_loc10_][1].length)
          {
            this.eventArray[_loc10_][1][_loc11_] = this.eventArray[_loc10_][1][_loc11_].split("-");
            _loc11_++;
          }
          _loc11_ = 0;
          while (_loc11_ < this.eventArray[_loc10_][1].length)
          {
            _loc12_ = 0;
            while (_loc12_ < this.eventArray[_loc10_][1][_loc11_].length)
            {
              this.eventArray[_loc10_][1][_loc11_][_loc12_] = Number(this.eventArray[_loc10_][1][_loc11_][_loc12_]);
              _loc12_++;
            }
            _loc11_++;
          }
        }
        if (this.eventArray[_loc10_].length > 2)
        {
          this.eventArray[_loc10_][2] = Number(this.eventArray[_loc10_][2]);
        }
        if (this.eventArray[_loc10_].length > 3)
        {
          this.eventArray[_loc10_][3] = Number(this.eventArray[_loc10_][3]);
        }
        if (this.eventArray[_loc10_].length > 4)
        {
          this.eventArray[_loc10_][4] = String(this.eventArray[_loc10_][4]);
        }
        _loc10_++;
      }
      if (param1.itemArray == "")
      {
        this.itemArray = [];
      }
      if (param1.enemyArray == "")
      {
        this.enemyArray = [];
      }
      if (param1.objectArray == "")
      {
        this.objectArray = [];
      }
      if (param1.npcArray == "")
      {
        this.npcArray = [];
      }
      if (param1.eventArray == "")
      {
        this.eventArray = [];
      }
      if (param1.doorArray == "")
      {
        this.doorArray = [];
      }
      this.loadedRoom = true;
      this.roomID = param1.roomID;
    }

    public function createBitmap():void
    {
      var _loc2_:GameDisplay = this.gameObj.var_103;
      var _loc3_:Number = _loc2_.tileWidth * this.tileArray[0].length;
      var _loc4_:Number = _loc2_.tileWidth * this.tileArray.length;
      var _loc5_:Number = 1;
      if (_loc3_ > 2880)
      {
        _loc5_ = Math.ceil(_loc3_ / 2880);
        _loc3_ = _loc2_.tilesWidePerRow * _loc2_.tileWidth;
        _loc4_ = _loc5_ * _loc4_;
      }
      if (this.tileBMP)
      {
        this.tileBMP.dispose();
        this.tileBMP = null;
      }
      this.tileBMP = new BitmapData(_loc3_, _loc4_, true, 16777215);
    }

    public function createBackgroundBitmap(param1:Number, param2:Number):void
    {
      if (this.bgBMP)
      {
        this.bgBMP.dispose();
        this.bgBMP = null;
      }
    }

    public function destroy():void
    {
      this.tileArray = null;
      this.enemyArray = null;
      this.objectArray = null;
      this.itemArray = null;
      this.eventArray = null;
      if (this.tileBMP)
      {
        this.tileBMP.dispose();
        this.tileBMP = null;
      }
      if (this.bgBMP)
      {
        this.bgBMP.dispose();
        this.bgBMP = null;
      }
    }

    public function clearBitmaps():void
    {
      if (this.tileBMP)
      {
        this.tileBMP.dispose();
        this.tileBMP = null;
      }
      if (this.bgBMP)
      {
        this.bgBMP.dispose();
        this.bgBMP = null;
      }
    }

    public function checkForDoorID(param1:Number, param2:Number):Number
    {
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:Number = NaN;
      var _loc8_:Number = NaN;
      var _loc4_:Number = -1;
      var _loc9_:int = 0;
      while (_loc9_ < this.doorArray.length)
      {
        if (param1 >= this.doorArray[_loc9_][0] && param1 < this.doorArray[_loc9_][0] + this.doorArray[_loc9_][2] && param2 >= this.doorArray[_loc9_][1] && param2 < this.doorArray[_loc9_][1] + this.doorArray[_loc9_][3])
        {
          _loc4_ = _loc9_;
          break;
        }
        _loc9_++;
      }
      return _loc4_;
    }

    public function updateItems(param1:Array):void
    {
      this.itemArray = null;
      this.itemArray = param1.concat();
    }

    public function saveObjectState(param1:Number, param2:Array, param3:Boolean = false):void
    {
      if (param3 || !param3 && this.objectArray.length > param1)
      {
        this.objectArray[param1] = param2.concat();
      }
    }

    public function saveEnemyState(param1:Number, param2:Array):void
    {
      this.enemyArray[param1] = param2.concat();
    }
  }
}
