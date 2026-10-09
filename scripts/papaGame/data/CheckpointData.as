package papaGame.data
{
  import flash.external.ExternalInterface;
  import package_2.class_12;
  import package_2.class_7;
  import package_4.class_5;
  import papaGame.data.CustomerData;

  public class CheckpointData
  {

    public var whichLevel:Number = -1;
    public var startingRoomIndex:Number = -1;
    public var screenDataArray:Array;
    public var startingRoomXtile:Number = -1;
    public var startingRoomYtile:Number = -1;
    public var save_gotHurt:Boolean = false;
    public var save_fellInWater:Boolean = false;
    public var save_killsTally:Number = 0;
    public var save_skillUsed:Boolean = false;
    public var save_isCoinsDeadly:Boolean = false;
    public var save_livesLost:Number = 0;
    public var save_gameplayTimer:Number = 0;
    public var challenge1_tally:Number = -1;
    public var challenge2_tally:Number = -1;
    public var challenge3_tally:Number = -1;
    public var challenge4_tally:Number = -1;
    public var challenge5_tally:Number = -1;
    public var challenge6_tally:Number = -1;
    public var money_tally:Number = -1;
    public var burgerzillas_tally:Number = -1;
    public var specialitems_tally:Number = -1;

    public function CheckpointData(param1:class_5, param2:Number, param3:Number, param4:Array, param5:Number = -1, param6:Number = -1)
    {
      var ob:CheckpointData;
      var i:int;
      var gameObj:class_5 = param1;
      var whichLevel:Number = param2;
      var startingRoomIndex:Number = param3;
      var screenDataArray:Array = param4;
      var startingRoomXtile:Number = param5;
      var startingRoomYtile:Number = param6;
      this.screenDataArray = [];
      super();
      ob = this;
      ob.whichLevel = whichLevel;
      ob.startingRoomIndex = startingRoomIndex;
      ob.startingRoomXtile = startingRoomXtile;
      ob.startingRoomYtile = startingRoomYtile;
      gameObj.var_111.saveObjectsAtCheckpoint();
      gameObj.var_120.saveItemsAtCheckpoint();
      ob.screenDataArray = [];
      i = 0;
      while (i < screenDataArray.length)
      {
        ob.screenDataArray.push(ob.duplicateScreenData(screenDataArray[i]));
        i++;
      }
      try
      {
        ob.screenDataArray[ob.startingRoomIndex].startPoint[1] = ob.startingRoomXtile;
        ob.screenDataArray[ob.startingRoomIndex].startPoint[2] = ob.startingRoomYtile;
        class_7.method_1("(Set startpoint to checkpoint coords)");
      }
      catch (err:Error)
      {
        class_7.error("Error setting the starting room\'s startpoint to the checkpoint coords.");
      }
      ob.save_gotHurt = gameObj.var_106.gotHurt;
      // ANCHOR save custom data to cp
      var skillType = gameObj.var_113.getCustomerData(gameObj.var_106.selectedCharacter).skillType;
      ExternalInterface.call("warn", "gameObj.var_106.skillUsed || skillType != CustomerData.SKILL_NONE", gameObj.var_106.skillUsed, skillType != CustomerData.SKILL_NONE);
      ob.save_skillUsed = gameObj.var_106.skillUsed || skillType != CustomerData.SKILL_NONE;
      ob.save_isCoinsDeadly = gameObj.var_106.isCoinsDeadly;
      ob.save_fellInWater = gameObj.var_106.fellInWater;
      ob.save_killsTally = gameObj.var_106.killsTally;
      ob.save_livesLost = gameObj.var_106.livesLost.value;
      ob.save_gameplayTimer = gameObj.var_108.gameplayTimer;
      ob.challenge1_tally = gameObj.var_112.getChallengeTallyForCheckpoint(whichLevel, 1);
      ob.challenge2_tally = gameObj.var_112.getChallengeTallyForCheckpoint(whichLevel, 2);
      ob.challenge3_tally = gameObj.var_112.getChallengeTallyForCheckpoint(whichLevel, 3);
      ob.challenge4_tally = gameObj.var_112.getChallengeTallyForCheckpoint(whichLevel, 4);
      ob.challenge5_tally = gameObj.var_112.getChallengeTallyForCheckpoint(whichLevel, 5);
      ob.challenge6_tally = gameObj.var_112.getChallengeTallyForCheckpoint(whichLevel, 6);
      ob.money_tally = gameObj.var_106.money.value;
      ob.burgerzillas_tally = gameObj.var_106.burgerzillas.value;
      ob.specialitems_tally = gameObj.var_106.specialitems.value;
      class_7.method_1("New Checkpoint Data created (World " + (whichLevel + 1) + ", Checkpoint Room " + startingRoomIndex + " (at " + startingRoomXtile + "," + startingRoomYtile + "), " + screenDataArray.length + " room states saved)");
    }

    public function duplicateScreenData(param1:ScreenData):ScreenData
    {
      var _loc3_:ScreenData = new ScreenData(param1.gameObj, null, param1.whichTileset, param1.roomIndex);
      _loc3_.tileArray = class_12.method_90(param1.tileArray);
      _loc3_.eventArray = class_12.method_90(param1.eventArray);
      _loc3_.doorArray = class_12.method_90(param1.doorArray);
      _loc3_.startPoint = class_12.method_90(param1.startPoint);
      _loc3_.enemyArray = class_12.method_90(param1.enemyArray);
      _loc3_.objectArray = class_12.method_90(param1.objectArray);
      _loc3_.itemArray = class_12.method_90(param1.itemArray);
      _loc3_.roomID = param1.roomID;
      _loc3_.objectsInitialized = false;
      return _loc3_;
    }

    public function destroy():void
    {
      var _loc2_:int = 0;
      while (_loc2_ < this.screenDataArray.length)
      {
        this.screenDataArray[_loc2_].destroy();
        this.screenDataArray[_loc2_] = null;
        _loc2_++;
      }
      this.screenDataArray = null;
      this.screenDataArray = [];
    }

    public function getScreenDataArray():Array
    {
      var _loc2_:Array = [];
      var _loc3_:int = 0;
      while (_loc3_ < this.screenDataArray.length)
      {
        _loc2_.push(this.duplicateScreenData(this.screenDataArray[_loc3_]));
        _loc3_++;
      }
      return _loc2_;
    }

    public function getStartingRoomIndex():Number
    {
      return this.startingRoomIndex;
    }

    public function getCheckpointLevel():Number
    {
      return this.whichLevel;
    }
  }
}
