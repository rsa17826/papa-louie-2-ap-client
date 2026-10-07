package papaGame.models
{
  import flash.external.ExternalInterface;
  import flash.geom.Rectangle;
  import flash.media.SoundChannel;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.*;
  import papaGame.display.GameDisplay;
  import papaGame.events.*;
  import papaGame.managers.*;
  import papaGame.models.characters.CustomerChar;
  import papaGame.models.effects.*;

  public class PlayerChar extends Character
  {
    public var standCollRect:Rectangle;
    public var duckCollRect:Rectangle;
    public var jumpCollRect:Rectangle;
    public var isDucking:Boolean = false;
    public var isGrabbing:Boolean = false;
    public var isStartingGrabbing:Boolean = false;
    public var grabTileYOffset:Number = -2;
    public var isGroundPounding:Boolean = false;
    public var isDoubleJumping:Boolean = false;
    public var isWallJumping:Boolean = false;
    public var canGlideBoost:Boolean = true;
    public var canPush:Boolean = false;
    public var canAutoWallJump:Boolean = false;
    public var wallSlideCancelTimer:Number = 0;
    public var wallSlideCancelTimerMax:Number = 6;
    public var wallSlideStartTimer:Number = 0;
    public var wallSlideStartTimerMax:Number = 4;
    public var wallJumpDelayTimer:Number = 0;
    public var wallJumpDelayTimerMax:Number = 4;
    public var playerData:CustomerDataFile = null;
    public var skillType:String = "none";
    public var statAttack:Number = 1;
    public var hasPowerup:Boolean = false;
    public var isInvincible:Boolean = false;
    public var invincibleTimer:Number = 0;
    public var invincibleTimerMax:Number = 450;
    public var invincibleTimerWarning:Number = 390;
    public var invincibleFXID:Number = -1;
    public var isFinishingLevel:Boolean = false;
    public var isPausingAfterMiniboss:Boolean = false;
    public var finishTargetX:Number = 0;
    public var finishJumps:Number = 0;
    public var finishJumpsMax:Number = 4;
    public var finishCustomerFXIndex:Number = -1;
    public var finishType:String = "cage";
    public var finishAddedPortal:Boolean = false;
    public var finishWaitTimer:Number = 0;
    public var finishWaitTimerMax:Number = 20;
    public var finishPortalID:Number = -1;
    public var isGone:Boolean = false;
    public var isHiding:Boolean = false;
    public var forceGrabYoffset:Number = 0;
    public var isShoved:Boolean = false;
    public var shoveTimer:Number = 0;
    public var shoveTimerMax:Number = 6;
    public var isAttacking:Boolean = false;
    public var canAttack:Boolean = true;
    public var canDealDamage:Boolean = true;
    public var lastSafeX:Number = 0;
    public var lastSafeY:Number = 0;
    public var lastSafeTime:Number = 0;
    public var lastSafeTimeBuffer:Number = 6;
    public var lastWallJumpKey:String = "jump";
    public var lastWallJumpOtherKey:String = "jump";
    public var canPressWallJump:Boolean = true;
    public var canArrowWallJump:Boolean = true;
    public var canPressDoubleJump:Boolean = true;
    public var canPressJump:Boolean = true;
    public var canPressAction:Boolean = true;
    public var canPressLeft:Boolean = true;
    public var canPressRight:Boolean = true;
    public var canPressDown:Boolean = true;
    public var didDoubleJump:Boolean = false;
    public var waitToEnterDoor:Boolean = false;
    public var doorDirX:Number = 0;
    public var doorDirY:Number = 0;
    public var doorXtile:Number = 0;
    public var doorYtile:Number = 0;
    public var fellOffTrain:Boolean = false;
    public var isInRiver:Boolean = false;
    public var isRidingElevator:Boolean = false;
    public var hitByBlast:Boolean = false;
    public var comboTally:Number = 0;
    public var comboTimer:Number = 0;
    public var comboTimerMax:Number = 90;
    public var trainSound:SoundChannel;
    public var slideSound:SoundChannel = null;
    public var balloonsLastFloatedAway:Number = 0;
    public var isCheesed:Boolean = false;
    public var cheesedFXID:Number = -1;
    public var stunStarIDs:Array = [];
    public var bossDelayMusicTimer:Number = 0;
    public var bossDelayMusicTimerMax:Number = 150;

    public function PlayerChar(param1:class_5)
    {
      super(param1);
    }

    public function getNormalAttackPower():Number
    {
      return this.statAttack;
    }

    public function addToCombo(param1:Number = 1):void
    {
      this.comboTally += param1;
      this.comboTimer = 0;
      if (this.comboTally > 1)
      {
        this.gameObj.var_112.recordCombo(this.comboTally);
      }
    }

    public function updateComboTimer():void
    {
      var _loc1_:PlayerChar = this;
      if (_loc1_.comboTally > 0)
      {
        ++_loc1_.comboTimer;
        if (_loc1_.comboTimer >= _loc1_.comboTimerMax)
        {
          if (_loc1_.comboTally > 1)
          {
          }
          _loc1_.comboTimer = 0;
          _loc1_.comboTally = 0;
        }
      }
    }

    public function clearCombo():void
    {
      if (this.comboTally > 1)
      {
      }
      this.comboTimer = 0;
      this.comboTally = 0;
    }

    public function updateWeaponMastery(param1:String, param2:Number):void
    {
    }

    public function canGetHit():Boolean
    {
      if (!this.isHit && !this.isStunned && !this.isInvincible && !this.isDead && !this.isFinishingLevel && !this.isPausingAfterMiniboss && !this.isHiding && !this.isRidingObject)
      {
        return true;
      }
      return false;
    }

    public function startDucking():void
    {
      if (this.onSlope > 0 && (this.skillType != CustomerData.SKILL_CRAWL || !this.isCrawling))
      {
        this.startSliding(1);
      }
      else
      {
        this.duck = true;
        this.isDucking = true;
        this.isTurning = false;
      }
    }

    public function startSliding(param1:Number = 0, param2:Boolean = true):void
    {
      if (!this.isSliding)
      {
        if (Boolean(this.onSlope) && param2)
        {
          if (this.onSlope == 1 || this.onSlope == 3 || this.onSlope == 4 || this.onSlope == 7 || this.onSlope == 8)
          {
            this.facingDir = -1;
            this.walkingDir = -1;
            this.dirx = -1;
          }
          else
          {
            this.facingDir = 1;
            this.walkingDir = 1;
            this.dirx = 1;
          }
        }
        else
        {
          this.walkingDir = this.facingDir;
          this.dirx = this.walkingDir;
        }
        this.isSliding = true;
        this.slideSpeed = param1;
        this.baseSlideSpeed = param1;
        if (this.slideSound == null)
        {
          if (this.playerData.customerName == "Scooter")
          {
            this.slideSound = this.gameObj.var_105.playSound("skateboard_slide.wav", true, 0.1);
          }
          else
          {
            this.slideSound = this.gameObj.var_105.playSound("hill_slide.wav", true, 0.1);
          }
        }
      }
    }

    public function startPounding():void
    {
      if (this.skillType == CustomerData.SKILL_POUND && !this.isGroundPounding)
      {
        this.isGroundPounding = true;
        this.jump = true;
        this.jumpspeed = 0;
        this.gameObj.method_94("groundpound");
        this.gameObj.method_94("poundcontext");
      }
    }

    public function startDoubleJumping():void
    {
      if (this.skillType == CustomerData.SKILL_DOUBLEJUMP && !this.isDoubleJumping)
      {
        this.isDoubleJumping = true;
        this.jump = true;
        this.jumpspeed = this.jumpstart;
        this.gravity = this.jumpgravity;
        this.gameObj.method_94("doublejump");
      }
    }

    public function startGliding():void
    {
      if (this.skillType == CustomerData.SKILL_GLIDE && this.jump && !this.isGliding)
      {
        this.isGliding = true;
        this.gravity = this.glidegravity;
        if (this.canGlideBoost)
        {
          this.jumpspeed = -6;
          this.canGlideBoost = false;
        }
        else
        {
          this.jumpspeed = 0;
        }
        if (this.playerData.customerName == "Foodini")
        {
          this.gameObj.var_105.playSound("balloon_glide.wav");
        }
        else if (this.playerData.customerName != "Professor Fitz")
        {
          this.gameObj.var_105.playSound("hatglider.wav", false, 0.3);
        }
        this.gameObj.method_94("glide");
      }
    }

    public function startWallJumping(param1:Number = 0, param2:String = "jump"):void
    {
      this.isWallJumping = true;
      this.isWallSliding = false;
      this.jumpspeed = this.jumpstart;
      this.gravity = this.jumpgravity;
      this.lastWallJumpKey = param2;
      this.lastWallJumpOtherKey = param2;
      this.canPressWallJump = false;
      this.canArrowWallJump = false;
      this.speed = 10;
      this.canAutoWallJump = true;
      if (CustomerChar(this).checkIfAgainstWall(1) || param1 == -1)
      {
        this.facingDir = -1;
        this.walkingDir = -1;
        this.dirx = -1;
        this.triggerjump = true;
        this.triggerjumpx = true;
        this.lastWallJumpKey = "right";
      }
      else if (CustomerChar(this).checkIfAgainstWall(-1) || param1 == 1)
      {
        this.facingDir = 1;
        this.walkingDir = 1;
        this.dirx = 1;
        this.triggerjump = true;
        this.triggerjumpx = true;
        this.lastWallJumpKey = "left";
      }
      this.gameObj.method_94("walljump");
    }

    public function startupPlayer(param1:Number, param2:Number, param3:Boolean = false, param4:Boolean = false):void
    {
      var _loc6_:GameDisplay = this.gameObj.var_103;
      var _loc7_:EffectManager = this.gameObj.var_104;
      this.x = param1 * _loc6_.tileWidth + _loc6_.tileWidth / 2;
      this.y = param2 * _loc6_.tileWidth + _loc6_.tileWidth / 2;
      this.xtile = param1;
      this.ytile = param2;
      this.lastSafeX = param1;
      this.lastSafeY = param2;
      if (!param4)
      {
        this.facingDir = 1;
        this.walkingDir = 1;
      }
      this.isWalking = false;
      this.isDead = false;
      this.isHit = false;
      this.fellOffTrain = false;
      this.stunStarIDs = [];
      if (!param4)
      {
        this.statAttack = 1;
      }
      this.canPressLeft = true;
      this.canPressRight = true;
      this.gameObj.var_108.stopHurtControls = false;
      if (!param4)
      {
        this.isStunned = true;
        this.stunStartTime = 0;
      }
      if (this.isInvincible)
      {
        this.isInvincible = false;
        try
        {
          if (this.invincibleFXID > -1)
          {
            _loc7_.removeEffect(this.invincibleFXID);
            this.invincibleFXID = -1;
          }
        }
        catch (err:Error)
        {
        }
      }
      if (param3)
      {
        this.isFinishingLevel = false;
        this.hitByBlast = false;
        this.gameObj.var_108.stopActionControls = false;
      }
      if (!param4)
      {
        this.currentHealth = this.maxHealth;
        this.gameObj.var_115.updatePlayerHealth(this.currentHealth);
      }
      if (param3)
      {
        this.gameObj.var_104.addEffect(this.x, this.y - 64, "EndPortalEffect", "startup");
      }
      if (this.playerData.skillType == CustomerData.SKILL_POUND && !this.gameObj.var_106.hasTrained("groundpound"))
      {
        this.gameObj.method_102("groundpound", true, this.gameObj.var_109.getKeyLabel(DataManager.KEY_DOWN));
      }
      else if (this.playerData.skillType == CustomerData.SKILL_GLIDE && !this.gameObj.var_106.hasTrained("glide"))
      {
        this.gameObj.method_102("glide", true, this.gameObj.var_109.getKeyLabel(DataManager.KEY_JUMP));
      }
      else if (this.playerData.skillType == CustomerData.SKILL_DOUBLEJUMP && !this.gameObj.var_106.hasTrained("doublejump"))
      {
        this.gameObj.method_102("doublejump", true);
      }
      this.fallChar();
    }

    public function hurtPlayer(param1:Number, param2:Number, param3:Boolean = false):void
    {
      // TODO send deathlinks here
      var _loc6_:Number = NaN;
      var _loc5_:EffectManager = this.gameObj.var_104;
      if (param3 && (this.isPausingAfterMiniboss || this.isFinishingLevel))
      {
        param3 = false;
        class_7.method_1("Don\'t hurt him, he\'s finishing the level!");
      }
      if (ExternalInterface.call("debugModeEnabled"))
      {
        this.isInvincible = true;
      }
      if (this.canGetHit() || (param3 && !this.isInvincible))
      {
        if (param3)
        {
          class_7.method_1("Forced Damage");
        }
        this.currentHealth -= param2;
        this.isHit = true;
        this.hitStartTime = 0;
        this.isGrabbing = false;
        this.isStartingGrabbing = false;
        this.isShoved = false;
        this.clearCombo();
        this.gameObj.var_106.gotHurt = true;
        this.isGroundPounding = false;
        this.isDoubleJumping = false;
        this.isClimbingLadder = false;
        this.isGliding = false;
        this.isWallJumping = false;
        this.isWallSliding = false;
        this.canAutoWallJump = false;
        if (!this.isCrawling)
        {
          this.isDucking = false;
          this.duck = false;
        }
        if (this.isCheesed)
        {
          this.removeCheese();
        }
        if (this.currentHealth <= 0)
        {
          this.currentHealth = 0;
          this.gameObj.var_119.setCameraJiggle(12, 10);
          this.cancelAttack();
          this.dropWeapon();
          this.dirx = param1;
          if (param1 != 0)
          {
            this.walkingDir = param1;
            this.facingDir = param1 * -1;
          }
          this.setSpeed(this.walkspeed);
          if (!this.isCrawling)
          {
            this.jumpspeed = this.jumpstart;
            this.jump = true;
          }
          this.isDead = true;
          this.hasPowerup = false;
          this.isInvincible = false;
          this.isWalking = false;
          if (this.invincibleFXID > -1)
          {
            this.gameObj.var_104.removeEffect(this.invincibleFXID);
            this.invincibleFXID = -1;
          }
          this.gameObj.var_105.playSound("player_died.wav");
          this.gameObj.var_108.stopHurtControls = true;
        }
        else
        {
          this.gameObj.var_119.setCameraJiggle(6, 8);
          this.dirx = param1;
          if (param1 != 0)
          {
            this.walkingDir = param1;
            this.facingDir = param1 * -1;
          }
          if (!this.isCrawling)
          {
            this.jumpspeed = -16;
            this.jump = true;
          }
          this.isWalking = false;
          this.setSpeed(8);
          if (this is CustomerChar)
          {
            CustomerChar(this).skidSpeed = 3;
          }
          this.cancelAttack();
          this.gameObj.var_108.stopHurtControls = true;
          this.isStunned = true;
          _loc6_ = -72;
          if (this.isCrawling)
          {
            _loc6_ = -32;
          }
          this.stunStarIDs.push(_loc5_.addEffect(this.x, this.y, "DizzyEffect", "faceRight", true, 0, _loc6_));
          this.gameObj.var_105.playSound("player_hurt.wav");
        }
        this.gameObj.var_115.updatePlayerHealth(this.currentHealth);
        this.throwCarriedObject(0);
        this.isThrowingObject = false;
      }
    }

    public function getHeart():void
    {
      var _loc1_:PlayerChar = this;
      if (_loc1_.currentHealth < _loc1_.maxHealth)
      {
        ++_loc1_.currentHealth;
      }
      _loc1_.gameObj.var_115.updatePlayerHealth(_loc1_.currentHealth);
    }

    public function throwCarriedObject(param1:Number, param2:Boolean = false):void
    {
      if (this.isCarryingObject && Boolean(this.whichObjectGrabbed))
      {
        this.whichObjectGrabbed.throwObject(param1, param2);
        this.whichObjectGrabbed = null;
        this.isCarryingObject = false;
        this.isGrabbingObject = false;
        this.gravity = this.normalgravity;
      }
    }

    public function shovePlayer(param1:Number, param2:Number = 4):void
    {
      if (!this.isGrabbing && !this.isStartingGrabbing)
      {
        this.isShoved = true;
        this.isTurning = false;
        this.shoveTimer = 0;
        this.dirx = param1;
        if (param1 != 0)
        {
          this.walkingDir = param1;
          this.facingDir = param1 * -1;
        }
        if (param1 == 1)
        {
          this.canPressLeft = false;
        }
        else if (param1 == -1)
        {
          this.canPressRight = false;
        }
        if (this.jump)
        {
          param2 = 1;
        }
        this.setSpeed(param2);
      }
    }

    public function setSpeed(param1:Number):void
    {
      this.speed = param1;
    }

    public function restartPlayer(param1:Number = -1):void
    {
      // TODO real send deathlink location
      var _loc3_:GameDisplay = this.gameObj.var_103;
      var _loc4_:MapManager = this.gameObj.var_114;
      var _loc5_:Boolean = this.gameObj.var_106.adjustLives(param1);
      if (_loc5_)
      {
        this.gameObj.var_108.stopHurtControls = false;
        this.isDead = false;
        this.gameObj.var_108.resetKeys();
        this.startupPlayer(this.lastSafeX, this.lastSafeY);
      }
      else
      {
        class_7.method_1("DEAD!");
        this.gameObj.var_107.api.method_100("Died", this.gameObj.var_109.currentLevel + 1);
        this.gameObj.var_105.endMusic();
        this.gameObj.var_108.stopCycle = true;
        this.gameObj.var_103.startMainIrisOut();
      }
    }

    public function updateStunTime():void
    {
      var _loc1_:PlayerChar = this;
      var _loc2_:EffectManager = _loc1_.gameObj.var_104;
      if (_loc1_.isStunned)
      {
        ++_loc1_.stunStartTime;
        if (_loc1_.stunStartTime >= _loc1_.stunDuration)
        {
          _loc1_.isStunned = false;
        }
      }
      if (_loc1_.isShoved)
      {
        ++_loc1_.shoveTimer;
        if (_loc1_.shoveTimer >= _loc1_.shoveTimerMax)
        {
          _loc1_.isShoved = false;
          _loc1_.canPressRight = true;
          _loc1_.canPressLeft = true;
          _loc1_.walkingDir = _loc1_.facingDir;
          _loc1_.isWalking = true;
        }
      }
    }

    public function checkForHittingEnemies(param1:Boolean = false):Boolean
    {
      var _loc5_:int = 0;
      var _loc6_:Enemy = null;
      var _loc3_:Rectangle = new Rectangle(this.x + this.collRect.x, this.y + this.collRect.y, this.collRect.width, this.collRect.height);
      var _loc4_:EnemyManager = this.gameObj.var_110;
      if (this.canGetHit())
      {
        _loc5_ = 0;
        while (_loc5_ < _loc4_.enemies.length)
        {
          if (_loc4_.enemies[_loc5_] != 0)
          {
            _loc6_ = _loc4_.enemies[_loc5_];
            if (_loc6_.checkSpriteCollision(_loc3_) && !_loc6_.isDead)
            {
              break;
            }
          }
          _loc5_++;
        }
      }
      return false;
    }

    public function checkForHittingObjects():Boolean
    {
      return false;
    }

    public function checkForCollectingItems():void
    {
      var _loc2_:Rectangle = new Rectangle(this.x + this.collRect.x, this.y + this.collRect.y, this.collRect.width, this.collRect.height);
      var _loc3_:ItemManager = this.gameObj.var_120;
      _loc3_.checkForCollecting(_loc2_);
    }

    public function checkForGrabbingTile():void
    {
      var _loc3_:Number = NaN;
      var _loc2_:MapManager = this.gameObj.var_114;
      if (this.jump && this.jumpspeed >= 0 && !this.isGrabbing)
      {
        _loc3_ = Number(_loc2_.getTileProperty(this.xtile, this.ytile + this.grabTileYOffset, "grab"));
        if (_loc3_ > 0)
        {
          this.isStartingGrabbing = true;
          this.isGrabbing = true;
          this.jump = false;
          this.y = this.ytile * this.gameObj.var_103.tileWidth;
        }
      }
    }

    public function checkForGrabbingObjects():Boolean
    {
      var _loc5_:int = 0;
      var _loc6_:GameObject = null;
      var _loc2_:ObjectManager = this.gameObj.var_111;
      var _loc3_:Rectangle = new Rectangle(this.x + this.collRect.x, this.y + this.collRect.y, this.collRect.width, this.collRect.height);
      var _loc4_:Boolean = false;
      if (!this.isCarryingObject)
      {
        _loc5_ = 0;
        while (_loc5_ < _loc2_.objects.length)
        {
          _loc6_ = _loc2_.objects[_loc5_];
          if (_loc6_.checkOnScreen() && _loc6_.isGrabbable && !_loc6_.isGrabbed && !_loc6_.isThrowing && (_loc6_.checkSpriteCollision(_loc3_) || this.onMovingTile && this.whichMovingTile == _loc6_))
          {
            _loc4_ = true;
            this.isGrabbingObject = true;
            this.isCarryingObject = true;
            this.whichObjectGrabbed = _loc6_;
            this.cancelAttack();
            _loc6_.grabObject();
            break;
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function adjustCarriedObject():void
    {
    }

    public function checkIfCanGrab(param1:Number, param2:Number):Boolean
    {
      var _loc4_:MapManager = this.gameObj.var_114;
      var _loc5_:Number = Number(_loc4_.getTileProperty(param1, param2, "grab"));
      if (_loc5_ > 0)
      {
        return true;
      }
      return false;
    }

    public function checkIfOnLadder(param1:Number):Boolean
    {
      var _loc3_:MapManager = this.gameObj.var_114;
      var _loc4_:Number = Number(_loc3_.getTileProperty(this.xtile, this.ytile, "ladder"));
      if (_loc4_ > 0)
      {
        if (this.isClimbingLadder == false && param1 == 1 && (_loc3_.getTileProperty(this.xtile, this.ytile + 1, "collision") > 0 || _loc3_.getTileProperty(this.xtile, this.ytile + 1, "thrublock") > 0))
        {
          return false;
        }
        if (this.isCheesed)
        {
          return false;
        }
        return true;
      }
      return false;
    }

    public function getPowerUp():void
    {
      this.hasPowerup = true;
      this.gameObj.var_105.playSound("get_powerup.wav");
    }

    public function getInvincibility(param1:Boolean = false):void
    {
      var _loc3_:EffectManager = this.gameObj.var_104;
      this.isInvincible = true;
      this.invincibleTimer = 0;
      if (param1)
      {
        class_7.method_1("--------- Always Invincible");
        this.invincibleTimer = int.MIN_VALUE;
      }
      this.gameObj.var_105.playSound("powerup2.wav");
    }

    public function pauseAfterMiniboss():void
    {
      this.isWalking = false;
      this.gameObj.var_108.stopActionControls = true;
      this.isPausingAfterMiniboss = true;
      this.gameObj.var_105.endMusic();
    }

    public function beatMiniboss():void
    {
      this.dirx = 1;
      this.facingDir = 1;
      this.walkingDir = 1;
      this.isWalking = true;
      this.isFinishingLevel = true;
      this.isPausingAfterMiniboss = false;
      this.duck = false;
      this.gameObj.var_105.playSound("beatlevel.wav");
    }

    public function finishLevel(param1:String = "cage"):void
    {
      // TODO alternate win location?
      this.gameObj.var_108.stopActionControls = true;
      this.isFinishingLevel = true;
      this.isWalking = false;
      this.finishType = param1;
      this.isGliding = false;
      this.isGroundPounding = false;
      if (param1 != "fake")
      {
        this.gameObj.var_105.playTrack("", int.MAX_VALUE);
        this.gameObj.var_105.playSound("papalouie2_fanfare.wav");
      }
      class_7.method_1("-- FINISH LEVEL: " + param1);
      if (param1 != "fake")
      {
        this.gameObj.var_112.recordCompletionTime(this.gameObj.var_108.gameplayTimer);
        this.gameObj.var_112.checkCustomChallenges();
      }
    }
    public function teleportTo(param1:Number, param2:Number):void
    {
      var _loc3_:Number = this.gameObj.var_103.tileWidth;
      this.x = param1;
      this.y = param2;
      this.xtile = Math.floor(param1 / _loc3_);
      this.ytile = Math.floor(param2 / _loc3_);
      this.jump = false;
      this.jumpspeed = 0;
      this.lastSafeX = this.xtile;
      this.lastSafeY = this.ytile;
      this.gameObj.var_119.adjustCamera(this, true);
    }
    public function cancelAttack():void
    {
      this.isAttacking = false;
      this.canAttack = true;
    }

    public function addWeapon(param1:String, param2:Number = -1, param3:Number = -1):void
    {
    }

    public function dropWeapon():void
    {
    }

    public function usingGun():Boolean
    {
      return false;
    }

    public function usingPowerTool():Boolean
    {
      return false;
    }

    public function getWeaponSheetName():String
    {
      return null;
    }

    public function getWeaponName():String
    {
      return null;
    }

    public function checkIfOnDoor():void
    {
      var _loc2_:* = this.gameObj.var_114.getTileProperty(this.xtile, this.ytile, "door");
      if (_loc2_ != false && _loc2_ != null && !this.isDead)
      {
        this.waitToEnterDoor = true;
        this.doorDirX = _loc2_[4];
        this.doorDirY = _loc2_[5];
        this.doorXtile = this.xtile;
        this.doorYtile = this.ytile;
      }
      else if (this.gameObj.var_114.isWithinBounds(this.xtile, this.ytile))
      {
        this.waitToEnterDoor = false;
      }
    }

    public function checkGoingThroughDoor(param1:Number, param2:Number):void
    {
      if (this.waitToEnterDoor && !this.gameObj.var_103.isTransitioningIn)
      {
        if (param1 == this.doorDirX && param2 == this.doorDirY)
        {
          this.enterDoor(this.doorXtile, this.doorYtile);
        }
      }
    }

    public function enterDoor(param1:Number, param2:Number):void
    {
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:Number = NaN;
      var _loc8_:Number = NaN;
      var _loc9_:Number = NaN;
      var _loc10_:Number = NaN;
      var _loc4_:* = gameObj.var_114.getTileProperty(param1, param2, "door");
      if (_loc4_ != false)
      {
        _loc5_ = _loc4_[0] - 1;
        _loc6_ = Number(_loc4_[1]);
        _loc7_ = Number(_loc4_[2]);
        _loc8_ = Number(_loc4_[3]);
        _loc9_ = Number(_loc4_[4]);
        _loc10_ = Number(_loc4_[5]);
        this.cancelAttack();
        if (_loc10_ == -1)
        {
          this.jump = true;
          this.jumpspeed = this.jumpstart;
        }
        else if (_loc10_ == 1)
        {
          this.jump = false;
        }
        else
        {
          this.jump = false;
        }
        this.gameObj.var_108.travelThroughDoor(_loc5_, _loc6_, _loc7_, _loc8_, _loc9_, _loc10_);
      }
    }

    public function canFudgeJump():Boolean
    {
      if (this.gameObj.var_108.gameplayTimer < this.lastSafeTime + this.lastSafeTimeBuffer && !this.duck && !this.isCrawling && !this.isDucking && (!this.jump || this.jump && this.jumpspeed >= 0))
      {
        return true;
      }
      return false;
    }

    public function getCheesed():void
    {
      var _loc3_:* = undefined;
      var _loc2_:EffectManager = this.gameObj.var_104;
      if (!this.isCrawling)
      {
        this.cancelAttack();
        if (this.isClimbingLadder)
        {
          this.jump = true;
        }
        else if (this.isSliding)
        {
          this.jump = true;
          this.jumpspeed = -6;
        }
        this.jumpspeed = 0;
        this.isGliding = false;
        this.isGroundPounding = false;
        this.isWallJumping = false;
        this.canAutoWallJump = false;
        this.isWallSliding = false;
        this.isDoubleJumping = false;
        this.isClimbingLadder = false;
        this.isSliding = false;
        this.isCheesed = true;
        if (this.cheesedFXID == -1)
        {
          this.cheesedFXID = _loc2_.addEffect(this.x, this.y, "StuckCheeseEffect", "", true);
        }
        else
        {
          _loc3_ = _loc2_.getEffect(this.cheesedFXID);
          if (_loc3_ != null)
          {
            _loc3_.refillCheese();
          }
        }
        this.gameObj.var_105.playSound("getcheesed.mp3");
      }
    }

    public function removeCheese():void
    {
      var _loc2_:EffectManager = this.gameObj.var_104;
      if (this.isCheesed)
      {
        if (this.jump)
        {
          this.jumpspeed = this.jumpstart + 2;
        }
        this.isCheesed = false;
        if (this.cheesedFXID != -1)
        {
          try
          {
            _loc2_.removeEffect(this.cheesedFXID);
          }
          catch (err:Error)
          {
          }
        }
        this.cheesedFXID = -1;
      }
    }

    public function jumpCheesed():void
    {
      var _loc2_:EffectManager = this.gameObj.var_104;
      var _loc3_:* = _loc2_.getEffect(this.cheesedFXID);
      if (_loc3_ != null)
      {
        _loc3_.playerJumped();
      }
    }

    override public function destroy():void
    {
      if (this.whichObjectGrabbed != null)
      {
        this.whichObjectGrabbed = null;
      }
      if (this.whichObjectRiding != null)
      {
        this.whichObjectRiding = null;
      }
      try
      {
        if (this.slideSound != null)
        {
          this.slideSound.stop();
          this.slideSound = null;
        }
      }
      catch (err:Error)
      {
      }
      this.stopTrainSound();
      super.destroy();
    }

    public function startTrainSound():void
    {
      if (this.gameObj.var_109.isOnTrain())
      {
        this.trainSound = this.gameObj.var_105.playSound("train_tracks.wav", true);
      }
      else if (this.gameObj.var_109.currentLevel == 11)
      {
        this.trainSound = this.gameObj.var_105.playSound("river_loop", true, 0.5);
      }
    }

    public function stopTrainSound():void
    {
      if (this.gameObj.var_109.isOnTrain() || this.gameObj.var_109.currentLevel == 11)
      {
        try
        {
          this.trainSound.stop();
          this.trainSound = null;
        }
        catch (err:Error)
        {
        }
      }
      else
      {
        try
        {
          if (this.trainSound != null)
          {
            this.trainSound.stop();
            this.trainSound = null;
          }
        }
        catch (err:Error)
        {
        }
      }
    }
  }
}
