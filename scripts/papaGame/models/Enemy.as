package papaGame.models
{
  import flash.external.ExternalInterface;
  import flash.geom.Rectangle;
  import package_2.class_15;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.*;
  import papaGame.display.*;
  import papaGame.managers.*;

  public class Enemy extends Character
  {
    public var whichScreen:Number = -1;
    public var whichTileset:Number = 0;
    public var screenObjID:Number = -1;
    public var foreground:Boolean = false;
    public var canReact:Boolean = true;
    public var canBeStunned:Boolean = false;
    public var isUnstunning:Boolean = false;
    public var isReactingToHurt:Boolean = false;
    public var waitingToDie:Boolean = false;
    public var resistBullets:Boolean = false;
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
    public var broadcastOff:Boolean = false;
    public var broadcastOn:Boolean = false;
    public var broadcastAmount:Number = 0;
    public var broadcastAmountOn:Number = -1;
    public var broadcastAmountOff:Number = 1;
    public var broadcastReceiptMethod:Number = 1;
    public var dieJumpSpeed:Number = -24;
    public var dieSpeed:Number = 3;
    public var hitsWhileDead:Number = 0;
    public var hitsToLaunch:Number = 5;
    public var isLaunching:Boolean = false;
    public var launchJumpSpeed:Number = -32;
    public var noticedPlayer:Boolean = false;
    public var alwaysNoticePlayer:Boolean = false;
    public var statAttack:Number = 1;
    public var hasDroppedWeapon:Boolean = false;
    public var dropWeaponChance:Number = 1;
    public var dropWeaponSKU:String = "";
    public var rememberKilled:Boolean = true;
    public var saveKillAsID:Number = -1;
    public var onSingleTile:Boolean = false;
    public var usedWeapons:Array = [];
    public var usedWeaponsJuggling:Array = [];
    public var finalWeapon:String = "";
    public var isMultiSprite:Boolean = false;
    public var torsoSpriteWidth:Number;
    public var torsoSpriteHeight:Number;
    public var torsoSheetWidth:Number;
    public var torsoSheetHeight:Number;
    public var legAnimationFrame:Number = 0;
    public var legCycleFrame:Number = 0;
    public var legCycleName:String;
    public var headSpriteWidth:Number;
    public var headSpriteHeight:Number;
    public var headSheetWidth:Number;
    public var headSheetHeight:Number;
    public var torsoFlipOffset:Number;
    public var headFlipOffset:Number;
    public var torsoSheetName:String = "";
    public var headSheetName:String = "";
    public var legSheetName:String = "";
    public var enemyGroupType:String = "";
    public var enemyHeadOverride:String = "";
    public var shouldUseMastery:Boolean = false;
    public var strengthMultiplier:Number = 1.5;
    public var points:Number = 100;
    public var lookForPlayerRect:Rectangle = new Rectangle(-80, -80, 180, 80);
    public var keepChasingPlayerRect:Rectangle = new Rectangle(-450, -150, 900, 300);
    public var canDealDamage:Boolean = true;
    public var stunBounceGravity:Number = 2;
    public var stunBounceJumpSpeed:Number = -16;
    public var shoveAmount:Number = 0;
    public var bouncingDoesStun:Boolean = true;
    public var canDodgeAttacks:Boolean = false;
    public var dodgeChance:Number = 0.3;
    public var attackChangeInRange:Number = 0.03;
    public var isDodging:Boolean = false;
    public var isAttacking:Boolean = false;
    public var spawnerObjectID:Number = -1;
    public var groupID:Number = -1;
    public var stompRect:Rectangle = null;
    public var enemyCategory:String = "";
    public var didTagStun:Boolean = false;

    public function Enemy(param1:class_5, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Array)
    {
      super(param1);
      this.xtile = param2;
      this.ytile = param3;
      this.id = param4;
      this.whichScreen = param5;
      this.whichTileset = param6;
      this.screenObjID = param7;
      this.setupParams(param8);
      this.placeEnemy(param2, param3);
    }

    public function setupSprite():void
    {
    }

    public function setupParams(param1:Array):void
    {
    }

    public function placeEnemy(param1:Number, param2:Number):void
    {
      var _loc4_:GameDisplay = this.gameObj.var_103;
      this.xtile = param1;
      this.ytile = param2;
      this.x = this.xtile * _loc4_.tileWidth + _loc4_.tileWidth / 2;
      this.y = this.ytile * _loc4_.tileWidth + _loc4_.tileWidth / 2;
      var _loc5_:MapManager = this.gameObj.var_114;
      if (!_loc5_.getTileProperty(this.xtile - 1, this.ytile + 1, "collision") && !_loc5_.getTileProperty(this.xtile - 1, this.ytile + 1, "thrublock") && (!this.gameObj.var_114.getTileProperty(this.xtile + 1, this.ytile + 1, "collision") && !this.gameObj.var_114.getTileProperty(this.xtile + 1, this.ytile + 1, "thrublock")) && (Boolean(this.gameObj.var_114.getTileProperty(this.xtile, this.ytile + 1, "collision")) || Boolean(this.gameObj.var_114.getTileProperty(this.xtile, this.ytile + 1, "thrublock"))))
      {
        class_7.method_1("Enemy is on a single tile, don\'t walk!");
        this.onSingleTile = true;
      }
      else if (Boolean(_loc5_.getTileProperty(this.xtile, this.ytile + 1, "collision")) || Boolean(_loc5_.getTileProperty(this.xtile, this.ytile + 1, "thrublock")))
      {
        if (Boolean(_loc5_.getTileProperty(this.xtile + 1, this.ytile, "collision")) && Boolean(!_loc5_.getTileProperty(this.xtile - 1, this.ytile + 1, "collision")) && !_loc5_.getTileProperty(this.xtile - 1, this.ytile + 1, "thrublock"))
        {
          class_7.method_1("Wall on right, gap on left. Don\'t walk!");
          this.onSingleTile = true;
        }
        else if (Boolean(_loc5_.getTileProperty(this.xtile - 1, this.ytile, "collision")) && Boolean(!_loc5_.getTileProperty(this.xtile + 1, this.ytile + 1, "collision")) && !_loc5_.getTileProperty(this.xtile + 1, this.ytile + 1, "thrublock"))
        {
          class_7.method_1("Wall on left, gap on right. Don\'t walk!");
          this.onSingleTile = true;
        }
        else if (Boolean(_loc5_.getTileProperty(this.xtile - 1, this.ytile, "collision")) && Boolean(_loc5_.getTileProperty(this.xtile + 1, this.ytile, "collision")))
        {
          class_7.method_1("Walls on left and right. Don\'t walk!");
          this.onSingleTile = true;
        }
      }
      this.fallChar();
    }

    public function stunEnemy():void
    {
      this.isStunned = true;
      this.stunStartTime = 0;
    }

    public function reactToHurtingPlayer():void
    {
    }

    public function getHit(param1:Number = 1, param2:Number = 1, param3:Boolean = false, param4:String = "none"):Boolean
    {
      var _loc8_:Number = NaN;
      var _loc9_:Number = NaN;
      var _loc6_:Boolean = false;
      var _loc7_:EffectManager = this.gameObj.var_104;
      if (!this.isDead)
      {
        this.currentHealth -= param1;
        this.isHit = true;
        this.gameObj.playerObj.addToCombo();
        if (this.usedWeapons.indexOf(param4) == -1)
        {
          this.usedWeapons.push(param4);
        }
        if (this.currentHealth <= 0 && this.hitsWhileDead == 0)
        {
          this.finalWeapon = param4;
        }
        if (this.currentHealth <= 0 && this.usedWeaponsJuggling.indexOf(param4) == -1)
        {
          if (this.hitsWhileDead > 0)
          {
            this.usedWeaponsJuggling.push(param4);
          }
        }
        if (this.currentHealth <= 0)
        {
          this.killMe(param2);
          _loc6_ = true;
        }
        _loc8_ = this.x;
        _loc9_ = this.y - 24;
        _loc7_.addEffect(_loc8_, _loc9_, "StarburstEffect");
        this.gameObj.var_105.playSound("hitenemy_alt.wav");
      }
      return _loc6_;
    }

    override public function killMe(param1:Number = 1):void
    {
      ExternalInterface.call("killed", this.type);
      var _loc2_:Enemy = this;
      var _loc3_:ItemManager = _loc2_.gameObj.var_120;
      _loc2_.isHit = true;
      _loc2_.isDead = true;
      _loc2_.isFlying = false;
      ++_loc2_.hitsWhileDead;
      _loc2_.speed = _loc2_.dieSpeed;
      _loc2_.dirx = param1;
      _loc2_.currentHealth = 0;
      _loc2_.jumpspeed = _loc2_.dieJumpSpeed / 2;
      if (_loc2_.hitsWhileDead > 1)
      {
        _loc2_.jumpspeed -= _loc2_.hitsWhileDead * 2;
        if (_loc2_.jumpspeed < _loc2_.dieJumpSpeed)
        {
          _loc2_.jumpspeed = _loc2_.dieJumpSpeed;
        }
        if (_loc2_.dirx == 0)
        {
          if (Math.random() > 0.5)
          {
            _loc2_.dirx = 1;
          }
          else
          {
            _loc2_.dirx = -1;
          }
        }
        if (_loc2_.hitsWhileDead > 3)
        {
          _loc2_.speed += 1;
        }
        if (_loc2_.hitsWhileDead >= _loc2_.hitsToLaunch)
        {
        }
      }
      _loc2_.jump = true;
      _loc2_.gameObj.var_106.earnPoints(_loc2_.points);
      if (_loc2_.rememberKilled && _loc2_.hitsWhileDead == 1)
      {
        _loc2_.gameObj.var_109.currentScreenData.saveEnemyState(_loc2_.id - 1, [0]);
      }
    }

    override public function grabAnimationCycle():Array
    {
      return null;
    }

    public function launchEnemy():void
    {
    }

    public function grabLegAnimationCycle():Array
    {
      return [];
    }

    public function grabHeadAnimationCycle():Array
    {
      return [];
    }

    public function grabWeaponAnimationCycle():Array
    {
      return [];
    }

    public function getTorsoOffsetX():Number
    {
      return 0;
    }

    public function getTorsoOffsetY():Number
    {
      return 0;
    }

    override public function endAnimationCycle():void
    {
    }

    public function legsEndAnimationCycle():void
    {
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
          if (Boolean(this.tellTriggerPan) && this.tellTriggerPanTarget == _loc5_ + 1)
          {
            _loc8_ = true;
          }
          if (_loc7_ == 1)
          {
            _loc4_.var_111.activateObject(this.whichScreen, _loc6_, _loc8_, param1, param2);
          }
          _loc5_++;
        }
      }
    }

    public function sendTriggered(param1:Number, param2:Boolean, param3:Boolean = false):void
    {
      var _loc5_:Number = param1;
      this.killMe(1);
    }

    public function setCameraPan(param1:String, param2:String):void
    {
    }

    public function stopCameraPan():void
    {
    }

    public function checkOnScreen():Boolean
    {
      var _loc2_:GameDisplay = this.gameObj.var_103;
      return _loc2_.checkOnScreen(this);
    }

    public function checkBeforeBlitting():void
    {
    }

    public function saveEnemyKill():void
    {
      var _loc2_:String = "none";
      if (this.usedWeapons.length > 0)
      {
        _loc2_ = this.usedWeapons[0];
      }
      var _loc3_:Number = Number(this.type);
      if (this.saveKillAsID != -1)
      {
        _loc3_ = this.saveKillAsID;
      }
      this.gameObj.var_106.saveEnemyKill(_loc3_, _loc2_, this.enemyCategory);
    }

    public function removeEnemy():void
    {
      var _loc1_:Enemy = this;
      var _loc2_:EnemyManager = _loc1_.gameObj.var_110;
      _loc1_.broadcastTriggered(1);
      --_loc1_.gameObj.var_110.jugglingEnemies;
      if (_loc1_.gameObj.var_110.jugglingEnemies < 0)
      {
        _loc1_.gameObj.var_110.jugglingEnemies = 0;
      }
      _loc2_.removeEnemy(_loc1_.id);
    }

    override public function jumpChar(param1:Boolean = true):void
    {
      super.jumpChar(param1);
      if (this.ytile > this.gameObj.var_103.levelTileHeight)
      {
        if (!this.isDead)
        {
          this.killMe(-1);
        }
      }
    }

    override public function updateObject():void
    {
      var _loc2_:class_5 = this.gameObj;
      var _loc3_:EnemyManager = this.gameObj.var_110;
      var _loc4_:GameDisplay = _loc2_.var_103;
      this.jumpChar();
      this.moveChar(this.dirx, 0, 0, true, true);
      this.walkingDir = this.dirx;
      if (this.facingWalking)
      {
        this.facingDir = this.walkingDir;
      }
      if (_loc4_.checkOnScreen(this))
      {
        this.updateSprite();
      }
      else if (this.xtile < _loc4_.currentXtileLeft - 4)
      {
        _loc3_.removeEnemy(this.id);
      }
      else if (this.y > _loc4_.screenPxHeight * 2)
      {
        _loc3_.removeEnemy(this.id);
      }
    }

    override public function destroy():void
    {
      if (this.isDead)
      {
        this.saveEnemyKill();
      }
    }

    public function startShoving():void
    {
    }

    public function startQuickAttacking():void
    {
    }

    public function startAttacking():void
    {
    }

    public function lookForPlayer():void
    {
      var _loc3_:Rectangle = null;
      var _loc2_:PlayerChar = this.gameObj.playerObj;
      if (!this.noticedPlayer)
      {
        _loc3_ = new Rectangle(this.x + this.lookForPlayerRect.x, this.y + this.lookForPlayerRect.y, this.lookForPlayerRect.width, this.lookForPlayerRect.height);
        if (this.facingDir == -1)
        {
          _loc3_.x = this.x - this.lookForPlayerRect.x - this.lookForPlayerRect.width;
        }
        if (_loc2_.checkSpriteCollision(_loc3_))
        {
          this.noticedPlayer = true;
        }
      }
      else if (!this.alwaysNoticePlayer)
      {
        _loc3_ = new Rectangle(this.x + this.keepChasingPlayerRect.x, this.y + this.keepChasingPlayerRect.y, this.keepChasingPlayerRect.width, this.keepChasingPlayerRect.height);
        if (this.facingDir == -1)
        {
          _loc3_.x = this.x - this.keepChasingPlayerRect.x - this.keepChasingPlayerRect.width;
        }
        if (_loc2_.checkSpriteCollision(_loc3_) == false)
        {
          this.noticedPlayer = false;
        }
      }
      if (_loc2_.isRidingElevator)
      {
        this.noticedPlayer = true;
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

    override public function updateSprite():void
    {
      if (this.isMultiSprite)
      {
        this.updateMultiSprite();
      }
      else
      {
        super.updateSprite();
      }
    }

    public function updateMultiSprite():void
    {
      var _loc2_:Array = null;
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc6_:String = null;
      var _loc7_:Number = NaN;
      _loc2_ = this.grabLegAnimationCycle();
      _loc3_ = this.legAnimationFrame;
      _loc5_ = this.legCycleFrame;
      _loc6_ = _loc2_[0];
      _loc7_ = Number(_loc2_[1]);
      if (_loc7_ == 1)
      {
        _loc4_ = Number(_loc2_[5]);
      }
      else if (_loc7_ == 2)
      {
        _loc4_ = Number(_loc2_[5][0]);
      }
      if (_loc6_ != this.legCycleName)
      {
        this.adjustLegFrameSync(_loc6_, this.legCycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
      }
      else
      {
        this.adjustLegFrameSync(_loc6_, this.legCycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
        this.legSpriteChangeFrame(1, _loc2_, _loc7_);
      }
      _loc2_ = this.grabAnimationCycle();
      _loc3_ = this.animationFrame;
      _loc5_ = this.cycleFrame;
      _loc6_ = _loc2_[0];
      _loc7_ = Number(_loc2_[1]);
      if (_loc7_ == 1)
      {
        _loc4_ = Number(_loc2_[5]);
      }
      else if (_loc7_ == 2)
      {
        _loc4_ = Number(_loc2_[5][0]);
      }
      if (_loc6_ != this.cycleName)
      {
        this.adjustFrameSync(_loc6_, this.cycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
      }
      else
      {
        this.adjustFrameSync(_loc6_, this.cycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
        this.spriteChangeFrame(1, _loc2_, _loc7_);
      }
      this.animationBlitStyle = _loc2_[2];
    }

    public function legSpriteChangeFrame(param1:Number, param2:Array, param3:Number):void
    {
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:Number = NaN;
      var _loc8_:Number = NaN;
      var _loc9_:Number = NaN;
      if (param3 == 1)
      {
        this.legAnimationFrame += param1;
        _loc5_ = Number(param2[3]);
        _loc6_ = Number(param2[4]);
        _loc7_ = Number(param2[5]);
        _loc8_ = Number(param2[6]);
        if (this.legAnimationFrame > _loc8_)
        {
          if (_loc6_ == -1)
          {
            this.legAnimationFrame = _loc8_;
            this.legsEndAnimationCycle();
          }
          else
          {
            this.legAnimationFrame = _loc6_;
          }
        }
        if (this.legAnimationFrame < _loc6_ && this.facingDir != this.walkingDir)
        {
          this.legAnimationFrame = _loc8_;
        }
      }
      else if (param3 == 2)
      {
        _loc9_ = Number(param2[5].length);
        _loc5_ = Number(param2[3]);
        _loc6_ = Number(param2[4]);
        _loc7_ = Number(param2[5][0]);
        _loc8_ = param2[5].length - 1;
        this.legCycleFrame += param1;
        if (this.legCycleFrame < 0)
        {
          this.legCycleFrame = _loc8_;
        }
        else if (this.legCycleFrame > _loc8_)
        {
          if (_loc6_ == -1)
          {
            this.legCycleFrame = _loc8_;
            this.legsEndAnimationCycle();
          }
          else
          {
            this.legCycleFrame = _loc6_;
          }
        }
        this.legAnimationFrame = param2[5][this.legCycleFrame];
      }
    }

    public function adjustLegFrameSync(param1:String, param2:String, param3:Number, param4:Number, param5:Number, param6:Number, param7:Array):void
    {
      if (param1 != param2)
      {
        this.legAnimationFrame = param3;
        this.legCycleFrame = 0;
        this.legCycleName = param1;
      }
    }

    public function adjustSpeedForSlopes(param1:Number):Number
    {
      var _loc3_:Number = param1;
      if (this.onSlope == 1 || this.onSlope == 2)
      {
        _loc3_ = param1 * Math.cos(class_15.degreesToRads(45));
      }
      else if (this.onSlope == 3 || this.onSlope == 4 || this.onSlope == 5 || this.onSlope == 6)
      {
        _loc3_ = param1 * Math.cos(class_15.degreesToRads(22));
      }
      else if (this.onSlope == 7 || this.onSlope == 8)
      {
        if (this.walkingDir == 1)
        {
          _loc3_ = param1 * Math.cos(class_15.degreesToRads(67));
        }
        else
        {
          _loc3_ = param1 * Math.cos(class_15.degreesToRads(55));
        }
      }
      else if (this.onSlope == 9 || this.onSlope == 10)
      {
        if (this.walkingDir == -1)
        {
          _loc3_ = param1 * Math.cos(class_15.degreesToRads(67));
        }
        else
        {
          _loc3_ = param1 * Math.cos(class_15.degreesToRads(55));
        }
      }
      else
      {
        _loc3_ = param1;
      }
      return _loc3_;
    }

    public function receiveGroupMessage(param1:String, param2:Number):void
    {
    }
  }
}
