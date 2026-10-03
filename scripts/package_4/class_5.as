package package_4
{
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
      var _loc2_:class_5 = this;
      _loc2_.method_202();
      _loc2_.var_128 = new MovieClip();
      _loc2_.addChild(_loc2_.var_128);
      _loc2_.var_197 = new MovieClip();
      _loc2_.addChild(_loc2_.var_197);
      _loc2_.var_197.mouseEnabled = false;
      _loc2_.var_107 = new class_6(_loc2_);
      _loc2_.var_107.method_130();
      var _loc3_:MovieClip = new border_overlay();
      _loc3_.mouseEnabled = false;
      _loc3_.mouseChildren = false;
      _loc2_.addChild(_loc3_);
      if (_loc2_.var_303)
      {
        _loc2_.method_208();
      }
      trace("Papa Louie 2: When Burgers Attack! (c) 2013 Flipline Studios.  All Rights Reserved.");
      trace("Game Version: " + _loc2_.var_107.var_35);
      trace("- Loaded.");
      trace("----------------------------------------------------------------");
      class_9.stage = _loc2_.stage;
      _loc2_.method_212();
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
      var _loc1_:class_5 = this;
      var _loc2_:String = "";
      try
      {
        if (_loc1_.var_108)
        {
          _loc2_ = _loc1_.var_108.gameplayTimer + "   ";
        }
      }
      catch (err:Error)
      {
      }
      return _loc2_;
    }

    public function method_212():void
    {
      var _loc1_:class_5 = this;
      _loc1_.stage.stageFocusRect = false;
      _loc1_.var_113 = new CustomerData(_loc1_);
      _loc1_.var_106 = new UserData(_loc1_);
      _loc1_.var_105 = new SoundManager(_loc1_);
      _loc1_.var_107.method_125(_loc1_.var_105);
      _loc1_.var_112 = new ChallengeManager(_loc1_);
      _loc1_.var_109 = new DataManager(_loc1_);
      _loc1_.var_109.prepareLevelData(false);
    }

    public function method_183():MovieClip
    {
      var _loc1_:class_5 = this;
      _loc1_.method_129();
      _loc1_.var_165 = new LoadingLevelsScreen(_loc1_);
      return _loc1_.var_165.clip;
    }

    public function method_129():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_165)
      {
        _loc1_.var_165.destroy();
        _loc1_.var_165 = null;
      }
    }

    public function method_241():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_310 = new class_8(_loc1_);
    }

    public function method_169():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_191 = new SponsorLogoScreen(_loc1_);
    }

    public function method_187():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_191)
      {
        _loc1_.var_191.destroy();
        _loc1_.var_191 = null;
      }
    }

    public function method_137():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_189 = new LicenseLogoScreen(_loc1_);
    }

    public function method_194():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_189)
      {
        _loc1_.var_189.destroy();
        _loc1_.var_189 = null;
      }
    }

    public function method_155():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_203 = new FliplineLogoScreen(_loc1_);
    }

    public function method_179():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_203)
      {
        _loc1_.var_203.destroy();
        _loc1_.var_203 = null;
      }
    }

    public function method_174():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_198 = new StageIntroScreen(_loc1_);
    }

    public function method_193():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_198)
      {
        _loc1_.var_198.destroy();
        _loc1_.var_198 = null;
      }
      if (_loc1_.var_108)
      {
        _loc1_.var_108.resetKeyFocus();
      }
    }

    public function method_197():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_196 = new StageOutroScreen(_loc1_);
    }

    public function method_195():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_196)
      {
        _loc1_.var_196.destroy();
        _loc1_.var_196 = null;
      }
    }

    public function method_217():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_158 = 0;
      _loc1_.method_116();
      _loc1_.method_211();
    }

    public function method_211():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_190)
      {
        _loc1_.var_190.destroy();
        _loc1_.var_190 = null;
      }
      if (_loc1_.var_108)
      {
        _loc1_.var_108.resetKeyFocus();
      }
    }

    public function method_209():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_202 = new GameOutroScreen(_loc1_);
    }

    public function method_204():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_202)
      {
        _loc1_.var_202.destroy();
        _loc1_.var_202 = null;
      }
      if (_loc1_.var_108)
      {
        _loc1_.var_108.resetKeyFocus();
      }
    }

    public function method_147():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_200 = new BossIntroScreen(_loc1_);
    }

    public function method_180():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_200)
      {
        _loc1_.var_200.destroy();
        _loc1_.var_200 = null;
      }
    }

    public function method_215(param1:Number):void
    {
      this.var_192 = new NewCustomerScreen(this, param1);
    }

    public function method_198():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_192)
      {
        _loc1_.var_192.destroy();
        _loc1_.var_192 = null;
      }
    }

    public function method_121(param1:Boolean = true):void
    {
      var _loc2_:class_5 = this;
      if (!_loc2_.var_186)
      {
        _loc2_.var_186 = new ParadeScreen(_loc2_, param1);
      }
    }

    public function method_182():void
    {
      var _loc1_:class_5 = this;
      if (_loc1_.var_186)
      {
        _loc1_.var_186.destroy();
        _loc1_.var_186 = null;
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
      var _loc1_:class_5 = this;
      _loc1_.var_103.setupBitmapDraw();
      _loc1_.method_174();
    }

    public function method_224():void
    {
      var _loc1_:class_5 = this;
      class_7.method_1("Level data is ready.");
      if (_loc1_.var_165)
      {
        _loc1_.var_165.showPlayButton();
      }
    }

    public function method_116():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_104 = new EffectManager(_loc1_);
      _loc1_.var_116 = new BulletManager(_loc1_);
      _loc1_.playerObj = new CustomerChar(_loc1_);
      _loc1_.var_115 = new GameHUD(_loc1_);
      _loc1_.bitmapManager = new BitmapManager(_loc1_);
      _loc1_.var_114 = new MapManager(_loc1_);
      _loc1_.var_111 = new ObjectManager(_loc1_);
      _loc1_.var_110 = new EnemyManager(_loc1_);
      _loc1_.var_120 = new ItemManager(_loc1_);
      _loc1_.var_194 = new EventManager(_loc1_);
      _loc1_.var_103 = new GameDisplay(_loc1_);
      _loc1_.var_119 = new GameCam(_loc1_);
      _loc1_.var_108 = new GameControls(_loc1_);
      _loc1_.method_205();
    }

    public function method_225(param1:Number):void
    {
      var _loc2_:class_5 = this;
      _loc2_.var_109.currentLevel = param1;
      _loc2_.var_106.resetLives();
      _loc2_.var_106.clearTallies();
      _loc2_.bitmapManager.clearExtraSprites();
      _loc2_.bitmapManager.whichTileset = -1;
      var _loc3_:Number = getTimer();
      _loc2_.var_109.setupLevelScreens(param1);
      var _loc4_:Number = getTimer() - _loc3_;
      var _loc5_:Number = getTimer();
      _loc2_.var_103.setupPreBlit();
      var _loc6_:Number = getTimer() - _loc5_;
      _loc2_.var_103.currentXcoord = 0;
      _loc2_.var_103.currentYcoord = 0;
      _loc2_.var_119.setCameraBounds();
      _loc2_.var_115.updateDisplay();
      _loc2_.var_115.updateTimer();
      _loc2_.var_112.resetCurrentChallenges();
      _loc2_.playerObj.startupPlayer(_loc2_.var_109.currentScreenData.startPoint[1], _loc2_.var_109.currentScreenData.startPoint[2], true);
      class_7.method_1("Setup Screens Duration: " + _loc4_ + " ms.  Pre-blit Duration: " + _loc6_ + " ms.");
      if (param1 == 8 && _loc2_.var_106.getLevelHighScore(param1) == 0)
      {
        _loc2_.method_147();
      }
      else
      {
        _loc2_.method_135();
      }
    }

    public function method_135():void
    {
      class_7.method_1("START LEVEL");
      var _loc1_:class_5 = this;
      _loc1_.var_119.adjustCamera(_loc1_.playerObj, true);
      _loc1_.var_103.currentXcoord = 0;
      _loc1_.var_103.currentYcoord = 0;
      _loc1_.var_109.initializeScreenObjects(0);
      _loc1_.var_105.startLevelMusic();
      _loc1_.var_105.playSound("portalsound_spinfallout.wav");
      _loc1_.playerObj.startTrainSound();
      _loc1_.var_115.showHUD();
      _loc1_.var_108.setupControls();
      _loc1_.var_108.setupCycleCode();
      _loc1_.var_109.handleCheckpointProgress();
      _loc1_.var_115.updateDisplay();
      _loc1_.var_103.startTransition("in");
    }

    public function method_171(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number):void
    {
      var _loc7_:class_5 = this;
      var _loc8_:DataManager = _loc7_.var_109;
      var _loc9_:Number = getTimer();
      _loc7_.var_110.saveEnemies();
      _loc7_.var_111.saveObjects();
      _loc7_.var_120.saveItems();
      _loc7_.var_116.clearBullets();
      _loc7_.var_104.clearEffects();
      var _loc10_:Number = getTimer() - _loc9_;
      _loc8_.setActiveRoom(param1);
      _loc7_.bitmapManager.clearExtraSprites();
      var _loc11_:Number = getTimer();
      _loc7_.var_103.setupPreBlit();
      var _loc12_:Number = getTimer() - _loc11_;
      _loc7_.var_103.currentXcoord = 0;
      _loc7_.var_103.currentYcoord = 0;
      _loc7_.var_119.setCameraBounds();
      if (_loc7_.var_115)
      {
        _loc7_.var_115.updateDisplay();
        _loc7_.var_115.updateTimer();
      }
      var _loc13_:Number = _loc8_.currentScreenData.doorArray[param2][0] + param5;
      var _loc14_:Number = _loc8_.currentScreenData.doorArray[param2][1] + (_loc8_.currentScreenData.doorArray[param2][3] - 1) + param6;
      _loc7_.playerObj.startupPlayer(_loc13_, _loc14_, false, true);
      _loc7_.var_119.adjustCamera(_loc7_.playerObj, true);
      _loc7_.var_103.currentXcoord = 0;
      _loc7_.var_103.currentYcoord = 0;
      var _loc15_:Number = getTimer();
      _loc7_.var_109.initializeScreenObjects(0);
      var _loc16_:Number = getTimer() - _loc15_;
      if (_loc7_.var_115)
      {
        _loc7_.var_115.updateDisplay();
        _loc7_.var_115.showHUD();
      }
      _loc7_.var_108.stopCycle = false;
      _loc7_.var_103.startTransition("in");
      class_7.method_1("ENTER ROOM -------");
      class_7.method_1("Time to clean up: " + _loc10_ + " ms.");
      class_7.method_1("Time to blit tiles: " + _loc12_ + " ms.");
      class_7.method_1("Time to blit enemies/objects: " + _loc16_ + " ms.");
      class_7.method_1(" --- Enemy Time: " + _loc7_.var_110.lastBuildDuration + " ms.");
      class_7.method_1(" --- Object Time: " + _loc7_.var_111.lastBuildDuration + " ms.");
      class_7.method_1("------------------");
    }

    public function finishLevel():void
    {
      class_7.method_1("BEAT LEVEL");
      var _loc1_:class_5 = this;
      _loc1_.var_108.stopCycle = true;
      _loc1_.var_108.stopControls = true;
      _loc1_.playerObj.stopTrainSound();
      _loc1_.var_109.clearCheckpoint();
      _loc1_.var_107.api.method_117();
      try
      {
        if (_loc1_.var_108)
        {
          _loc1_.var_106.totalTimePlayed.addValue(_loc1_.var_108.currentLevelTimer);
          class_7.method_1("(Updated Time Played)");
        }
      }
      catch (err:Error)
      {
      }
      _loc1_.method_197();
    }

    public function method_131():void
    {
      class_7.method_1("DEAD");
      var _loc1_:class_5 = this;
      try
      {
        if (_loc1_.var_108)
        {
          _loc1_.var_106.totalTimePlayed.addValue(_loc1_.var_108.currentLevelTimer);
          class_7.method_1("(Updated Time Played)");
        }
      }
      catch (err:Error)
      {
      }
      _loc1_.var_106.saveProgress("quitlevel");
      _loc1_.var_107.api.method_117();
      _loc1_.method_108();
      _loc1_.var_107.api.method_85("MainMenu", {"section": "map"});
    }

    public function method_181():void
    {
      var _loc1_:class_5 = this;
      _loc1_.method_108();
      _loc1_.method_116();
    }

    public function method_108():void
    {
      var _loc1_:class_5 = this;
      _loc1_.var_109.clearLevelScreens();
      if (_loc1_.var_115)
      {
        _loc1_.var_115.destroy();
      }
      _loc1_.playerObj.destroy();
      _loc1_.bitmapManager.destroy();
      _loc1_.var_114.destroy();
      _loc1_.var_111.destroy();
      _loc1_.var_110.destroy();
      _loc1_.var_120.destroy();
      _loc1_.var_104.destroy();
      _loc1_.var_116.destroy();
      _loc1_.var_194.destroy();
      _loc1_.var_103.destroy();
      _loc1_.var_119.destroy();
      _loc1_.var_108.destroy();
      _loc1_.playerObj = null;
      _loc1_.var_115 = null;
      _loc1_.bitmapManager = null;
      _loc1_.var_114 = null;
      _loc1_.var_111 = null;
      _loc1_.var_110 = null;
      _loc1_.var_120 = null;
      _loc1_.var_104 = null;
      _loc1_.var_116 = null;
      _loc1_.var_194 = null;
      _loc1_.var_103 = null;
      _loc1_.var_119 = null;
      _loc1_.var_108 = null;
    }

    public function method_208():void
    {
    }

    public function method_102(param1:String, param2:Boolean, param3:String = "", param4:String = "", param5:String = "", param6:Number = -1):Boolean
    {
      var _loc7_:class_5 = this;
      var _loc8_:Boolean = false;
      if (_loc7_.var_106.isValidTrainingFlag(param1) && !_loc7_.var_106.hasTrained(param1))
      {
        if (_loc7_.var_150)
        {
          _loc7_.var_150.destroy();
          _loc7_.var_150 = null;
        }
        _loc7_.var_150 = new TrainingPopup(_loc7_, param1, param2, param3, param4, param5, param6);
        _loc8_ = true;
      }
      return _loc8_;
    }

    public function method_94(param1:String, param2:Boolean = true):Boolean
    {
      var _loc3_:class_5 = this;
      var _loc4_:Boolean = false;
      if (Boolean(_loc3_.var_150) && _loc3_.var_150.trainingFlag == param1)
      {
        _loc3_.var_106.setTrained(param1);
        _loc3_.method_103(param2);
        _loc4_ = true;
      }
      return _loc4_;
    }

    public function method_103(param1:Boolean = true):void
    {
      var _loc2_:class_5 = this;
      if (param1)
      {
        if (_loc2_.var_150)
        {
          _loc2_.var_150.closePopup();
        }
      }
      else if (_loc2_.var_150)
      {
        _loc2_.var_150.destroy();
        _loc2_.var_150 = null;
      }
    }
  }
}
