package papaGame.events
{
  import flash.display.*;
  import flash.events.*;
  import flash.system.System;
  import flash.ui.Keyboard;
  import flash.utils.getTimer;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.*;
  import papaGame.display.*;
  import papaGame.managers.*;
  import papaGame.models.*;
  import papaGame.models.characters.*;

  public class GameControls
  {

    public var gameObj:class_5;
    public var playerObj:PlayerChar;
    public var camObj:GameCam;
    public var displayObj:GameDisplay;
    public var stopControls:Boolean = false;
    public var stopHurtControls:Boolean = false;
    public var stopActionControls:Boolean = false;
    public var stopCycle:Boolean = false;
    public var cameraPanTargetX:Number;
    public var cameraPanTargetY:Number;
    public var cameraPanID:Number;
    public var cameraPanType:*;
    public var cameraPan:Boolean = false;
    public var playerIsDead:Boolean = false;
    public var deadPlayer:PlayerChar;
    public var hudBorder:Number = 326;
    public var cameraAnchor:* = 0;
    public var overrideKeyInput:Boolean = false;
    public var gameplayTimer:Number = 0;
    public var currentLevelTimer:Number = 0;
    public var shiftIsDown:Boolean = false;
    public var keyPressedJump:Boolean = false;
    public var keyPressedAction:Boolean = false;
    public var keyPressedLeft:Boolean = false;
    public var keyPressedRight:Boolean = false;
    public var keyPressedUp:Boolean = false;
    public var keyPressedDown:Boolean = false;
    public var coopKeyPressedJump:Boolean = false;
    public var coopKeyPressedAction:Boolean = false;
    public var coopKeyPressedLeft:Boolean = false;
    public var coopKeyPressedRight:Boolean = false;
    public var coopKeyPressedUp:Boolean = false;
    public var coopKeyPressedDown:Boolean = false;
    public var canPressTab:Boolean = true;
    public var keysArray:Array = [];
    public var releasedArrow:Boolean = false;
    public var pressedArrow:Boolean = false;
    public var releasedArrowDirection:Number = 1;
    public var sendQueue:Array = [];
    public var lastCycleTime:Number = 0;
    public var speedCheckTimer:Number = -60;
    public var speedCheckTimerMax:Number = 10;
    public var isCaveIn:Boolean = false;
    public var keyPause:Number = 13;
    public var bonusTimer:Number = 0;
    public var bonusTimerMax:Number = 2700;
    public var debugMode:Number = 1;
    public var travelingThroughDoor:Boolean = false;
    public var doorDirX:Number = 0;
    public var doorDirY:Number = 0;
    public var doorRoomID:Number = 0;
    public var doorDoorID:Number = 0;
    public var doorXoffset:Number = 0;
    public var doorYoffset:Number = 0;
    public var isPaused:Boolean = false;
    public var isShowingPopup:Boolean = false;

    public function GameControls(param1:class_5)
    {
      super();
      this.gameObj = param1;
      this.playerObj = this.gameObj.playerObj;
      this.camObj = this.gameObj.var_119;
      this.displayObj = this.gameObj.var_103;
    }

    public function setupControls():void
    {
      this.gameplayTimer = 0;
      this.currentLevelTimer = 0;
      this.gameObj.stage.focus = this.gameObj.stage;
      this.gameObj.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownListener);
      this.gameObj.stage.addEventListener(KeyboardEvent.KEY_UP, this.keyUpListener);
    }

    public function resetKeyFocus():void
    {
      this.gameObj.stage.focus = this.gameObj.stage;
    }

    public function setupCycleCode():void
    {
      if (!this.gameObj.hasEventListener(Event.ENTER_FRAME))
      {
        this.gameObj.addEventListener(Event.ENTER_FRAME, this.detectKeys);
      }
      this.stopCycle = false;
      this.stopControls = false;
      this.stopActionControls = false;
    }

    public function destroy():void
    {
      this.gameObj.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.keyDownListener);
      this.gameObj.stage.removeEventListener(KeyboardEvent.KEY_UP, this.keyUpListener);
      this.gameObj.removeEventListener(Event.ENTER_FRAME, this.detectKeys);
    }

    public function convertToRadians(param1:Number):Number
    {
      return param1 * (Math.PI / 180);
    }

    public function convertToDegrees(param1:Number):Number
    {
      return param1 * (180 / Math.PI);
    }

    public function keyDownListener(param1:KeyboardEvent):void
    {
      var _loc3_:PlayerChar = this.playerObj;
      var _loc4_:UserData = this.gameObj.var_106;
      if (param1.keyCode == Keyboard.SHIFT)
      {
        this.shiftIsDown = true;
      }
      if (!this.overrideKeyInput)
      {
        if (param1.keyCode == _loc4_.keyCodeJump)
        {
          if (!this.keyPressedJump)
          {
            this.keyPressedJump = true;
          }
        }
        if (param1.keyCode == _loc4_.keyCodeAttack)
        {
          if (!this.keyPressedAction)
          {
            this.keyPressedAction = true;
          }
        }
        else if (param1.keyCode == _loc4_.keyCodeLeft)
        {
          if (!this.keyPressedLeft)
          {
            this.keyPressedLeft = true;
          }
          this.jumpPlayerOnLadder();
        }
        else if (param1.keyCode == _loc4_.keyCodeRight)
        {
          if (!this.keyPressedRight)
          {
            this.keyPressedRight = true;
          }
          this.jumpPlayerOnLadder();
        }
        else if (param1.keyCode == _loc4_.keyCodeUp)
        {
          if (!this.keyPressedUp)
          {
            this.keyPressedUp = true;
          }
        }
        else if (param1.keyCode == _loc4_.keyCodeDown)
        {
          if (!this.keyPressedDown)
          {
            this.keyPressedDown = true;
          }
        }
      }
      else if (this.overrideKeyInput)
      {
      }
    }

    public function keyUpListener(param1:KeyboardEvent = null, param2:Number = -1):void
    {
      var _loc4_:PlayerChar = this.playerObj;
      var _loc5_:UserData = this.gameObj.var_106;
      var _loc7_:Number = 0;
      if (param1)
      {
        _loc7_ = param1.keyCode;
        if (param1.keyCode == Keyboard.SHIFT)
        {
          this.shiftIsDown = false;
        }
      }
      else if (param2 > -1)
      {
        _loc7_ = param2;
      }
      if (_loc7_ == _loc5_.keyCodeJump)
      {
        if (this.keyPressedJump)
        {
          this.keyPressedJump = false;
        }
      }
      if (_loc7_ == _loc5_.keyCodeAttack)
      {
        if (this.keyPressedAction)
        {
          this.keyPressedAction = false;
        }
      }
      else if (_loc7_ == _loc5_.keyCodeLeft)
      {
        if (this.keyPressedLeft)
        {
          this.keyPressedLeft = false;
        }
      }
      else if (_loc7_ == _loc5_.keyCodeRight)
      {
        if (this.keyPressedRight)
        {
          this.keyPressedRight = false;
        }
      }
      else if (_loc7_ == _loc5_.keyCodeUp)
      {
        if (this.keyPressedUp)
        {
          this.keyPressedUp = false;
        }
      }
      else if (_loc7_ == _loc5_.keyCodeDown)
      {
        if (this.keyPressedDown)
        {
          this.keyPressedDown = false;
        }
      }
    }

    public function resetKeys():void
    {
      this.keyPressedAction = false;
      this.keyPressedJump = false;
      this.keyPressedLeft = false;
      this.keyPressedRight = false;
      this.keyPressedUp = false;
      this.keyPressedDown = false;
    }

    public function jumpPlayerOnLadder():void
    {
      var _loc2_:PlayerChar = this.gameObj.playerObj;
      if (_loc2_.isClimbingLadder)
      {
        _loc2_.isClimbingLadder = false;
        _loc2_.jump = true;
        _loc2_.jumpspeed = -6;
      }
    }

    public function travelThroughDoor(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number):void
    {
      this.doorRoomID = param1;
      this.doorDoorID = param2;
      this.doorXoffset = param3;
      this.doorYoffset = param4;
      this.doorDirX = param5;
      this.doorDirY = param6;
      this.gameObj.var_119.unsetCameraForceScrolling();
      this.travelingThroughDoor = true;
      this.gameObj.var_103.startTransition("out");
      this.gameObj.var_108.stopCycle = true;
    }

    public function setCameraPan(param1:Number, param2:Number, param3:*, param4:Number):void
    {
      var _loc6_:GameCam = this.camObj;
      class_7.method_1("SET CAMERA PAN: " + param1 + ", " + param2 + ", " + param3 + ", " + param4);
      // this.cameraPanTargetX = param1;
      // this.cameraPanTargetY = param2;
      // this.cameraPanID = param4;
      // this.cameraPanType = param3;
      // this.cameraPan = true;
      // this.stopCycle = false;
      // this.stopControls = false;
      _loc6_.currstartdelay = 0;
      _loc6_.currenddelay = 0;
      if (param3 != "player" && _loc6_.prepanx == 0 && _loc6_.prepany == 0)
      {
        _loc6_.prepanx = _loc6_.x;
        _loc6_.prepany = _loc6_.y;
      }
    }

    public function playerHasDied(param1:PlayerChar):void
    {
    }

    public function finishCameraPan():void
    {
      var _loc2_:class_5 = this.gameObj;
      var _loc3_:GameCam = this.camObj;
      var _loc4_:* = this.cameraPanType;
      var _loc5_:Number = this.cameraPanID;
      class_7.method_1("FINISH CAMERA PAN");
      if (_loc4_ == "player")
      {
        this.stopCycle = false;
        this.stopControls = false;
        this.cameraPan = false;
        _loc3_.prepanx = 0;
        _loc3_.prepany = 0;
      }
      else if (_loc4_ == 1)
      {
        _loc2_.var_111.stopCameraPan(_loc5_);
      }
      else if (_loc4_ == 2)
      {
        _loc2_.var_110.stopCameraPan(_loc5_);
      }
    }

    public function setCameraAnchor(param1:*):void
    {
      var _loc3_:GameCam = this.camObj;
      if (!param1 || param1 == 0 || param1 == undefined)
      {
        this.cameraAnchor = 0;
      }
      else
      {
        this.cameraAnchor = param1;
      }
      _loc3_.prepanx = 0;
      _loc3_.prepany = 0;
    }

    public function adjustFramerate(param1:Number):void
    {
      var _loc3_:String = String(param1 + " fps");
      _loc3_ += "  |  " + String(Math.round(System.totalMemory / 1024 / 1024)) + " MB";
      this.gameObj.var_115.updateMessageFPS(_loc3_);
    }

    public function pauseGame():void
    {
      this.isPaused = true;
      this.gameObj.var_105.muteSound(false);
      try
      {
        this.gameObj.var_115.interfaceClip.pausedMC.visible = true;
      }
      catch (err:Error)
      {
      }
    }

    public function resumeGame(param1:Boolean = false):void
    {
      this.isPaused = false;
      if (this.gameObj.var_105.isMute == false)
      {
        this.gameObj.var_105.unmuteSound(false);
      }
      if (param1)
      {
        try
        {
          this.gameObj.var_111.updateTrainingSigns();
        }
        catch (err:Error)
        {
        }
      }
      try
      {
        this.gameObj.var_115.interfaceClip.pausedMC.visible = false;
      }
      catch (err:Error)
      {
      }
    }

    public function detectKeys(param1:Event):void
    {
      var _loc17_:CustomerChar = null;
      var _loc18_:* = undefined;
      var _loc19_:GameObject = null;
      var _loc2_:GameControls = this;
      var _loc3_:Number = getTimer();
      var _loc4_:Number = _loc3_;
      var _loc5_:Number = _loc4_ - _loc2_.lastCycleTime;
      var _loc6_:Number = Math.round(1000 / _loc5_);
      _loc2_.adjustFramerate(_loc6_);
      _loc2_.lastCycleTime = _loc4_;
      var _loc7_:class_5 = _loc2_.gameObj;
      var _loc8_:PlayerChar = _loc2_.playerObj;
      var _loc9_:GameCam = _loc2_.camObj;
      var _loc10_:GameDisplay = _loc2_.displayObj;
      var _loc11_:ItemManager = _loc2_.gameObj.var_120;
      var _loc12_:EnemyManager = _loc2_.gameObj.var_110;
      var _loc13_:EffectManager = _loc2_.gameObj.var_104;
      var _loc14_:ObjectManager = _loc2_.gameObj.var_111;
      var _loc15_:BulletManager = _loc2_.gameObj.var_116;
      var _loc16_:Boolean = _loc8_.jump;
      if (!_loc2_.isPaused && !_loc2_.isShowingPopup)
      {
        if (!_loc2_.stopCycle)
        {
          if (!_loc8_.isFinishingLevel)
          {
            ++_loc2_.gameplayTimer;
            ++_loc2_.currentLevelTimer;
          }
          if (!_loc8_.isPausingAfterMiniboss && !_loc8_.isFinishingLevel)
          {
            _loc7_.var_106.timeBonus.addValue(-1);
            _loc7_.var_106.levelTimePlayed.addValue(1);
          }
          if (_loc8_.isShoved && (_loc8_.walkingDir == 1 && this.keyPressedRight || _loc8_.walkingDir == -1 && this.keyPressedLeft))
          {
            _loc8_.isShoved = false;
            _loc8_.walkingDir = _loc8_.facingDir;
          }
          if (!_loc2_.stopControls && !_loc2_.stopHurtControls && !_loc2_.stopActionControls)
          {
            _loc2_.keyCheckPlayer(CustomerChar(_loc8_));
          }
          if (_loc8_.jump)
          {
            _loc8_.duck = false;
            _loc8_.isDucking = false;
            _loc8_.isCrawling = false;
            if (_loc8_.jumpspeed < 0)
            {
              _loc8_.isClimbingLadder = false;
            }
            if (_loc8_.isDead && _loc8_.isRidingElevator)
            {
              _loc8_.jumpChar(false);
            }
            else
            {
              _loc8_.jumpChar();
              if (_loc8_.isGroundPounding)
              {
                _loc8_.updateObject();
                _loc8_.jumpChar();
              }
            }
          }
          _loc17_ = CustomerChar(_loc8_);
          if (_loc16_ && !_loc17_.jump && !_loc17_.isWalking && _loc17_.skidSpeed != 0 && !_loc17_.isHit)
          {
            _loc17_.skidSpeed = 0;
          }
          if (!_loc17_.isWalking && _loc17_.jump && _loc17_.skidSpeed != 0 && !_loc17_.isHit)
          {
            _loc17_.skidSpeed = 0;
          }
          if (_loc16_ && !_loc8_.jump && !_loc8_.isHit)
          {
            _loc8_.walkingDir = _loc8_.facingDir;
            _loc8_.isTurning = false;
            if (_loc8_.speed < 0)
            {
              _loc8_.speed *= -1;
            }
            if (_loc17_.skidSpeed > _loc17_.speed)
            {
              _loc17_.skidSpeed = _loc17_.speed;
            }
          }
          if (_loc8_.triggerjumpx)
          {
            _loc8_.moveChar(_loc8_.walkingDir, 0, 0);
          }
          if (_loc8_.isDead && _loc8_.jump)
          {
            if (_loc8_.fellOffTrain)
            {
              _loc8_.setSpeed(30);
              _loc8_.moveChar(_loc8_.walkingDir, 0, 0, false, false, false);
            }
            else if (_loc8_.isRidingElevator)
            {
              _loc8_.setSpeed(_loc8_.walkspeed);
              _loc8_.moveChar(_loc8_.walkingDir, 0, 0, false, false, false);
            }
            else
            {
              _loc8_.setSpeed(_loc8_.walkspeed);
              _loc8_.moveChar(_loc8_.walkingDir, 0, 0);
            }
          }
          if (!_loc8_.isDead && (_loc8_.isHit || _loc8_.isShoved))
          {
            if (_loc8_.speed > 0)
            {
              _loc8_.moveChar(_loc8_.walkingDir, 0, 0);
            }
          }
          _loc8_.updateObject();
          _loc11_.processItems();
          _loc15_.processBullets();
          _loc12_.processEnemies();
          _loc13_.processEffects();
          _loc14_.processObjects();
          _loc18_ = _loc2_.cameraAnchor;
          if (_loc18_ == 0)
          {
            _loc18_ = _loc8_;
          }
          _loc9_.adjustCamera(_loc18_);
          _loc7_.var_115.updateTimer();
          _loc10_.redrawScreen();
        }
        else if (!this.playerIsDead)
        {
          if (_loc2_.cameraPan)
          {
            if (_loc2_.cameraPanType == 1)
            {
              _loc19_ = _loc14_.getObject(_loc2_.cameraPanID, 0);
              if (_loc19_ != null)
              {
                _loc19_.updateObject();
              }
            }
            else if (_loc2_.cameraPanType == 2)
            {
              class_7.error("ERROR --- Camera Pan to ENEMY not supported.");
            }
            _loc7_.var_104.processEffects();
            _loc9_.panCamera(_loc2_.cameraPanTargetX, _loc2_.cameraPanTargetY, _loc2_.cameraPanType);
            _loc10_.redrawScreen();
          }
          else if (_loc2_.displayObj.isTransitioningIn || _loc2_.displayObj.isTransitionOut || _loc2_.displayObj.deadIrisMC != null)
          {
            _loc2_.displayObj.redrawScreen();
          }
        }
      }
      if (!_loc2_.stopCycle && _loc8_.isDead && _loc8_.isRidingElevator && _loc8_.y - 100 > _loc10_.currentYcoord + _loc10_.screenPxHeight)
      {
        class_7.method_1("Off-Screen after getting killed on the elevator. RESET!");
        _loc2_.gameObj.var_107.api.method_100("Died", _loc2_.gameObj.var_109.currentLevel + 1);
        _loc2_.gameObj.var_105.endMusic();
        _loc2_.stopCycle = true;
        _loc2_.gameObj.var_103.startMainIrisOut();
      }
    }

    public function keyCheckPlayer(param1:CustomerChar):void
    {
      var _loc4_:Boolean = false;
      var _loc5_:Boolean = false;
      var _loc6_:Boolean = false;
      var _loc7_:Boolean = false;
      var _loc8_:Boolean = false;
      var _loc9_:Boolean = false;
      var _loc10_:Boolean = false;
      var _loc3_:class_5 = this.gameObj;
      _loc4_ = this.keyPressedAction;
      _loc5_ = this.keyPressedJump;
      _loc6_ = this.keyPressedLeft;
      _loc7_ = this.keyPressedRight;
      _loc9_ = this.keyPressedUp;
      _loc8_ = this.keyPressedDown;
      param1.lastx = param1.x;
      param1.lasty = param1.y;
      param1.lastOnSlope = param1.onSlope;
      if (param1.slopedIntoCeiling == 0)
      {
        this.jumpPlayer(param1);
      }
      if (_loc8_ && !param1.isClimbingLadder && !param1.isCheesed && !param1.jump && !param1.isCrawling && !param1.isRidingObject && !param1.isRidingElevator && !_loc6_ && !_loc7_ && param1.canPressDown)
      {
        if (param1.isCarryingObject)
        {
          if (!param1.isThrowingObject && !param1.isGrabbingObject)
          {
            param1.throwCarriedObject(0, true);
            param1.isThrowingObject = false;
          }
        }
        else if (!param1.checkForGrabbingObjects())
        {
          param1.startDucking();
        }
        param1.canPressDown = false;
      }
      else if (_loc8_ && param1.jump && !param1.isClimbingLadder && !param1.isCheesed && !param1.isGroundPounding && !param1.isRidingObject && !param1.isRidingElevator && param1.canPressDown && param1.skillType == CustomerData.SKILL_POUND)
      {
        param1.startPounding();
        param1.canPressDown = false;
      }
      else if (!_loc8_ || param1.isCrawling)
      {
        if (param1.duck)
        {
          if (!param1.isInsideCrawlGap() && !param1.isHit)
          {
            if (param1.isCrawling)
            {
            }
            param1.duck = false;
            param1.isTurning = false;
            param1.isCrawling = false;
          }
        }
        param1.canPressDown = true;
      }
      if (!param1.isAttacking && !param1.isCheesed && !param1.isWallSliding && !param1.isPushingObject && !param1.isSliding && !param1.isGliding && !param1.isGroundPounding && (!param1.jump || param1.jumpspeed >= 0))
      {
        if (_loc9_ && param1.checkIfOnLadder(-1))
        {
          if (!param1.isClimbingLadder)
          {
            _loc3_.var_105.playSound("ladder_grab.wav");
          }
          param1.isClimbingLadder = true;
          param1.climbDir = -1;
          if (param1.facingDir == 1)
          {
            param1.x = param1.xtile * param1.gameObj.var_103.tileWidth + 12;
          }
          else
          {
            param1.x = (param1.xtile + 1) * param1.gameObj.var_103.tileWidth - 12;
          }
          if (param1.jump && param1.jumpspeed >= 0)
          {
            param1.jump = false;
          }
          param1.canPressDoubleJump = false;
        }
        else if (_loc8_ && (param1.checkIfOnLadder(1) || param1.checkIfLadderBelow()))
        {
          if (param1.checkIfLadderBelow() && !param1.checkIfOnLadder(1))
          {
            param1.y += 18;
            param1.ytile = Math.floor(param1.y / param1.gameObj.var_103.tileWidth);
          }
          if (!param1.isClimbingLadder)
          {
            _loc3_.var_105.playSound("ladder_grab.wav");
          }
          param1.isClimbingLadder = true;
          param1.climbDir = 1;
          if (param1.facingDir == 1)
          {
            param1.x = param1.xtile * param1.gameObj.var_103.tileWidth + 12;
          }
          else
          {
            param1.x = (param1.xtile + 1) * param1.gameObj.var_103.tileWidth - 12;
          }
          if (param1.jump && param1.jumpspeed >= 0)
          {
            param1.jump = false;
          }
        }
        else if (param1.isClimbingLadder && !_loc8_ && !_loc9_)
        {
          param1.climbDir = 0;
        }
      }
      if (param1.isClimbingLadder && param1.climbDir != 0)
      {
        param1.moveChar(0, param1.climbDir, 0, false, false, true, param1.climbSpeed);
        if (param1.isClimbingLadder && param1.checkIfOnLadder(param1.climbDir) == false)
        {
          param1.isClimbingLadder = false;
          param1.jump = true;
          param1.jumpspeed = -12;
        }
      }
      if (_loc6_ && param1.canPressLeft && param1.slopedIntoCeiling != -1)
      {
        if (param1.isInRiver)
        {
          param1.isWalking = false;
        }
        else if (param1.isRidingObject)
        {
          param1.isWalking = false;
        }
        else if (param1.isSliding)
        {
          param1.isWalking = false;
        }
        else if (param1.isCheesed)
        {
          param1.isWalking = false;
        }
        else if (param1.isGroundPounding)
        {
          param1.isWalking = false;
        }
        else if (param1.isClimbingLadder)
        {
          param1.isWalking = false;
        }
        else if (param1.isAttackLunging)
        {
          param1.isWalking = false;
        }
        else if (param1.facingDir == 1 && param1.isWallSliding)
        {
          if (param1.checkIfAgainstWall(1) && param1.canArrowWallJump)
          {
            param1.isWalking = true;
            param1.startWallJumping(-1, "left");
            if (param1.whichJumpSound == 1)
            {
              _loc3_.var_105.playSound("jump1");
              param1.whichJumpSound = 2;
            }
            else
            {
              _loc3_.var_105.playSound("jump2");
              param1.whichJumpSound = 1;
            }
          }
          else
          {
            param1.isWalking = false;
          }
        }
        else if (param1.isWallJumping)
        {
          param1.isWalking = false;
        }
        else if (param1.isDucking && !param1.duck)
        {
          param1.walkingDir = -1;
          param1.facingDir = -1;
          param1.isWalking = false;
        }
        else if (param1.duck && (param1.skillType != CustomerData.SKILL_CRAWL || param1.isCrawling == false) || param1.isGrabbingObject || param1.isRidingElevator)
        {
          param1.walkingDir = -1;
          param1.facingDir = -1;
          param1.isWalking = false;
          if (param1.duck && param1.skillType == CustomerData.SKILL_CRAWL && !param1.isCrawling && param1.isInsideCrawlGap())
          {
            class_7.method_1("You slid into a gap, you can crawl now.");
            if (!param1.isCrawling)
            {
              _loc3_.var_105.playSound("crawlgap.wav");
            }
            param1.isCrawling = true;
          }
        }
        else if (param1.isAttacking && param1.facingDir == 1)
        {
          if (!(param1.usingGun() || param1.usingPowerTool()))
          {
            param1.cancelAttack();
          }
          param1.setSpeed(param1.walkspeed);
          param1.walkingDir = -1;
          param1.facingDir = -1;
          _loc10_ = param1.moveChar(-1, 0, 0);
        }
        else if (param1.isAttacking && param1.facingDir == -1 && !param1.canDealDamage && !param1.jump)
        {
          param1.walkingDir = -1;
          param1.facingDir = -1;
          param1.isWalking = false;
          param1.canPressLeft = false;
          param1.postAttackDelayTimer = 0;
        }
        else if (param1.jump && param1.isWalking)
        {
          if (param1.walkingDir == -1)
          {
            if (param1.speed < param1.walkspeed)
            {
              param1.speed += 1;
              if (param1.speed > param1.walkspeed)
              {
                param1.setSpeed(param1.walkspeed);
              }
            }
            if (param1.speed > param1.walkspeed)
            {
              --param1.speed;
            }
          }
          else if (param1.walkingDir == 1)
          {
            if (param1.speed > param1.walkspeed * -1)
            {
              --param1.speed;
              if (param1.speed < param1.walkspeed * -1)
              {
                param1.setSpeed(param1.walkspeed * -1);
              }
            }
          }
          param1.facingDir = -1;
          _loc10_ = param1.moveChar(param1.walkingDir, 0, 0);
        }
        else
        {
          if (param1.walkingDir == 1 && !param1.jump && !param1.isShoved)
          {
            param1.isTurning = true;
          }
          if (param1.speed > param1.walkspeed && param1.jump)
          {
            --param1.speed;
          }
          else
          {
            param1.setSpeed(param1.walkspeed);
          }
          param1.walkingDir = -1;
          param1.facingDir = -1;
          _loc10_ = param1.moveChar(-1, 0, 0);
        }
      }
      else if (_loc7_ && param1.canPressRight && param1.slopedIntoCeiling != 1)
      {
        if (param1.isInRiver)
        {
          param1.isWalking = false;
        }
        else if (param1.isSliding)
        {
          param1.isWalking = false;
        }
        else if (param1.isGroundPounding)
        {
          param1.isWalking = false;
        }
        else if (param1.isCheesed)
        {
          param1.isWalking = false;
        }
        else if (param1.isClimbingLadder)
        {
          param1.isWalking = false;
        }
        else if (param1.isAttackLunging)
        {
          param1.isWalking = false;
        }
        else if (param1.facingDir == -1 && param1.isWallSliding)
        {
          if (param1.checkIfAgainstWall(-1) && param1.canArrowWallJump)
          {
            param1.isWalking = true;
            param1.startWallJumping(1, "right");
            if (param1.whichJumpSound == 1)
            {
              _loc3_.var_105.playSound("jump1");
              param1.whichJumpSound = 2;
            }
            else
            {
              _loc3_.var_105.playSound("jump2");
              param1.whichJumpSound = 1;
            }
          }
          else
          {
            param1.isWalking = false;
          }
        }
        else if (param1.isWallJumping)
        {
          param1.isWalking = false;
        }
        else if (param1.isRidingObject)
        {
          param1.isWalking = false;
        }
        else if (param1.isDucking && !param1.duck)
        {
          param1.walkingDir = 1;
          param1.facingDir = 1;
          param1.isWalking = false;
        }
        else if (param1.duck && (param1.skillType != CustomerData.SKILL_CRAWL || param1.isCrawling == false) || param1.isGrabbingObject || param1.isRidingElevator)
        {
          param1.walkingDir = 1;
          param1.facingDir = 1;
          param1.isWalking = false;
          if (param1.duck && param1.skillType == CustomerData.SKILL_CRAWL && !param1.isCrawling && param1.isInsideCrawlGap())
          {
            class_7.method_1("You slid into a gap, you can crawl now.");
            if (!param1.isCrawling)
            {
              _loc3_.var_105.playSound("crawlgap.wav");
            }
            param1.isCrawling = true;
          }
        }
        else if (param1.isAttacking && param1.facingDir == -1)
        {
          if (!(param1.usingGun() || param1.usingPowerTool()))
          {
            param1.cancelAttack();
          }
          param1.setSpeed(param1.walkspeed);
          param1.walkingDir = 1;
          param1.facingDir = 1;
          _loc10_ = param1.moveChar(1, 0, 0);
        }
        else if (param1.isAttacking && param1.facingDir == 1 && !param1.canDealDamage && !param1.jump)
        {
          param1.walkingDir = 1;
          param1.facingDir = 1;
          param1.isWalking = false;
          param1.canPressRight = false;
          param1.postAttackDelayTimer = 0;
        }
        else if (param1.jump && param1.isWalking)
        {
          if (param1.walkingDir == 1)
          {
            if (param1.speed < param1.walkspeed)
            {
              param1.speed += 1;
              if (param1.speed > param1.walkspeed)
              {
                param1.setSpeed(param1.walkspeed);
              }
            }
            if (param1.speed > param1.walkspeed)
            {
              --param1.speed;
            }
          }
          else if (param1.walkingDir == -1)
          {
            if (param1.speed > param1.walkspeed * -1)
            {
              --param1.speed;
              if (param1.speed < param1.walkspeed * -1)
              {
                param1.setSpeed(param1.walkspeed * -1);
              }
            }
          }
          param1.facingDir = 1;
          _loc10_ = param1.moveChar(param1.walkingDir, 0, 0);
        }
        else
        {
          if (param1.walkingDir == -1 && !param1.jump && !param1.isShoved)
          {
            param1.isTurning = true;
          }
          if (param1.speed > param1.walkspeed && param1.jump)
          {
            --param1.speed;
          }
          else
          {
            param1.setSpeed(param1.walkspeed);
          }
          param1.walkingDir = 1;
          param1.facingDir = 1;
          _loc10_ = param1.moveChar(1, 0, 0);
        }
      }
      else
      {
        if (param1.speed < 0)
        {
          param1.speed *= -1;
          param1.walkingDir *= -1;
        }
        if (param1.jump && param1.isWalking && !param1.isGrabbing && !param1.isCheesed && !param1.isClimbingLadder && !param1.isRidingObject && !param1.isWallJumping && !param1.isSliding && !param1.isAttackLunging && param1.slopedIntoCeiling == 0)
        {
          if (param1.speed >= 2)
          {
            if (param1.speed > 2 && this.gameplayTimer % 2 == 0)
            {
              --param1.speed;
            }
            if (param1.skidSpeed > param1.speed)
            {
              param1.skidSpeed = param1.speed;
            }
            _loc10_ = param1.moveChar(param1.walkingDir, 0, 0);
          }
        }
        else if (!param1.jump && !param1.isShoved)
        {
          param1.isWalking = false;
        }
        else if (param1.isShoved && !this.keyPressedRight && !this.keyPressedLeft)
        {
          param1.isWalking = false;
        }
        if (param1.isShoved && param1.isAttacking && !param1.canDealDamage)
        {
          param1.isShoved = false;
          param1.postAttackDelayTimer = 0;
          param1.isWalking = false;
          if (param1.facingDir == 1)
          {
            param1.canPressRight = false;
            param1.canPressLeft = true;
          }
          else if (param1.facingDir == -1)
          {
            param1.canPressRight = true;
            param1.canPressLeft = false;
          }
        }
        if (param1.isSkidding && !param1.isGrabbing && !param1.isRidingObject && !param1.isCheesed && !param1.isClimbingLadder && !param1.isShoved && !param1.isSliding && param1.slopedIntoCeiling == 0 && !param1.onMovingTile)
        {
          param1.setSpeed(param1.useSkidSpeed);
          _loc10_ = param1.moveChar(param1.walkingDir, 0, 0);
        }
      }
      if (param1.isSliding && !param1.isGrabbing && !param1.isCheesed && !param1.isClimbingLadder && !param1.isRidingObject && !param1.isShoved)
      {
        param1.setSpeed(param1.slideSpeed);
        _loc10_ = param1.moveChar(param1.walkingDir, 0, 0);
      }
      if (param1.isAttackLunging && !param1.isClimbingLadder && !param1.isCheesed && !param1.isRidingObject && !param1.isShoved)
      {
        param1.setSpeed(param1.useLungeSpeed);
        _loc10_ = param1.moveChar(param1.lungeDirection, 0, 0);
      }
      if (_loc4_)
      {
        if (param1.isCarryingObject)
        {
          if (param1.canPressAction && !param1.isThrowingObject && !param1.isGrabbingObject)
          {
            param1.startThrowingObject();
            param1.canPressAction = false;
          }
        }
        else if (param1.canAttack && !param1.duck && !param1.isDucking && !param1.isCheesed && !param1.isClimbingLadder && !param1.isCarryingObject && !param1.isGrabbingObject && !param1.isThrowingObject && !param1.isSliding && !param1.isGroundPounding && !param1.isWallSliding && param1.canPressAction)
        {
          param1.startAttacking();
          param1.canPressAction = false;
        }
      }
      else if (!_loc4_ && !param1.canPressAction)
      {
        param1.canPressAction = true;
      }
    }

    public function jumpPlayer(param1:CustomerChar):void
    {
      var _loc5_:Boolean = false;
      var _loc6_:Boolean = false;
      var _loc7_:Number = NaN;
      var _loc8_:Number = NaN;
      var _loc9_:Number = NaN;
      var _loc10_:Boolean = false;
      var _loc11_:Boolean = false;
      var _loc2_:CustomerChar = CustomerChar(param1);
      var _loc4_:class_5 = this.gameObj;
      _loc5_ = this.keyPressedJump;
      _loc6_ = this.keyPressedDown;
      if ((_loc6_) && !_loc2_.jump && _loc2_.isGrabbing)
      {
        _loc2_.jump = true;
        _loc2_.jumpspeed = 2;
        _loc2_.jumpedFromSlope = _loc2_.onSlope;
        _loc2_.jumpedFromX = _loc2_.x;
        _loc2_.jumpedFromY = _loc2_.y;
        _loc7_ = Math.floor((_loc2_.y + _loc2_.height - 1 + 22) / _loc4_.var_103.tileWidth);
        _loc8_ = Math.floor((_loc2_.x - _loc2_.width) / _loc4_.var_103.tileWidth);
        _loc9_ = Math.floor((_loc2_.x + _loc2_.width * _loc2_.widthmultiplier - 1) / _loc4_.var_103.tileWidth);
        _loc10_ = Boolean(_loc4_.var_114.getTileProperty(_loc8_, _loc7_, "collision"));
        _loc11_ = Boolean(_loc4_.var_114.getTileProperty(_loc9_, _loc7_, "collision"));
        if (!_loc10_ && !_loc11_)
        {
          _loc2_.y += 22;
        }
        _loc2_.ytile = Math.floor(_loc2_.y / this.displayObj.tileWidth);
        _loc2_.gravity = _loc2_.normalgravity;
        _loc2_.duck = false;
        _loc2_.isDucking = false;
        _loc2_.isGrabbing = false;
        _loc2_.isStartingGrabbing = false;
        _loc2_.isWalking = false;
      }
      if (_loc5_ && (!_loc2_.jump || _loc2_.canFudgeJump() || _loc2_.skillType == CustomerData.SKILL_DOUBLEJUMP && !_loc2_.isDoubleJumping && !_loc2_.isCheesed && !_loc2_.isInQuicksand || _loc2_.skillType == CustomerData.SKILL_GLIDE && !_loc2_.isGliding && !_loc2_.isCheesed && !_loc2_.isInQuicksand) && !_loc2_.isGrabbingObject && (_loc2_.canPressJump || _loc2_.canPressDoubleJump && (_loc2_.skillType == CustomerData.SKILL_DOUBLEJUMP && !_loc2_.isDoubleJumping && !_loc2_.isCheesed && !_loc2_.isInQuicksand || _loc2_.skillType == CustomerData.SKILL_GLIDE && !_loc2_.isGliding && !_loc2_.isCheesed && !_loc2_.isInQuicksand)) && (!_loc2_.duck || (_loc2_.skillType != CustomerData.SKILL_CRAWL || _loc2_.isCrawling == false)) && !_loc2_.isRidingElevator && !_loc2_.isSliding && !_loc2_.isClimbingLadder && !_loc2_.checkIfOnLadder(-1) && (!_loc2_.isRidingObject || _loc2_.whichObjectRiding.canJumpFromRideable))
      {
        if (!(_loc6_ && (_loc2_.checkDropThruCloud() || _loc2_.isGrabbing || _loc2_.isRidingObject)))
        {
          if (!_loc2_.jump || _loc2_.canFudgeJump())
          {
            _loc2_.jump = true;
            _loc2_.jumpspeed = _loc2_.jumpstart;
            _loc2_.gravity = _loc2_.jumpgravity;
            _loc2_.isDoubleJumping = false;
            _loc2_.canPressDoubleJump = false;
            _loc2_.canPressWallJump = false;
          }
          else if (!_loc2_.isCheesed && !_loc2_.isInQuicksand && _loc2_.skillType == CustomerData.SKILL_DOUBLEJUMP && !_loc2_.isDoubleJumping && _loc2_.canPressDoubleJump && !_loc2_.didDoubleJump)
          {
            _loc2_.startDoubleJumping();
            _loc2_.canPressDoubleJump = false;
            _loc2_.didDoubleJump = true;
          }
          else if (!_loc2_.isCheesed && !_loc2_.isInQuicksand && _loc2_.skillType == CustomerData.SKILL_GLIDE && !_loc2_.isGliding && _loc2_.canPressDoubleJump && !_loc2_.didDoubleJump)
          {
            _loc2_.startGliding();
            _loc2_.canPressDoubleJump = false;
            _loc2_.didDoubleJump = true;
          }
          _loc2_.duck = false;
          _loc2_.isDucking = false;
          _loc2_.jumpedFromSlope = _loc2_.onSlope;
          _loc2_.jumpedFromX = _loc2_.x;
          _loc2_.jumpedFromY = _loc2_.y;
          if (_loc2_.isCheesed)
          {
            _loc2_.jumpspeed = -10;
            _loc2_.jumpCheesed();
          }
          else if (_loc2_.isInQuicksand)
          {
            _loc2_.jumpspeed = -16;
          }
          else if (_loc2_.isInRiver)
          {
            _loc2_.jumpspeed = -14;
          }
          if (!_loc2_.isGliding && !_loc2_.isCheesed && !_loc2_.isInQuicksand)
          {
            if (_loc2_.whichJumpSound == 1)
            {
              _loc4_.var_105.playSound("jump1");
              _loc2_.whichJumpSound = 2;
            }
            else
            {
              _loc4_.var_105.playSound("jump2");
              _loc2_.whichJumpSound = 1;
            }
          }
          else if (_loc2_.isCheesed || _loc2_.isInQuicksand)
          {
            _loc4_.var_105.playSound("jumpcheesed.wav");
          }
        }
        _loc2_.isGrabbing = false;
        _loc2_.isStartingGrabbing = false;
        _loc2_.canPressJump = false;
        _loc2_.lastSafeTime = 0;
        if (_loc2_.isRidingObject)
        {
          _loc2_.stopGrabRiding();
        }
      }
      else if (_loc5_ && _loc2_.jump && _loc2_.skillType == CustomerData.SKILL_WALLJUMP && _loc2_.checkIfAgainstWall() && !_loc2_.isGrabbingObject && _loc2_.canPressWallJump && (!_loc2_.isRidingObject || _loc2_.whichObjectRiding.canJumpFromRideable) && !_loc2_.isCheesed && !_loc2_.isInQuicksand)
      {
        if (_loc2_.checkIfOnLadder(-1) == false && (_loc2_.facingDir == 1 && _loc2_.checkIfAgainstWall(1) && _loc2_.isWallSliding || _loc2_.facingDir == -1 && _loc2_.checkIfAgainstWall(-1) && _loc2_.isWallSliding))
        {
          _loc2_.startWallJumping();
          if (_loc2_.whichJumpSound == 1)
          {
            _loc4_.var_105.playSound("jump1");
            _loc2_.whichJumpSound = 2;
          }
          else
          {
            _loc4_.var_105.playSound("jump2");
            _loc2_.whichJumpSound = 1;
          }
          _loc2_.canPressDoubleJump = false;
        }
      }
      else if (!_loc5_ && _loc2_.jump && _loc2_.jumpspeed < _loc2_.shortjump && !_loc2_.triggerjump && !_loc2_.isDoubleJumping && !_loc2_.isWallJumping && !_loc2_.isCheesed && !_loc2_.isInQuicksand)
      {
        _loc2_.jumpspeed = _loc2_.shortjump;
        _loc2_.canPressJump = true;
        if (!_loc2_.didDoubleJump)
        {
          _loc2_.canPressDoubleJump = true;
        }
        _loc2_.lastSafeTime = 0;
      }
      else if (!_loc5_ && !_loc2_.jump)
      {
        _loc2_.canPressJump = true;
        _loc2_.isDoubleJumping = false;
        _loc2_.didDoubleJump = false;
      }
      else if (!_loc5_ && _loc2_.jump && !_loc2_.didDoubleJump)
      {
        _loc2_.canPressDoubleJump = true;
      }
      if (!_loc5_ && _loc2_.isGliding)
      {
        _loc2_.isGliding = false;
      }
      if (_loc2_.canPressWallJump == false && !_loc5_)
      {
        _loc2_.canPressWallJump = true;
      }
      else if (_loc2_.canArrowWallJump == false)
      {
        if (_loc2_.lastWallJumpKey == "left" && !this.keyPressedLeft)
        {
          _loc2_.canArrowWallJump = true;
        }
        else if (_loc2_.lastWallJumpKey == "right" && !this.keyPressedRight)
        {
          _loc2_.canArrowWallJump = true;
        }
      }
    }
  }
}
