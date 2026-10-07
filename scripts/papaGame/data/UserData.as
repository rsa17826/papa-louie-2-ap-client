// this.so.data.(\w+) = (.*);

// this.so.data.$1 = $2;
// ExternalInterface.call("log"', this.so.data.$1', , this.so.data.$1);

package papaGame.data
{
  import flash.external.ExternalInterface;
  import flash.events.NetStatusEvent;
  import flash.net.SharedObject;
  import flash.net.SharedObjectFlushStatus;
  import flash.utils.getTimer;
  import mochi.as3.MochiDigits;
  import package_2.class_12;
  import package_2.class_7;
  import package_4.class_5;
  import papaGame.managers.ChallengeManager;

  public class UserData
  {

    public var gameObj:class_5;
    public var saveSlotPrefix:String = "PapaLouie2_";
    public var saveSlotVersion:String = "1.0";
    public var saveSlotMaxSize:Number = 15360;
    public var so:SharedObject = null;
    public var whichSlot:Number = 1;
    public var playerName:String = "Marty";
    public var whichCharacter:String = "customer";
    public var lastCustomerUnlocked:Number = 0;
    public var selectedCharacter:Number = 0;
    public var selectedStyle:Number = 1;
    public var savedCharacterIndex:Number = -1;
    public var savedCharacterWasUnlocked:Boolean = false;
    public var points:MochiDigits = new MochiDigits(0);
    public var money:MochiDigits = new MochiDigits(0);
    public var burgerzillas:MochiDigits = new MochiDigits(0);
    public var specialitems:MochiDigits = new MochiDigits(0);
    public var livesLost:MochiDigits = new MochiDigits(0);
    public var levelTimePlayed:MochiDigits = new MochiDigits(0);
    public var warpCoinsEarned:MochiDigits = new MochiDigits(500);
    public var killsPerWeapon:Array = [];
    public var killsTally:Number = 0;
    public var gotHurt:Boolean = false;
    public var fellInWater:Boolean = false;
    public var alreadyEarned100:Boolean = false;
    public var startingLives:MochiDigits = new MochiDigits(0);
    public var scorePerShortBonus:MochiDigits = new MochiDigits(500);
    public var scorePerLongBonus:MochiDigits = new MochiDigits(1000);
    public var scoreShortCutoff:MochiDigits = new MochiDigits(450);
    public var scoreTimeMaximum:MochiDigits = new MochiDigits(2500);
    public var scoreLostPerLife:MochiDigits = new MochiDigits(500);
    public var scoreForNoDeaths:MochiDigits = new MochiDigits(2500);
    public var scorePerTreasureEarned:MochiDigits = new MochiDigits(500);
    public var scorePerChallengeCompeleted:MochiDigits = new MochiDigits(500);
    public var timeBonus:MochiDigits = new MochiDigits(0);
    public var startingBonus:MochiDigits = new MochiDigits(9000);
    public var timeBonusMinimums:Array = [2610, 4950, 7050, 8550, 5850, 8700, 10350, 10800, 4050, 12600];
    public var scoreLostPerMinuteOver:MochiDigits = new MochiDigits(500);
    public var totalScore:MochiDigits = new MochiDigits(0);
    public var totalMoney:MochiDigits = new MochiDigits(0);
    public var totalLives:MochiDigits = new MochiDigits(0);
    public var warpCoins:MochiDigits = new MochiDigits(0);
    public var totalTimePlayed:MochiDigits = new MochiDigits(0);
    public var areasUnlocked:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var highScores:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var bestTimes:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var hasRevealedLatestArea:Boolean = true;
    public var lastAreaRevealed:Number = 0;
    public var challengesCompleted:Array = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]];
    public var customersUnlocked:Array = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var customersUsed:Array = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var customerOutfits:Array = [[1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0]];
    public var enemyKills:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var medalsEarned:Array = [];
    public var medalProgress:Array = [];
    public var hasContinuedGame:Boolean = false;
    public var didClickTwitter:Boolean = false;
    public var didClickFacebook:Boolean = false;
    public var trainingFlagNames:Array = ["doublejump", "crawl", "push", "groundpound", "glide", "walljump", "character", "nowarpkeys", "challenges", "walk", "jump", "attack", "stun", "slide", "ladder", "menu", "poundcontext", "styles"];
    public var trainingFlags:Array = [];
    public var keyCodeLeft:Number = 37;
    public var keyCodeRight:Number = 39;
    public var keyCodeUp:Number = 38;
    public var keyCodeDown:Number = 40;
    public var keyCodeJump:Number = 38;
    public var keyCodeAttack:Number = 32;
    public var keyCodeDrop:Number = 68;
    public var keyCodePause:Number = 80;

    // private var defaultKeyCodeLeft:Number = 37;
    private var defaultKeyCodeLeft:Number = 65;
    // private var defaultKeyCodeRight:Number = 39;
    private var defaultKeyCodeRight:Number = 68;
    // private var defaultKeyCodeUp:Number = 38;
    private var defaultKeyCodeUp:Number = 87;
    // private var defaultKeyCodeDown:Number = 40;
    private var defaultKeyCodeDown:Number = 83;
    // private var defaultKeyCodeJump:Number = 38;
    private var defaultKeyCodeJump:Number = 87;
    // private var defaultKeyCodeAttack:Number = 32;
    private var defaultKeyCodeAttack:Number = 16;
    // private var defaultKeyCodeDrop:Number = 68;
    private var defaultKeyCodeDrop:Number = 68;
    // private var defaultKeyCodePause:Number = 80;
    private var defaultKeyCodePause:Number = 80;

    public function UserData(param1:class_5)
    {
      super();
      this.gameObj = param1;
      this.totalLives.setValue(this.startingLives.value);
      this.clearTallies();
    }

    public function resetLives():void
    {
      this.totalLives.setValue(this.startingLives.value);
    }

    public function adjustLives(param1:Number):Boolean
    {
      this.totalLives.addValue(param1);
      if (this.gameObj.var_115)
      {
        this.gameObj.var_115.updateDisplay();
      }
      if (param1 < 0)
      {
        this.livesLost.addValue(Math.abs(param1));
      }
      if (this.totalLives.value >= 0)
      {
        return true;
      }
      return false;
    }

    public function earnPoints(param1:Number):void
    {
      this.points.addValue(param1);
      if (this.gameObj.var_115)
      {
        this.gameObj.var_115.updateDisplay();
      }
    }

    public function earnMoney(param1:Number = 1):void
    {
      this.money.addValue(param1);
      if (this.gameObj.var_115)
      {
        this.gameObj.var_115.updateDisplay();
      }
    }

    public function earnWarpCoin():void
    {
      class_7.method_1("EARN A WARP COIN!");
      this.gameObj.var_112.recordTag("warpCoin");
      // this.warpCoins.addValue(1);
      // this.warpCoinsEarned.addValue(1);
    }

    public function unlockCustomer(param1:Number):void
    {
      if (this.gameObj.var_109.currentLevel == 9 && param1 == 27)
      {
        ExternalInterface.call("newItem", "level9 - char:xandra");
      }
      ExternalInterface.call("warn", this.gameObj.var_109.currentLevel, param1);
      // if (param1 < this.customersUnlocked.length)
      // {
      // if (this.customersUnlocked[param1] == 0)
      // {
      // this.gameObj.var_112.recordTag("customerUnlocked");
      // }
      // this.customersUnlocked[param1] = 1;
      // }
    }

    public function collectSpecialItem(param1:Number = 1):void
    {
      this.specialitems.addValue(param1);
      if (this.gameObj.var_115)
      {
        this.gameObj.var_115.updateDisplay();
      }
      this.gameObj.var_112.recordSpecialItem(param1);
    }

    public function killBurgerzilla(param1:Number = 1):void
    {
      this.burgerzillas.addValue(param1);
      if (this.gameObj.var_115)
      {
        this.gameObj.var_115.updateDisplay();
      }
      this.gameObj.var_112.recordBurgerzilla(param1);
    }

    public function clearTallies():void
    {
      this.timeBonus.setValue(this.startingBonus.value);
      this.levelTimePlayed.setValue(0);
      this.livesLost.setValue(0);
      this.money.setValue(0);
      this.points.setValue(0);
      this.burgerzillas.setValue(0);
      this.specialitems.setValue(0);
      this.warpCoinsEarned.setValue(0);
      this.killsPerWeapon = [];
      this.killsTally = 0;
      this.gotHurt = false;
      this.fellInWater = false;
      this.savedCharacterIndex = -1;
    }

    public function getTimeBonus():Number
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc2_:Number = this.gameObj.var_109.currentLevel;
      if (this.totalLives.value >= 0)
      {
        _loc3_ = Number(this.timeBonusMinimums[_loc2_]);
        _loc4_ = this.levelTimePlayed.value - _loc3_;
        _loc5_ = 0;
        if (_loc4_ <= 0)
        {
          _loc5_ = 0;
        }
        else if (_loc4_ <= 1800)
        {
          _loc5_ = 1;
        }
        else if (_loc4_ <= 3600)
        {
          _loc5_ = 2;
        }
        else if (_loc4_ <= 5400)
        {
          _loc5_ = 3;
        }
        else if (_loc4_ <= 7200)
        {
          _loc5_ = 4;
        }
        else if (_loc4_ > 7200)
        {
          _loc5_ = 5;
        }
        return this.scoreTimeMaximum.value - _loc5_ * this.scoreLostPerMinuteOver.value;
      }
      return 0;
    }

    public function getLivesTally():Number
    {
      if (this.totalLives.value >= 0)
      {
        return this.totalLives.value;
      }
      return 0;
    }

    public function getLivesLostTally():Number
    {
      return this.livesLost.value;
    }

    public function getLivesBonus():Number
    {
      if (this.totalLives.value >= 0)
      {
        if (this.livesLost.value == 0)
        {
          return this.scoreForNoDeaths.value;
        }
        return Math.max(0, this.scoreForNoDeaths.value - this.livesLost.value * this.scoreLostPerLife.value);
      }
      return 0;
    }

    public function getTreasureBonus():Number
    {
      return 0;
    }

    public function getChallengeBonus():Number
    {
      return this.getChallengeTally() * this.scorePerChallengeCompeleted.value;
    }

    public function getChallengeTally():Number
    {
      var _loc4_:int = 0;
      var _loc2_:Number = this.gameObj.var_109.currentLevel;
      var _loc3_:Number = 0;
      if (this.challengesCompleted.length > _loc2_)
      {
        _loc4_ = 0;
        while (_loc4_ < this.challengesCompleted[_loc2_].length)
        {
          if (this.challengesCompleted[_loc2_][_loc4_] == 1)
          {
            _loc3_++;
          }
          _loc4_++;
        }
      }
      return _loc3_;
    }

    public function unlockNextLevel():void
    {
      // var _loc2_:Number = this.gameObj.var_109.currentLevel;
      // var _loc3_:int = 0;
      // while (_loc3_ < this.gameObj.var_109.coinsToUnlockWorld.length)
      // {
      // // if (this.getWarpCoins() >= this.gameObj.var_109.coinsToUnlockWorld[_loc3_])
      // // {
      // // if (this.areasUnlocked[_loc3_] == 0)
      // // {
      // // class_7.method_1(">>>> UNLOCK WORLD " + (_loc3_ + 1));
      // // this.areasUnlocked[_loc3_] = 1;
      // // this.hasRevealedLatestArea = false;
      // // }
      // // }
      // _loc3_++;
      // }
    }

    public function updateAndGetLevelScore(param1:Boolean = true, param2:Boolean = true):Number
    {
      var _loc4_:Number = 0;
      var _loc5_:Number = this.points.value + this.getTimeBonus() + this.getChallengeBonus();
      if (_loc5_ < 0)
      {
        _loc5_ = 0;
      }
      this.saveHighScore(_loc5_);
      if (param1)
      {
        _loc4_ = _loc5_;
      }
      else
      {
        _loc4_ = this.getLevelHighScore();
      }
      this.totalMoney.addValue(this.money.value);
      this.totalScore.setValue(this.getTotalScore());
      this.clearTallies();
      if (param2)
      {
        this.saveProgress();
      }
      return _loc4_;
    }

    public function getCurrentPoints():Number
    {
      return this.points.value;
    }

    public function getCurrentMoney():Number
    {
      return this.money.value;
    }

    public function getCurrentBurgerzillas():Number
    {
      return this.burgerzillas.value;
    }

    public function getCurrentSpecialItems():Number
    {
      return this.specialitems.value;
    }

    public function getLevelHighScore(param1:Number = -1):Number
    {
      if (param1 == -1)
      {
        param1 = this.gameObj.var_109.currentLevel;
      }
      if (this.highScores.length > param1)
      {
        return this.highScores[param1];
      }
      return 0;
    }

    public function saveHighScore(param1:Number, param2:Number = -1, param3:Boolean = true):void
    {
      var _loc5_:Number = NaN;
      if (param2 == -1)
      {
        param2 = this.gameObj.var_109.currentLevel;
      }
      if (this.highScores.length > param2)
      {
        _loc5_ = Number(this.highScores[param2]);
        if (_loc5_ == 0)
        {
          this.gameObj.var_107.api.method_100("BeatLevel", param2 + 1);
        }
        if (param1 > _loc5_ || param3 == false)
        {
          this.highScores[param2] = param1;
        }
      }
    }

    public function setLevelTime(param1:Number):void
    {
      var _loc4_:Number = NaN;
      var _loc3_:Number = this.gameObj.var_109.currentLevel;
      if (this.bestTimes.length > _loc3_)
      {
        _loc4_ = Number(this.bestTimes[_loc3_]);
        if (param1 < _loc4_ || _loc4_ == 0)
        {
          this.bestTimes[_loc3_] = param1;
        }
      }
    }

    public function getLevelBestTime(param1:Number = -1):Number
    {
      if (param1 == -1)
      {
        param1 = this.gameObj.var_109.currentLevel;
      }
      if (this.bestTimes.length > param1)
      {
        return this.bestTimes[param1];
      }
      return 0;
    }

    public function getTotalScore():Number
    {
      var _loc5_:int = 0;
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < this.highScores.length)
      {
        _loc2_ += this.highScores[_loc3_];
        _loc3_++;
      }
      var _loc4_:ChallengeManager = this.gameObj.var_112;
      if (_loc4_)
      {
        _loc5_ = 0;
        while (_loc5_ < _loc4_.badges.length)
        {
          if (this.medalsEarned[_loc5_] == 1)
          {
            _loc2_ += Challenge(_loc4_.badges[_loc5_]).rewardMoney;
          }
          _loc5_++;
        }
      }
      return _loc2_;
    }

    public function getTotalMoney():Number
    {
      return this.totalMoney.value;
    }

    public function getWarpCoins():Number
    {
      return this.warpCoins.value;
    }

    public function getEnemyKills(param1:Number):Number
    {
      var _loc3_:Number = 0;
      if (param1 < this.enemyKills.length && param1 >= 0)
      {
        _loc3_ = Number(this.enemyKills[param1]);
      }
      return _loc3_;
    }

    public function hasCompletedChallenge(param1:Number, param2:Number):Boolean
    {
      var _loc4_:Boolean = false;
      if (param1 > -1 && this.challengesCompleted.length > param1)
      {
        if (this.challengesCompleted[param1].length > param2 - 1)
        {
          if (this.challengesCompleted[param1][param2 - 1] == 1)
          {
            _loc4_ = true;
          }
        }
      }
      return _loc4_;
    }

    public function completeChallenge(param1:Number, param2:Number):void
    {
      if (this.challengesCompleted.length > param1)
      {
        this.challengesCompleted[param1][param2 - 1] = 1;
      }
      this.gameObj.var_107.api.method_100("Challenge " + param2, param1 + 1);
      if (!this.alreadyEarned100 && this.hasEarnedEverything())
      {
        this.gameObj.var_107.api.method_88("100 Percent Complete", "Gameplay", true);
        this.alreadyEarned100 = true;
      }
      if (param1 != 9)
      {
        this.earnWarpCoin();
        try
        {
          this.gameObj.var_104.addEffect(this.gameObj.playerObj.x, this.gameObj.playerObj.y, "WarpCoinEffect", "", true, 0, -30);
        }
        catch (err:Error)
        {
        }
      }
    }

    public function getTotalChallengesCompleted():Number
    {
      var _loc4_:int = 0;
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < this.challengesCompleted.length)
      {
        _loc4_ = 0;
        while (_loc4_ < this.challengesCompleted[_loc3_].length)
        {
          if (this.challengesCompleted[_loc3_][_loc4_] == 1)
          {
            _loc2_++;
          }
          _loc4_++;
        }
        _loc3_++;
      }
      return _loc2_;
    }

    public function hasBadge(param1:Number):Boolean
    {
      var _loc3_:Boolean = false;
      if (this.medalsEarned.length > param1)
      {
        if (this.medalsEarned[param1] == 1)
        {
          _loc3_ = true;
        }
      }
      return _loc3_;
    }

    public function earnBadge(param1:Number, param2:String = ""):void
    {
      this.medalsEarned[param1] = 1;
      this.gameObj.var_107.api.method_88("Badge " + param1 + ": " + param2, "Badges");
      if (!this.alreadyEarned100 && this.hasEarnedEverything())
      {
        this.gameObj.var_107.api.method_88("100 Percent Complete", "Gameplay", true);
        this.alreadyEarned100 = true;
      }
    }

    public function getTotalBadgesEarned():Number
    {
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < this.medalsEarned.length)
      {
        if (this.medalsEarned[_loc3_] == 1)
        {
          _loc2_++;
        }
        _loc3_++;
      }
      return _loc2_;
    }

    public function hasCustomerUnlocked(param1:Number):Boolean
    {
      var _loc3_:Boolean = false;
      if (param1 < this.customersUnlocked.length)
      {
        if (this.customersUnlocked[param1] == 1)
        {
          _loc3_ = true;
        }
      }
      return _loc3_;
    }

    public function hasOutfitUnlocked(param1:Number, param2:Number):Boolean
    {
      var _loc4_:Boolean = false;
      if (param1 < this.customerOutfits.length && param2 < this.customerOutfits[param1].length)
      {
        if (this.customersUnlocked[param1] == 1 && this.customerOutfits[param1][param2] == 1)
        {
          _loc4_ = true;
        }
      }
      return _loc4_;
    }

    public function getBestOutfit(param1:Number):Number
    {
      var _loc4_:int = 0;
      var _loc3_:Number = 1;
      if (param1 < this.customerOutfits.length)
      {
        _loc4_ = 1;
        while (_loc4_ < this.customerOutfits[param1].length)
        {
          if (this.customerOutfits[param1][_loc4_] == 1)
          {
            _loc3_ = _loc4_ + 1;
          }
          _loc4_++;
        }
      }
      return _loc3_;
    }

    public function purchaseOutfit(param1:Number, param2:Number):Boolean
    {
      var _loc4_:Boolean = false;
      var _loc5_:Number = this.gameObj.var_109.getOutfitPrice(param1, param2);
      if (this.totalMoney.value >= _loc5_)
      {
        this.customerOutfits[param1][param2] = 1;
        this.totalMoney.setValue(this.totalMoney.value - _loc5_);
        _loc4_ = true;
        this.setTrained("styles");
        this.gameObj.var_112.recordTag("buyOutfit");
        this.saveProgress("outfit");
      }
      return _loc4_;
    }

    public function getTotalCustomersUnlocked():Number
    {
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < this.customersUnlocked.length)
      {
        if (this.customersUnlocked[_loc3_] == 1)
        {
          _loc2_++;
        }
        _loc3_++;
      }
      return _loc2_;
    }

    public function getTotalLevelsCompleted():Number
    {
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < 10)
      {
        if (this.areasUnlocked[_loc3_] == 1 && this.getLevelHighScore(_loc3_) > 0)
        {
          _loc2_++;
        }
        _loc3_++;
      }
      return _loc2_;
    }

    public function hasBeatGame():Number
    {
      if (this.areasUnlocked[8] == 1 && this.getLevelHighScore(8) > 0)
      {
        return 1;
      }
      return 0;
    }

    public function loadSlotDataForBackup(param1:Number):Object
    {
      var _loc3_:Object = null;
      var _loc4_:SharedObject = SharedObject.getLocal(this.saveSlotPrefix + param1, "/");
      if (_loc4_.data.playerName)
      {
        _loc3_ = _loc4_.data;
      }
      return _loc3_;
    }

    public function loadLabelsForSlot(param1:Number):Object
    {
      // TODO save data loading?
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc7_:ChallengeManager = null;
      var _loc8_:Number = NaN;
      var _loc9_:Number = NaN;
      var _loc10_:Number = NaN;
      var _loc11_:Number = NaN;
      var _loc12_:Number = NaN;
      var _loc13_:Number = NaN;
      var _loc14_:Number = NaN;
      var _loc15_:Number = NaN;
      var _loc16_:Number = NaN;
      var _loc17_:Number = NaN;
      var _loc18_:Number = NaN;
      var _loc19_:Number = NaN;
      var _loc20_:String = null;
      var _loc21_:String = null;
      var _loc22_:int = 0;
      var _loc3_:Object = null;
      var _loc6_:SharedObject = SharedObject.getLocal(this.saveSlotPrefix + param1, "/");
      if (_loc6_.data.playerName)
      {
        _loc3_ = {};
        _loc3_.name = _loc6_.data.playerName;
        _loc3_.score = 0;
        _loc3_.coins = _loc6_.data.totalMoney;
        _loc3_.warpcoins = _loc6_.data.warpCoins;
        _loc3_.customers = 0;
        _loc4_ = 0;
        while (_loc4_ < _loc6_.data.customersUnlocked.length)
        {
          if (_loc6_.data.customersUnlocked[_loc4_] == 1)
          {
            ++_loc3_.customers;
          }
          _loc4_++;
        }
        if (_loc6_.data.char)
        {
          _loc3_.char = _loc6_.data.char;
        }
        else
        {
          _loc3_.char = 0;
        }
        if (_loc6_.data.style)
        {
          _loc3_.style = _loc6_.data.style;
        }
        else
        {
          _loc3_.style = 1;
        }
        if (_loc6_.data.totalTime)
        {
          _loc3_.time = _loc6_.data.totalTime;
        }
        else
        {
          _loc3_.time = 0;
        }
        _loc4_ = 0;
        while (_loc4_ < _loc6_.data.highScores.length)
        {
          _loc3_.score += _loc6_.data.highScores[_loc4_];
          _loc4_++;
        }
        _loc7_ = this.gameObj.var_112;
        if (_loc7_)
        {
          _loc22_ = 0;
          while (_loc22_ < _loc7_.badges.length)
          {
            if (_loc6_.data.medalsEarned[_loc22_] == 1)
            {
              _loc3_.score += Challenge(_loc7_.badges[_loc22_]).rewardMoney;
            }
            _loc22_++;
          }
        }
        _loc8_ = 0;
        _loc9_ = 0;
        _loc10_ = 0;
        _loc11_ = 0;
        _loc12_ = 0;
        _loc13_ = 0;
        _loc14_ = 0;
        _loc15_ = 0;
        _loc4_ = 0;
        while (_loc4_ < _loc6_.data.highScores.length)
        {
          _loc8_++;
          if (_loc6_.data.highScores[_loc4_] > 0)
          {
            _loc9_++;
          }
          _loc4_++;
        }
        _loc4_ = 0;
        while (_loc4_ < _loc6_.data.challengesCompleted.length)
        {
          _loc5_ = 0;
          while (_loc5_ < _loc6_.data.challengesCompleted[_loc4_].length)
          {
            _loc10_++;
            _loc11_ += _loc6_.data.challengesCompleted[_loc4_][_loc5_];
            _loc5_++;
          }
          _loc4_++;
        }
        _loc10_ = 49;
        if (_loc11_ > _loc10_)
        {
          _loc11_ = _loc10_;
        }
        if (_loc6_.data.medalsEarned.length > 0)
        {
          _loc4_ = 0;
          while (_loc4_ < _loc6_.data.medalsEarned.length)
          {
            if (_loc6_.data.medalsEarned[_loc4_] == 1)
            {
              _loc13_++;
            }
            _loc4_++;
          }
        }
        _loc12_ = this.gameObj.var_112.getNumberOfBadges();
        _loc4_ = 0;
        while (_loc4_ < _loc6_.data.customerOutfits.length)
        {
          _loc5_ = 0;
          while (_loc5_ < _loc6_.data.customerOutfits[_loc4_].length)
          {
            _loc14_++;
            if (_loc6_.data.customersUnlocked[_loc4_] == 1)
            {
              _loc15_ += _loc6_.data.customerOutfits[_loc4_][_loc5_];
            }
            _loc5_++;
          }
          _loc4_++;
        }
        _loc16_ = _loc9_ / _loc8_ * 30;
        _loc17_ = _loc11_ / _loc10_ * 30;
        _loc18_ = 0;
        if (_loc12_ > 0)
        {
          _loc18_ = _loc13_ / _loc12_ * 30;
        }
        _loc19_ = _loc15_ / _loc14_ * 10;
        _loc20_ = "Slot " + param1 + ": ";
        _loc20_ = _loc20_ + ("Areas: " + _loc9_ + "/" + _loc8_ + ". ");
        _loc20_ = _loc20_ + ("Challenges: " + _loc11_ + "/" + _loc10_ + ". ");
        _loc20_ = _loc20_ + ("Badges: " + _loc13_ + "/" + _loc12_ + ". ");
        _loc20_ = _loc20_ + ("Outfits: " + _loc15_ + "/" + _loc14_ + ". ");
        class_7.method_1(_loc20_);
        _loc21_ = String(Math.floor(_loc16_ + _loc17_ + _loc18_ + _loc19_));
        _loc3_.completion = _loc21_;
        _loc3_.areasCompleted = _loc9_;
      }
      return _loc3_;
    }

    public function hasEarnedEverything():Boolean
    {
      var _loc2_:Number = this.getCompletionPercentage();
      if (_loc2_ == 100)
      {
        class_7.method_1("100% Complete.");
        return true;
      }
      class_7.method_1("Not 100% Complete.");
      return false;
    }

    public function getCompletionPercentage():Number
    {
      var _loc10_:Number = NaN;
      var _loc11_:Number = NaN;
      var _loc15_:Number = NaN;
      var _loc2_:Number = 0;
      var _loc3_:Number = 0;
      var _loc4_:Number = 0;
      var _loc5_:Number = 0;
      var _loc6_:Number = 0;
      var _loc7_:Number = 0;
      var _loc8_:Number = 0;
      var _loc9_:Number = 0;
      _loc10_ = 0;
      while (_loc10_ < this.highScores.length)
      {
        _loc2_++;
        if (this.highScores[_loc10_] > 0)
        {
          _loc3_++;
        }
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < this.challengesCompleted.length)
      {
        _loc11_ = 0;
        while (_loc11_ < this.challengesCompleted[_loc10_].length)
        {
          _loc4_++;
          _loc5_ += this.challengesCompleted[_loc10_][_loc11_];
          _loc11_++;
        }
        _loc10_++;
      }
      _loc4_ = 49;
      if (_loc5_ > _loc4_)
      {
        _loc5_ = _loc4_;
      }
      if (this.medalsEarned.length > 0)
      {
        _loc10_ = 0;
        while (_loc10_ < this.medalsEarned.length)
        {
          if (this.medalsEarned[_loc10_] == 1)
          {
            _loc7_++;
          }
          _loc10_++;
        }
      }
      _loc6_ = this.gameObj.var_112.getNumberOfBadges();
      _loc10_ = 0;
      while (_loc10_ < this.customerOutfits.length)
      {
        _loc11_ = 0;
        while (_loc11_ < this.customerOutfits[_loc10_].length)
        {
          _loc8_++;
          if (this.customersUnlocked[_loc10_] == 1)
          {
            _loc9_ += this.customerOutfits[_loc10_][_loc11_];
          }
          _loc11_++;
        }
        _loc10_++;
      }
      var _loc12_:Number = _loc3_ / _loc2_ * 30;
      var _loc13_:Number = _loc5_ / _loc4_ * 30;
      var _loc14_:Number = 0;
      if (_loc6_ > 0)
      {
        _loc14_ = _loc7_ / _loc6_ * 30;
      }
      _loc15_ = _loc9_ / _loc15_ * 10;
      return Math.floor(_loc12_ + _loc13_ + _loc14_ + _loc15_);
    }

    public function createNewSlot(param1:Number, param2:String, param3:String = "papalouie"):void
    {
      // TODO
      this.gameObj.var_112.resetAllTallies();
      this.hasContinuedGame = false;
      this.whichSlot = param1;
      if (param3 == "rita")
      {
        this.selectedCharacter = 1;
      }
      else
      {
        this.selectedCharacter = 0;
      }
      this.selectedStyle = 1;
      this.totalScore.setValue(0);
      this.totalMoney.setValue(0);
      this.totalLives.setValue(this.startingLives.value);
      this.totalTimePlayed.setValue(0);
      this.warpCoins.setValue(1);
      this.playerName = param2;
      this.whichCharacter = param3;
      this.lastCustomerUnlocked = 0;
      this.customersUnlocked = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      this.customersUsed = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      this.customerOutfits = [[1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0]];
      this.customersUsed[this.selectedCharacter] = 1;
      this.enemyKills = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      this.areasUnlocked = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      this.highScores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      this.bestTimes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      this.hasRevealedLatestArea = false;
      this.lastAreaRevealed = 0;
      this.challengesCompleted = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]];
      this.medalsEarned = [];
      this.medalProgress = [];
      this.setupInitialBadgeProgress();
      this.alreadyEarned100 = false;
      this.didClickFacebook = false;
      this.didClickTwitter = false;
      this.trainingFlags = [];
      var _loc5_:int = 0;
      while (_loc5_ < this.trainingFlagNames.length)
      {
        this.trainingFlags.push(0);
        _loc5_++;
      }
      this.keyCodeLeft = this.defaultKeyCodeLeft;
      this.keyCodeRight = this.defaultKeyCodeRight;
      this.keyCodeUp = this.defaultKeyCodeUp;
      this.keyCodeDown = this.defaultKeyCodeDown;
      this.keyCodeJump = this.defaultKeyCodeJump;
      this.keyCodeAttack = this.defaultKeyCodeAttack;
      this.keyCodeDrop = this.defaultKeyCodeDrop;
      this.keyCodePause = this.defaultKeyCodePause;
      this.so = SharedObject.getLocal(this.saveSlotPrefix + param1, "/");
      this.saveProgress();
      this.clearTallies();
      this.gameObj.var_109.clearCheckpoint();
    }

    public function loadData(param1:Number):void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:int = 0;
      var _loc6_:int = 0;
      this.whichSlot = param1;
      this.selectedCharacter = 0;
      this.selectedStyle = 1;
      this.gameObj.var_112.resetAllTallies();
      this.so = SharedObject.getLocal(this.saveSlotPrefix + param1, "/");
      if (this.so.data.playerName)
      {
        class_7.info("Load from Existing Slot " + param1);
        this.playerName = this.so.data.playerName;
        this.whichCharacter = this.so.data.whichCharacter;
        this.totalScore.setValue(this.so.data.totalScore);
        this.totalMoney.setValue(this.so.data.totalMoney);
        this.totalLives.setValue(this.so.data.totalLives);
        if (this.so.data.warpCoins)
        {
          this.warpCoins.setValue(this.so.data.warpCoins + 100);
        }
        else
        {
          this.warpCoins.setValue(1);
        }
        this.areasUnlocked = this.so.data.areasUnlocked.concat();
        this.highScores = this.so.data.highScores.concat();
        this.challengesCompleted = class_12.method_90(this.so.data.challengesCompleted);
        this.medalsEarned = this.so.data.medalsEarned.concat();
        if (this.so.data.revealedarea)
        {
          this.hasRevealedLatestArea = this.so.data.revealedarea;
        }
        else
        {
          this.hasRevealedLatestArea = false;
        }
        if (this.so.data.lastarearevealed)
        {
          this.lastAreaRevealed = this.so.data.lastarearevealed;
        }
        else
        {
          _loc3_ = 0;
          while (_loc3_ < 10)
          {
            if (this.areasUnlocked[_loc3_] == 1)
            {
              this.lastAreaRevealed = _loc3_;
            }
            _loc3_++;
          }
        }
        if (this.so.data.enemyKills)
        {
          this.enemyKills = this.so.data.enemyKills.concat();
        }
        else
        {
          this.enemyKills = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        }
        this.customersUnlocked = this.so.data.customersUnlocked.concat();
        this.customerOutfits = class_12.method_90(this.so.data.customerOutfits);
        this.lastCustomerUnlocked = this.so.data.lastCustomerUnlocked;
        if (this.so.data.customersUsed)
        {
          this.customersUsed = this.so.data.customersUsed.concat();
        }
        else
        {
          this.customersUsed = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        }
        if (this.so.data.char)
        {
          this.selectedCharacter = this.so.data.char;
        }
        else
        {
          this.selectedCharacter = 0;
        }
        if (this.so.data.style)
        {
          this.selectedStyle = this.so.data.style;
        }
        else
        {
          this.selectedStyle = 1;
        }
        if (this.so.data.bestTimes)
        {
          this.bestTimes = this.so.data.bestTimes.concat();
        }
        else
        {
          this.bestTimes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        }
        if (this.so.data.medalProgress)
        {
          this.medalProgress = this.so.data.medalProgress.concat();
        }
        else
        {
          this.medalProgress = [];
        }
        if (this.totalLives.value < 0)
        {
          this.totalLives.setValue(this.startingLives.value);
        }
        if (this.so.data.clicktwitter)
        {
          this.didClickTwitter = this.so.data.clicktwitter;
        }
        else
        {
          this.didClickTwitter = false;
        }
        if (this.so.data.clickfacebook)
        {
          this.didClickFacebook = this.so.data.clickfacebook;
        }
        else
        {
          this.didClickFacebook = false;
        }
        if (this.so.data.trainingflags)
        {
          this.trainingFlags = this.so.data.trainingflags.concat();
          if (this.trainingFlags.length < this.trainingFlagNames.length)
          {
            _loc5_ = _loc4_ = this.trainingFlags.length;
            while (_loc5_ < this.trainingFlagNames.length)
            {
              this.trainingFlags.push(0);
              _loc5_++;
            }
          }
        }
        else
        {
          this.trainingFlags = [];
          _loc6_ = 0;
          while (_loc6_ < this.trainingFlagNames.length)
          {
            this.trainingFlags.push(0);
            _loc6_++;
          }
        }
        if (this.so.data.keyCodeLeft)
        {
          this.keyCodeLeft = this.so.data.keyCodeLeft;
          this.keyCodeRight = this.so.data.keyCodeRight;
          this.keyCodeUp = this.so.data.keyCodeUp;
          this.keyCodeDown = this.so.data.keyCodeDown;
          this.keyCodeJump = this.so.data.keyCodeJump;
          this.keyCodeAttack = this.so.data.keyCodeAttack;
          this.keyCodeDrop = this.so.data.keyCodeDrop;
        }
        else
        {
          this.keyCodeLeft = this.defaultKeyCodeLeft;
          this.keyCodeRight = this.defaultKeyCodeRight;
          this.keyCodeUp = this.defaultKeyCodeUp;
          this.keyCodeDown = this.defaultKeyCodeDown;
          this.keyCodeJump = this.defaultKeyCodeJump;
          this.keyCodeAttack = this.defaultKeyCodeAttack;
          this.keyCodeDrop = this.defaultKeyCodeDrop;
        }
        if (this.so.data.keyCodePause)
        {
          this.keyCodePause = this.so.data.keyCodePause;
        }
        else
        {
          this.keyCodePause = this.defaultKeyCodePause;
        }
        if (this.so.data.totalTime)
        {
          this.totalTimePlayed.setValue(this.so.data.totalTime);
        }
        else
        {
          this.totalTimePlayed.setValue(0);
        }
        this.gameObj.var_112.populateMedalProgress(this.medalProgress);
        if (this.hasEarnedEverything())
        {
          this.alreadyEarned100 = true;
        }
        else
        {
          this.alreadyEarned100 = false;
        }
        if (this.so.data.continuedgame)
        {
          this.hasContinuedGame = true;
          this.gameObj.var_107.api.method_88("Continued_Game_Again", "Slots");
        }
        else
        {
          this.hasContinuedGame = true;
          this.gameObj.var_107.api.method_88("Continued_Game", "Slots");
        }
      }
      else
      {
        this.createNewSlot(param1, "Marty");
      }
      this.clearTallies();
      this.gameObj.var_109.clearCheckpoint();
      this.gameObj.var_107.method_151();
      this.gameObj.var_112.fixBadges();
    }

    public function saveProgress(param1:String = "all"):void
    {
      // TODO save data
      var _loc3_:Number = getTimer();
      if (this.so == null)
      {
        class_7.error("Saved data was missing for this save.  Generating a new one.");
        this.so = SharedObject.getLocal(this.saveSlotPrefix + this.whichSlot, "/");
      }
      if (param1 == "all")
      {
        this.so.data.playerName = this.playerName;
        ExternalInterface.call("log", 'this.so.data.playerName', this.so.data.playerName);
        this.so.data.whichCharacter = this.whichCharacter;
        ExternalInterface.call("log", 'this.so.data.whichCharacter', this.so.data.whichCharacter);
        this.so.data.continuedgame = this.hasContinuedGame;
        ExternalInterface.call("log", 'this.so.data.continuedgame', this.so.data.continuedgame);
        this.so.data.totalScore = this.totalScore.value;
        ExternalInterface.call("log", 'this.so.data.totalScore', this.so.data.totalScore);
        this.so.data.totalMoney = this.totalMoney.value;
        ExternalInterface.call("log", 'this.so.data.totalMoney', this.so.data.totalMoney);
        this.so.data.totalLives = this.totalLives.value;
        ExternalInterface.call("log", 'this.so.data.totalLives', this.so.data.totalLives);
        this.so.data.totalTime = this.totalTimePlayed.value;
        ExternalInterface.call("log", 'this.so.data.totalTime', this.so.data.totalTime);
        this.so.data.warpCoins = this.warpCoins.value;
        ExternalInterface.call("log", 'this.so.data.warpCoins', this.so.data.warpCoins);
        this.so.data.areasUnlocked = this.areasUnlocked.concat();
        ExternalInterface.call("log", 'this.so.data.areasUnlocked', this.so.data.areasUnlocked);
        this.so.data.highScores = this.highScores.concat();
        ExternalInterface.call("log", 'this.so.data.highScores', this.so.data.highScores);
        this.so.data.bestTimes = this.bestTimes.concat();
        ExternalInterface.call("log", 'this.so.data.bestTimes', this.so.data.bestTimes);
        this.so.data.challengesCompleted = class_12.method_90(this.challengesCompleted);
        ExternalInterface.call("log", 'this.so.data.challengesCompleted', this.so.data.challengesCompleted);
        this.so.data.medalsEarned = this.medalsEarned.concat();
        ExternalInterface.call("log", 'this.so.data.medalsEarned', this.so.data.medalsEarned);
        this.so.data.medalProgress = this.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", 'this.so.data.medalProgress', this.so.data.medalProgress);
        this.so.data.revealedarea = this.hasRevealedLatestArea;
        ExternalInterface.call("log", 'this.so.data.revealedarea', this.so.data.revealedarea);
        this.so.data.lastarearevealed = this.lastAreaRevealed;
        ExternalInterface.call("log", 'this.so.data.lastarearevealed', this.so.data.lastarearevealed);
        this.so.data.customersUnlocked = this.customersUnlocked.concat();
        ExternalInterface.call("log", 'this.so.data.customersUnlocked', this.so.data.customersUnlocked);
        this.so.data.customerOutfits = class_12.method_90(this.customerOutfits);
        ExternalInterface.call("log", 'this.so.data.customerOutfits', this.so.data.customerOutfits);
        this.so.data.lastCustomerUnlocked = this.lastCustomerUnlocked;
        ExternalInterface.call("log", 'this.so.data.lastCustomerUnlocked', this.so.data.lastCustomerUnlocked);
        this.so.data.enemyKills = this.enemyKills.concat();
        ExternalInterface.call("log", 'this.so.data.enemyKills', this.so.data.enemyKills);
        this.so.data.customersUsed = this.customersUsed.concat();
        ExternalInterface.call("log", 'this.so.data.customersUsed', this.so.data.customersUsed);
        this.so.data.char = this.selectedCharacter;
        ExternalInterface.call("log", 'this.so.data.char', this.so.data.char);
        this.so.data.style = this.selectedStyle;
        ExternalInterface.call("log", 'this.so.data.style', this.so.data.style);
        this.so.data.keyCodeLeft = this.keyCodeLeft;
        ExternalInterface.call("log", 'this.so.data.keyCodeLeft', this.so.data.keyCodeLeft);
        this.so.data.keyCodeRight = this.keyCodeRight;
        ExternalInterface.call("log", 'this.so.data.keyCodeRight', this.so.data.keyCodeRight);
        this.so.data.keyCodeUp = this.keyCodeUp;
        ExternalInterface.call("log", 'this.so.data.keyCodeUp', this.so.data.keyCodeUp);
        this.so.data.keyCodeDown = this.keyCodeDown;
        ExternalInterface.call("log", 'this.so.data.keyCodeDown', this.so.data.keyCodeDown);
        this.so.data.keyCodeJump = this.keyCodeJump;
        ExternalInterface.call("log", 'this.so.data.keyCodeJump', this.so.data.keyCodeJump);
        this.so.data.keyCodeAttack = this.keyCodeAttack;
        ExternalInterface.call("log", 'this.so.data.keyCodeAttack', this.so.data.keyCodeAttack);
        this.so.data.keyCodeDrop = this.keyCodeDrop;
        ExternalInterface.call("log", 'this.so.data.keyCodeDrop', this.so.data.keyCodeDrop);
        this.so.data.keyCodePause = this.keyCodePause;
        ExternalInterface.call("log", 'this.so.data.keyCodePause', this.so.data.keyCodePause);
        this.so.data.clicktwitter = this.didClickTwitter;
        ExternalInterface.call("log", 'this.so.data.clicktwitter', this.so.data.clicktwitter);
        this.so.data.clickfacebook = this.didClickFacebook;
        ExternalInterface.call("log", 'this.so.data.clickfacebook', this.so.data.clickfacebook);
      }
      else if (param1 == "quitlevel")
      {
        this.so.data.playerName = this.playerName;
        ExternalInterface.call("log", 'this.so.data.playerName', this.so.data.playerName);
        this.so.data.whichCharacter = this.whichCharacter;
        ExternalInterface.call("log", 'this.so.data.whichCharacter', this.so.data.whichCharacter);
        this.so.data.continuedgame = this.hasContinuedGame;
        ExternalInterface.call("log", 'this.so.data.continuedgame', this.so.data.continuedgame);
        this.so.data.revealedarea = this.hasRevealedLatestArea;
        ExternalInterface.call("log", 'this.so.data.revealedarea', this.so.data.revealedarea);
        this.so.data.lastarearevealed = this.lastAreaRevealed;
        ExternalInterface.call("log", 'this.so.data.lastarearevealed', this.so.data.lastarearevealed);
        this.so.data.totalTime = this.totalTimePlayed.value;
        ExternalInterface.call("log", 'this.so.data.totalTime', this.so.data.totalTime);
        this.so.data.totalScore = this.totalScore.value;
        ExternalInterface.call("log", 'this.so.data.totalScore', this.so.data.totalScore);
        this.so.data.totalMoney = this.totalMoney.value;
        ExternalInterface.call("log", 'this.so.data.totalMoney', this.so.data.totalMoney);
        this.so.data.totalLives = this.totalLives.value;
        ExternalInterface.call("log", 'this.so.data.totalLives', this.so.data.totalLives);
        this.so.data.warpCoins = this.warpCoins.value;
        ExternalInterface.call("log", 'this.so.data.warpCoins', this.so.data.warpCoins);
        this.so.data.clicktwitter = this.didClickTwitter;
        ExternalInterface.call("log", 'this.so.data.clicktwitter', this.so.data.clicktwitter);
        this.so.data.clickfacebook = this.didClickFacebook;
        ExternalInterface.call("log", 'this.so.data.clickfacebook', this.so.data.clickfacebook);
        this.so.data.challengesCompleted = class_12.method_90(this.challengesCompleted);
        ExternalInterface.call("log", 'this.so.data.challengesCompleted', this.so.data.challengesCompleted);
        this.so.data.medalsEarned = this.medalsEarned.concat();
        ExternalInterface.call("log", 'this.so.data.medalsEarned', this.so.data.medalsEarned);
        this.so.data.medalProgress = this.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", 'this.so.data.medalProgress', this.so.data.medalProgress);
        this.so.data.customersUnlocked = this.customersUnlocked.concat();
        ExternalInterface.call("log", 'this.so.data.customersUnlocked', this.so.data.customersUnlocked);
        this.so.data.customerOutfits = class_12.method_90(this.customerOutfits);
        ExternalInterface.call("log", 'this.so.data.customerOutfits', this.so.data.customerOutfits);
        this.so.data.lastCustomerUnlocked = this.lastCustomerUnlocked;
        ExternalInterface.call("log", 'this.so.data.lastCustomerUnlocked', this.so.data.lastCustomerUnlocked);
        this.so.data.customersUsed = this.customersUsed.concat();
        ExternalInterface.call("log", 'this.so.data.customersUsed', this.so.data.customersUsed);
        this.so.data.char = this.selectedCharacter;
        ExternalInterface.call("log", 'this.so.data.char', this.so.data.char);
        this.so.data.style = this.selectedStyle;
        ExternalInterface.call("log", 'this.so.data.style', this.so.data.style);
        this.so.data.enemyKills = this.enemyKills.concat();
        ExternalInterface.call("log", 'this.so.data.enemyKills', this.so.data.enemyKills);
      }
      else if (param1 == "time")
      {
        this.so.data.totalTime = this.totalTimePlayed.value;
        ExternalInterface.call("log", 'this.so.data.totalTime', this.so.data.totalTime);
        this.so.data.continuedgame = this.hasContinuedGame;
        ExternalInterface.call("log", 'this.so.data.continuedgame', this.so.data.continuedgame);
      }
      else if (param1 == "badge")
      {
        this.so.data.medalsEarned = this.medalsEarned.concat();
        ExternalInterface.call("log", 'this.so.data.medalsEarned', this.so.data.medalsEarned);
        this.so.data.medalProgress = this.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", 'this.so.data.medalProgress', this.so.data.medalProgress);
        this.so.data.totalMoney = this.totalMoney.value;
        ExternalInterface.call("log", 'this.so.data.totalMoney', this.so.data.totalMoney);
        this.so.data.continuedgame = this.hasContinuedGame;
        ExternalInterface.call("log", 'this.so.data.continuedgame', this.so.data.continuedgame);
        this.so.data.clicktwitter = this.didClickTwitter;
        ExternalInterface.call("log", 'this.so.data.clicktwitter', this.so.data.clicktwitter);
        this.so.data.clickfacebook = this.didClickFacebook;
        ExternalInterface.call("log", 'this.so.data.clickfacebook', this.so.data.clickfacebook);
      }
      else if (param1 == "outfit")
      {
        this.so.data.customersUnlocked = this.customersUnlocked.concat();
        ExternalInterface.call("log", 'this.so.data.customersUnlocked', this.so.data.customersUnlocked);
        this.so.data.customerOutfits = class_12.method_90(this.customerOutfits);
        ExternalInterface.call("log", 'this.so.data.customerOutfits', this.so.data.customerOutfits);
        this.so.data.totalMoney = this.totalMoney.value;
        ExternalInterface.call("log", 'this.so.data.totalMoney', this.so.data.totalMoney);
        this.so.data.clicktwitter = this.didClickTwitter;
        ExternalInterface.call("log", 'this.so.data.clicktwitter', this.so.data.clicktwitter);
        this.so.data.clickfacebook = this.didClickFacebook;
        ExternalInterface.call("log", 'this.so.data.clickfacebook', this.so.data.clickfacebook);
        this.so.data.medalsEarned = this.medalsEarned.concat();
        ExternalInterface.call("log", 'this.so.data.medalsEarned', this.so.data.medalsEarned);
        this.so.data.medalProgress = this.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", 'this.so.data.medalProgress', this.so.data.medalProgress);
      }
      else if (param1 == "challenge")
      {
        this.so.data.challengesCompleted = class_12.method_90(this.challengesCompleted);
        ExternalInterface.call("log", 'this.so.data.challengesCompleted', this.so.data.challengesCompleted);
        this.so.data.continuedgame = this.hasContinuedGame;
        ExternalInterface.call("log", 'this.so.data.continuedgame', this.so.data.continuedgame);
        this.so.data.medalsEarned = this.medalsEarned.concat();
        ExternalInterface.call("log", 'this.so.data.medalsEarned', this.so.data.medalsEarned);
        this.so.data.medalProgress = this.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", 'this.so.data.medalProgress', this.so.data.medalProgress);
        this.so.data.clicktwitter = this.didClickTwitter;
        ExternalInterface.call("log", 'this.so.data.clicktwitter', this.so.data.clicktwitter);
        this.so.data.clickfacebook = this.didClickFacebook;
        ExternalInterface.call("log", 'this.so.data.clickfacebook', this.so.data.clickfacebook);
      }
      else if (param1 == "controls")
      {
        this.so.data.keyCodeLeft = this.keyCodeLeft;
        ExternalInterface.call("log", 'this.so.data.keyCodeLeft', this.so.data.keyCodeLeft);
        this.so.data.keyCodeRight = this.keyCodeRight;
        ExternalInterface.call("log", 'this.so.data.keyCodeRight', this.so.data.keyCodeRight);
        this.so.data.keyCodeUp = this.keyCodeUp;
        ExternalInterface.call("log", 'this.so.data.keyCodeUp', this.so.data.keyCodeUp);
        this.so.data.keyCodeDown = this.keyCodeDown;
        ExternalInterface.call("log", 'this.so.data.keyCodeDown', this.so.data.keyCodeDown);
        this.so.data.keyCodeJump = this.keyCodeJump;
        ExternalInterface.call("log", 'this.so.data.keyCodeJump', this.so.data.keyCodeJump);
        this.so.data.keyCodeAttack = this.keyCodeAttack;
        ExternalInterface.call("log", 'this.so.data.keyCodeAttack', this.so.data.keyCodeAttack);
        this.so.data.keyCodeDrop = this.keyCodeDrop;
        ExternalInterface.call("log", 'this.so.data.keyCodeDrop', this.so.data.keyCodeDrop);
        this.so.data.keyCodePause = this.keyCodePause;
        ExternalInterface.call("log", 'this.so.data.keyCodePause', this.so.data.keyCodePause);
        this.so.data.continuedgame = this.hasContinuedGame;
        ExternalInterface.call("log", 'this.so.data.continuedgame', this.so.data.continuedgame);
      }
      this.so.data.version = this.saveSlotVersion;
      ExternalInterface.call("log", 'this.so.data.version', this.so.data.version);
      this.so.data.trainingflags = this.trainingFlags.concat();
      ExternalInterface.call("log", 'this.so.data.trainingflags', this.so.data.trainingflags);
      var _loc4_:Number = getTimer();
      this.flushSaveSlot();
      this.gameObj.var_107.method_151();
      var _loc5_:Number = getTimer();
      class_7.method_1("Saving (" + param1 + "): " + (_loc5_ - _loc3_) + " ms.");
    }

    public function checkForCheats(param1:String):void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
    }

    public function eraseSlot(param1:Number):void
    {
      var _loc3_:SharedObject = SharedObject.getLocal(this.saveSlotPrefix + param1, "/");
      _loc3_.clear();
    }

    private function flushSaveSlot():void
    {
      var ob:UserData = null;
      var flushStatus:String = null;
      ob = this;
      if (ob.so != null)
      {
        flushStatus = null;
        try
        {
          flushStatus = ob.so.flush(ob.saveSlotMaxSize);
        }
        catch (err:Error)
        {
          class_7.error("Error saving to Save Slot, may be disabled from saving.");
          ob.gameObj.var_107.api.method_112("Your computer won\'t let your progress be saved!  Right-click and choose \'Settings...\', then choose \'Unlimited\'.");
        }
        if (flushStatus != null)
        {
          switch (flushStatus)
          {
            case SharedObjectFlushStatus.PENDING:
              ob.gameObj.var_107.api.method_112("You need to Allow this site to save your game progress in the pop-up.");
              class_7.info("Asking the player to increase storage size...");
              ob.so.addEventListener(NetStatusEvent.NET_STATUS, ob.onFlushStatus);
              break;
            case SharedObjectFlushStatus.FLUSHED:
              ob.gameObj.var_107.api.method_111();
              class_7.info("Saved.");
          }
        }
      }
      else
      {
        class_7.error("Trying to Flush/Save, but there\'s no save slot!");
      }
    }

    public function onFlushStatus(param1:NetStatusEvent):void
    {
      switch (param1.info.code)
      {
        case "SharedObject.Flush.Success":
          class_7.info("Granted Permission to Save, data will now save.");
          this.gameObj.var_107.api.method_111();
          break;
        case "SharedObject.Flush.Failed":
          this.gameObj.var_107.api.method_112("Your game progress will not be saved!");
          class_7.info("Denied Permission to Save, no progress will be saved!");
      }
      this.so.removeEventListener(NetStatusEvent.NET_STATUS, this.onFlushStatus);
    }

    public function saveEnemyKill(param1:Number, param2:String = "none", param3:String = ""):void
    {
      var _loc4_:UserData = this;
      ++_loc4_.killsTally;
      if (_loc4_.enemyKills.length > param1)
      {
        ++_loc4_.enemyKills[param1];
      }
      _loc4_.gameObj.var_112.recordEnemyKill(param1, param2, param3);
    }

    public function setKey(param1:Number, param2:String):Boolean
    {
      var _loc4_:Boolean = false;
      var _loc5_:Boolean = false;
      if (this.keyCodeAttack == param1 && param2 != "attack")
      {
        _loc4_ = true;
      }
      else if (this.keyCodeJump == param1 && param2 != "jump" && param2 != "up")
      {
        _loc4_ = true;
      }
      else if (this.keyCodeDown == param1 && param2 != "down")
      {
        _loc4_ = true;
      }
      else if (this.keyCodeUp == param1 && param2 != "up" && param2 != "jump")
      {
        _loc4_ = true;
      }
      else if (this.keyCodeLeft == param1 && param2 != "left")
      {
        _loc4_ = true;
      }
      else if (this.keyCodeRight == param1 && param2 != "right")
      {
        _loc4_ = true;
      }
      if (!_loc4_)
      {
        if (param2 == "attack")
        {
          this.keyCodeAttack = param1;
        }
        else if (param2 == "jump")
        {
          this.keyCodeJump = param1;
        }
        else if (param2 == "drop")
        {
          this.keyCodeDrop = param1;
        }
        else if (param2 == "down")
        {
          this.keyCodeDown = param1;
        }
        else if (param2 == "up")
        {
          this.keyCodeUp = param1;
        }
        else if (param2 == "left")
        {
          this.keyCodeLeft = param1;
        }
        else if (param2 == "right")
        {
          this.keyCodeRight = param1;
        }
        else if (param2 == "pause")
        {
          this.keyCodePause = param1;
        }
        this.saveProgress("controls");
        _loc5_ = true;
      }
      else
      {
        _loc5_ = false;
      }
      return _loc5_;
    }

    public function setupInitialBadgeProgress():void
    {
      var _loc2_:ChallengeManager = this.gameObj.var_112;
      var _loc3_:int = 0;
      while (_loc3_ < _loc2_.badges.length)
      {
        this.medalsEarned.push(0);
        this.medalProgress.push(0);
        _loc3_++;
      }
      _loc2_.recordTag("warpCoin");
      _loc2_.recordTag("customerUnlocked");
      _loc2_.recordTag("customerUnlocked");
    }

    public function isValidTrainingFlag(param1:String):Boolean
    {
      var _loc3_:Boolean = false;
      var _loc4_:Number = this.trainingFlagNames.indexOf(param1);
      if (_loc4_ > -1)
      {
        _loc3_ = true;
      }
      return _loc3_;
    }

    public function hasTrained(param1:String):Boolean
    {
      var _loc3_:Boolean = false;
      var _loc4_:Number = this.trainingFlagNames.indexOf(param1);
      if (_loc4_ > -1 && this.trainingFlags.length > _loc4_)
      {
        if (this.trainingFlags[_loc4_] == 1)
        {
          _loc3_ = true;
        }
      }
      return _loc3_;
    }

    public function setTrained(param1:String):void
    {
      var _loc3_:Number = this.trainingFlagNames.indexOf(param1);
      if (_loc3_ > -1)
      {
        this.trainingFlags[_loc3_] = 1;
      }
    }
  }
}
