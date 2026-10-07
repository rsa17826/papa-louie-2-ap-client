package papaGame.models.objects
{
  import flash.geom.Rectangle;
  import package_4.*;
  import papaGame.data.*;
  import papaGame.display.*;
  import papaGame.events.GameControls;
  import papaGame.managers.*;
  import papaGame.models.Enemy;
  import papaGame.models.GameObject;
  import papaGame.models.PlayerChar;
  import papaGame.models.characters.*;

  public class GameObject27 extends GameObject
  {

    public var wasMovingPlayer:Boolean = false;
    public var wasPlayerJumping:Boolean = false;
    public var playerSplashID:Number = -1;

    public function GameObject27(param1:class_5, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Array)
    {
      super(param1, param2, param3, param4, param5, param6, param7);
    }

    override public function defineVars():void
    {
      sheetname = "object_bbqsauce";
      objectname = "BBQ Quicksauce";
      sheetIsBitmap = false;
      type = 27;
      spritewidth = 64;
      spriteheight = 64;
      spriteCenterX = 32;
      spriteCenterY = 32;
      spriteTargetX = 16;
      spriteTargetY = 16;
      sheetWidth = 29;
      sheetHeight = 2;
      widthmultiplier = 3;
      heightmultiplier = 3;
      foreground = true;
      collRect = new Rectangle(-16, -16, 64, 64);
      isTilingObject = true;
      tilingHasCap = true;
      tilingCapBlitOffsetY = 0;
      tilingNoCapBlitOffsetY = 64;
      tilingUseColorFill = false;
      isActivated = true;
      broadcastStyle = 1;
      activeCycleFrames = ["active", 1, 1, 0, 0, 0, 28];
      activatingCycleFrames = ["activating", 2, 1, 0, -1, [0]];
      deactivatingCycleFrames = ["deactivating", 2, 1, 0, -1, [0]];
      inactiveCycleFrames = ["inactive", 1, 1, 0, 0, 0, 0];
      dirx = 1;
    }

    override public function checkOnScreen():Boolean
    {
      var _loc2_:GameDisplay = this.gameObj.var_103;
      return true;
    }

    override public function setupParams(param1:Array):void
    {
      if (param1)
      {
        if (param1.length > 0)
        {
          if (Number(param1[0]) > 0)
          {
            this.tilingWidth = Number(param1[0]);
          }
          else
          {
            this.tilingWidth = this.gameObj.var_103.levelTileWidth - this.xtile;
          }
        }
        else
        {
          this.tilingWidth = this.gameObj.var_103.levelTileWidth - this.xtile;
        }
        if (param1.length > 1)
        {
          if (Number(param1[1]) > 0)
          {
            this.tilingHeight = Number(param1[1]);
          }
          else
          {
            this.tilingHeight = this.gameObj.var_103.levelTileHeight - this.ytile;
          }
        }
        else
        {
          this.tilingHeight = this.gameObj.var_103.levelTileHeight - this.ytile;
        }
      }
      else
      {
        this.tilingWidth = this.gameObj.var_103.levelTileWidth - this.xtile;
        this.tilingHeight = this.gameObj.var_103.levelTileHeight - this.ytile;
      }
    }

    override public function updateObject():void
    {
      var _loc2_:PlayerChar = this.gameObj.playerObj;
      var _loc3_:GameControls = this.gameObj.var_108;
      var _loc4_:EffectManager = this.gameObj.var_104;
      var _loc5_:Rectangle = new Rectangle();
      _loc5_.x = this.x + this.collRect.x;
      _loc5_.y = this.y + this.collRect.y;
      _loc5_.width = this.gameObj.var_103.tileWidth * this.tilingWidth;
      _loc5_.height = this.gameObj.var_103.tileWidth * this.tilingHeight;
      var _loc6_:Rectangle = new Rectangle(-16, -10, 32, 24);
      if (_loc2_.checkSpriteCollision(_loc5_, _loc6_))
      {
        if (!this.wasMovingPlayer && _loc2_.jump)
        {
          if (String(this.type) == "27")
          {
            _loc4_.addEffect(_loc2_.x, this.y, "BBQBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x - 3, this.y, "BBQBitEffect", "piece2");
            _loc4_.addEffect(_loc2_.x - 6, this.y, "BBQBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x + 4, this.y, "BBQBitEffect", "piece3");
          }
          else if (String(this.type) == "32")
          {
            _loc4_.addEffect(_loc2_.x, this.y, "RainbowBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x - 3, this.y, "RainbowBitEffect", "piece2");
            _loc4_.addEffect(_loc2_.x - 6, this.y, "RainbowBitEffect", "piece3");
            _loc4_.addEffect(_loc2_.x + 4, this.y, "SauceBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x, this.y, "BlueberryBitEffect", "piece1");
          }
          this.gameObj.var_105.playSound("getcheesed.mp3", false, 0.7);
        }
        if (_loc2_.jump && _loc2_.jumpspeed >= 0)
        {
          _loc2_.jump = false;
          _loc2_.isGliding = false;
          _loc2_.isDoubleJumping = false;
          _loc2_.isGroundPounding = false;
        }
        this.wasMovingPlayer = true;
        _loc2_.isSliding = false;
        _loc2_.isInQuicksand = true;
        _loc2_.setSpeed(3);
        _loc2_.moveChar(0, 1, 0);
        if (_loc2_.jump && _loc2_.jumpspeed < 0 && !this.wasPlayerJumping)
        {
          if (String(this.type) == "27")
          {
            _loc4_.addEffect(_loc2_.x, this.y, "BBQBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x - 3, this.y, "BBQBitEffect", "piece2");
            _loc4_.addEffect(_loc2_.x - 6, this.y, "BBQBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x + 4, this.y, "BBQBitEffect", "piece3");
          }
          else if (String(this.type) == "32")
          {
            _loc4_.addEffect(_loc2_.x, this.y, "RainbowBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x - 3, this.y, "RainbowBitEffect", "piece2");
            _loc4_.addEffect(_loc2_.x - 6, this.y, "RainbowBitEffect", "piece3");
            _loc4_.addEffect(_loc2_.x + 4, this.y, "SauceBitEffect", "piece1");
            _loc4_.addEffect(_loc2_.x, this.y, "BlueberryBitEffect", "piece1");
          }
          this.wasPlayerJumping = true;
        }
        else if (!_loc2_.jump && this.wasPlayerJumping)
        {
          this.wasPlayerJumping = false;
        }
      }
      else if (this.wasMovingPlayer)
      {
        _loc2_.isInQuicksand = false;
        _loc2_.isWalking = false;
        this.wasMovingPlayer = false;
        if (this.playerSplashID > -1)
        {
          _loc4_.removeEffect(this.playerSplashID);
          this.playerSplashID = -1;
        }
      }
      this.checkEnemiesInWater();
      this.updateSprite();
    }

    public function checkEnemiesInWater():void
    {
      var _loc6_:Enemy = null;
      var _loc2_:EnemyManager = this.gameObj.var_110;
      var _loc3_:EffectManager = this.gameObj.var_104;
      var _loc4_:Rectangle = new Rectangle();
      _loc4_.x = this.x + this.collRect.x;
      _loc4_.y = this.y + this.collRect.y;
      _loc4_.width = this.gameObj.var_103.tileWidth * this.tilingWidth;
      _loc4_.height = this.gameObj.var_103.tileWidth * this.tilingHeight;
      var _loc5_:int = 0;
      while (_loc5_ < _loc2_.enemies.length)
      {
        if (_loc2_.enemies[_loc5_] is Enemy)
        {
          _loc6_ = _loc2_.enemies[_loc5_];
          if (_loc6_.checkSpriteCollision(_loc4_) && !_loc6_.isDead && _loc6_.type != 38 && _loc6_.type != 39)
          {
            if (String(this.type) == "27")
            {
              _loc3_.addEffect(_loc6_.x, this.y, "BBQBitEffect", "piece1");
              _loc3_.addEffect(_loc6_.x - 3, this.y, "BBQBitEffect", "piece2");
              _loc3_.addEffect(_loc6_.x - 6, this.y, "BBQBitEffect", "piece1");
              _loc3_.addEffect(_loc6_.x + 4, this.y, "BBQBitEffect", "piece3");
            }
            else if (String(this.type) == "32")
            {
              _loc3_.addEffect(_loc6_.x, this.y, "RainbowBitEffect", "piece1");
              _loc3_.addEffect(_loc6_.x - 3, this.y, "RainbowBitEffect", "piece2");
              _loc3_.addEffect(_loc6_.x - 6, this.y, "RainbowBitEffect", "piece3");
              _loc3_.addEffect(_loc6_.x + 4, this.y, "SauceBitEffect", "piece1");
              _loc3_.addEffect(_loc6_.x, this.y, "BlueberryBitEffect", "piece1");
            }
            _loc6_.killMe(-1);
            this.gameObj.var_105.playSound("getcheesed.mp3", false, 0.7 * _loc6_.getProximityVolume(), _loc6_.getProximityPan());
            this.gameObj.var_112.recordTag("waterEnemy");
          }
        }
        _loc5_++;
      }
    }

    public function checkObjectsInWater():void
    {
      var _loc2_:ObjectManager = this.gameObj.var_111;
      var _loc3_:EffectManager = this.gameObj.var_104;
      var _loc4_:Rectangle = new Rectangle();
      _loc4_.x = this.x + this.collRect.x;
      _loc4_.y = this.y + this.collRect.y;
      _loc4_.width = this.gameObj.var_103.tileWidth * this.tilingWidth;
      _loc4_.height = this.collRect.height;
    }

    override public function destroy():void
    {
    }
  }
}
