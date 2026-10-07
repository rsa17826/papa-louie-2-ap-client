package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import flash.utils.getDefinitionByName;
  import package_2.class_10;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.Challenge;
  import papaGame.data.CustomerData;
  import papaGame.data.DataManager;
  import papaGame.data.UserData;

  public class ScoreTallyScreen
  {

    public var gameObj:class_5;
    public var irisClip:MovieClip;
    public var clip:MovieClip;
    public var container:MovieClip;
    public var speed:Number = 32;
    public var screenHeight:Number = 480;
    public var animatingIn:Boolean = false;
    public var animatingOut:Boolean = false;
    public var delayBetweenReveals:Number = 15;
    public var delayTimer:Number = -20;
    public var revealingWhich:String = "points";
    public var fromGameOver:Boolean = false;
    public var endAction:String = "none";
    public var didSubmitScore:Boolean = false;
    public var isNewHighScore:Boolean = false;
    public var tally_points:Number = 0;
    public var tally_timepoints:Number = 0;
    public var tally_challenge:Number = 0;
    public var tally_levelpoints:Number = 0;
    public var tally_high:Number = 0;
    public var tally_high_previous:Number = 0;
    public var tally_totalpoints:Number = 0;
    public var tally_total_previous:Number = 0;
    public var tally_money:Number = 0;
    public var tally_totalmoney:Number = 0;
    public var tally_totalmoney_previous:Number = 0;
    public var tally_keys:Number = 0;
    public var whichTallyIndex:Number = 0;
    public var tallyLabels:Array = ["points", "timepoints", "challenge", "levelpoints", "high", "totalpoints", "money", "done"];

    private var rescueThumbs:Vector.<Bitmap>;

    public var crowdChar1:MovieClip = null;
    public var crowdChar2:MovieClip = null;
    public var crowdChar3:MovieClip = null;
    public var playerChar:MovieClip = null;
    public var unlockedChar:MovieClip = null;
    public var unlockedJumping:Boolean = true;
    public var playerJumping:Boolean = true;
    public var playerLanded:Boolean = false;
    public var unlockedLanded:Boolean = false;
    public var unlockedStartX:Number = 192;
    public var unlockedTargetX:Number = 172;
    public var unlockedStartY:Number = 89;
    public var unlockedTargetY:Number = 159;
    public var playerStartX:Number = 320;
    public var playerTargetX:Number = 340;
    public var playerStartY:Number = 89;
    public var playerTargetY:Number = 159;
    public var unlockedJumpSpeed:Number = -12;
    public var playerJumpSpeed:Number = -16;
    public var walkSpeed:Number = 1;
    public var didUnlockNewCustomer:Boolean = false;
    public var unlockedNewCustomerIndex:Number = -1;

    public function ScoreTallyScreen(param1:class_5, param2:MovieClip, param3:Object = null)
    {
      super();
      this.gameObj = param1;
      this.container = param2;
      this.fromGameOver = false;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc6_:MovieClip = null;
      var _loc7_:String = null;
      var _loc8_:String = null;
      var _loc9_:String = null;
      var _loc10_:Number = NaN;
      var _loc11_:BitmapData = null;
      var _loc12_:Bitmap = null;
      var _loc2_:UserData = this.gameObj.var_106;
      var _loc3_:Number = this.gameObj.var_109.currentLevel;
      this.clip = new scoreTallyMC();
      this.container.addChild(this.clip);
      this.setupCharacters();
      this.clip.leaderboard_cover.visible = false;
      this.irisClip = new irisTransitionMC();
      this.container.addChild(this.irisClip);
      this.irisClip.x = 30;
      this.irisClip.y = -30;
      this.clip.title_txt.text = this.gameObj.var_109.getWorldTitle(_loc3_);
      this.clip.levelnum_txt.text = String(_loc3_ + 1);
      if (_loc3_ == 9)
      {
        this.clip.levelnum_txt.text = "X";
      }
      this.clip.levelinside.inside.gotoAndStop(_loc3_ + 1);
      this.clip.time_txt.text = class_10.method_109(this.gameObj.var_108.gameplayTimer);
      this.getScoreValues();
      if (this.tally_high_previous == 0)
      {
        _loc5_ = this.gameObj.var_108.gameplayTimer / 30;
        if (_loc5_ < 3600)
        {
          this.gameObj.var_107.api.method_100("InitialTime", _loc3_ + 1, "average", _loc5_);
        }
        else
        {
          this.gameObj.var_107.api.method_100("InitialExcessiveTime", _loc3_ + 1, "average", _loc5_);
        }
      }
      this.gameObj.var_107.api.method_153();
      this.clip.points_txt.text = "";
      this.clip.timepoints_txt.text = "";
      this.clip.challenge_txt.text = "";
      this.clip.money_txt.text = "";
      this.clip.totalmoney_txt.text = class_10.method_84(this.tally_totalmoney_previous);
      this.clip.levelpoints_txt.text = "";
      this.clip.high_txt.text = class_10.method_84(this.tally_high_previous);
      this.clip.totalpoints_txt.text = class_10.method_84(this.tally_total_previous);
      this.clip.highscore_flasher.visible = false;
      this.clip.highscore_flasher.gotoAndStop(1);
      this.clip.totalwarpcoins_txt.text = _loc2_.getWarpCoins() + "/50";
      this.container.addEventListener("clickContinue", this.clickContinue);
      this.container.addEventListener("clickSubmitScore", this.clickSubmit);
      this.container.addEventListener("clickQuit", this.clickQuit);
      this.clip.levelinside.mask = this.clip.levelmask;
      this.rescueThumbs = new Vector.<Bitmap>();
      _loc4_ = 1;
      while (_loc4_ <= 6)
      {
        if (_loc2_.hasCompletedChallenge(_loc3_, _loc4_))
        {
          this.clip["icon" + _loc4_].gotoAndStop(2);
        }
        else
        {
          this.clip["icon" + _loc4_].gotoAndStop(1);
        }
        this.clip["icon" + _loc4_].num_txt.text = String(_loc4_);
        _loc6_ = this.clip["panel" + _loc4_];
        _loc7_ = this.gameObj.var_112.getChallengeType(_loc3_, _loc4_);
        _loc8_ = this.gameObj.var_112.getChallengeTargetAmount(_loc3_, _loc4_);
        _loc9_ = this.gameObj.var_112.getChallengeSkillNeeded(_loc3_, _loc4_);
        if (_loc7_ == Challenge.RESCUE)
        {
          _loc6_.description_txt.text = "Rescue:";
          _loc10_ = this.gameObj.var_113.getTrappedCustomerIndex(_loc3_, _loc4_);
          _loc11_ = this.gameObj.var_113.getCustomerBitmap(_loc10_);
          _loc12_ = new Bitmap(_loc11_);
          _loc12_.x = -8;
          _loc12_.y = -8;
          if (this.gameObj.var_113.getCustomerName(_loc10_) == "Georgito" || this.gameObj.var_113.getCustomerName(_loc10_) == "Yippy" || this.gameObj.var_113.getCustomerName(_loc10_) == "Greg")
          {
            _loc12_.y -= 8;
          }
          _loc6_.icon.gotoAndStop(1);
          _loc6_.icon.holder.addChild(_loc12_);
          _loc6_.icon.holder.mask = _loc6_.icon.masker;
          this.rescueThumbs.push(_loc12_);
        }
        else if (_loc7_ == Challenge.BURGERZILLAS)
        {
          _loc6_.description_txt.text = "Defeat " + _loc8_ + ":";
          _loc6_.icon.gotoAndStop(2);
        }
        else if (_loc7_ == Challenge.COINS)
        {
          _loc6_.description_txt.text = "Find " + _loc8_ + ":";
          _loc6_.icon.gotoAndStop(3);
        }
        else
        {
          _loc6_.description_txt.text = "Find " + _loc8_ + ":";
          _loc6_.icon.gotoAndStop(4 + _loc3_);
        }
        if (_loc9_ == CustomerData.SKILL_NONE || _loc9_ == "")
        {
          _loc6_.skill.stop();
          _loc6_.skill.visible = false;
          _loc6_.needs.visible = false;
        }
        else
        {
          _loc6_.skill.gotoAndStop(_loc9_);
        }
        if (_loc7_ == "")
        {
          _loc6_.visible = false;
          this.clip["icon" + _loc4_].visible = false;
        }
        _loc4_++;
      }
      this.gameObj.var_105.playTrack("AlternateTrack", 1, 0, "outin");
      this.clip.addEventListener(Event.ENTER_FRAME, this.updateScreen);
      this.irisClip.gotoAndPlay("irisin");
      this.gameObj.var_105.playSound("portalsound_spinfallout.wav");
    }

    public function getScoreValues():void
    {
      var _loc2_:UserData = this.gameObj.var_106;
      this.tally_challenge = _loc2_.getChallengeBonus();
      this.tally_timepoints = _loc2_.getTimeBonus();
      this.tally_money = _loc2_.getCurrentMoney();
      this.tally_points = _loc2_.getCurrentPoints();
      this.tally_high_previous = _loc2_.getLevelHighScore();
      this.tally_total_previous = _loc2_.getTotalScore();
      this.tally_totalmoney_previous = _loc2_.getTotalMoney();
      _loc2_.unlockNextLevel();
      _loc2_.setLevelTime(this.gameObj.var_108.gameplayTimer);
      this.tally_levelpoints = _loc2_.updateAndGetLevelScore();
      this.tally_high = _loc2_.getLevelHighScore();
      this.tally_totalpoints = _loc2_.getTotalScore();
      this.tally_totalmoney = _loc2_.getTotalMoney();
      if (this.tally_levelpoints > this.tally_high_previous)
      {
        this.isNewHighScore = true;
      }
      else
      {
        this.isNewHighScore = false;
      }
    }

    public function nextTally():void
    {
      var _loc1_:ScoreTallyScreen = this;
      _loc1_.delayTimer = 0 - _loc1_.delayBetweenReveals;
      ++_loc1_.whichTallyIndex;
      if (_loc1_.tallyLabels.length > _loc1_.whichTallyIndex)
      {
        _loc1_.revealingWhich = _loc1_.tallyLabels[_loc1_.whichTallyIndex];
        if (_loc1_.revealingWhich == "high" && _loc1_.isNewHighScore == false)
        {
          class_7.method_1("Skip high score and total tally, go right to money.");
          _loc1_.revealingWhich = "money";
        }
      }
      else
      {
        _loc1_.revealingWhich = "done";
      }
    }

    public function tallyScore():void
    {
      var _loc4_:String = null;
      var _loc2_:UserData = this.gameObj.var_106;
      var _loc3_:DataManager = this.gameObj.var_109;
      if (this.checkAndIncrement())
      {
        this.clip[this.revealingWhich + "_txt"].text = class_10.method_84(this["tally_" + this.revealingWhich]);
        if (this.revealingWhich == "money")
        {
          this.clip.totalmoney_txt.text = class_10.method_84(this.tally_totalmoney);
        }
        this.nextTally();
      }
      else if (this.delayTimer > 0)
      {
        _loc4_ = "0";
        if (this.revealingWhich == "high")
        {
          _loc4_ = class_10.method_84(Math.round(this.tally_high_previous + (this.tally_high - this.tally_high_previous) * (this.delayTimer / this.delayBetweenReveals)));
          if (this.isNewHighScore)
          {
            if (this.clip.highscore_flasher.visible == false)
            {
              this.clip.highscore_flasher.visible = true;
              this.clip.highscore_flasher.gotoAndPlay(1);
            }
          }
        }
        else if (this.revealingWhich == "totalpoints")
        {
          _loc4_ = class_10.method_84(Math.round(this.tally_total_previous + (this.tally_totalpoints - this.tally_total_previous) * (this.delayTimer / this.delayBetweenReveals)));
        }
        else
        {
          _loc4_ = class_10.method_84(Math.round(this["tally_" + this.revealingWhich] * (this.delayTimer / this.delayBetweenReveals)));
          if (this.revealingWhich == "money")
          {
            this.clip.totalmoney_txt.text = class_10.method_84(Math.round(this.tally_totalmoney_previous + this.tally_money * (this.delayTimer / this.delayBetweenReveals)));
          }
        }
        this.clip[this.revealingWhich + "_txt"].text = _loc4_;
      }
    }

    public function updateScreen(param1:Event):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:DataManager = this.gameObj.var_109;
      this.updateCharacters();
      if (this.animatingIn)
      {
        if (this.irisClip.currentLabel == "stopirisout")
        {
          this.clip.visible = true;
          this.animatingIn = false;
          this.gameObj.var_105.playTrack("AlternateTrack");
          this.irisClip.gotoAndPlay("irisin");
        }
      }
      else if (this.animatingOut)
      {
        if (this.irisClip.currentLabel == "stopirisout")
        {
          this.animatingOut = false;
          this.scoreTallyClosed();
        }
      }
      else if (this.revealingWhich == "anim")
      {
        if (this.checkAndIncrement())
        {
          this.nextTally();
        }
        else if (this.delayTimer == 1)
        {
          this.clip.tallyclip.gotoAndPlay("anim");
        }
      }
      else if (this.revealingWhich == "done")
      {
        this.delayTimer = 0;
        this.revealingWhich = "none";
      }
      else if (this.revealingWhich != "none")
      {
        this.tallyScore();
      }
    }

    public function checkAndIncrement():Boolean
    {
      var _loc1_:ScoreTallyScreen = this;
      ++_loc1_.delayTimer;
      if (_loc1_.delayTimer == _loc1_.delayBetweenReveals)
      {
        return true;
      }
      return false;
    }

    public function scoreTallyClosed():void
    {
      if (this.endAction == "continue")
      {
        this.gameObj.method_108();
        this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      }
      else if (this.endAction == "quit")
      {
        this.gameObj.method_108();
        this.gameObj.var_107.api.method_85("SplashScreen");
      }
      this.gameObj.var_107.api.method_86("EndOfDay");
    }

    public function clickContinue(param1:Event = null):void
    {
      this.endAction = "continue";
      this.animatingOut = true;
      this.irisClip.gotoAndPlay("irisout");
      this.gameObj.var_107.api.method_105();
      this.gameObj.var_107.closeLeaderboard();
    }

    public function clickQuit(param1:Event = null):void
    {
      this.endAction = "quit";
      this.animatingOut = true;
      this.irisClip.gotoAndPlay("irisout");
      this.gameObj.var_107.api.method_105();
      this.gameObj.var_107.closeLeaderboard();
    }

    public function clickSubmit(param1:Event = null):void
    {
      var _loc4_:Object = null;
      var _loc3_:UserData = this.gameObj.var_106;
      if (!this.didSubmitScore)
      {
        this.clip.leaderboard_cover.visible = true;
        _loc4_ = new Object();
        this.gameObj.var_107.submitScore(this.gameObj.var_106.getTotalScore(), this.gameObj.var_106.playerName, this.leaderboardClosed, _loc4_);
        this.didSubmitScore = true;
      }
    }

    public function leaderboardClosed(param1:Event = null):void
    {
      this.clip.leaderboard_cover.visible = false;
    }

    public function setupCharacters(param1:Boolean = true):void
    {
      var _loc3_:int = 0;
      var _loc4_:Array = null;
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:MovieClip = null;
      if (param1)
      {
        if (this.gameObj.var_106.savedCharacterIndex > 0 && this.gameObj.var_106.savedCharacterWasUnlocked == false)
        {
          this.unlockedChar = this.buildModel(this.gameObj.var_106.savedCharacterIndex, 1);
          this.unlockedChar.gotoAndStop(1);
          this.unlockedChar.gotoAndStop("jump");
          this.unlockedChar.x = this.unlockedStartX;
          this.unlockedChar.y = this.unlockedStartY;
          this.clip.charholder.addChild(this.unlockedChar);
          this.didUnlockNewCustomer = true;
          this.unlockedNewCustomerIndex = this.gameObj.var_106.savedCharacterIndex;
        }
        this.playerChar = this.buildModel(this.gameObj.var_106.selectedCharacter, this.gameObj.var_106.selectedStyle);
        this.playerChar.gotoAndStop(1);
        this.playerChar.gotoAndStop("jump");
        this.playerChar.scaleX = -0.5;
        this.playerChar.x = this.playerStartX;
        this.playerChar.y = this.playerStartY;
        this.clip.charholder.addChild(this.playerChar);
        _loc4_ = [];
        _loc3_ = 0;
        while (_loc3_ < 28)
        {
          if (this.gameObj.var_106.customersUnlocked[_loc3_] == 1 && (_loc3_ != this.gameObj.var_106.savedCharacterIndex || this.gameObj.var_106.savedCharacterWasUnlocked == true) && _loc3_ != this.gameObj.var_106.selectedCharacter)
          {
            _loc4_.push(_loc3_);
          }
          _loc3_++;
        }
        _loc3_ = 1;
        while (_loc3_ <= 3)
        {
          if (_loc4_.length > 0)
          {
            _loc5_ = Math.floor(Math.random() * _loc4_.length);
            _loc6_ = Number(_loc4_[_loc5_]);
            _loc4_.splice(_loc5_, 1);
            _loc7_ = this.buildModel(_loc6_, 1);
            _loc7_.gotoAndStop(1);
            _loc7_.gotoAndPlay("standlobby");
            _loc7_.gotoAndPlay(_loc7_.currentFrame + Math.floor(Math.random() * 12));
            _loc7_.scaleX = -0.5;
            if (_loc3_ == 1)
            {
              this.crowdChar1 = _loc7_;
              this.crowdChar1.x = 140;
              this.crowdChar1.y = 200;
              this.clip.charholder.addChild(this.crowdChar1);
            }
            else if (_loc3_ == 2)
            {
              this.crowdChar2 = _loc7_;
              this.crowdChar2.x = 49;
              this.crowdChar2.y = 198;
              this.clip.charholder.addChild(this.crowdChar2);
            }
            else if (_loc3_ == 3)
            {
              this.crowdChar3 = _loc7_;
              this.crowdChar3.x = 91;
              this.crowdChar3.y = 229;
              this.clip.charholder.addChild(this.crowdChar3);
            }
            _loc7_ = null;
          }
          _loc3_++;
        }
      }
      else
      {
        if (this.unlockedChar)
        {
          this.clip.charholder.removeChild(this.unlockedChar);
          this.cleanupModel(this.unlockedChar);
          this.unlockedChar = null;
        }
        if (this.playerChar)
        {
          this.clip.charholder.removeChild(this.playerChar);
          this.cleanupModel(this.playerChar);
          this.playerChar = null;
        }
        if (this.crowdChar1)
        {
          this.clip.charholder.removeChild(this.crowdChar1);
          this.cleanupModel(this.crowdChar1);
          this.crowdChar1 = null;
        }
        if (this.crowdChar2)
        {
          this.clip.charholder.removeChild(this.crowdChar2);
          this.cleanupModel(this.crowdChar2);
          this.crowdChar2 = null;
        }
        if (this.crowdChar3)
        {
          this.clip.charholder.removeChild(this.crowdChar3);
          this.cleanupModel(this.crowdChar3);
          this.crowdChar3 = null;
        }
      }
    }

    public function updateCharacters():void
    {
      var _loc2_:Number = NaN;
      var _loc3_:Number = NaN;
      var _loc6_:Array = null;
      var _loc7_:Number = NaN;
      var _loc5_:Number = 0;
      if (this.playerJumping)
      {
        _loc5_ = this.playerJumpSpeed;
        this.playerJumpSpeed += 2;
        if (this.playerJumpSpeed > 20)
        {
          this.playerJumpSpeed = 20;
        }
        if (_loc5_ < 0 && this.playerJumpSpeed >= 0)
        {
          this.playerChar.gotoAndPlay("fall");
        }
        this.playerChar.x += this.walkSpeed;
        if (this.playerChar.x > this.playerTargetX)
        {
          this.playerChar.x = this.playerTargetX;
        }
        this.playerChar.y += this.playerJumpSpeed;
        if (this.playerChar.y > this.playerTargetY)
        {
          this.playerChar.y = this.playerTargetY;
        }
        _loc2_ = this.playerTargetX - this.playerChar.x;
        _loc3_ = this.playerTargetY - this.playerChar.y;
        if (Math.abs(_loc2_) <= 1 && Math.abs(_loc3_) <= 1)
        {
          this.playerChar.x = this.playerTargetX;
          this.playerChar.y = this.playerTargetY;
          this.playerChar.gotoAndPlay("standhappy");
          this.playerJumping = false;
          this.playerLanded = true;
          _loc6_ = ["clap", "wave", "overjoyed", "standhappy", "standhappy"];
          _loc7_ = -1;
          if (this.crowdChar1 != null)
          {
            _loc7_ = Math.floor(Math.random() * _loc6_.length);
            this.crowdChar1.gotoAndPlay(_loc6_[_loc7_]);
            _loc6_.splice(_loc7_, 1);
          }
          if (this.crowdChar2 != null)
          {
            _loc7_ = Math.floor(Math.random() * _loc6_.length);
            this.crowdChar2.gotoAndPlay(_loc6_[_loc7_]);
            _loc6_.splice(_loc7_, 1);
          }
          if (this.crowdChar3 != null)
          {
            _loc7_ = Math.floor(Math.random() * _loc6_.length);
            this.crowdChar3.gotoAndPlay(_loc6_[_loc7_]);
            _loc6_.splice(_loc7_, 1);
          }
        }
      }
      if (this.unlockedChar != null)
      {
        if (this.unlockedJumping)
        {
          _loc5_ = this.unlockedJumpSpeed;
          this.unlockedJumpSpeed += 2;
          if (this.unlockedJumpSpeed > 20)
          {
            this.unlockedJumpSpeed = 20;
          }
          if (_loc5_ < 0 && this.unlockedJumpSpeed >= 0)
          {
            this.unlockedChar.gotoAndPlay("fall");
          }
          this.unlockedChar.x -= this.walkSpeed;
          if (this.unlockedChar.x < this.unlockedTargetX)
          {
            this.unlockedChar.x = this.unlockedTargetX;
          }
          this.unlockedChar.y += this.unlockedJumpSpeed;
          if (this.unlockedChar.y > this.unlockedTargetY)
          {
            this.unlockedChar.y = this.unlockedTargetY;
          }
          _loc2_ = this.unlockedTargetX - this.unlockedChar.x;
          _loc3_ = this.unlockedTargetY - this.unlockedChar.y;
          if (Math.abs(_loc2_) <= 1 && Math.abs(_loc3_) <= 1)
          {
            this.unlockedChar.x = this.unlockedTargetX;
            this.unlockedChar.y = this.unlockedTargetY;
            this.unlockedChar.gotoAndPlay("overjoyed");
            this.unlockedJumping = false;
            this.unlockedLanded = true;
          }
        }
      }
    }

    private function buildModel(param1:Number, param2:Number):MovieClip
    {
      var _loc4_:MovieClip = null;
      var _loc36_:Class = null;
      var _loc37_:Class = null;
      var _loc38_:MovieClip = null;
      var _loc39_:MovieClip = null;
      var _loc40_:MovieClip = null;
      var _loc41_:MovieClip = null;
      var _loc5_:String = this.gameObj.var_113.getCustomerClipName(param1);
      var _loc6_:String = this.gameObj.var_113.getCustomerType(param1);
      _loc4_ = new customerLobbyMC();
      var _loc7_:String = _loc5_;
      if (param2 == 2)
      {
        _loc7_ += "2";
      }
      else if (param2 == 3)
      {
        _loc7_ += "3";
      }
      var _loc8_:Class = getDefinitionByName("customer_" + _loc7_ + "_body") as Class;
      var _loc9_:MovieClip = new _loc8_();
      _loc9_.name = "clip";
      _loc4_.body.addChild(_loc9_);
      var _loc10_:Class = getDefinitionByName("customer_" + _loc7_ + "_head") as Class;
      var _loc11_:MovieClip = new _loc10_();
      _loc11_.name = "clip";
      _loc4_.head.addChild(_loc11_);
      var _loc12_:Class = getDefinitionByName("customer_" + _loc7_ + "_eyes") as Class;
      var _loc13_:MovieClip = new _loc12_();
      _loc13_.name = "clip";
      _loc4_.eyes.addChild(_loc13_);
      var _loc14_:Class = getDefinitionByName("customer_" + _loc7_ + "_mouth") as Class;
      var _loc15_:MovieClip = new _loc14_();
      _loc15_.name = "clip";
      _loc4_.mouth.addChild(_loc15_);
      var _loc16_:Class = getDefinitionByName("customer_" + _loc7_ + "_neck") as Class;
      var _loc17_:MovieClip = new _loc16_();
      _loc17_.name = "clip";
      _loc4_.neck.addChild(_loc17_);
      var _loc18_:MovieClip = null;
      try
      {
        _loc36_ = getDefinitionByName("customer_" + _loc7_ + "_hair") as Class;
        _loc18_ = new _loc36_();
        _loc18_.name = "clip";
        _loc4_.hair.addChild(_loc18_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc37_ = getDefinitionByName("customer_" + _loc7_ + "_back_hair") as Class;
        _loc38_ = new _loc37_();
        _loc38_.name = "clip";
        _loc4_.back_hair.addChild(_loc38_);
      }
      catch (err:Error)
      {
      }
      var _loc19_:Class = getDefinitionByName("customer_" + _loc7_ + "_foot") as Class;
      var _loc20_:MovieClip = new _loc19_();
      _loc20_.name = "clip";
      _loc4_.front_shoe.addChild(_loc20_);
      var _loc21_:MovieClip = new _loc19_();
      _loc21_.name = "clip";
      _loc4_.back_shoe.addChild(_loc21_);
      var _loc22_:String = "customer_" + _loc7_ + "_hand";
      var _loc23_:Class = getDefinitionByName(_loc22_) as Class;
      var _loc24_:MovieClip = new _loc23_();
      _loc24_.name = "clip";
      _loc4_.fronthand.addChild(_loc24_);
      var _loc25_:Class = getDefinitionByName("customer_" + _loc7_ + "_hand2") as Class;
      var _loc26_:MovieClip = new _loc25_();
      _loc26_.name = "clip";
      _loc4_.backhand.addChild(_loc26_);
      var _loc27_:Class = getDefinitionByName("customer_" + _loc7_ + "_upperarm") as Class;
      var _loc28_:MovieClip = new _loc27_();
      _loc28_.name = "clip";
      _loc4_.front_upperarm.addChild(_loc28_);
      var _loc29_:MovieClip = new _loc27_();
      _loc29_.name = "clip";
      _loc4_.back_upperarm.addChild(_loc29_);
      var _loc30_:Class = getDefinitionByName("customer_" + _loc7_ + "_forearm") as Class;
      var _loc31_:MovieClip = new _loc30_();
      _loc31_.name = "clip";
      _loc4_.front_forearm.addChild(_loc31_);
      var _loc32_:MovieClip = new _loc30_();
      _loc32_.name = "clip";
      _loc4_.back_forearm.addChild(_loc32_);
      try
      {
        _loc39_ = new _loc30_();
        _loc39_.name = "clip";
        _loc4_.cross_backforearm.addChild(_loc39_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc40_ = new _loc25_();
        _loc40_.name = "clip";
        _loc4_.cross_back_hand.addChild(_loc40_);
      }
      catch (err:Error)
      {
      }
      var _loc33_:String = this.gameObj.var_113.getWeaponClipName(this.gameObj.var_106.selectedCharacter, this.gameObj.var_106.selectedStyle);
      var _loc34_:Class = getDefinitionByName("weapon_" + _loc33_) as Class;
      var _loc35_:MovieClip = new _loc34_();
      _loc35_.name = "clip";
      try
      {
        _loc4_.weapon.addChild(_loc35_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc41_ = new _loc34_();
        _loc41_.name = "clip";
        _loc4_.cross_back_weap.addChild(_loc41_);
      }
      catch (err:Error)
      {
      }
      _loc4_.scaleX = 0.5;
      _loc4_.scaleY = 0.5;
      _loc4_.mouseEnabled = false;
      _loc4_.mouseChildren = false;
      return _loc4_;
    }

    private function cleanupModel(param1:MovieClip):void
    {
      var whichModel:MovieClip = param1;
      var ob:ScoreTallyScreen = this;
      whichModel.stop();
      whichModel.filters = [];
      try
      {
        whichModel.body.removeChildAt(0);
        whichModel.head.removeChildAt(0);
        whichModel.eyes.removeChildAt(0);
        whichModel.mouth.removeChildAt(0);
        whichModel.neck.removeChildAt(0);
        whichModel.front_shoe.removeChildAt(0);
        whichModel.back_shoe.removeChildAt(0);
        whichModel.fronthand.removeChildAt(0);
        whichModel.backhand.removeChildAt(0);
        whichModel.front_upperarm.removeChildAt(0);
        whichModel.back_upperarm.removeChildAt(0);
        whichModel.front_forearm.removeChildAt(0);
        whichModel.back_forearm.removeChildAt(0);
      }
      catch (err:Error)
      {
        class_7.error("Error removing parts of customer");
      }
      try
      {
        whichModel.weapon.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.cross_backforearm.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.cross_back_hand.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.cross_back_weap.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.hair.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.back_hair.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      try
      {
        whichModel.glider.removeChildAt(0);
      }
      catch (err:Error)
      {
      }
      whichModel = null;
    }

    public function destroy():void
    {
      var _loc2_:int = 0;
      if (Boolean(this.rescueThumbs) && this.rescueThumbs.length > 0)
      {
        _loc2_ = 0;
        while (_loc2_ < this.rescueThumbs.length)
        {
          if (this.rescueThumbs[_loc2_] != null)
          {
            this.rescueThumbs[_loc2_].bitmapData.dispose();
            this.rescueThumbs[_loc2_].bitmapData = null;
            this.rescueThumbs[_loc2_].parent.removeChild(this.rescueThumbs[_loc2_]);
            this.rescueThumbs[_loc2_] = null;
          }
          _loc2_++;
        }
        this.rescueThumbs = null;
      }
      this.setupCharacters(false);
      try
      {
        this.clip.removeEventListener(Event.ENTER_FRAME, this.updateScreen);
      }
      catch (err:Error)
      {
      }
      this.container.removeEventListener("clickContinue", this.clickContinue);
      this.container.removeEventListener("clickSubmitScore", this.clickSubmit);
      this.container.removeEventListener("clickQuit", this.clickQuit);
      this.container.removeChild(this.irisClip);
      this.container.removeChild(this.clip);
      this.clip = null;
      this.irisClip = null;
    }
  }
}
