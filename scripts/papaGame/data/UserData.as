// this.so.data.(\w+) = (.*);

// this.so.data.$1 = $2;
// ExternalInterface.call("log", this.so.data.$1);

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
    public var warpCoinsEarned:MochiDigits = new MochiDigits(0);
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

    private var defaultKeyCodeLeft:Number = 37;
    private var defaultKeyCodeRight:Number = 39;
    private var defaultKeyCodeUp:Number = 38;
    private var defaultKeyCodeDown:Number = 40;
    private var defaultKeyCodeJump:Number = 38;
    private var defaultKeyCodeAttack:Number = 32;
    private var defaultKeyCodeDrop:Number = 68;
    private var defaultKeyCodePause:Number = 80;

    public function UserData(param1:class_5)
    {
      super();
      var _loc2_:UserData = this;
      _loc2_.gameObj = param1;
      _loc2_.totalLives.setValue(_loc2_.startingLives.value);
      _loc2_.clearTallies();
    }

    public function resetLives():void
    {
      var _loc1_:UserData = this;
      _loc1_.totalLives.setValue(_loc1_.startingLives.value);
    }

    public function adjustLives(param1:Number):Boolean
    {
      var _loc2_:UserData = this;
      _loc2_.totalLives.addValue(param1);
      if (_loc2_.gameObj.var_115)
      {
        _loc2_.gameObj.var_115.updateDisplay();
      }
      if (param1 < 0)
      {
        _loc2_.livesLost.addValue(Math.abs(param1));
      }
      if (_loc2_.totalLives.value >= 0)
      {
        return true;
      }
      return false;
    }

    public function earnPoints(param1:Number):void
    {
      var _loc2_:UserData = this;
      _loc2_.points.addValue(param1);
      if (_loc2_.gameObj.var_115)
      {
        _loc2_.gameObj.var_115.updateDisplay();
      }
    }

    public function earnMoney(param1:Number = 1):void
    {
      var _loc2_:UserData = this;
      _loc2_.money.addValue(param1);
      if (_loc2_.gameObj.var_115)
      {
        _loc2_.gameObj.var_115.updateDisplay();
      }
    }

    public function earnWarpCoin():void
    {
      var _loc1_:UserData = this;
      class_7.method_1("EARN A WARP COIN!");
      _loc1_.gameObj.var_112.recordTag("warpCoin");
      _loc1_.warpCoins.addValue(1);
      _loc1_.warpCoinsEarned.addValue(1);
    }

    public function unlockCustomer(param1:Number):void
    {
      var _loc2_:UserData = this;
      if (param1 < _loc2_.customersUnlocked.length)
      {
        if (_loc2_.customersUnlocked[param1] == 0)
        {
          _loc2_.gameObj.var_112.recordTag("customerUnlocked");
        }
        _loc2_.customersUnlocked[param1] = 1;
      }
    }

    public function collectSpecialItem(param1:Number = 1):void
    {
      var _loc2_:UserData = this;
      _loc2_.specialitems.addValue(param1);
      if (_loc2_.gameObj.var_115)
      {
        _loc2_.gameObj.var_115.updateDisplay();
      }
      _loc2_.gameObj.var_112.recordSpecialItem(param1);
    }

    public function killBurgerzilla(param1:Number = 1):void
    {
      var _loc2_:UserData = this;
      _loc2_.burgerzillas.addValue(param1);
      if (_loc2_.gameObj.var_115)
      {
        _loc2_.gameObj.var_115.updateDisplay();
      }
      _loc2_.gameObj.var_112.recordBurgerzilla(param1);
    }

    public function clearTallies():void
    {
      var _loc1_:UserData = this;
      _loc1_.timeBonus.setValue(_loc1_.startingBonus.value);
      _loc1_.levelTimePlayed.setValue(0);
      _loc1_.livesLost.setValue(0);
      _loc1_.money.setValue(0);
      _loc1_.points.setValue(0);
      _loc1_.burgerzillas.setValue(0);
      _loc1_.specialitems.setValue(0);
      _loc1_.warpCoinsEarned.setValue(0);
      _loc1_.killsPerWeapon = [];
      _loc1_.killsTally = 0;
      _loc1_.gotHurt = false;
      _loc1_.fellInWater = false;
      _loc1_.savedCharacterIndex = -1;
    }

    public function getTimeBonus():Number
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc1_:UserData = this;
      var _loc2_:Number = _loc1_.gameObj.var_109.currentLevel;
      if (_loc1_.totalLives.value >= 0)
      {
        _loc3_ = Number(_loc1_.timeBonusMinimums[_loc2_]);
        _loc4_ = _loc1_.levelTimePlayed.value - _loc3_;
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
        return _loc1_.scoreTimeMaximum.value - _loc5_ * _loc1_.scoreLostPerMinuteOver.value;
      }
      return 0;
    }

    public function getLivesTally():Number
    {
      var _loc1_:UserData = this;
      if (_loc1_.totalLives.value >= 0)
      {
        return _loc1_.totalLives.value;
      }
      return 0;
    }

    public function getLivesLostTally():Number
    {
      var _loc1_:UserData = this;
      return _loc1_.livesLost.value;
    }

    public function getLivesBonus():Number
    {
      var _loc1_:UserData = this;
      if (_loc1_.totalLives.value >= 0)
      {
        if (_loc1_.livesLost.value == 0)
        {
          return _loc1_.scoreForNoDeaths.value;
        }
        return Math.max(0, _loc1_.scoreForNoDeaths.value - _loc1_.livesLost.value * _loc1_.scoreLostPerLife.value);
      }
      return 0;
    }

    public function getTreasureBonus():Number
    {
      return 0;
    }

    public function getChallengeBonus():Number
    {
      var _loc1_:UserData = this;
      return _loc1_.getChallengeTally() * _loc1_.scorePerChallengeCompeleted.value;
    }

    public function getChallengeTally():Number
    {
      var _loc4_:int = 0;
      var _loc1_:UserData = this;
      var _loc2_:Number = _loc1_.gameObj.var_109.currentLevel;
      var _loc3_:Number = 0;
      if (_loc1_.challengesCompleted.length > _loc2_)
      {
        _loc4_ = 0;
        while (_loc4_ < _loc1_.challengesCompleted[_loc2_].length)
        {
          if (_loc1_.challengesCompleted[_loc2_][_loc4_] == 1)
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
      var _loc1_:UserData = this;
      var _loc2_:Number = _loc1_.gameObj.var_109.currentLevel;
      var _loc3_:int = 0;
      while (_loc3_ < _loc1_.gameObj.var_109.coinsToUnlockWorld.length)
      {
        if (_loc1_.getWarpCoins() >= _loc1_.gameObj.var_109.coinsToUnlockWorld[_loc3_])
        {
          if (_loc1_.areasUnlocked[_loc3_] == 0)
          {
            class_7.method_1(">>>> UNLOCK WORLD " + (_loc3_ + 1));
            _loc1_.areasUnlocked[_loc3_] = 1;
            _loc1_.hasRevealedLatestArea = false;
          }
        }
        _loc3_++;
      }
    }

    public function updateAndGetLevelScore(param1:Boolean = true, param2:Boolean = true):Number
    {
      var _loc3_:UserData = this;
      var _loc4_:Number = 0;
      var _loc5_:Number = _loc3_.points.value + _loc3_.getTimeBonus() + _loc3_.getChallengeBonus();
      if (_loc5_ < 0)
      {
        _loc5_ = 0;
      }
      _loc3_.saveHighScore(_loc5_);
      if (param1)
      {
        _loc4_ = _loc5_;
      }
      else
      {
        _loc4_ = _loc3_.getLevelHighScore();
      }
      _loc3_.totalMoney.addValue(_loc3_.money.value);
      _loc3_.totalScore.setValue(_loc3_.getTotalScore());
      _loc3_.clearTallies();
      if (param2)
      {
        _loc3_.saveProgress();
      }
      return _loc4_;
    }

    public function getCurrentPoints():Number
    {
      var _loc1_:UserData = this;
      return _loc1_.points.value;
    }

    public function getCurrentMoney():Number
    {
      var _loc1_:UserData = this;
      return _loc1_.money.value;
    }

    public function getCurrentBurgerzillas():Number
    {
      var _loc1_:UserData = this;
      return _loc1_.burgerzillas.value;
    }

    public function getCurrentSpecialItems():Number
    {
      var _loc1_:UserData = this;
      return _loc1_.specialitems.value;
    }

    public function getLevelHighScore(param1:Number = -1):Number
    {
      var _loc2_:UserData = this;
      if (param1 == -1)
      {
        param1 = _loc2_.gameObj.var_109.currentLevel;
      }
      if (_loc2_.highScores.length > param1)
      {
        return _loc2_.highScores[param1];
      }
      return 0;
    }

    public function saveHighScore(param1:Number, param2:Number = -1, param3:Boolean = true):void
    {
      var _loc5_:Number = NaN;
      var _loc4_:UserData = this;
      if (param2 == -1)
      {
        param2 = _loc4_.gameObj.var_109.currentLevel;
      }
      if (_loc4_.highScores.length > param2)
      {
        _loc5_ = Number(_loc4_.highScores[param2]);
        if (_loc5_ == 0)
        {
          _loc4_.gameObj.var_107.api.method_100("BeatLevel", param2 + 1);
        }
        if (param1 > _loc5_ || param3 == false)
        {
          _loc4_.highScores[param2] = param1;
        }
      }
    }

    public function setLevelTime(param1:Number):void
    {
      var _loc4_:Number = NaN;
      var _loc2_:UserData = this;
      var _loc3_:Number = _loc2_.gameObj.var_109.currentLevel;
      if (_loc2_.bestTimes.length > _loc3_)
      {
        _loc4_ = Number(_loc2_.bestTimes[_loc3_]);
        if (param1 < _loc4_ || _loc4_ == 0)
        {
          _loc2_.bestTimes[_loc3_] = param1;
        }
      }
    }

    public function getLevelBestTime(param1:Number = -1):Number
    {
      var _loc2_:UserData = this;
      if (param1 == -1)
      {
        param1 = _loc2_.gameObj.var_109.currentLevel;
      }
      if (_loc2_.bestTimes.length > param1)
      {
        return _loc2_.bestTimes[param1];
      }
      return 0;
    }

    public function getTotalScore():Number
    {
      var _loc5_:int = 0;
      var _loc1_:UserData = this;
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < _loc1_.highScores.length)
      {
        _loc2_ += _loc1_.highScores[_loc3_];
        _loc3_++;
      }
      var _loc4_:ChallengeManager = _loc1_.gameObj.var_112;
      if (_loc4_)
      {
        _loc5_ = 0;
        while (_loc5_ < _loc4_.badges.length)
        {
          if (_loc1_.medalsEarned[_loc5_] == 1)
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
      var _loc1_:UserData = this;
      return _loc1_.totalMoney.value;
    }

    public function getWarpCoins():Number
    {
      var _loc1_:UserData = this;
      return _loc1_.warpCoins.value;
    }

    public function getEnemyKills(param1:Number):Number
    {
      var _loc2_:UserData = this;
      var _loc3_:Number = 0;
      if (param1 < _loc2_.enemyKills.length && param1 >= 0)
      {
        _loc3_ = Number(_loc2_.enemyKills[param1]);
      }
      return _loc3_;
    }

    public function hasCompletedChallenge(param1:Number, param2:Number):Boolean
    {
      var _loc3_:UserData = this;
      var _loc4_:Boolean = false;
      if (param1 > -1 && _loc3_.challengesCompleted.length > param1)
      {
        if (_loc3_.challengesCompleted[param1].length > param2 - 1)
        {
          if (_loc3_.challengesCompleted[param1][param2 - 1] == 1)
          {
            _loc4_ = true;
          }
        }
      }
      return _loc4_;
    }

    public function completeChallenge(param1:Number, param2:Number):void
    {
      var _loc3_:UserData = this;
      if (_loc3_.challengesCompleted.length > param1)
      {
        _loc3_.challengesCompleted[param1][param2 - 1] = 1;
      }
      _loc3_.gameObj.var_107.api.method_100("Challenge " + param2, param1 + 1);
      if (!_loc3_.alreadyEarned100 && _loc3_.hasEarnedEverything())
      {
        _loc3_.gameObj.var_107.api.method_88("100 Percent Complete", "Gameplay", true);
        _loc3_.alreadyEarned100 = true;
      }
      if (param1 != 9)
      {
        _loc3_.earnWarpCoin();
        try
        {
          _loc3_.gameObj.var_104.addEffect(_loc3_.gameObj.playerObj.x, _loc3_.gameObj.playerObj.y, "WarpCoinEffect", "", true, 0, -30);
        }
        catch (err:Error)
        {
        }
      }
    }

    public function getTotalChallengesCompleted():Number
    {
      var _loc4_:int = 0;
      var _loc1_:UserData = this;
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < _loc1_.challengesCompleted.length)
      {
        _loc4_ = 0;
        while (_loc4_ < _loc1_.challengesCompleted[_loc3_].length)
        {
          if (_loc1_.challengesCompleted[_loc3_][_loc4_] == 1)
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
      var _loc2_:UserData = this;
      var _loc3_:Boolean = false;
      if (_loc2_.medalsEarned.length > param1)
      {
        if (_loc2_.medalsEarned[param1] == 1)
        {
          _loc3_ = true;
        }
      }
      return _loc3_;
    }

    public function earnBadge(param1:Number, param2:String = ""):void
    {
      var _loc3_:UserData = this;
      _loc3_.medalsEarned[param1] = 1;
      _loc3_.gameObj.var_107.api.method_88("Badge " + param1 + ": " + param2, "Badges");
      if (!_loc3_.alreadyEarned100 && _loc3_.hasEarnedEverything())
      {
        _loc3_.gameObj.var_107.api.method_88("100 Percent Complete", "Gameplay", true);
        _loc3_.alreadyEarned100 = true;
      }
    }

    public function getTotalBadgesEarned():Number
    {
      var _loc1_:UserData = this;
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < _loc1_.medalsEarned.length)
      {
        if (_loc1_.medalsEarned[_loc3_] == 1)
        {
          _loc2_++;
        }
        _loc3_++;
      }
      return _loc2_;
    }

    public function hasCustomerUnlocked(param1:Number):Boolean
    {
      var _loc2_:UserData = this;
      var _loc3_:Boolean = false;
      if (param1 < _loc2_.customersUnlocked.length)
      {
        if (_loc2_.customersUnlocked[param1] == 1)
        {
          _loc3_ = true;
        }
      }
      return _loc3_;
    }

    public function hasOutfitUnlocked(param1:Number, param2:Number):Boolean
    {
      var _loc3_:UserData = this;
      var _loc4_:Boolean = false;
      if (param1 < _loc3_.customerOutfits.length && param2 < _loc3_.customerOutfits[param1].length)
      {
        if (_loc3_.customersUnlocked[param1] == 1 && _loc3_.customerOutfits[param1][param2] == 1)
        {
          _loc4_ = true;
        }
      }
      return _loc4_;
    }

    public function getBestOutfit(param1:Number):Number
    {
      var _loc4_:int = 0;
      var _loc2_:UserData = this;
      var _loc3_:Number = 1;
      if (param1 < _loc2_.customerOutfits.length)
      {
        _loc4_ = 1;
        while (_loc4_ < _loc2_.customerOutfits[param1].length)
        {
          if (_loc2_.customerOutfits[param1][_loc4_] == 1)
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
      var _loc3_:UserData = this;
      var _loc4_:Boolean = false;
      var _loc5_:Number = _loc3_.gameObj.var_109.getOutfitPrice(param1, param2);
      if (_loc3_.totalMoney.value >= _loc5_)
      {
        _loc3_.customerOutfits[param1][param2] = 1;
        _loc3_.totalMoney.setValue(_loc3_.totalMoney.value - _loc5_);
        _loc4_ = true;
        _loc3_.setTrained("styles");
        _loc3_.gameObj.var_112.recordTag("buyOutfit");
        _loc3_.saveProgress("outfit");
      }
      return _loc4_;
    }

    public function getTotalCustomersUnlocked():Number
    {
      var _loc1_:UserData = this;
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < _loc1_.customersUnlocked.length)
      {
        if (_loc1_.customersUnlocked[_loc3_] == 1)
        {
          _loc2_++;
        }
        _loc3_++;
      }
      return _loc2_;
    }

    public function getTotalLevelsCompleted():Number
    {
      var _loc1_:UserData = this;
      var _loc2_:Number = 0;
      var _loc3_:int = 0;
      while (_loc3_ < 10)
      {
        if (_loc1_.areasUnlocked[_loc3_] == 1 && _loc1_.getLevelHighScore(_loc3_) > 0)
        {
          _loc2_++;
        }
        _loc3_++;
      }
      return _loc2_;
    }

    public function hasBeatGame():Number
    {
      var _loc1_:UserData = this;
      if (_loc1_.areasUnlocked[8] == 1 && _loc1_.getLevelHighScore(8) > 0)
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
      var _loc2_:UserData = this;
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
        _loc7_ = _loc2_.gameObj.var_112;
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
        _loc12_ = _loc2_.gameObj.var_112.getNumberOfBadges();
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
      var _loc1_:UserData = this;
      var _loc2_:Number = _loc1_.getCompletionPercentage();
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
      var _loc1_:UserData = this;
      var _loc2_:Number = 0;
      var _loc3_:Number = 0;
      var _loc4_:Number = 0;
      var _loc5_:Number = 0;
      var _loc6_:Number = 0;
      var _loc7_:Number = 0;
      var _loc8_:Number = 0;
      var _loc9_:Number = 0;
      _loc10_ = 0;
      while (_loc10_ < _loc1_.highScores.length)
      {
        _loc2_++;
        if (_loc1_.highScores[_loc10_] > 0)
        {
          _loc3_++;
        }
        _loc10_++;
      }
      _loc10_ = 0;
      while (_loc10_ < _loc1_.challengesCompleted.length)
      {
        _loc11_ = 0;
        while (_loc11_ < _loc1_.challengesCompleted[_loc10_].length)
        {
          _loc4_++;
          _loc5_ += _loc1_.challengesCompleted[_loc10_][_loc11_];
          _loc11_++;
        }
        _loc10_++;
      }
      _loc4_ = 49;
      if (_loc5_ > _loc4_)
      {
        _loc5_ = _loc4_;
      }
      if (_loc1_.medalsEarned.length > 0)
      {
        _loc10_ = 0;
        while (_loc10_ < _loc1_.medalsEarned.length)
        {
          if (_loc1_.medalsEarned[_loc10_] == 1)
          {
            _loc7_++;
          }
          _loc10_++;
        }
      }
      _loc6_ = _loc1_.gameObj.var_112.getNumberOfBadges();
      _loc10_ = 0;
      while (_loc10_ < _loc1_.customerOutfits.length)
      {
        _loc11_ = 0;
        while (_loc11_ < _loc1_.customerOutfits[_loc10_].length)
        {
          _loc8_++;
          if (_loc1_.customersUnlocked[_loc10_] == 1)
          {
            _loc9_ += _loc1_.customerOutfits[_loc10_][_loc11_];
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
      var _loc4_:UserData = this;
      _loc4_.gameObj.var_112.resetAllTallies();
      _loc4_.hasContinuedGame = false;
      _loc4_.whichSlot = param1;
      if (param3 == "rita")
      {
        _loc4_.selectedCharacter = 1;
      }
      else
      {
        _loc4_.selectedCharacter = 0;
      }
      _loc4_.selectedStyle = 1;
      _loc4_.totalScore.setValue(0);
      _loc4_.totalMoney.setValue(0);
      _loc4_.totalLives.setValue(_loc4_.startingLives.value);
      _loc4_.totalTimePlayed.setValue(0);
      _loc4_.warpCoins.setValue(1);
      _loc4_.playerName = param2;
      _loc4_.whichCharacter = param3;
      _loc4_.lastCustomerUnlocked = 0;
      _loc4_.customersUnlocked = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      _loc4_.customersUsed = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      _loc4_.customerOutfits = [[1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0], [1, 0, 0]];
      _loc4_.customersUsed[_loc4_.selectedCharacter] = 1;
      _loc4_.enemyKills = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      _loc4_.areasUnlocked = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      _loc4_.highScores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      _loc4_.bestTimes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      _loc4_.hasRevealedLatestArea = false;
      _loc4_.lastAreaRevealed = 0;
      _loc4_.challengesCompleted = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0]];
      _loc4_.medalsEarned = [];
      _loc4_.medalProgress = [];
      _loc4_.setupInitialBadgeProgress();
      _loc4_.alreadyEarned100 = false;
      _loc4_.didClickFacebook = false;
      _loc4_.didClickTwitter = false;
      _loc4_.trainingFlags = [];
      var _loc5_:int = 0;
      while (_loc5_ < _loc4_.trainingFlagNames.length)
      {
        _loc4_.trainingFlags.push(0);
        _loc5_++;
      }
      _loc4_.keyCodeLeft = _loc4_.defaultKeyCodeLeft;
      _loc4_.keyCodeRight = _loc4_.defaultKeyCodeRight;
      _loc4_.keyCodeUp = _loc4_.defaultKeyCodeUp;
      _loc4_.keyCodeDown = _loc4_.defaultKeyCodeDown;
      _loc4_.keyCodeJump = _loc4_.defaultKeyCodeJump;
      _loc4_.keyCodeAttack = _loc4_.defaultKeyCodeAttack;
      _loc4_.keyCodeDrop = _loc4_.defaultKeyCodeDrop;
      _loc4_.keyCodePause = _loc4_.defaultKeyCodePause;
      _loc4_.so = SharedObject.getLocal(this.saveSlotPrefix + param1, "/");
      _loc4_.saveProgress();
      _loc4_.clearTallies();
      _loc4_.gameObj.var_109.clearCheckpoint();
    }

    public function loadData(param1:Number):void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:int = 0;
      var _loc6_:int = 0;
      var _loc2_:UserData = this;
      _loc2_.whichSlot = param1;
      _loc2_.selectedCharacter = 0;
      _loc2_.selectedStyle = 1;
      _loc2_.gameObj.var_112.resetAllTallies();
      _loc2_.so = SharedObject.getLocal(this.saveSlotPrefix + param1, "/");
      if (this.so.data.playerName)
      {
        class_7.info("Load from Existing Slot " + param1);
        _loc2_.playerName = this.so.data.playerName;
        _loc2_.whichCharacter = this.so.data.whichCharacter;
        _loc2_.totalScore.setValue(this.so.data.totalScore);
        _loc2_.totalMoney.setValue(this.so.data.totalMoney);
        _loc2_.totalLives.setValue(this.so.data.totalLives);
        if (this.so.data.warpCoins)
        {
          _loc2_.warpCoins.setValue(this.so.data.warpCoins);
        }
        else
        {
          _loc2_.warpCoins.setValue(1);
        }
        _loc2_.areasUnlocked = this.so.data.areasUnlocked.concat();
        _loc2_.highScores = this.so.data.highScores.concat();
        _loc2_.challengesCompleted = class_12.method_90(this.so.data.challengesCompleted);
        _loc2_.medalsEarned = this.so.data.medalsEarned.concat();
        if (this.so.data.revealedarea)
        {
          _loc2_.hasRevealedLatestArea = this.so.data.revealedarea;
        }
        else
        {
          _loc2_.hasRevealedLatestArea = false;
        }
        if (this.so.data.lastarearevealed)
        {
          _loc2_.lastAreaRevealed = this.so.data.lastarearevealed;
        }
        else
        {
          _loc3_ = 0;
          while (_loc3_ < 10)
          {
            if (_loc2_.areasUnlocked[_loc3_] == 1)
            {
              _loc2_.lastAreaRevealed = _loc3_;
            }
            _loc3_++;
          }
        }
        if (this.so.data.enemyKills)
        {
          _loc2_.enemyKills = this.so.data.enemyKills.concat();
        }
        else
        {
          _loc2_.enemyKills = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        }
        _loc2_.customersUnlocked = this.so.data.customersUnlocked.concat();
        _loc2_.customerOutfits = class_12.method_90(this.so.data.customerOutfits);
        _loc2_.lastCustomerUnlocked = this.so.data.lastCustomerUnlocked;
        if (this.so.data.customersUsed)
        {
          _loc2_.customersUsed = this.so.data.customersUsed.concat();
        }
        else
        {
          _loc2_.customersUsed = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        }
        if (this.so.data.char)
        {
          _loc2_.selectedCharacter = this.so.data.char;
        }
        else
        {
          _loc2_.selectedCharacter = 0;
        }
        if (this.so.data.style)
        {
          _loc2_.selectedStyle = this.so.data.style;
        }
        else
        {
          _loc2_.selectedStyle = 1;
        }
        if (this.so.data.bestTimes)
        {
          _loc2_.bestTimes = this.so.data.bestTimes.concat();
        }
        else
        {
          _loc2_.bestTimes = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        }
        if (this.so.data.medalProgress)
        {
          _loc2_.medalProgress = this.so.data.medalProgress.concat();
        }
        else
        {
          _loc2_.medalProgress = [];
        }
        if (_loc2_.totalLives.value < 0)
        {
          _loc2_.totalLives.setValue(_loc2_.startingLives.value);
        }
        if (this.so.data.clicktwitter)
        {
          _loc2_.didClickTwitter = this.so.data.clicktwitter;
        }
        else
        {
          _loc2_.didClickTwitter = false;
        }
        if (this.so.data.clickfacebook)
        {
          _loc2_.didClickFacebook = this.so.data.clickfacebook;
        }
        else
        {
          _loc2_.didClickFacebook = false;
        }
        if (this.so.data.trainingflags)
        {
          _loc2_.trainingFlags = this.so.data.trainingflags.concat();
          if (_loc2_.trainingFlags.length < _loc2_.trainingFlagNames.length)
          {
            _loc5_ = _loc4_ = _loc2_.trainingFlags.length;
            while (_loc5_ < _loc2_.trainingFlagNames.length)
            {
              _loc2_.trainingFlags.push(0);
              _loc5_++;
            }
          }
        }
        else
        {
          _loc2_.trainingFlags = [];
          _loc6_ = 0;
          while (_loc6_ < _loc2_.trainingFlagNames.length)
          {
            _loc2_.trainingFlags.push(0);
            _loc6_++;
          }
        }
        if (this.so.data.keyCodeLeft)
        {
          _loc2_.keyCodeLeft = this.so.data.keyCodeLeft;
          _loc2_.keyCodeRight = this.so.data.keyCodeRight;
          _loc2_.keyCodeUp = this.so.data.keyCodeUp;
          _loc2_.keyCodeDown = this.so.data.keyCodeDown;
          _loc2_.keyCodeJump = this.so.data.keyCodeJump;
          _loc2_.keyCodeAttack = this.so.data.keyCodeAttack;
          _loc2_.keyCodeDrop = this.so.data.keyCodeDrop;
        }
        else
        {
          _loc2_.keyCodeLeft = _loc2_.defaultKeyCodeLeft;
          _loc2_.keyCodeRight = _loc2_.defaultKeyCodeRight;
          _loc2_.keyCodeUp = _loc2_.defaultKeyCodeUp;
          _loc2_.keyCodeDown = _loc2_.defaultKeyCodeDown;
          _loc2_.keyCodeJump = _loc2_.defaultKeyCodeJump;
          _loc2_.keyCodeAttack = _loc2_.defaultKeyCodeAttack;
          _loc2_.keyCodeDrop = _loc2_.defaultKeyCodeDrop;
        }
        if (this.so.data.keyCodePause)
        {
          _loc2_.keyCodePause = this.so.data.keyCodePause;
        }
        else
        {
          _loc2_.keyCodePause = _loc2_.defaultKeyCodePause;
        }
        if (this.so.data.totalTime)
        {
          _loc2_.totalTimePlayed.setValue(this.so.data.totalTime);
        }
        else
        {
          _loc2_.totalTimePlayed.setValue(0);
        }
        _loc2_.gameObj.var_112.populateMedalProgress(_loc2_.medalProgress);
        if (_loc2_.hasEarnedEverything())
        {
          _loc2_.alreadyEarned100 = true;
        }
        else
        {
          _loc2_.alreadyEarned100 = false;
        }
        if (this.so.data.continuedgame)
        {
          _loc2_.hasContinuedGame = true;
          _loc2_.gameObj.var_107.api.method_88("Continued_Game_Again", "Slots");
        }
        else
        {
          _loc2_.hasContinuedGame = true;
          _loc2_.gameObj.var_107.api.method_88("Continued_Game", "Slots");
        }
      }
      else
      {
        _loc2_.createNewSlot(param1, "Marty");
      }
      _loc2_.clearTallies();
      _loc2_.gameObj.var_109.clearCheckpoint();
      _loc2_.gameObj.var_107.method_151();
      _loc2_.gameObj.var_112.fixBadges();
    }

    public function saveProgress(param1:String = "all"):void
    {
      var _loc2_:UserData = this;
      var _loc3_:Number = getTimer();
      if (_loc2_.so == null)
      {
        class_7.error("Saved data was missing for this save.  Generating a new one.");
        _loc2_.so = SharedObject.getLocal(this.saveSlotPrefix + _loc2_.whichSlot, "/");
      }
      if (param1 == "all")
      {
        this.so.data.playerName = _loc2_.playerName;
        ExternalInterface.call("log", this.so.data.playerName);
        this.so.data.whichCharacter = _loc2_.whichCharacter;
        ExternalInterface.call("log", this.so.data.whichCharacter);
        this.so.data.continuedgame = _loc2_.hasContinuedGame;
        ExternalInterface.call("log", this.so.data.continuedgame);
        this.so.data.totalScore = _loc2_.totalScore.value;
        ExternalInterface.call("log", this.so.data.totalScore);
        this.so.data.totalMoney = _loc2_.totalMoney.value;
        ExternalInterface.call("log", this.so.data.totalMoney);
        this.so.data.totalLives = _loc2_.totalLives.value;
        ExternalInterface.call("log", this.so.data.totalLives);
        this.so.data.totalTime = _loc2_.totalTimePlayed.value;
        ExternalInterface.call("log", this.so.data.totalTime);
        this.so.data.warpCoins = _loc2_.warpCoins.value;
        ExternalInterface.call("log", this.so.data.warpCoins);
        this.so.data.areasUnlocked = _loc2_.areasUnlocked.concat();
        ExternalInterface.call("log", this.so.data.areasUnlocked);
        this.so.data.highScores = _loc2_.highScores.concat();
        ExternalInterface.call("log", this.so.data.highScores);
        this.so.data.bestTimes = _loc2_.bestTimes.concat();
        ExternalInterface.call("log", this.so.data.bestTimes);
        this.so.data.challengesCompleted = class_12.method_90(_loc2_.challengesCompleted);
        ExternalInterface.call("log", this.so.data.challengesCompleted);
        this.so.data.medalsEarned = _loc2_.medalsEarned.concat();
        ExternalInterface.call("log", this.so.data.medalsEarned);
        this.so.data.medalProgress = _loc2_.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", this.so.data.medalProgress);
        this.so.data.revealedarea = _loc2_.hasRevealedLatestArea;
        ExternalInterface.call("log", this.so.data.revealedarea);
        this.so.data.lastarearevealed = _loc2_.lastAreaRevealed;
        ExternalInterface.call("log", this.so.data.lastarearevealed);
        this.so.data.customersUnlocked = _loc2_.customersUnlocked.concat();
        ExternalInterface.call("log", this.so.data.customersUnlocked);
        this.so.data.customerOutfits = class_12.method_90(_loc2_.customerOutfits);
        ExternalInterface.call("log", this.so.data.customerOutfits);
        this.so.data.lastCustomerUnlocked = _loc2_.lastCustomerUnlocked;
        ExternalInterface.call("log", this.so.data.lastCustomerUnlocked);
        this.so.data.enemyKills = _loc2_.enemyKills.concat();
        ExternalInterface.call("log", this.so.data.enemyKills);
        this.so.data.customersUsed = _loc2_.customersUsed.concat();
        ExternalInterface.call("log", this.so.data.customersUsed);
        this.so.data.char = _loc2_.selectedCharacter;
        ExternalInterface.call("log", this.so.data.char);
        this.so.data.style = _loc2_.selectedStyle;
        ExternalInterface.call("log", this.so.data.style);
        this.so.data.keyCodeLeft = _loc2_.keyCodeLeft;
        ExternalInterface.call("log", this.so.data.keyCodeLeft);
        this.so.data.keyCodeRight = _loc2_.keyCodeRight;
        ExternalInterface.call("log", this.so.data.keyCodeRight);
        this.so.data.keyCodeUp = _loc2_.keyCodeUp;
        ExternalInterface.call("log", this.so.data.keyCodeUp);
        this.so.data.keyCodeDown = _loc2_.keyCodeDown;
        ExternalInterface.call("log", this.so.data.keyCodeDown);
        this.so.data.keyCodeJump = _loc2_.keyCodeJump;
        ExternalInterface.call("log", this.so.data.keyCodeJump);
        this.so.data.keyCodeAttack = _loc2_.keyCodeAttack;
        ExternalInterface.call("log", this.so.data.keyCodeAttack);
        this.so.data.keyCodeDrop = _loc2_.keyCodeDrop;
        ExternalInterface.call("log", this.so.data.keyCodeDrop);
        this.so.data.keyCodePause = _loc2_.keyCodePause;
        ExternalInterface.call("log", this.so.data.keyCodePause);
        this.so.data.clicktwitter = _loc2_.didClickTwitter;
        ExternalInterface.call("log", this.so.data.clicktwitter);
        this.so.data.clickfacebook = _loc2_.didClickFacebook;
        ExternalInterface.call("log", this.so.data.clickfacebook);
      }
      else if (param1 == "quitlevel")
      {
        this.so.data.playerName = _loc2_.playerName;
        ExternalInterface.call("log", this.so.data.playerName);
        this.so.data.whichCharacter = _loc2_.whichCharacter;
        ExternalInterface.call("log", this.so.data.whichCharacter);
        this.so.data.continuedgame = _loc2_.hasContinuedGame;
        ExternalInterface.call("log", this.so.data.continuedgame);
        this.so.data.revealedarea = _loc2_.hasRevealedLatestArea;
        ExternalInterface.call("log", this.so.data.revealedarea);
        this.so.data.lastarearevealed = _loc2_.lastAreaRevealed;
        ExternalInterface.call("log", this.so.data.lastarearevealed);
        this.so.data.totalTime = _loc2_.totalTimePlayed.value;
        ExternalInterface.call("log", this.so.data.totalTime);
        this.so.data.totalScore = _loc2_.totalScore.value;
        ExternalInterface.call("log", this.so.data.totalScore);
        this.so.data.totalMoney = _loc2_.totalMoney.value;
        ExternalInterface.call("log", this.so.data.totalMoney);
        this.so.data.totalLives = _loc2_.totalLives.value;
        ExternalInterface.call("log", this.so.data.totalLives);
        this.so.data.warpCoins = _loc2_.warpCoins.value;
        ExternalInterface.call("log", this.so.data.warpCoins);
        this.so.data.clicktwitter = _loc2_.didClickTwitter;
        ExternalInterface.call("log", this.so.data.clicktwitter);
        this.so.data.clickfacebook = _loc2_.didClickFacebook;
        ExternalInterface.call("log", this.so.data.clickfacebook);
        this.so.data.challengesCompleted = class_12.method_90(_loc2_.challengesCompleted);
        ExternalInterface.call("log", this.so.data.challengesCompleted);
        this.so.data.medalsEarned = _loc2_.medalsEarned.concat();
        ExternalInterface.call("log", this.so.data.medalsEarned);
        this.so.data.medalProgress = _loc2_.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", this.so.data.medalProgress);
        this.so.data.customersUnlocked = _loc2_.customersUnlocked.concat();
        ExternalInterface.call("log", this.so.data.customersUnlocked);
        this.so.data.customerOutfits = class_12.method_90(_loc2_.customerOutfits);
        ExternalInterface.call("log", this.so.data.customerOutfits);
        this.so.data.lastCustomerUnlocked = _loc2_.lastCustomerUnlocked;
        ExternalInterface.call("log", this.so.data.lastCustomerUnlocked);
        this.so.data.customersUsed = _loc2_.customersUsed.concat();
        ExternalInterface.call("log", this.so.data.customersUsed);
        this.so.data.char = _loc2_.selectedCharacter;
        ExternalInterface.call("log", this.so.data.char);
        this.so.data.style = _loc2_.selectedStyle;
        ExternalInterface.call("log", this.so.data.style);
        this.so.data.enemyKills = _loc2_.enemyKills.concat();
        ExternalInterface.call("log", this.so.data.enemyKills);
      }
      else if (param1 == "time")
      {
        this.so.data.totalTime = _loc2_.totalTimePlayed.value;
        ExternalInterface.call("log", this.so.data.totalTime);
        this.so.data.continuedgame = _loc2_.hasContinuedGame;
        ExternalInterface.call("log", this.so.data.continuedgame);
      }
      else if (param1 == "badge")
      {
        this.so.data.medalsEarned = _loc2_.medalsEarned.concat();
        ExternalInterface.call("log", this.so.data.medalsEarned);
        this.so.data.medalProgress = _loc2_.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", this.so.data.medalProgress);
        this.so.data.totalMoney = _loc2_.totalMoney.value;
        ExternalInterface.call("log", this.so.data.totalMoney);
        this.so.data.continuedgame = _loc2_.hasContinuedGame;
        ExternalInterface.call("log", this.so.data.continuedgame);
        this.so.data.clicktwitter = _loc2_.didClickTwitter;
        ExternalInterface.call("log", this.so.data.clicktwitter);
        this.so.data.clickfacebook = _loc2_.didClickFacebook;
        ExternalInterface.call("log", this.so.data.clickfacebook);
      }
      else if (param1 == "outfit")
      {
        this.so.data.customersUnlocked = _loc2_.customersUnlocked.concat();
        ExternalInterface.call("log", this.so.data.customersUnlocked);
        this.so.data.customerOutfits = class_12.method_90(_loc2_.customerOutfits);
        ExternalInterface.call("log", this.so.data.customerOutfits);
        this.so.data.totalMoney = _loc2_.totalMoney.value;
        ExternalInterface.call("log", this.so.data.totalMoney);
        this.so.data.clicktwitter = _loc2_.didClickTwitter;
        ExternalInterface.call("log", this.so.data.clicktwitter);
        this.so.data.clickfacebook = _loc2_.didClickFacebook;
        ExternalInterface.call("log", this.so.data.clickfacebook);
        this.so.data.medalsEarned = _loc2_.medalsEarned.concat();
        ExternalInterface.call("log", this.so.data.medalsEarned);
        this.so.data.medalProgress = _loc2_.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", this.so.data.medalProgress);
      }
      else if (param1 == "challenge")
      {
        this.so.data.challengesCompleted = class_12.method_90(_loc2_.challengesCompleted);
        ExternalInterface.call("log", this.so.data.challengesCompleted);
        this.so.data.continuedgame = _loc2_.hasContinuedGame;
        ExternalInterface.call("log", this.so.data.continuedgame);
        this.so.data.medalsEarned = _loc2_.medalsEarned.concat();
        ExternalInterface.call("log", this.so.data.medalsEarned);
        this.so.data.medalProgress = _loc2_.gameObj.var_112.getMedalProgressArray();
        ExternalInterface.call("log", this.so.data.medalProgress);
        this.so.data.clicktwitter = _loc2_.didClickTwitter;
        ExternalInterface.call("log", this.so.data.clicktwitter);
        this.so.data.clickfacebook = _loc2_.didClickFacebook;
        ExternalInterface.call("log", this.so.data.clickfacebook);
      }
      else if (param1 == "controls")
      {
        this.so.data.keyCodeLeft = _loc2_.keyCodeLeft;
        ExternalInterface.call("log", this.so.data.keyCodeLeft);
        this.so.data.keyCodeRight = _loc2_.keyCodeRight;
        ExternalInterface.call("log", this.so.data.keyCodeRight);
        this.so.data.keyCodeUp = _loc2_.keyCodeUp;
        ExternalInterface.call("log", this.so.data.keyCodeUp);
        this.so.data.keyCodeDown = _loc2_.keyCodeDown;
        ExternalInterface.call("log", this.so.data.keyCodeDown);
        this.so.data.keyCodeJump = _loc2_.keyCodeJump;
        ExternalInterface.call("log", this.so.data.keyCodeJump);
        this.so.data.keyCodeAttack = _loc2_.keyCodeAttack;
        ExternalInterface.call("log", this.so.data.keyCodeAttack);
        this.so.data.keyCodeDrop = _loc2_.keyCodeDrop;
        ExternalInterface.call("log", this.so.data.keyCodeDrop);
        this.so.data.keyCodePause = _loc2_.keyCodePause;
        ExternalInterface.call("log", this.so.data.keyCodePause);
        this.so.data.continuedgame = _loc2_.hasContinuedGame;
        ExternalInterface.call("log", this.so.data.continuedgame);
      }
      this.so.data.version = _loc2_.saveSlotVersion;
      ExternalInterface.call("log", this.so.data.version);
      this.so.data.trainingflags = _loc2_.trainingFlags.concat();
      ExternalInterface.call("log", this.so.data.trainingflags);
      var _loc4_:Number = getTimer();
      _loc2_.flushSaveSlot();
      _loc2_.gameObj.var_107.method_151();
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
      var _loc2_:UserData = this;
      switch (param1.info.code)
      {
        case "SharedObject.Flush.Success":
          class_7.info("Granted Permission to Save, data will now save.");
          _loc2_.gameObj.var_107.api.method_111();
          break;
        case "SharedObject.Flush.Failed":
          _loc2_.gameObj.var_107.api.method_112("Your game progress will not be saved!");
          class_7.info("Denied Permission to Save, no progress will be saved!");
      }
      _loc2_.so.removeEventListener(NetStatusEvent.NET_STATUS, _loc2_.onFlushStatus);
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
      var _loc3_:UserData = this;
      var _loc4_:Boolean = false;
      var _loc5_:Boolean = false;
      if (_loc3_.keyCodeAttack == param1 && param2 != "attack")
      {
        _loc4_ = true;
      }
      else if (_loc3_.keyCodeJump == param1 && param2 != "jump" && param2 != "up")
      {
        _loc4_ = true;
      }
      else if (_loc3_.keyCodeDown == param1 && param2 != "down")
      {
        _loc4_ = true;
      }
      else if (_loc3_.keyCodeUp == param1 && param2 != "up" && param2 != "jump")
      {
        _loc4_ = true;
      }
      else if (_loc3_.keyCodeLeft == param1 && param2 != "left")
      {
        _loc4_ = true;
      }
      else if (_loc3_.keyCodeRight == param1 && param2 != "right")
      {
        _loc4_ = true;
      }
      if (!_loc4_)
      {
        if (param2 == "attack")
        {
          _loc3_.keyCodeAttack = param1;
        }
        else if (param2 == "jump")
        {
          _loc3_.keyCodeJump = param1;
        }
        else if (param2 == "drop")
        {
          _loc3_.keyCodeDrop = param1;
        }
        else if (param2 == "down")
        {
          _loc3_.keyCodeDown = param1;
        }
        else if (param2 == "up")
        {
          _loc3_.keyCodeUp = param1;
        }
        else if (param2 == "left")
        {
          _loc3_.keyCodeLeft = param1;
        }
        else if (param2 == "right")
        {
          _loc3_.keyCodeRight = param1;
        }
        else if (param2 == "pause")
        {
          _loc3_.keyCodePause = param1;
        }
        _loc3_.saveProgress("controls");
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
      var _loc1_:UserData = this;
      var _loc2_:ChallengeManager = _loc1_.gameObj.var_112;
      var _loc3_:int = 0;
      while (_loc3_ < _loc2_.badges.length)
      {
        _loc1_.medalsEarned.push(0);
        _loc1_.medalProgress.push(0);
        _loc3_++;
      }
      _loc2_.recordTag("warpCoin");
      _loc2_.recordTag("customerUnlocked");
      _loc2_.recordTag("customerUnlocked");
    }

    public function isValidTrainingFlag(param1:String):Boolean
    {
      var _loc2_:UserData = this;
      var _loc3_:Boolean = false;
      var _loc4_:Number = _loc2_.trainingFlagNames.indexOf(param1);
      if (_loc4_ > -1)
      {
        _loc3_ = true;
      }
      return _loc3_;
    }

    public function hasTrained(param1:String):Boolean
    {
      var _loc2_:UserData = this;
      var _loc3_:Boolean = false;
      var _loc4_:Number = _loc2_.trainingFlagNames.indexOf(param1);
      if (_loc4_ > -1 && _loc2_.trainingFlags.length > _loc4_)
      {
        if (_loc2_.trainingFlags[_loc4_] == 1)
        {
          _loc3_ = true;
        }
      }
      return _loc3_;
    }

    public function setTrained(param1:String):void
    {
      var _loc2_:UserData = this;
      var _loc3_:Number = _loc2_.trainingFlagNames.indexOf(param1);
      if (_loc3_ > -1)
      {
        _loc2_.trainingFlags[_loc3_] = 1;
      }
    }
  }
}
