package package_4
{
  import flash.external.ExternalInterface;
  import flash.display.*;
  import flash.events.*;
  import flash.utils.getTimer;
  import mochi.as3.*;
  import package_1.class_6;
  import package_2.class_7;
  import package_2.class_9;
  import papaGame.data.*;
  import papaGame.display.*;
  import papaGame.events.*;
  import papaGame.managers.*;
  import papaGame.models.*;
  import papaGame.models.characters.CustomerChar;
  import papaGame.screens.*;
  import flash.geom.Point;

  public dynamic class class_5 extends MovieClip
  {

    public var var_103:GameDisplay;
    public var var_119:GameCam;
    public var var_109:DataManager;
    public var bitmapManager:BitmapManager;
    public var var_114:MapManager;
    public var var_194:EventManager;
    public var var_112:ChallengeManager;
    public var var_115:GameHUD;
    public var playerObj:PlayerChar;
    public var var_327:String = "cactus";
    public var var_108:GameControls;
    public var var_110:EnemyManager;
    public var var_111:ObjectManager;
    public var var_120:ItemManager;
    public var var_104:EffectManager;
    public var var_116:BulletManager;
    public var var_105:SoundManager;
    public var var_106:UserData;
    public var var_113:CustomerData;
    public var var_128:MovieClip;
    public var var_197:MovieClip;
    public var var_107:class_6;
    public var var_190:GameIntroScreen;
    public var var_202:GameOutroScreen;
    public var var_198:StageIntroScreen;
    public var var_196:StageOutroScreen;
    public var var_200:BossIntroScreen;
    public var var_192:NewCustomerScreen;
    public var var_186:ParadeScreen;
    public var var_150:TrainingPopup;
    public var loadingScreen:class_2;
    public var var_165:LoadingLevelsScreen;
    public var var_191:SponsorLogoScreen;
    public var var_189:LicenseLogoScreen;
    public var var_203:FliplineLogoScreen;
    public var var_310:class_8;
    public var var_158:Number = 0;
    public var var_325:Boolean = false;
    public var var_294:Array = [SplashScreen, ScoreTallyScreen, SlotSelectScreen, MainMenuScreen, MochiAd];
    public var var_303:Boolean = false;

    public function class_5()
    {
      super();
    }

    public function method_172(param1:Event = null):void
    {
      ExternalInterface.call("log", "start " + getTimer());
      this.method_202();
      this.var_128 = new MovieClip();
      this.addChild(this.var_128);
      this.var_197 = new MovieClip();
      this.addChild(this.var_197);
      this.var_197.mouseEnabled = false;
      this.var_107 = new class_6(this);
      this.var_107.method_130();
      var _loc3_:MovieClip = new border_overlay();
      _loc3_.mouseEnabled = false;
      _loc3_.mouseChildren = false;
      this.addChild(_loc3_);
      if (this.var_303)
      {
        this.method_208();
      }
      trace("Papa Louie 2: When Burgers Attack! (c) 2013 Flipline Studios.  All Rights Reserved.");
      trace("Game Version: " + this.var_107.var_35);
      trace("- Loaded.");
      trace("----------------------------------------------------------------");
      class_9.stage = this.stage;
      this.method_212();
    }

    public function method_202():void
    {
      var loaderInfo:LoaderInfo = null;
      var mod:class_5 = this;
      class_7.method_148(class_7.const_9);
      class_7.method_227(mod.method_203);
      try
      {
        loaderInfo = mod.root.loaderInfo;
        if (loaderInfo.loader != null)
        {
          loaderInfo = loaderInfo.loader.loaderInfo;
        }
        if (loaderInfo.parameters.hasOwnProperty("traceall"))
        {
          class_7.method_148(class_7.ALL);
        }
      }
      catch (err:Error)
      {
        class_7.error("Error checking parameters for trace override.");
      }
    }

    public function method_203():String
    {
      var _loc2_:String = "";
      try
      {
        if (this.var_108)
        {
          _loc2_ = this.var_108.gameplayTimer + "   ";
        }
      }
      catch (err:Error)
      {
      }
      return _loc2_;
    }

    public function method_212():void
    {
      this.stage.stageFocusRect = false;
      this.var_113 = new CustomerData(this);
      this.var_106 = new UserData(this);
      this.var_105 = new SoundManager(this);
      this.var_107.method_125(this.var_105);
      this.var_112 = new ChallengeManager(this);
      this.var_109 = new DataManager(this);
      ExternalInterface.addCallback("setCharLockState", setCharLockState);
      this.var_109.prepareLevelData(false);
    }

    public function setCharLockState(char, state)
    {
      this.var_106.customersUnlocked[char] = state;
    }
    public function method_183():MovieClip
    {
      this.method_129();
      this.var_165 = new LoadingLevelsScreen(this);
      return this.var_165.clip;
    }

    public function method_129():void
    {
      if (this.var_165)
      {
        this.var_165.destroy();
        this.var_165 = null;
      }
    }

    public function method_241():void
    {
      this.var_310 = new class_8(this);
    }

    public function method_169():void
    {
      this.var_191 = new SponsorLogoScreen(this);
    }

    public function method_187():void
    {
      if (this.var_191)
      {
        this.var_191.destroy();
        this.var_191 = null;
      }
    }

    public function method_137():void
    {
      this.var_189 = new LicenseLogoScreen(this);
    }

    public function method_194():void
    {
      if (this.var_189)
      {
        this.var_189.destroy();
        this.var_189 = null;
      }
    }

    public function method_155():void
    {
      this.var_203 = new FliplineLogoScreen(this);
    }

    public function method_179():void
    {
      if (this.var_203)
      {
        this.var_203.destroy();
        this.var_203 = null;
      }
    }

    public function method_174():void
    {
      this.var_198 = new StageIntroScreen(this);
    }

    public function method_193():void
    {
      if (this.var_198)
      {
        this.var_198.destroy();
        this.var_198 = null;
      }
      if (this.var_108)
      {
        this.var_108.resetKeyFocus();
      }
    }

    public function method_197():void
    {
      this.var_196 = new StageOutroScreen(this);
    }

    public function method_195():void
    {
      if (this.var_196)
      {
        this.var_196.destroy();
        this.var_196 = null;
      }
    }

    public function method_217():void
    {
      this.var_158 = 0;
      this.method_116();
      this.method_211();
    }

    public function method_211():void
    {
      if (this.var_190)
      {
        this.var_190.destroy();
        this.var_190 = null;
      }
      if (this.var_108)
      {
        this.var_108.resetKeyFocus();
      }
    }

    public function method_209():void
    {
      this.var_202 = new GameOutroScreen(this);
    }

    public function method_204():void
    {
      if (this.var_202)
      {
        this.var_202.destroy();
        this.var_202 = null;
      }
      if (this.var_108)
      {
        this.var_108.resetKeyFocus();
      }
    }

    public function method_147():void
    {
      this.var_200 = new BossIntroScreen(this);
    }

    public function method_180():void
    {
      if (this.var_200)
      {
        this.var_200.destroy();
        this.var_200 = null;
      }
    }

    public function method_215(param1:Number):void
    {
      this.var_192 = new NewCustomerScreen(this, param1);
    }

    public function method_198():void
    {
      if (this.var_192)
      {
        this.var_192.destroy();
        this.var_192 = null;
      }
    }

    public function method_121(param1:Boolean = true):void
    {
      if (!this.var_186)
      {
        this.var_186 = new ParadeScreen(this, param1);
      }
    }

    public function method_182():void
    {
      if (this.var_186)
      {
        this.var_186.destroy();
        this.var_186 = null;
      }
    }

    public function method_250(param1:Boolean = false):void
    {
    }

    public function method_240():void
    {
    }

    public function method_205():void
    {
      this.var_103.setupBitmapDraw();
      this.method_174();
    }

    public function method_224():void
    {
      ExternalInterface.call("log", "ready " + getTimer());
      class_7.method_1("Level data is ready.");
      if (this.var_165)
      {
        this.var_165.showPlayButton();
      }
    }

    public function method_116():void
    {
      this.var_104 = new EffectManager(this);
      this.var_116 = new BulletManager(this);
      this.playerObj = new CustomerChar(this);
      this.var_115 = new GameHUD(this);
      this.bitmapManager = new BitmapManager(this);
      this.var_114 = new MapManager(this);
      this.var_111 = new ObjectManager(this);
      this.var_110 = new EnemyManager(this);
      this.var_120 = new ItemManager(this);
      this.var_194 = new EventManager(this);
      this.var_103 = new GameDisplay(this);
      this.var_119 = new GameCam(this);
      this.var_108 = new GameControls(this);
      this.method_205();
    }

    public function method_225(param1:Number):void
    {
      this.var_109.currentLevel = param1;
      this.var_106.resetLives();
      this.var_106.clearTallies();
      this.bitmapManager.clearExtraSprites();
      this.bitmapManager.whichTileset = -1;
      var _loc3_:Number = getTimer();
      this.var_109.setupLevelScreens(param1);
      var _loc4_:Number = getTimer() - _loc3_;
      var _loc5_:Number = getTimer();
      this.var_103.setupPreBlit();
      var _loc6_:Number = getTimer() - _loc5_;
      this.var_103.currentXcoord = 0;
      this.var_103.currentYcoord = 0;
      this.var_119.setCameraBounds();
      this.var_115.updateDisplay();
      this.var_115.updateTimer();
      this.var_112.resetCurrentChallenges();
      this.playerObj.startupPlayer(this.var_109.currentScreenData.startPoint[1], this.var_109.currentScreenData.startPoint[2], true);
      // TODO another enter level?
      class_7.method_1("Setup Screens Duration: " + _loc4_ + " ms.  Pre-blit Duration: " + _loc6_ + " ms.");
      if (param1 == 8 && this.var_106.getLevelHighScore(param1) == 0)
      {
        this.method_147();
      }
      else
      {
        this.method_135();
      }
    }

    public function method_135():void
    {
      class_7.method_1("START LEVEL");
      // TODO level start
      this.var_119.adjustCamera(this.playerObj, true);
      this.var_103.currentXcoord = 0;
      this.var_103.currentYcoord = 0;
      this.var_109.initializeScreenObjects(0);
      this.var_105.startLevelMusic();
      this.var_105.playSound("portalsound_spinfallout.wav");
      this.playerObj.startTrainSound();
      this.var_115.showHUD();
      this.var_108.setupControls();
      this.var_108.setupCycleCode();
      this.var_109.handleCheckpointProgress();
      this.var_115.updateDisplay();
      this.var_103.startTransition("in");
      this.stage.addEventListener(MouseEvent.CLICK, this.clickTeleport);
    }
    public function clickTeleport(param1:MouseEvent):void
    {
      if (!ExternalInterface.call("debugModeEnabled"))
      {
        return;
      }
      // if (!param1.shiftKey)
      // {
      // return;
      // }
      var _loc2_:Point = this.globalToLocal(new Point(param1.stageX, param1.stageY));
      this.playerObj.teleportTo(_loc2_.x + this.var_103.currentXcoord, _loc2_.y + this.var_103.currentYcoord);
    }
    public function method_171(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number):void
    {
      var _loc8_:DataManager = this.var_109;
      var _loc9_:Number = getTimer();
      this.var_110.saveEnemies();
      this.var_111.saveObjects();
      this.var_120.saveItems();
      this.var_116.clearBullets();
      this.var_104.clearEffects();
      var _loc10_:Number = getTimer() - _loc9_;
      _loc8_.setActiveRoom(param1);
      this.bitmapManager.clearExtraSprites();
      var _loc11_:Number = getTimer();
      this.var_103.setupPreBlit();
      var _loc12_:Number = getTimer() - _loc11_;
      this.var_103.currentXcoord = 0;
      this.var_103.currentYcoord = 0;
      this.var_119.setCameraBounds();
      if (this.var_115)
      {
        this.var_115.updateDisplay();
        this.var_115.updateTimer();
      }
      var _loc13_:Number = _loc8_.currentScreenData.doorArray[param2][0] + param5;
      var _loc14_:Number = _loc8_.currentScreenData.doorArray[param2][1] + (_loc8_.currentScreenData.doorArray[param2][3] - 1) + param6;
      this.playerObj.startupPlayer(_loc13_, _loc14_, false, true);
      this.var_119.adjustCamera(this.playerObj, true);
      this.var_103.currentXcoord = 0;
      this.var_103.currentYcoord = 0;
      var _loc15_:Number = getTimer();
      this.var_109.initializeScreenObjects(0);
      var _loc16_:Number = getTimer() - _loc15_;
      if (this.var_115)
      {
        this.var_115.updateDisplay();
        this.var_115.showHUD();
      }
      this.var_108.stopCycle = false;
      this.var_103.startTransition("in");
      // TODO room change
      class_7.method_1("ENTER ROOM -------");
      class_7.method_1("Time to clean up: " + _loc10_ + " ms.");
      class_7.method_1("Time to blit tiles: " + _loc12_ + " ms.");
      class_7.method_1("Time to blit enemies/objects: " + _loc16_ + " ms.");
      class_7.method_1(" --- Enemy Time: " + this.var_110.lastBuildDuration + " ms.");
      class_7.method_1(" --- Object Time: " + this.var_111.lastBuildDuration + " ms.");
      class_7.method_1("------------------");
    }

    public function finishLevel():void
    {
      // TODO level win check
      ExternalInterface.call("newItem", "level:");
      class_7.method_1("BEAT LEVEL");
      this.var_108.stopCycle = true;
      this.var_108.stopControls = true;
      this.playerObj.stopTrainSound();
      this.var_109.clearCheckpoint();
      this.var_107.api.method_117();
      try
      {
        if (this.var_108)
        {
          this.var_106.totalTimePlayed.addValue(this.var_108.currentLevelTimer);
          class_7.method_1("(Updated Time Played)");
        }
      }
      catch (err:Error)
      {
      }
      this.method_197();
      this.stage.removeEventListener(MouseEvent.CLICK, this.clickTeleport);
    }

    public function method_131():void
    {
      class_7.method_1("DEAD");
      try
      {
        if (this.var_108)
        {
          this.var_106.totalTimePlayed.addValue(this.var_108.currentLevelTimer);
          class_7.method_1("(Updated Time Played)");
        }
      }
      catch (err:Error)
      {
      }
      this.var_106.saveProgress("quitlevel");
      this.var_107.api.method_117();
      this.method_108();
      this.var_107.api.method_85("MainMenu", {"section": "map"});
    }

    public function method_181():void
    {
      this.method_108();
      this.method_116();
    }

    public function method_108():void
    {
      this.var_109.clearLevelScreens();
      if (this.var_115)
      {
        this.var_115.destroy();
      }
      this.playerObj.destroy();
      this.bitmapManager.destroy();
      this.var_114.destroy();
      this.var_111.destroy();
      this.var_110.destroy();
      this.var_120.destroy();
      this.var_104.destroy();
      this.var_116.destroy();
      this.var_194.destroy();
      this.var_103.destroy();
      this.var_119.destroy();
      this.var_108.destroy();
      this.playerObj = null;
      this.var_115 = null;
      this.bitmapManager = null;
      this.var_114 = null;
      this.var_111 = null;
      this.var_110 = null;
      this.var_120 = null;
      this.var_104 = null;
      this.var_116 = null;
      this.var_194 = null;
      this.var_103 = null;
      this.var_119 = null;
      this.var_108 = null;
      this.stage.removeEventListener(MouseEvent.CLICK, this.clickTeleport);
    }

    public function method_208():void
    {
    }

    public function method_102(param1:String, param2:Boolean, param3:String = "", param4:String = "", param5:String = "", param6:Number = -1):Boolean
    {
      var _loc8_:Boolean = false;
      if (this.var_106.isValidTrainingFlag(param1) && !this.var_106.hasTrained(param1))
      {
        if (this.var_150)
        {
          this.var_150.destroy();
          this.var_150 = null;
        }
        this.var_150 = new TrainingPopup(this, param1, param2, param3, param4, param5, param6);
        _loc8_ = true;
      }
      return _loc8_;
    }

    public function method_94(param1:String, param2:Boolean = true):Boolean
    {
      var _loc4_:Boolean = false;
      if (Boolean(this.var_150) && this.var_150.trainingFlag == param1)
      {
        this.var_106.setTrained(param1);
        this.method_103(param2);
        _loc4_ = true;
      }
      return _loc4_;
    }

    public function method_103(param1:Boolean = true):void
    {
      if (param1)
      {
        if (this.var_150)
        {
          this.var_150.closePopup();
        }
      }
      else if (this.var_150)
      {
        this.var_150.destroy();
        this.var_150 = null;
      }
    }
  }
}
