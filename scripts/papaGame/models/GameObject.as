package papaGame.models
{
  import flash.geom.Rectangle;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.*;
  import papaGame.display.*;
  import papaGame.events.GameControls;
  import papaGame.managers.*;

  public class GameObject extends Character
  {

    public var whichScreen:Number = -1;
    public var screenObjID:Number = -1;
    public var originalScreenIndex:Number = -1;
    public var originalScreenObjectID:Number = -1;
    public var isInteractive:Boolean = true;
    public var isActivated:Boolean = true;
    public var isDeactivated:Boolean = false;
    public var isActivating:Boolean = false;
    public var isDeactivating:Boolean = false;
    public var canReactivate:Boolean = true;
    public var isSolidActive:Boolean = false;
    public var isSolidInactive:Boolean = false;
    public var solidType:String = "none";
    public var solidTilesRect:Rectangle = new Rectangle(0, 0, 2, 2);
    public var isGrabbable:Boolean = false;
    public var isGrabbed:Boolean = false;
    public var isThrowing:Boolean = false;
    public var hasLandedAfterThrown:Boolean = false;
    public var grabWeight:Number = 0;
    public var grabGravity:Number = 2;
    public var thrownByPlayer:Boolean = true;
    public var isGrabbedJumping:Boolean = false;
    public var grabFacing:Number = 1;
    public var isGrabRideable:Boolean = false;
    public var isGrabRiding:Boolean = false;
    public var delayRideableUntilPickup:Boolean = false;
    public var rideablePlayerOffsetX:Number = 0;
    public var rideablePlayerOffsetY:Number = 0;
    public var canJumpFromRideable:Boolean = true;
    public var isPushable:Boolean = false;
    public var isBeingPushed:Boolean = false;
    public var wasDropped:Boolean = false;
    public var dropStartingY:Number = 0;
    public var dropMaxSafeY:Number = 130;
    public var activeCycleFrames:Array = ["active", 1, 1, 0, 0, 0, 0];
    public var inactiveCycleFrames:Array = ["inactive", 1, 1, 0, 3, 3, 3];
    public var activatingCycleFrames:Array = ["activating", 2, 1, 0, -1, [3, 2, 1]];
    public var deactivatingCycleFrames:Array = ["deactivating", 2, 1, 0, -1, [1, 2, 3]];
    public var jigglecam:Boolean = false;
    public var jiggleamount:Number = 10;
    public var jiggleduration:Number = 20;
    public var foreground:Boolean = false;
    public var isPlaced:Boolean = false;
    public var isShootable:Boolean = false;
    public var blocksBullets:Boolean = false;
    public var throwSpeed:Number = 4;
    public var statAttack:Number = 1;
    public var saveState:Boolean = false;
    public var canReact:Boolean = true;
    public var waitActivate:Boolean = false;
    public var waitPanBack:Boolean = false;
    public var waitType:String;
    public var globalStateID:Number;
    public var wasGloballyTriggered:Boolean = false;
    public var currentTriggers:Number = 0;
    public var necessaryTriggers:Number = 1;
    public var tellTriggerArray:Array;
    public var tellTriggerPan:Number;
    public var tellTriggerPanTarget:Number;
    public var fromTriggerArray:Array;
    public var broadcastStyle:Number = 1;
    public var broadcastOff:Boolean = true;
    public var broadcastOn:Boolean = false;
    public var broadcastAmount:Number = 0;
    public var broadcastAmountOn:Number = -1;
    public var broadcastAmountOff:Number = 1;
    public var broadcastReceiptMethod:Number = 2;
    public var canBeShot:Boolean = false;
    public var canBeMeleed:Boolean = false;
    public var canBeBrokenByObjects:Boolean = false;
    public var shotByWeapons:Array = ["all"];
    public var meleedByWeapons:Array = ["all"];
    public var brokenByObjects:Array = ["all"];
    public var canTravelBetweenRooms:Boolean = true;
    public var saveDataAtCheckpoint:Boolean = false;
    public var isTilingObject:Boolean = false;
    public var tilingWidth:Number = 7;
    public var tilingColorFill:uint = 4294901760;
    public var tilingHasCap:Boolean = false;
    public var tilingCapBlitOffsetY:Number = 0;
    public var tilingNoCapBlitOffsetY:Number = 0;
    public var tilingUseColorFill:Boolean = true;
    public var tilingHasBottomCap:Boolean = false;
    public var tilingBottomCapBlitOffsetY:Number = 0;
    public var canFloat:Boolean = false;
    public var isFloating:Boolean = false;
    public var isLadder:Boolean = false;
    public var tilingHeight:Number = 5;
    public var topCapFrame:Number = 0;
    public var tilingFrame:Number = 0;
    public var bottomCapFrame:Number = 0;
    public var initialY:Number = 0;
    public var standingChars:Array = [];
    public var standingCharsLastX:Array = [];
    public var standOffset:Number = 0;
    public var standingWalkSpeed:Number = 7;
    public var isSteppable:Boolean = false;
    public var isSteppableByObjects:Boolean = false;

    public function GameObject(param1:class_5, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Array)
    {
      super(param1);
      this.id = param4;
      this.whichScreen = param5;
      this.screenObjID = param6;
      this.setupParams(param7);
      this.placeObject(param2, param3);
    }

    public function setupParams(param1:Array):void
    {
    }

    public function updateTrainingSign():void
    {
    }

    public function placeObject(param1:Number, param2:Number):void
    {
      var _loc4_:GameDisplay = this.gameObj.var_103;
      this.xtile = param1;
      this.ytile = param2;
      this.x = this.xtile * _loc4_.tileWidth + _loc4_.tileWidth / 2;
      this.y = this.ytile * _loc4_.tileWidth + _loc4_.tileWidth / 2;
      this.initialY = this.y;
      if (!this.isActivated && this.isSolidInactive)
      {
        this.addCollision();
      }
      else if (this.isActivated && this.isSolidActive)
      {
        this.addCollision();
      }
      this.isPlaced = true;
    }

    public function moveCarriedObject(param1:Number, param2:Number, param3:Boolean = false, param4:Number = 1):void
    {
      this.x = param1;
      this.y = param2;
      this.xtile = Math.floor(this.x / this.gameObj.var_103.tileWidth);
      this.ytile = Math.floor(this.y / this.gameObj.var_103.tileWidth);
      this.isGrabbedJumping = param3;
      this.grabFacing = param4;
    }

    public function addCollision():void
    {
      var _loc8_:int = 0;
      var _loc2_:MapManager = this.gameObj.var_114;
      var _loc3_:Number = this.xtile + this.solidTilesRect.x;
      var _loc4_:Number = this.ytile + this.solidTilesRect.y;
      var _loc5_:Number = this.solidTilesRect.width;
      var _loc6_:Number = this.solidTilesRect.height;
      var _loc7_:int = 0;
      while (_loc7_ < _loc6_)
      {
        _loc8_ = 0;
        while (_loc8_ < _loc5_)
        {
          _loc2_.setProperty(_loc3_ + _loc8_, _loc4_ + _loc7_, this.solidType);
          _loc8_++;
        }
        _loc7_++;
      }
    }

    public function removeCollision():void
    {
      var _loc8_:int = 0;
      var _loc2_:MapManager = this.gameObj.var_114;
      var _loc3_:Number = this.xtile + this.solidTilesRect.x;
      var _loc4_:Number = this.ytile + this.solidTilesRect.y;
      var _loc5_:Number = this.solidTilesRect.width;
      var _loc6_:Number = this.solidTilesRect.height;
      var _loc7_:int = 0;
      while (_loc7_ < _loc6_)
      {
        _loc8_ = 0;
        while (_loc8_ < _loc5_)
        {
          _loc2_.unsetProperty(_loc3_ + _loc8_, _loc4_ + _loc7_, this.solidType);
          _loc8_++;
        }
        _loc7_++;
      }
    }

    override public function destroy():void
    {
    }

    public function saveObjectData():void
    {
    }

    override public function grabAnimationCycle():Array
    {
      var _loc2_:Array = null;
      if (this.isActivating)
      {
        _loc2_ = this.activatingCycleFrames;
      }
      else if (this.isDeactivating)
      {
        _loc2_ = this.deactivatingCycleFrames;
      }
      else if (this.isActivated)
      {
        _loc2_ = this.activeCycleFrames;
      }
      else
      {
        _loc2_ = this.inactiveCycleFrames;
      }
      return _loc2_;
    }

    override public function endAnimationCycle():void
    {
      var _loc2_:String = this.cycleName;
      if (_loc2_.indexOf("deactivating") > -1)
      {
        this.finishDeactivatingObject();
      }
      else if (_loc2_.indexOf("activating") > -1)
      {
        this.finishActivatingObject();
      }
    }

    public function activateObject():void
    {
      if (!this.isActivating)
      {
        this.isActivating = true;
        this.isDeactivating = false;
        this.isDeactivated = false;
      }
    }

    public function deactivateObject():void
    {
      if (!this.isDeactivating)
      {
        this.isDeactivating = true;
        this.isActivating = false;
        this.isActivated = false;
      }
    }

    public function finishActivatingObject():void
    {
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc2_:GameCam = this.gameObj.var_119;
      var _loc3_:GameControls = this.gameObj.var_108;
      this.isActivating = false;
      this.isActivated = true;
      this.isDeactivated = false;
      this.isDeactivating = false;
      if (this.isSolidActive && !this.isSolidInactive)
      {
        this.addCollision();
      }
      else if (!this.isSolidActive && this.isSolidInactive)
      {
        this.removeCollision();
      }
      if (this.waitPanBack)
      {
        _loc4_ = _loc2_.prepanx;
        _loc5_ = _loc2_.prepany;
        _loc3_.setCameraPan(_loc4_, _loc5_, "player", this.screenObjID);
        this.waitPanBack = false;
      }
      if (this.jigglecam)
      {
        _loc2_.setCameraJiggle(this.jiggleamount, this.jiggleduration);
      }
      if (this.broadcastAmount == 0)
      {
        this.broadcastAmount = this.broadcastAmountOn;
      }
      if (this.broadcastOn)
      {
        this.broadcastTriggered(this.broadcastAmount);
      }
      else
      {
        this.allowReactions();
      }
      this.broadcastAmount = 0;
      if (this.saveState)
      {
        this.saveObjectData();
      }
    }

    public function finishDeactivatingObject():void
    {
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc2_:GameCam = this.gameObj.var_119;
      var _loc3_:GameControls = this.gameObj.var_108;
      this.isDeactivating = false;
      this.isDeactivated = true;
      this.isActivated = false;
      this.isActivating = false;
      if (!this.isSolidInactive && this.isSolidActive)
      {
        this.removeCollision();
      }
      else if (this.isSolidInactive && !this.isSolidActive)
      {
        this.addCollision();
      }
      if (this.waitPanBack)
      {
        _loc4_ = _loc2_.prepanx;
        _loc5_ = _loc2_.prepany;
        _loc3_.setCameraPan(_loc4_, _loc5_, "player", this.screenObjID);
        this.waitPanBack = false;
      }
      if (this.jigglecam)
      {
        _loc2_.setCameraJiggle(this.jiggleamount, this.jiggleduration);
      }
      if (this.broadcastAmount == 0)
      {
        this.broadcastAmount = this.broadcastAmountOff;
      }
      if (this.broadcastOff)
      {
        this.broadcastTriggered(this.broadcastAmount);
      }
      else
      {
        this.allowReactions();
      }
      this.broadcastAmount = 0;
      if (this.saveState)
      {
        this.saveObjectData();
      }
    }

    public function broadcastTriggered(param1:Number, param2:Boolean = false):void
    {
      var _loc5_:int = 0;
      var _loc6_:Number = NaN;
      var _loc7_:Number = NaN;
      var _loc8_:Boolean = false;
      var _loc4_:class_5 = this.gameObj;
      if (this.tellTriggerArray)
      {
        _loc5_ = 0;
        while (_loc5_ < this.tellTriggerArray.length)
        {
          _loc6_ = Number(this.tellTriggerArray[_loc5_][0]);
          _loc7_ = Number(this.tellTriggerArray[_loc5_][1]);
          _loc8_ = false;
          // if (Boolean(this.tellTriggerPan) && this.tellTriggerPanTarget == _loc5_ + 1)
          // {
          //   _loc8_ = true;
          // }
          if (_loc7_ == 1)
          {
            _loc4_.var_111.activateObject(this.whichScreen, _loc6_, _loc8_, param1, param2);
          }
          else if (_loc7_ == 2)
          {
            _loc4_.var_110.activateObject(this.whichScreen, _loc6_, _loc8_, param1, param2);
          }
          _loc5_++;
        }
      }
      else
      {
        this.allowReactions();
      }
    }

    public function unregisterSpawn():void
    {
    }

    public function sendTriggered(param1:Number, param2:Boolean, param3:Boolean = false):void
    {
      var _loc8_:Number = NaN;
      var _loc9_:Number = NaN;
      var _loc5_:GameControls = this.gameObj.var_108;
      var _loc6_:GameCam = this.gameObj.var_119;
      var _loc7_:Boolean = false;
      this.currentTriggers += param1;
      if (this.currentTriggers < 0)
      {
        this.currentTriggers = 0;
        _loc7_ = true;
      }
      if (this.canReact)
      {
        if (this.currentTriggers == this.necessaryTriggers)
        {
          if (!this.isActivating && !this.isActivated && (this.broadcastReceiptMethod == 1 || this.broadcastReceiptMethod == 3))
          {
            if (param3)
            {
              this.finishActivatingObject();
            }
            else if (param2)
            {
              this.setCameraPan("wait", "activate");
            }
            else
            {
              this.activateObject();
            }
          }
          else if (!this.isDeactivating && !this.isDeactivated && (this.broadcastReceiptMethod == 2 || this.broadcastReceiptMethod == 3))
          {
            if (param3)
            {
              this.finishDeactivatingObject();
            }
            else if (param2)
            {
              this.setCameraPan("wait", "deactivate");
            }
            else
            {
              this.deactivateObject();
            }
          }
          else
          {
            this.allowTriggerReactions();
            if (param2 && !param3)
            {
              _loc8_ = _loc6_.prepanx;
              _loc9_ = _loc6_.prepany;
              _loc5_.setCameraPan(_loc8_, _loc9_, "player", this.screenObjID);
            }
          }
        }
        else if (this.currentTriggers < this.necessaryTriggers)
        {
          if (!this.isDeactivating && !this.isDeactivated && (this.broadcastReceiptMethod == 1 || this.broadcastReceiptMethod == 3))
          {
            if (param3)
            {
              this.finishDeactivatingObject();
            }
            else if (param2)
            {
              this.setCameraPan("wait", "deactivate");
            }
            else
            {
              this.deactivateObject();
            }
          }
          else if (!this.isActivating && !this.isActivated && (this.broadcastReceiptMethod == 2 || this.broadcastReceiptMethod == 3))
          {
            if (param3)
            {
              this.finishActivatingObject();
            }
            else if (param2)
            {
              this.setCameraPan("wait", "activate");
            }
            else
            {
              this.activateObject();
            }
          }
          else
          {
            this.allowTriggerReactions();
          }
        }
        else if (this.currentTriggers > this.necessaryTriggers)
        {
          if (!this.isDeactivating && !this.isDeactivated && this.broadcastReceiptMethod == 3)
          {
            if (param3)
            {
              this.finishDeactivatingObject();
            }
            else if (param2)
            {
              this.setCameraPan("wait", "deactivate");
            }
            else
            {
              this.deactivateObject();
            }
          }
          else if (!this.isActivating && !this.isActivated && this.broadcastReceiptMethod == 3)
          {
            if (param3)
            {
              this.finishActivatingObject();
            }
            else if (param2)
            {
              this.setCameraPan("wait", "activate");
            }
            else
            {
              this.activateObject();
            }
          }
          else
          {
            this.allowTriggerReactions();
          }
        }
      }
      else
      {
        this.allowTriggerReactions();
      }
    }

    public function setCameraPan(param1:String, param2:String):void
    {
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc4_:GameControls = this.gameObj.var_108;
      if (param1)
      {
        this.waitActivate = true;
        this.waitType = param2;
      }
      _loc5_ = this.y;
      _loc6_ = this.x;
      class_7.method_1("Set the Camera Pan onto me: " + this.objectname + "(id " + this.id + ") at X/Y " + _loc6_ + "," + _loc5_);
      _loc4_.setCameraPan(_loc6_, _loc5_, 1, this.screenObjID);
    }

    public function stopCameraPan():void
    {
      class_7.method_1("Object - stop camera pan");
      if (this.waitActivate)
      {
        if (this.waitType == "activate")
        {
          this.activateObject();
        }
        else if (this.waitType == "deactivate")
        {
          this.deactivateObject();
        }
        this.waitPanBack = true;
        this.waitActivate = false;
      }
    }

    public function checkOnScreen():Boolean
    {
      var _loc2_:GameDisplay = this.gameObj.var_103;
      return _loc2_.checkOnScreen(this);
    }

    public function checkAdditionalBlitting(param1:Boolean = false, param2:Boolean = false):void
    {
    }

    public function stopReactions():void
    {
      this.canReact = false;
    }

    public function allowReactions():void
    {
      this.canReact = true;
    }

    public function allowTriggerReactions():void
    {
    }

    override public function updateObject():void
    {
      var _loc2_:class_5 = this.gameObj;
      var _loc3_:ObjectManager = this.gameObj.var_111;
      var _loc4_:GameDisplay = _loc2_.var_103;
      if (_loc4_.checkOnScreen(this))
      {
        this.updateSprite();
      }
    }

    public function setEventData(param1:Array, param2:Number, param3:Number):void
    {
      this.tellTriggerArray = param1;
      this.tellTriggerPan = param2;
      this.tellTriggerPanTarget = param3;
    }

    public function setEventTriggers(param1:Number, param2:Array = null):void
    {
      this.necessaryTriggers = int(param1);
      this.fromTriggerArray = param2;
    }

    public function getHit(param1:Number = 1):void
    {
    }

    public function acceptsDamage(param1:String, param2:String):Boolean
    {
      var _loc4_:Boolean = false;
      if (param1 == "bullet" && this.canBeShot)
      {
        if (this.shotByWeapons.indexOf("all") > -1 || this.shotByWeapons.indexOf(param2) > -1)
        {
          _loc4_ = true;
        }
      }
      else if (param1 == "object" && this.canBeBrokenByObjects)
      {
        if (this.brokenByObjects.indexOf("all") > -1 || this.brokenByObjects.indexOf(param2) > -1)
        {
          _loc4_ = true;
        }
      }
      else if (param1 == "weapon" && this.canBeMeleed)
      {
        if (this.meleedByWeapons.indexOf("all") > -1 || this.meleedByWeapons.indexOf(param2) > -1)
        {
          _loc4_ = true;
        }
      }
      return _loc4_;
    }

    public function grabObject():void
    {
      this.isGrabbed = true;
      this.isThrowing = false;
    }

    public function grabRideableObject(param1:Character):void
    {
      this.isGrabRiding = true;
    }

    public function getRideableDirection():Number
    {
      return 1;
    }

    public function releaseRideableObject():void
    {
      this.isGrabRiding = false;
    }

    public function throwObject(param1:Number, param2:Boolean, param3:Boolean = true):void
    {
      this.isGrabbed = false;
      this.isThrowing = true;
      this.hasLandedAfterThrown = false;
      this.thrownByPlayer = param3;
      this.dirx = param1;
      this.speed = this.throwSpeed;
      this.gravity = this.jumpgravity;
      if (param2)
      {
        this.jumpspeed = 0;
      }
      else
      {
        this.jumpspeed = this.jumpstart;
      }
      this.jump = true;
      this.dropStartingY = this.y;
      if (param2)
      {
        this.wasDropped = true;
      }
      else
      {
        this.wasDropped = false;
      }
    }

    public function checkHittingEnemies(param1:Number = 0, param2:Number = 0):Boolean
    {
      var _loc9_:int = 0;
      var _loc10_:Enemy = null;
      var _loc4_:class_5 = this.gameObj;
      var _loc5_:EnemyManager = _loc4_.var_110;
      var _loc6_:Number = _loc5_.enemies.length;
      var _loc7_:Boolean = false;
      var _loc8_:Rectangle = new Rectangle();
      _loc8_.x = this.x + this.collRect.x;
      _loc8_.y = this.y + this.collRect.y;
      _loc8_.width = this.collRect.width;
      _loc8_.height = this.collRect.height;
      if (!this.thrownByPlayer)
      {
        if (_loc4_.playerObj.checkSpriteCollision(_loc8_) && _loc4_.playerObj.canGetHit())
        {
          _loc4_.playerObj.hurtPlayer(this.dirx, this.statAttack);
          _loc7_ = true;
          this.thrownByPlayer = true;
        }
      }
      else
      {
        _loc9_ = 0;
        while (_loc9_ < _loc6_)
        {
          _loc10_ = _loc5_.enemies[_loc9_];
          if (_loc10_.checkSpriteCollision(_loc8_))
          {
            if (!_loc10_.isHit && !_loc10_.resistBullets)
            {
              _loc10_.getHit(this.statAttack, this.dirx, true, this.objectname);
              _loc7_ = true;
            }
          }
          _loc9_++;
        }
      }
      if (_loc7_)
      {
        this.getHit();
      }
      return _loc7_;
    }

    public function checkPushingObject():Boolean
    {
      if (this.isPushable && this.isBeingPushed)
      {
        return true;
      }
      return false;
    }

    public function checkStartStepping(param1:Character, param2:Boolean = false):void
    {
      var _loc9_:Number = NaN;
      var _loc10_:Number = NaN;
      var _loc4_:GameDisplay = this.gameObj.var_103;
      var _loc5_:Number = param1.x + param1.width;
      var _loc6_:Number = param1.x - param1.width;
      var _loc7_:Number = this.x + this.collRect.x + this.collRect.width;
      var _loc8_:Number = this.x + this.collRect.x;
      if ((!this.isThrowing || this.hasLandedAfterThrown) && !this.isGrabbed)
      {
        if (_loc5_ > _loc8_ && _loc6_ < _loc7_)
        {
          _loc9_ = this.y - param1.y;
          _loc10_ = this.spriteTargetY + param1.height - this.standOffset + 3;
          if (_loc9_ <= _loc10_ && param1.y < this.y - this.spriteTargetY + this.standOffset + 10)
          {
            if (param1.jump && param1.jumpspeed >= 0 || !param1.jump && param1.onMovingTile == false && param2)
            {
              this.stepOnObject(param1);
            }
          }
        }
      }
    }

    public function stepOnObject(param1:Character):void
    {
      if (!this.isDeactivated)
      {
        if (this.standingChars.indexOf(param1) == -1)
        {
          this.standingChars.push(param1);
          this.standingCharsLastX.push(param1.x);
        }
        param1.jump = false;
        param1.onMovingTile = true;
        param1.whichMovingTile = this;
      }
    }

    public function stopStandingOnObject(param1:Character):void
    {
      param1.onMovingTile = false;
      param1.whichMovingTile = null;
      var _loc3_:Number = this.standingChars.indexOf(param1);
      if (_loc3_ > -1)
      {
        this.standingChars.splice(_loc3_, 1);
        this.standingCharsLastX.splice(_loc3_, 1);
      }
    }

    public function checkStandingOnObject(param1:Character):Boolean
    {
      var _loc3_:Boolean = true;
      var _loc4_:Number = param1.x;
      var _loc5_:Number = param1.y;
      var _loc6_:Number = param1.x + param1.width;
      var _loc7_:Number = param1.x - param1.width;
      var _loc8_:Number = this.x + this.collRect.x + this.collRect.width;
      var _loc9_:Number = this.x + this.collRect.x;
      if (_loc6_ < _loc9_ || _loc7_ > _loc8_)
      {
        _loc3_ = false;
      }
      else if (param1.jump && param1.jumpspeed < 0)
      {
        _loc3_ = false;
      }
      else if (this.isGrabbed)
      {
        _loc3_ = false;
      }
      else if (param1.onSlope)
      {
        _loc3_ = false;
      }
      if (!_loc3_)
      {
        this.stopStandingOnObject(param1);
      }
      return _loc3_;
    }
  }
}
