package papaGame.display
{
  import package_4.*;
  import papaGame.data.*;
  import papaGame.events.*;
  import papaGame.models.*;

  public class GameCam
  {

    public var gameObj:class_5;
    public var x:Number = 240;
    public var y:Number = 672;
    public var targetX:Number = 240;
    public var targetY:Number = 672;
    public var mouseLookX:Number = 240;
    public var mouseLookY:Number = 672;
    public var mouseTargetX:Number;
    public var mouseTargetY:Number;
    public var mouseRealX:Number;
    public var mouseRealY:Number;
    public var chasesteps:Number = 2;
    public var lockchasesteps:Number = 8;
    public var pansteps:Number = 8;
    public var prepanx:Number = 0;
    public var prepany:Number = 0;
    public var panstartdelay:Number = 15;
    public var currstartdelay:Number = 0;
    public var panenddelay:Number = 15;
    public var currenddelay:Number = 0;
    public var jiggle:Boolean = false;
    public var jiggleamount:Number = 0;
    public var jiggleduration:Number = 0;
    public var currentjiggle:Number = 0;
    public var lastjigglex:Number = 1;
    public var lastjiggley:Number = 1;
    public var jiggleTrainAmount:Number = 4;
    public var jiggleTrainDelay:Number = 0;
    public var jiggleTrainDelayMax:Number = 8;
    public var jiggleTrainDelayShort:Number = 8;
    public var jiggleTrainDelayLong:Number = 45;
    public var bargeCameraOffset:Number = 0;
    public var bargeCameraOffsetDirection:Number = -1;
    public var bargeCameraOffsetMin:Number = -8;
    public var bargeCameraOffsetSpeed:Number = 1;
    public var bargeTimeAtRest:Number = 0;
    public var bargeTimeAtRestMax:Number = 8;
    public var min_x:Number;
    public var max_x:Number;
    public var min_y:Number;
    public var max_y:Number;
    public var last_x:Number = 0;
    public var last_y:Number = 0;
    public var mouseRatioToScreen:Number = 4;
    public var screenbounds_offsetX:Number;
    public var screenbounds_offsetY:Number;
    public var screenbounds_minx:Number;
    public var screenbounds_maxx:Number;
    public var screenbounds_miny:Number;
    public var screenbounds_maxy:Number;
    public var mousePanSpeed:Number = 10;
    public var cameraOffset:Number = 0;
    public var maxCameraOffset:Number = 160;
    public var waitingInPanBoundsTime:Number = 0;
    public var waitingInPanBoundsTimeMax:Number = 3;
    public var lockedCamera:Boolean = false;
    public var wasLockedCamera:Boolean = false;
    public var lockStoppingPlayer:Boolean = false;
    public var lockTargetX:Number = 0;
    public var lockTargetY:Number = 0;
    public var forcedScrollingCamera:Boolean = false;
    public var forcedScrollingDirX:Number = 0;
    public var forcedScrollingDirY:Number = 0;
    public var forcedScrollingSpeed:Number = 1;

    public function GameCam(param1:class_5)
    {
      super();
      this.gameObj = param1;
      var _loc3_:GameDisplay = this.gameObj.var_103;
      _loc3_.getCamera(this);
    }

    public function setCameraJiggle(param1:Number, param2:Number):void
    {
      return;
      this.jiggle = true;
      this.jiggleamount = param1;
      this.jiggleduration = param2;
      this.currentjiggle = 0;
    }

    public function setCameraLock(param1:Number, param2:Number, param3:Boolean = true):void
    {
      return;

      var _loc5_:GameDisplay = this.gameObj.var_103;
      this.lockTargetX = (param1 + Math.floor(_loc5_.screenTileWidth / 2)) * _loc5_.tileWidth;
      this.lockTargetY = (param2 + Math.floor(_loc5_.screenTileHeight / 2)) * _loc5_.tileWidth;
      this.lockedCamera = true;
      if (param3)
      {
        this.lockStoppingPlayer = true;
        this.gameObj.var_108.stopActionControls = true;
        this.gameObj.playerObj.isWalking = false;
      }
    }

    public function setCameraForceScrolling(param1:Number = 0, param2:Number = 0, param3:Number = 1):void
    {
      return;

      this.forcedScrollingCamera = true;
      this.forcedScrollingDirX = param1;
      this.forcedScrollingDirY = param2;
      this.forcedScrollingSpeed = param3;
    }

    public function unsetCameraForceScrolling():void
    {
      this.forcedScrollingCamera = false;
    }

    public function unlockCamera():void
    {
      this.wasLockedCamera = true;
      this.lockedCamera = false;
    }

    public function jiggleCamera():void
    {
      return;

      var _loc1_:GameCam = this;
      var _loc2_:Boolean = _loc1_.gameObj.var_109.isOnTrain();
      var _loc3_:Boolean = _loc1_.gameObj.var_109.isOnBarge();
      ++_loc1_.currentjiggle;
      if (_loc1_.currentjiggle > _loc1_.jiggleduration)
      {
        _loc1_.jiggle = false;
      }
      var _loc4_:Number = _loc1_.jiggleamount - _loc1_.currentjiggle;
      _loc4_ = Math.max(1, _loc4_);
      if (!_loc1_.jiggle && _loc2_)
      {
        if (_loc1_.jiggleamount != 0)
        {
          --_loc1_.jiggleamount;
        }
        if (_loc1_.jiggleamount <= 0 - _loc1_.jiggleTrainAmount)
        {
          _loc1_.jiggleamount = _loc1_.jiggleTrainAmount;
          _loc4_ = _loc1_.jiggleamount;
        }
        else if (_loc1_.jiggleamount == 0)
        {
          _loc4_ = 0;
          ++_loc1_.jiggleTrainDelay;
          if (_loc1_.jiggleTrainDelay >= _loc1_.jiggleTrainDelayMax)
          {
            _loc1_.jiggleTrainDelay = 0;
            --_loc1_.jiggleamount;
            if (_loc1_.jiggleTrainDelayMax == _loc1_.jiggleTrainDelayShort)
            {
              _loc1_.jiggleTrainDelayMax = _loc1_.jiggleTrainDelayLong;
            }
            else
            {
              _loc1_.jiggleTrainDelayMax = _loc1_.jiggleTrainDelayShort;
            }
          }
        }
        else
        {
          _loc4_ = Math.abs(_loc1_.jiggleamount);
          if (_loc1_.jiggleamount < 0)
          {
            _loc1_.lastjiggley = -1;
          }
          else
          {
            _loc1_.lastjiggley = 1;
          }
        }
      }
      if (_loc1_.lastjiggley < 0)
      {
        _loc1_.y += _loc4_;
        _loc1_.lastjiggley = 1;
      }
      else
      {
        _loc1_.y -= _loc4_;
        _loc1_.lastjiggley = -1;
      }
      if (_loc1_.jiggle)
      {
        _loc1_.x += Math.floor(Math.random() * 3) - 1;
      }
    }

    public function setCameraBounds():void
    {
      return;

      var _loc2_:class_5 = this.gameObj;
      var _loc3_:DataManager = _loc2_.var_109;
      var _loc4_:GameDisplay = this.gameObj.var_103;
      var _loc5_:Number = _loc3_.currentScreenData.tileArray[0].length * _loc2_.var_103.tileWidth;
      var _loc6_:Number = _loc3_.currentScreenData.tileArray.length * _loc4_.tileWidth;
      this.min_x = 0 + (_loc4_.centerXtile - 1) * _loc4_.tileWidth;
      this.min_y = 0 + (_loc4_.centerYtile - 1) * _loc4_.tileWidth;
      this.max_x = _loc5_ - _loc4_.screen_Xoffset;
      this.max_y = _loc6_ - _loc4_.screen_Yoffset - _loc4_.tileWidth / 2;
      this.screenbounds_offsetX = 0;
      this.screenbounds_offsetY = 0;
      this.screenbounds_minx = 0 + this.screenbounds_offsetX;
      this.screenbounds_miny = 0 + this.screenbounds_offsetY;
      this.screenbounds_maxx = _loc2_.var_128.stageWidth - this.screenbounds_offsetX;
      this.screenbounds_maxy = _loc2_.var_128.stageHeight - this.screenbounds_offsetY;
      this.x = 240;
      this.y = 672;
      this.targetX = 240;
      this.targetY = 672;
      this.wasLockedCamera = false;
      _loc4_.defineScreenBounds();
    }

    public function offsetCamera(param1:Number = 0, param2:Number = 0):void
    {
      return;

      if (param1 != 0)
      {
        if (param1 == 1 && this.cameraOffset == 0)
        {
          this.cameraOffset = this.maxCameraOffset;
        }
        else if (param1 == 1 && this.cameraOffset < 0)
        {
          this.cameraOffset = 0;
        }
        else if (param1 == -1 && this.cameraOffset == 0)
        {
          this.cameraOffset = this.maxCameraOffset * -1;
        }
        else if (param1 == -1 && this.cameraOffset > 0)
        {
          this.cameraOffset = 0;
        }
      }
      else if (param2 != 0)
      {
        if (param2 == 1)
        {
          this.cameraOffset = this.maxCameraOffset * -1;
        }
        else if (param2 == 2)
        {
          this.cameraOffset = -90;
        }
        else if (param2 == 3)
        {
          this.cameraOffset = this.maxCameraOffset;
        }
      }
    }

    public function adjustCamera(param1:*, param2:Boolean = false):void
    {
      var _loc18_:Number = NaN;
      var _loc19_:Number = NaN;
      var _loc20_:Number = NaN;
      var _loc21_:Number = NaN;
      var _loc3_:GameCam = this;
      var _loc4_:class_5 = _loc3_.gameObj;
      var _loc5_:GameDisplay = _loc4_.var_103;
      var _loc6_:Number = _loc3_.mouseRatioToScreen;
      if (_loc4_.var_109.isOnBarge())
      {
        _loc3_.x = _loc3_.last_x;
        _loc3_.y = _loc3_.last_y;
      }
      var _loc8_:Number = (_loc5_.screenPxWidth - _loc5_.screenPxWidth / _loc6_) / 2;
      var _loc9_:Number = (_loc5_.screenPxHeight - _loc5_.screenPxHeight / 1) / 2;
      var _loc10_:Number = 0;
      var _loc11_:Number = 0;
      var _loc12_:Number = _loc3_.cameraOffset;
      if (_loc12_ < _loc3_.maxCameraOffset * -1)
      {
        _loc12_ = _loc3_.maxCameraOffset * -1;
      }
      else if (_loc12_ > _loc3_.maxCameraOffset)
      {
        _loc12_ = _loc3_.maxCameraOffset;
      }
      if (_loc10_ < _loc3_.screenbounds_minx)
      {
        _loc10_ = _loc3_.screenbounds_minx;
      }
      if (_loc10_ > _loc3_.screenbounds_maxx)
      {
        _loc10_ = _loc3_.screenbounds_maxx;
      }
      if (_loc11_ < _loc3_.screenbounds_miny)
      {
        _loc11_ = _loc3_.screenbounds_miny;
      }
      if (_loc11_ > _loc3_.screenbounds_maxy)
      {
        _loc11_ = _loc3_.screenbounds_maxy;
      }
      _loc10_ -= _loc3_.screenbounds_offsetX;
      _loc11_ -= _loc3_.screenbounds_offsetY;
      _loc3_.mouseRealX = _loc10_;
      _loc3_.mouseRealY = _loc11_;
      var _loc13_:Number = _loc10_ / _loc6_ + _loc8_;
      var _loc14_:Number = _loc11_ / 1 + _loc9_;
      if (param1 is PlayerChar)
      {
        _loc3_.targetX = param1.x;
        _loc3_.targetY = param1.y + _loc12_ - 32;
      }
      else
      {
        _loc3_.targetX = param1.x;
        _loc3_.targetY = param1.y - 32;
      }
      if (_loc3_.lockedCamera)
      {
        _loc3_.targetX = _loc3_.lockTargetX;
        _loc3_.targetY = _loc3_.lockTargetY;
      }
      else if (_loc3_.forcedScrollingCamera)
      {
        if (_loc3_.forcedScrollingDirX != 0)
        {
          _loc3_.targetX = _loc3_.x + _loc3_.forcedScrollingDirX * _loc3_.forcedScrollingSpeed;
        }
        if (_loc3_.forcedScrollingDirY != 0)
        {
          _loc3_.targetY = _loc3_.y + _loc3_.forcedScrollingDirY * _loc3_.forcedScrollingSpeed;
        }
      }
      var _loc15_:Number = 0;
      if (_loc3_.targetX > _loc3_.max_x)
      {
        _loc3_.targetX = _loc3_.max_x;
      }
      if (_loc3_.targetX < _loc3_.min_x)
      {
        _loc3_.targetX = _loc3_.min_x;
      }
      if (_loc3_.targetY > _loc3_.max_y)
      {
        _loc15_ = _loc3_.targetY - _loc3_.max_y;
        _loc3_.targetY = _loc3_.max_y;
      }
      if (_loc3_.targetY < _loc3_.min_y)
      {
        _loc15_ = _loc3_.min_y - _loc3_.targetY;
        _loc3_.targetY = _loc3_.min_y;
      }
      if (!param2)
      {
        _loc18_ = _loc3_.targetX - _loc3_.x;
        _loc19_ = _loc3_.targetY - _loc3_.y;
        _loc20_ = Math.floor(_loc18_ / _loc3_.chasesteps);
        _loc21_ = Math.floor(_loc19_ / _loc3_.chasesteps);
        if (param1 is PlayerChar)
        {
          _loc21_ = Math.floor(_loc19_ / (_loc3_.chasesteps * 2));
        }
        if (_loc3_.wasLockedCamera && Math.abs(_loc18_) < 5 && Math.abs(_loc19_) < 5)
        {
          _loc3_.wasLockedCamera = false;
        }
        if (_loc3_.lockedCamera || _loc3_.wasLockedCamera)
        {
          _loc20_ = Math.floor(_loc18_ / _loc3_.lockchasesteps);
          _loc21_ = Math.floor(_loc19_ / _loc3_.lockchasesteps);
        }
        _loc3_.x += _loc20_;
        _loc3_.y += _loc21_;
        if (_loc3_.forcedScrollingCamera)
        {
          if (_loc3_.forcedScrollingDirX != 0)
          {
            _loc3_.x = _loc3_.targetX;
          }
          if (_loc3_.forcedScrollingDirY != 0)
          {
            _loc3_.y = _loc3_.targetY;
          }
        }
        if (_loc3_.lockedCamera && _loc3_.lockStoppingPlayer && Math.abs(_loc20_) < 3 && Math.abs(_loc21_) < 3)
        {
          _loc3_.lockStoppingPlayer = false;
          _loc3_.gameObj.var_108.stopActionControls = false;
        }
      }
      else
      {
        _loc3_.x = _loc3_.targetX;
        _loc3_.y = _loc3_.targetY;
      }
      var _loc16_:Number = Math.floor(_loc3_.x) - Math.floor(_loc5_.screenTileWidth / 2) * _loc5_.tileWidth;
      var _loc17_:Number = Math.floor(_loc3_.y) - Math.floor(_loc5_.screenTileHeight / 2) * _loc5_.tileWidth;
      _loc3_.mouseLookX = Math.floor(_loc16_ + _loc10_);
      _loc3_.mouseLookY = Math.min(param1.y, Math.floor(_loc17_ + _loc11_));
      _loc3_.mouseTargetX = Math.floor(_loc16_ + _loc10_);
      _loc3_.mouseTargetY = Math.floor(_loc17_ + _loc11_);
      if (_loc3_.jiggle || _loc3_.gameObj.var_109.isOnTrain())
      {
        _loc3_.jiggleCamera();
      }
      if (_loc3_.x > _loc3_.max_x)
      {
        _loc3_.x = _loc3_.max_x;
      }
      if (_loc3_.x < _loc3_.min_x)
      {
        _loc3_.x = _loc3_.min_x;
      }
      if (_loc3_.y > _loc3_.max_y)
      {
        _loc3_.y = _loc3_.max_y;
      }
      if (_loc3_.y < _loc3_.min_y)
      {
        _loc3_.y = _loc3_.min_y;
      }
      _loc3_.last_x = _loc3_.x;
      _loc3_.last_y = _loc3_.y;
      if (_loc4_.var_109.isOnBarge())
      {
        if (_loc3_.gameObj.var_108.gameplayTimer % _loc3_.bargeCameraOffsetSpeed == 0)
        {
          _loc3_.bargeCameraOffset += _loc3_.bargeCameraOffsetDirection;
          if (_loc3_.bargeCameraOffset >= 0 && _loc3_.bargeCameraOffsetDirection != -1)
          {
            _loc3_.bargeCameraOffset = 0;
            _loc3_.bargeCameraOffsetDirection = 0;
            ++_loc3_.bargeTimeAtRest;
            if (_loc3_.bargeTimeAtRest >= _loc3_.bargeTimeAtRestMax)
            {
              _loc3_.bargeCameraOffsetDirection = -1;
              _loc3_.bargeTimeAtRest = 0;
            }
          }
          else if (_loc3_.bargeCameraOffset <= _loc3_.bargeCameraOffsetMin && _loc3_.bargeCameraOffsetDirection != 1)
          {
            _loc3_.bargeCameraOffset = _loc3_.bargeCameraOffsetMin;
            _loc3_.bargeCameraOffsetDirection = 0;
            ++_loc3_.bargeTimeAtRest;
            if (_loc3_.bargeTimeAtRest >= _loc3_.bargeTimeAtRestMax)
            {
              _loc3_.bargeCameraOffsetDirection = 1;
              _loc3_.bargeTimeAtRest = 0;
            }
          }
        }
        _loc3_.y += _loc3_.bargeCameraOffset;
        if (_loc3_.x > _loc3_.max_x)
        {
          _loc3_.x = _loc3_.max_x;
        }
        if (_loc3_.x < _loc3_.min_x)
        {
          _loc3_.x = _loc3_.min_x;
        }
        if (_loc3_.y > _loc3_.max_y)
        {
          _loc3_.y = _loc3_.max_y;
        }
        if (_loc3_.y < _loc3_.min_y)
        {
          _loc3_.y = _loc3_.min_y;
        }
      }
    }

    public function withinPanBounds(param1:Number):Number
    {
      return;

      var _loc2_:GameCam = this;
      if (param1 < 32)
      {
        ++_loc2_.waitingInPanBoundsTime;
        if (_loc2_.waitingInPanBoundsTime >= _loc2_.waitingInPanBoundsTimeMax)
        {
          return -1;
        }
        return 0;
      }
      if (param1 > 320 && param1 < _loc2_.gameObj.var_103.screenPxHeight)
      {
        ++_loc2_.waitingInPanBoundsTime;
        if (_loc2_.waitingInPanBoundsTime >= _loc2_.waitingInPanBoundsTimeMax)
        {
          return 1;
        }
        return 0;
      }
      _loc2_.waitingInPanBoundsTime = 0;
      return 0;
    }

    public function panCamera(param1:Number, param2:Number, param3:String, param4:Boolean = false):void
    {
      var _loc13_:Number = NaN;
      var _loc14_:Number = NaN;
      var _loc15_:Number = NaN;
      var _loc16_:Number = NaN;
      var _loc5_:GameCam = this;
      var _loc6_:class_5 = _loc5_.gameObj;
      var _loc7_:GameDisplay = _loc6_.var_103;
      var _loc8_:Number = _loc5_.mouseRatioToScreen;
      var _loc9_:Number = _loc6_.var_128.mouseX;
      var _loc10_:Number = _loc6_.var_128.mouseY;
      if (_loc9_ < _loc5_.screenbounds_minx)
      {
        _loc9_ = _loc5_.screenbounds_minx;
      }
      if (_loc9_ > _loc5_.screenbounds_maxx)
      {
        _loc9_ = _loc5_.screenbounds_maxx;
      }
      if (_loc10_ < _loc5_.screenbounds_miny)
      {
        _loc10_ = _loc5_.screenbounds_miny;
      }
      if (_loc10_ > _loc5_.screenbounds_maxy)
      {
        _loc10_ = _loc5_.screenbounds_maxy;
      }
      _loc9_ -= _loc5_.screenbounds_offsetX;
      _loc10_ -= _loc5_.screenbounds_offsetY;
      _loc5_.mouseRealX = _loc9_;
      _loc5_.mouseRealY = _loc10_;
      _loc5_.targetX = param1;
      _loc5_.targetY = param2;
      if (_loc5_.targetX > _loc5_.max_x)
      {
        _loc5_.targetX = _loc5_.max_x;
      }
      if (_loc5_.targetX < _loc5_.min_x)
      {
        _loc5_.targetX = _loc5_.min_x;
      }
      if (_loc5_.targetY > _loc5_.max_y)
      {
        _loc5_.targetY = _loc5_.max_y;
      }
      if (_loc5_.targetY < _loc5_.min_y)
      {
        _loc5_.targetY = _loc5_.min_y;
      }
      if (!param4)
      {
        _loc13_ = _loc5_.targetX - _loc5_.x;
        _loc14_ = _loc5_.targetY - _loc5_.y;
        _loc15_ = Math.floor(_loc13_ / _loc5_.pansteps);
        _loc16_ = Math.floor(_loc14_ / _loc5_.pansteps);
        ++_loc5_.currstartdelay;
        if (_loc5_.currstartdelay >= _loc5_.panstartdelay)
        {
          _loc5_.x += _loc15_;
          _loc5_.y += _loc16_;
        }
        else if (_loc5_.currstartdelay == _loc5_.panstartdelay - 1)
        {
          if (param3 == "player")
          {
          }
        }
      }
      else
      {
        _loc5_.x = _loc5_.targetX;
        _loc5_.y = _loc5_.targetY;
      }
      if (_loc15_ == 0 && _loc16_ == 0)
      {
        ++_loc5_.currenddelay;
        if (_loc5_.currenddelay == _loc5_.panenddelay || param3 == "player")
        {
          _loc6_.var_108.finishCameraPan();
        }
      }
      var _loc11_:Number = Math.floor(_loc5_.x) - Math.floor(_loc7_.screenTileWidth / 2) * _loc7_.tileWidth;
      var _loc12_:Number = Math.floor(_loc5_.y) - Math.floor(_loc7_.screenTileHeight / 2) * _loc7_.tileWidth;
      _loc5_.mouseTargetX = Math.floor(_loc11_ + _loc9_);
      _loc5_.mouseTargetY = Math.floor(_loc12_ + _loc10_);
      if (_loc5_.jiggle)
      {
        _loc5_.jiggleCamera();
      }
      if (_loc5_.x > _loc5_.max_x)
      {
        _loc5_.x = _loc5_.max_x;
      }
      if (_loc5_.x < _loc5_.min_x)
      {
        _loc5_.x = _loc5_.min_x;
      }
      if (_loc5_.y > _loc5_.max_y)
      {
        _loc5_.y = _loc5_.max_y;
      }
      if (_loc5_.y < _loc5_.min_y)
      {
        _loc5_.y = _loc5_.min_y;
      }
    }

    public function destroy():void
    {
    }
  }
}
