package papaGame.screens
{
  import flash.display.*;
  import flash.events.*;
  import flash.filters.ColorMatrixFilter;
  import flash.geom.*;
  import flash.utils.getDefinitionByName;
  import flash.utils.getTimer;
  import package_1.class_1;
  import package_2.class_10;
  import package_2.class_3;
  import package_2.class_7;
  import package_2.class_9;
  import package_3.class_11;
  import package_4.class_5;
  import papaGame.data.Challenge;
  import papaGame.data.CustomerData;
  import papaGame.data.CustomerDataFile;
  import papaGame.data.DataManager;
  import papaGame.data.UserData;
  import papaGame.managers.ChallengeManager;

  public class MainMenuScreen
  {

    public var gameObj:class_5;

    public var clip:MovieClip;

    public var container:MovieClip;

    public var currentSection:String = "";

    public var newSection:String = "";

    public var tweenSpeed:Number = 2;

    public var isTransitioning:Boolean = false;

    public var isClosing:Boolean = false;

    private var params:Object;

    public var isStartingLevel:Boolean = false;

    public var isOpeningMapDetail:Boolean = false;

    public var whichLevel:Number = -1;

    public var isQuittingLevel:Boolean = false;

    public var isContinuingToMap:Boolean = false;

    public var isReturningToMap:Boolean = false;

    public var isOnCharSelect:Boolean = false;

    private var previousMoney:Number = 0;

    private var deductMoneyTimer:Number = 0;

    private var deductMoneyTimerMax:Number = 30;

    private var medalsPage:Number = 0;

    private var medalsPerPage:Number = 8;

    private var medalsDirection:String = "next";

    private var medalsTransitioning:Boolean = true;

    private var numCharacters:Number = 28;

    private var selectedCharacterIndex:Number = 0;

    private var selectedStyle:Number = 1;

    private var lastCharacterIndex:Number = 0;

    private var characterThumbs:Vector.<Bitmap>;

    private var rescueThumbs:Vector.<Bitmap>;

    private var enemyThumbs:Vector.<Bitmap>;

    private var enemyDetail:MovieClip = null;

    private var lastCharacterName:String = "";

    private var characterModel:MovieClip = null;

    private var leavingModels:Vector.<MovieClip>;

    private var characterStartX:Number = 500;

    private var characterLeaveX:Number = -100;

    private var characterTargetX:Number = 210;

    private var characterTargetY:Number = 80;

    private var characterSpeed:Number = 18;

    private var infoModel:MovieClip = null;

    private var confirmYesButton:class_11;

    private var confirmNoButton:class_11;

    private var settingWhichKey:String = "none";

    private var keysWereChanged:Boolean = false;

    private var useWhichUpsell:Number = 1;

    private var papalouieLink:String = "http://www.flipline.com/games/papalouie/";

    private var pizzeriaLink:String = "http://www.flipline.com/games/papaspizzeria/";

    private var burgeriaLink:String = "http://www.flipline.com/games/papasburgeria/";

    private var tacomiaLink:String = "http://www.flipline.com/games/papastacomia/";

    private var freezeriaLink:String = "http://www.flipline.com/games/papasfreezeria/";

    private var pancakeriaLink:String = "http://www.flipline.com/games/papaspancakeria/";

    private var wingeriaLink:String = "http://www.flipline.com/games/papaswingeria/";

    private var hotdoggeriaLink:String = "http://www.flipline.com/games/papashotdoggeria/";

    private var shouldShowGameLinks:Boolean = false;

    private var useWhichLink:String = "";

    private var helpIndex:Number = -1;

    private var helpScrollStart:Number = 30;

    private var helpScrollRange:Number = 158;

    private var helpTabScrollDir:Number = 0;

    private var helpMainScrollDir:Number = 0;

    private var willRevealMap:Boolean = false;

    private var mapLastUnlocked:Number = 0;

    public function MainMenuScreen(param1:class_5, param2:MovieClip, param3:Object = null)
    {
      super();
      this.gameObj = param1;
      this.container = param2;
      this.params = param3;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      var _loc1_:MainMenuScreen = this;
      if (this.params != null && this.params.hasOwnProperty("useLevel"))
      {
        _loc1_.whichLevel = Number(this.params.useLevel);
      }
      if (this.params != null && this.params.hasOwnProperty("isCharSelect"))
      {
        _loc1_.isOnCharSelect = this.params.isCharSelect;
      }
      _loc1_.clip = new mainMenuMC();
      _loc1_.container.addChild(_loc1_.clip);
      _loc1_.container.addEventListener("clickBaddies", _loc1_.clickBaddies);
      _loc1_.container.addEventListener("clickMedals", _loc1_.clickMedals);
      _loc1_.container.addEventListener("clickControls", _loc1_.clickControls);
      _loc1_.container.addEventListener("clickCredits", _loc1_.clickCredits);
      _loc1_.container.addEventListener("clickHelp", _loc1_.clickHelp);
      _loc1_.container.addEventListener("clickExit", _loc1_.clickExit);
      _loc1_.container.addEventListener("clickParade", _loc1_.clickParade);
      _loc1_.container.addEventListener("clickParadeTwo", _loc1_.clickParadeTwo);
      _loc1_.container.addEventListener("clickBaddiesRedirect", _loc1_.clickBaddiesRedirect);
      _loc1_.container.addEventListener("clickMedalsRedirect", _loc1_.clickMedalsRedirect);
      _loc1_.container.addEventListener("clickCreditsRedirect", _loc1_.clickCreditsRedirect);
      _loc1_.container.addEventListener("clickControlsRedirect", _loc1_.clickControlsRedirect);
      _loc1_.container.addEventListener("clickHelpRedirect", _loc1_.clickHelpRedirect);
      _loc1_.container.addEventListener("clickBaddiesRedirectBack", _loc1_.clickBaddiesRedirectBack);
      _loc1_.container.addEventListener("clickMedalsRedirectBack", _loc1_.clickMedalsRedirectBack);
      _loc1_.container.addEventListener("clickControlsRedirectBack", _loc1_.clickControlsRedirectBack);
      _loc1_.container.addEventListener("clickHelpRedirectBack", _loc1_.clickHelpRedirectBack);
      _loc1_.container.addEventListener("clickCreditsRedirectBack", _loc1_.clickCreditsRedirectBack);
      _loc1_.container.addEventListener("clickInfo", _loc1_.clickInfo);
      _loc1_.container.addEventListener("clickBackToGame", _loc1_.clickBackToGame);
      _loc1_.container.addEventListener("clickQuit", _loc1_.clickQuit);
      _loc1_.container.addEventListener("clickStartLevel", _loc1_.clickStartLevel);
      _loc1_.container.addEventListener("clickBackToMap", _loc1_.clickBackToMap);
      _loc1_.container.addEventListener("clickExitMapSelect", _loc1_.clickExitMapSelect);
      _loc1_.setupMap();
      if (this.isOnCharSelect)
      {
        _loc1_.setupCharacter();
      }
      if (!this.isOnCharSelect)
      {
        _loc1_.setupInfo();
      }
      _loc1_.setupBaddies();
      _loc1_.setupControls();
      _loc1_.setupCredits();
      _loc1_.setupHelp();
      _loc1_.setupMedals();
      _loc1_.setupConfirmQuit();
      if (_loc1_.gameObj.var_109.currentWorldData == null && _loc1_.gameObj.var_105.currentTrack != "otherscreens.wav")
      {
        _loc1_.gameObj.var_105.playTrack("AlternateTrack", 1, 0, "outin");
      }
      if (this.params != null && this.params.hasOwnProperty("section"))
      {
        _loc1_.setSection(this.params.section);
      }
      else
      {
        _loc1_.setSection("map");
      }
    }

    public function setupConfirmQuit(param1:Boolean = true):void
    {
      var _loc2_:MainMenuScreen = this;
      if (param1)
      {
        _loc2_.confirmYesButton = new class_11(null, "YES", "small", "button", "clickYesQuit", null, false, false, false, null, false, 80);
        _loc2_.confirmYesButton.x = 234;
        _loc2_.confirmYesButton.y = 220;
        _loc2_.confirmNoButton = new class_11(null, "NO", "small", "button", "clickNoQuit", null, false, false, false, null, false, 80);
        _loc2_.confirmNoButton.x = 385;
        _loc2_.confirmNoButton.y = _loc2_.confirmYesButton.y;
        _loc2_.clip.confirmquit.addChild(_loc2_.confirmYesButton);
        _loc2_.clip.confirmquit.addChild(_loc2_.confirmNoButton);
        _loc2_.confirmYesButton.addEventListener("clickYesQuit", _loc2_.clickConfirmQuit);
        _loc2_.confirmNoButton.addEventListener("clickNoQuit", _loc2_.clickCancelQuit);
        _loc2_.clip.confirmquit.visible = false;
      }
      else
      {
        _loc2_.clip.confirmquit.removeChild(_loc2_.confirmYesButton);
        _loc2_.clip.confirmquit.removeChild(_loc2_.confirmNoButton);
        _loc2_.confirmYesButton.removeEventListener("clickYesQuit", _loc2_.clickConfirmQuit);
        _loc2_.confirmNoButton.removeEventListener("clickNoQuit", _loc2_.clickCancelQuit);
        _loc2_.confirmYesButton.destroy();
        _loc2_.confirmNoButton.destroy();
        _loc2_.confirmYesButton = null;
        _loc2_.confirmNoButton = null;
      }
    }

    public function setupMedals(param1:Boolean = true):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      var _loc4_:ChallengeManager = _loc2_.gameObj.var_112;
      _loc2_.medalsPage = 0;
      _loc2_.medalsDirection = "next";
      _loc2_.medalsTransitioning = true;
      if (param1)
      {
        _loc2_.clip.medals.next_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickNextMedals);
        _loc2_.clip.medals.prev_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickPrevMedals);
        _loc2_.clip.medals.prev_btn.visible = false;
        _loc2_.clip.medals.total_txt.text = String(_loc3_.getTotalBadgesEarned() + "/" + _loc4_.getNumberOfBadges());
        _loc2_.populateMedals();
        _loc2_.clip.medals.panel.addEventListener(Event.ENTER_FRAME, _loc2_.animateMedalsTransition);
      }
      else
      {
        _loc2_.clip.medals.next_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickNextMedals);
        _loc2_.clip.medals.prev_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickPrevMedals);
        if (_loc2_.clip.medals.panel.hasEventListener(Event.ENTER_FRAME))
        {
          _loc2_.clip.medals.panel.removeEventListener(Event.ENTER_FRAME, _loc2_.animateMedalsTransition);
        }
      }
    }

    public function getDesaturatedFilter():ColorMatrixFilter
    {
      return new ColorMatrixFilter([0.212671, 0.71516, 0.072169, 0, 0, 0.212671, 0.71516, 0.072169, 0, 0, 0.212671, 0.71516, 0.072169, 0, 0, 0, 0, 0, 1, 0]);
    }

    public function populateMedals():void
    {
      var _loc9_:MovieClip = null;
      var _loc10_:Number = NaN;
      var _loc1_:MainMenuScreen = this;
      var _loc2_:UserData = _loc1_.gameObj.var_106;
      var _loc3_:ChallengeManager = _loc1_.gameObj.var_112;
      var _loc4_:Number = 0 + _loc1_.medalsPage * _loc1_.medalsPerPage;
      var _loc5_:Number = Math.min(_loc3_.getNumberOfBadges() - 1, _loc4_ + (_loc1_.medalsPerPage - 1));
      var _loc6_:Number = _loc5_ - _loc4_ + 1;
      var _loc7_:int = 0;
      while (_loc7_ < _loc1_.medalsPerPage)
      {
        _loc9_ = _loc1_.clip.medals.panel["panel" + (_loc7_ + 1)];
        _loc10_ = _loc7_ + _loc4_;
        if (_loc7_ < _loc6_)
        {
          _loc9_.visible = true;
          _loc9_.title_txt.text = _loc3_.getChallengeTitle(-1, -1, _loc10_);
          _loc9_.description_txt.text = _loc3_.getChallengeDescription(-1, -1, _loc10_) + " " + _loc3_.getBadgeTallyString(_loc10_);
          _loc9_.reward_txt.text = "+ $" + class_10.method_84(_loc3_.getChallengeRewardAmount(-1, -1, _loc10_));
          _loc9_.points_txt.text = _loc3_.getChallengeRewardAmount(-1, -1, _loc10_) + " Pts.";
          _loc9_.thumb.gotoAndStop(_loc10_ + 1);
          if (_loc2_.hasBadge(_loc10_))
          {
            _loc9_.earned.visible = true;
            _loc9_.thumb.filters = [];
          }
          else
          {
            _loc9_.earned.visible = false;
            _loc9_.thumb.filters = [_loc1_.getDesaturatedFilter()];
          }
          if (_loc3_.shouldLockBadge(_loc10_))
          {
            _loc9_.thumb.gotoAndStop(49);
            _loc9_.title_txt.text = "Hidden Badge";
            _loc9_.description_txt.text = "You can\'t see this badge yet!";
            _loc9_.reward_txt.text = "";
            _loc9_.points_txt.text = "";
          }
        }
        else
        {
          _loc9_.visible = false;
        }
        _loc7_++;
      }
      var _loc8_:Number = Math.ceil(_loc3_.getNumberOfBadges() / _loc1_.medalsPerPage);
      if (_loc1_.medalsPage > 0)
      {
        _loc1_.clip.medals.prev_btn.visible = true;
      }
      else
      {
        _loc1_.clip.medals.prev_btn.visible = false;
      }
      if (_loc1_.medalsPage < _loc8_ - 1)
      {
        _loc1_.clip.medals.next_btn.visible = true;
      }
      else
      {
        _loc1_.clip.medals.next_btn.visible = false;
      }
      _loc1_.clip.medals.page_txt.text = _loc1_.medalsPage + 1 + " / " + _loc8_;
      if (_loc1_.medalsDirection == "next")
      {
        _loc1_.clip.medals.panel.gotoAndPlay("innext");
      }
      else
      {
        _loc1_.clip.medals.panel.gotoAndPlay("inprev");
      }
    }

    public function clickNextMedals(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (!_loc2_.medalsTransitioning)
      {
        ++_loc2_.medalsPage;
        _loc2_.medalsDirection = "next";
        _loc2_.medalsTransitioning = true;
        _loc2_.clip.medals.panel.gotoAndPlay("outnext");
        _loc2_.clip.medals.panel.addEventListener(Event.ENTER_FRAME, _loc2_.animateMedalsTransition);
      }
    }

    public function clickPrevMedals(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (!_loc2_.medalsTransitioning)
      {
        --_loc2_.medalsPage;
        _loc2_.medalsDirection = "prev";
        _loc2_.medalsTransitioning = true;
        _loc2_.clip.medals.panel.gotoAndPlay("outprev");
        _loc2_.clip.medals.panel.addEventListener(Event.ENTER_FRAME, _loc2_.animateMedalsTransition);
      }
    }

    public function animateMedalsTransition(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.clip.medals.panel.currentLabel == "outnextframe" || _loc2_.clip.medals.panel.currentLabel == "outprevframe")
      {
        _loc2_.populateMedals();
      }
      else if (_loc2_.clip.medals.panel.currentLabel == "innextframe" || _loc2_.clip.medals.panel.currentLabel == "inprevframe")
      {
        _loc2_.clip.medals.panel.removeEventListener(Event.ENTER_FRAME, _loc2_.animateMedalsTransition);
        _loc2_.medalsTransitioning = false;
      }
    }

    public function setupBaddies(param1:Boolean = true):void
    {
      var _loc5_:int = 0;
      var _loc6_:MovieClip = null;
      var _loc9_:Object = null;
      var _loc10_:BitmapData = null;
      var _loc11_:Bitmap = null;
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      var _loc4_:DataManager = _loc2_.gameObj.var_109;
      var _loc7_:Number = 0;
      var _loc8_:Number = 0;
      if (param1)
      {
        _loc2_.enemyThumbs = new Vector.<Bitmap>();
        _loc5_ = 0;
        while (_loc5_ < 35)
        {
          _loc6_ = _loc2_.clip.baddies["thumb" + _loc5_];
          if (_loc5_ < _loc4_.enemyKey.length)
          {
            _loc8_++;
            _loc9_ = _loc4_.enemyKey[_loc5_];
            _loc6_.buttonMode = true;
            _loc6_.useHandCursor = true;
            _loc6_.hilite.visible = false;
            _loc6_.roll.visible = false;
            _loc6_.newbanner.visible = false;
            _loc6_.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickEnemyThumb);
            _loc6_.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverEnemyThumb);
            _loc6_.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutEnemyThumb);
            _loc6_.gotoAndStop(6);
            if (_loc9_.id == 35 || _loc9_.id == 37)
            {
              _loc6_.gotoAndStop(2);
            }
            _loc10_ = _loc2_.gameObj.var_109.getEnemyBitmap(_loc5_);
            _loc11_ = new Bitmap(_loc10_);
            _loc6_.holder.addChild(_loc11_);
            _loc2_.enemyThumbs.push(_loc11_);
            if (_loc3_.getEnemyKills(_loc9_.id) <= 0)
            {
              _loc6_.visible = false;
            }
            else
            {
              _loc7_++;
            }
          }
          else
          {
            _loc6_.visible = false;
          }
          _loc5_++;
        }
        _loc2_.clip.baddies.tally_txt.text = String(_loc7_ + "/" + _loc8_);
        if (_loc3_.getEnemyKills(_loc4_.enemyKey[0].id) > 0)
        {
          _loc2_.selectEnemy(0);
        }
        else if (_loc3_.getEnemyKills(_loc4_.enemyKey[1].id) > 0)
        {
          _loc2_.selectEnemy(1);
        }
        else if (_loc3_.getEnemyKills(_loc4_.enemyKey[4].id) > 0)
        {
          _loc2_.selectEnemy(4);
        }
        else
        {
          _loc2_.selectEnemy(0);
        }
      }
      else
      {
        _loc5_ = 0;
        while (_loc5_ < 35)
        {
          _loc6_ = _loc2_.clip.baddies["thumb" + _loc5_];
          if (_loc5_ < _loc4_.enemyKey.length)
          {
            _loc6_.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickEnemyThumb);
            _loc6_.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverEnemyThumb);
            _loc6_.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutEnemyThumb);
          }
          _loc5_++;
        }
        _loc5_ = 0;
        while (_loc5_ < _loc2_.enemyThumbs.length)
        {
          if (_loc2_.enemyThumbs[_loc5_] != null)
          {
            _loc2_.enemyThumbs[_loc5_].bitmapData.dispose();
            _loc2_.enemyThumbs[_loc5_].bitmapData = null;
            _loc2_.enemyThumbs[_loc5_].parent.removeChild(_loc2_.enemyThumbs[_loc5_]);
            _loc2_.enemyThumbs[_loc5_] = null;
          }
          _loc5_++;
        }
        _loc2_.enemyThumbs = null;
        if (_loc2_.enemyDetail != null)
        {
          _loc2_.enemyDetail.parent.removeChild(_loc2_.enemyDetail);
          _loc2_.enemyDetail = null;
        }
      }
    }

    public function setupCharacter(param1:Boolean = true):void
    {
      var _loc4_:int = 0;
      var _loc5_:Boolean = false;
      var _loc6_:MovieClip = null;
      var _loc7_:CustomerDataFile = null;
      var _loc8_:BitmapData = null;
      var _loc9_:Bitmap = null;
      var _loc10_:MovieClip = null;
      var _loc11_:String = null;
      var _loc12_:String = null;
      var _loc13_:String = null;
      var _loc14_:Number = NaN;
      var _loc15_:BitmapData = null;
      var _loc16_:Bitmap = null;
      var _loc17_:MovieClip = null;
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      _loc2_.clip.character.charholder.mouseEnabled = false;
      _loc2_.clip.character.charholder.mouseChildren = false;
      _loc2_.clip.character.title_txt.text = _loc2_.gameObj.var_109.getWorldTitle(_loc2_.whichLevel);
      _loc2_.clip.character.levelnum_txt.text = String(_loc2_.whichLevel + 1);
      if (_loc2_.whichLevel == 9)
      {
        _loc2_.clip.character.levelnum_txt.text = "X";
      }
      _loc2_.clip.character.score_txt.text = class_10.method_84(_loc3_.getLevelHighScore(_loc2_.whichLevel));
      _loc2_.clip.character.levelinside.inside.gotoAndStop(_loc2_.whichLevel + 1);
      _loc2_.clip.character.levelinside.mask = _loc2_.clip.character.levelmask;
      if (param1)
      {
        _loc2_.characterThumbs = new Vector.<Bitmap>();
        _loc2_.rescueThumbs = new Vector.<Bitmap>();
        _loc2_.leavingModels = new Vector.<MovieClip>();
        if (!class_3.method_47())
        {
          _loc2_.shouldShowGameLinks = true;
        }
        _loc2_.clip.character.link_btn.visible = false;
        _loc2_.clip.character.underline.visible = false;
        _loc2_.clip.character.link_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickCustomerPlayGame);
        _loc4_ = 0;
        while (_loc4_ < _loc2_.numCharacters)
        {
          _loc6_ = _loc2_.clip.character["thumb" + _loc4_];
          _loc6_.buttonMode = true;
          _loc6_.useHandCursor = true;
          _loc6_.hilite.visible = false;
          _loc6_.roll.visible = false;
          _loc6_.newbanner.visible = false;
          if (_loc3_.customersUsed[_loc4_] == 0)
          {
            _loc6_.newbanner.visible = true;
          }
          _loc6_.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterThumb);
          _loc6_.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterThumb);
          _loc6_.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterThumb);
          _loc7_ = _loc2_.gameObj.var_113.getCustomerData(_loc4_);
          _loc6_.gotoAndStop(_loc7_.skillType);
          _loc8_ = _loc2_.gameObj.var_113.getCustomerBitmap(_loc4_);
          _loc9_ = new Bitmap(_loc8_);
          _loc6_.holder.addChild(_loc9_);
          _loc2_.characterThumbs.push(_loc9_);
          if (_loc3_.hasCustomerUnlocked(_loc4_) == false)
          {
            _loc6_.visible = false;
          }
          _loc4_++;
        }
        class_7.method_1("Setup Challenges for level: " + this.whichLevel);
        _loc4_ = 1;
        while (_loc4_ <= 6)
        {
          if (_loc3_.hasCompletedChallenge(this.whichLevel, _loc4_))
          {
            _loc2_.clip.character["icon" + _loc4_].gotoAndStop(2);
          }
          else
          {
            _loc2_.clip.character["icon" + _loc4_].gotoAndStop(1);
          }
          _loc2_.clip.character["icon" + _loc4_].num_txt.text = String(_loc4_);
          _loc10_ = _loc2_.clip.character["panel" + _loc4_];
          _loc11_ = _loc2_.gameObj.var_112.getChallengeType(this.whichLevel, _loc4_);
          _loc12_ = _loc2_.gameObj.var_112.getChallengeTargetAmount(this.whichLevel, _loc4_);
          _loc13_ = _loc2_.gameObj.var_112.getChallengeSkillNeeded(this.whichLevel, _loc4_);
          if (_loc11_ == Challenge.RESCUE)
          {
            _loc10_.description_txt.text = "Rescue:";
            _loc14_ = _loc2_.gameObj.var_113.getTrappedCustomerIndex(this.whichLevel, _loc4_);
            _loc15_ = _loc2_.gameObj.var_113.getCustomerBitmap(_loc14_);
            _loc16_ = new Bitmap(_loc15_);
            _loc16_.x = -8;
            _loc16_.y = -8;
            if (_loc2_.gameObj.var_113.getCustomerName(_loc14_) == "Georgito" || _loc2_.gameObj.var_113.getCustomerName(_loc14_) == "Yippy" || _loc2_.gameObj.var_113.getCustomerName(_loc14_) == "Greg")
            {
              _loc16_.y -= 8;
            }
            _loc10_.icon.gotoAndStop(1);
            _loc10_.icon.holder.addChild(_loc16_);
            _loc10_.icon.holder.mask = _loc10_.icon.masker;
            _loc2_.rescueThumbs.push(_loc16_);
          }
          else if (_loc11_ == Challenge.BURGERZILLAS)
          {
            _loc10_.description_txt.text = "Defeat " + _loc12_ + ":";
            _loc10_.icon.gotoAndStop(2);
          }
          else if (_loc11_ == Challenge.COINS)
          {
            _loc10_.description_txt.text = "Find " + _loc12_ + ":";
            _loc10_.icon.gotoAndStop(3);
          }
          else
          {
            _loc10_.description_txt.text = "Find " + _loc12_ + ":";
            _loc10_.icon.gotoAndStop(4 + this.whichLevel);
          }
          if (_loc13_ == CustomerData.SKILL_NONE || _loc13_ == "")
          {
            _loc10_.skill.stop();
            _loc10_.skill.visible = false;
            _loc10_.needs.visible = false;
          }
          else
          {
            _loc10_.skill.gotoAndStop(_loc13_);
          }
          if (_loc11_ == "")
          {
            _loc10_.visible = false;
            _loc2_.clip.character["icon" + _loc4_].visible = false;
          }
          _loc4_++;
        }
        _loc2_.clip.character.styleA.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterStyle);
        _loc2_.clip.character.styleB.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterStyle);
        _loc2_.clip.character.styleC.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterStyle);
        _loc2_.clip.character.styleA.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterStyle);
        _loc2_.clip.character.styleB.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterStyle);
        _loc2_.clip.character.styleC.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterStyle);
        _loc2_.clip.character.styleA.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterStyle);
        _loc2_.clip.character.styleB.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterStyle);
        _loc2_.clip.character.styleC.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterStyle);
        _loc2_.clip.character.styleA.rolloverclip.visible = false;
        _loc2_.clip.character.styleB.rolloverclip.visible = false;
        _loc2_.clip.character.styleC.rolloverclip.visible = false;
        _loc2_.clip.character.styleA.buttonMode = true;
        _loc2_.clip.character.styleA.useHandCursor = true;
        _loc2_.clip.character.styleB.buttonMode = true;
        _loc2_.clip.character.styleB.useHandCursor = true;
        _loc2_.clip.character.styleC.buttonMode = true;
        _loc2_.clip.character.styleC.useHandCursor = true;
        _loc2_.clip.character.styleB.price_txt.mouseEnabled = false;
        _loc2_.clip.character.styleC.price_txt.mouseEnabled = false;
        _loc2_.selectCharacter(_loc2_.gameObj.var_106.selectedCharacter, _loc2_.gameObj.var_106.selectedStyle);
        _loc5_ = true;
        if (class_3.method_47() && class_1.method_79() == false)
        {
          _loc5_ = false;
        }
        if (_loc5_)
        {
          if (_loc3_.didClickFacebook == false)
          {
            _loc2_.clip.character.bonus_facebook_btn.visible = true;
            _loc2_.clip.character.bonus_twitter_btn.visible = false;
          }
          else if (_loc3_.didClickTwitter == false)
          {
            _loc2_.clip.character.bonus_facebook_btn.visible = false;
            _loc2_.clip.character.bonus_twitter_btn.visible = true;
          }
          else
          {
            _loc2_.clip.character.bonus_facebook_btn.visible = false;
            _loc2_.clip.character.bonus_twitter_btn.visible = false;
          }
        }
        else
        {
          _loc2_.clip.character.bonus_facebook_btn.visible = false;
          _loc2_.clip.character.bonus_twitter_btn.visible = false;
        }
        _loc2_.clip.character.bonus_facebook_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickBonusFacebook);
        _loc2_.clip.character.bonus_twitter_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickBonusTwitter);
        _loc2_.clip.character.totalmoney_txt.text = class_10.method_84(_loc2_.gameObj.var_106.getTotalMoney());
        _loc2_.clip.character.addEventListener(Event.ENTER_FRAME, _loc2_.updateCharacter);
      }
      else
      {
        _loc2_.clip.character.bonus_facebook_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickBonusFacebook);
        _loc2_.clip.character.bonus_twitter_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickBonusTwitter);
        _loc2_.clip.character.removeEventListener(Event.ENTER_FRAME, _loc2_.updateCharacter);
        _loc2_.clip.character.link_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickCustomerPlayGame);
        _loc4_ = 0;
        while (_loc4_ < _loc2_.numCharacters)
        {
          _loc17_ = _loc2_.clip.character["thumb" + _loc4_];
          _loc17_.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterThumb);
          _loc17_.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterThumb);
          _loc17_.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterThumb);
          _loc4_++;
        }
        _loc2_.clip.character.styleA.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterStyle);
        _loc2_.clip.character.styleB.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterStyle);
        _loc2_.clip.character.styleC.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickCharacterStyle);
        _loc2_.clip.character.styleA.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterStyle);
        _loc2_.clip.character.styleB.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterStyle);
        _loc2_.clip.character.styleC.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverCharacterStyle);
        _loc2_.clip.character.styleA.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterStyle);
        _loc2_.clip.character.styleB.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterStyle);
        _loc2_.clip.character.styleC.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutCharacterStyle);
        _loc4_ = 0;
        while (_loc4_ < _loc2_.characterThumbs.length)
        {
          if (_loc2_.characterThumbs[_loc4_] != null)
          {
            _loc2_.characterThumbs[_loc4_].bitmapData.dispose();
            _loc2_.characterThumbs[_loc4_].bitmapData = null;
            _loc2_.characterThumbs[_loc4_].parent.removeChild(_loc2_.characterThumbs[_loc4_]);
            _loc2_.characterThumbs[_loc4_] = null;
          }
          _loc4_++;
        }
        _loc2_.characterThumbs = null;
        if (Boolean(_loc2_.rescueThumbs) && _loc2_.rescueThumbs.length > 0)
        {
          _loc4_ = 0;
          while (_loc4_ < _loc2_.rescueThumbs.length)
          {
            if (_loc2_.rescueThumbs[_loc4_] != null)
            {
              _loc2_.rescueThumbs[_loc4_].bitmapData.dispose();
              _loc2_.rescueThumbs[_loc4_].bitmapData = null;
              _loc2_.rescueThumbs[_loc4_].parent.removeChild(_loc2_.rescueThumbs[_loc4_]);
              _loc2_.rescueThumbs[_loc4_] = null;
            }
            _loc4_++;
          }
          _loc2_.rescueThumbs = null;
        }
        if (_loc2_.characterModel)
        {
          _loc2_.characterModel.parent.removeChild(_loc2_.characterModel);
          _loc2_.cleanupModel(_loc2_.characterModel);
          _loc2_.characterModel = null;
        }
        _loc4_ = 0;
        while (_loc4_ < _loc2_.leavingModels.length)
        {
          _loc2_.leavingModels[_loc4_].parent.removeChild(_loc2_.leavingModels[_loc4_]);
          _loc2_.cleanupModel(_loc2_.leavingModels[_loc4_]);
          _loc2_.leavingModels[_loc4_] = null;
          _loc4_++;
        }
        _loc2_.leavingModels = null;
      }
    }

    public function updateCharacter(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.characterModel != null)
      {
        if (_loc2_.characterModel.x > _loc2_.characterTargetX)
        {
          _loc2_.characterModel.x -= _loc2_.characterSpeed;
          if (_loc2_.characterModel.x <= _loc2_.characterTargetX)
          {
            _loc2_.characterModel.x = _loc2_.characterTargetX;
            _loc2_.characterModel.gotoAndPlay("stand");
            if (_loc2_.gameObj.var_113.getCustomerClipName(_loc2_.selectedCharacterIndex) == "Connor")
            {
              _loc2_.characterModel.gotoAndPlay("standconnor");
            }
          }
        }
      }
      var _loc3_:* = int(_loc2_.leavingModels.length - 1);
      while (_loc3_ >= 0)
      {
        _loc2_.leavingModels[_loc3_].x -= _loc2_.characterSpeed;
        if (_loc2_.leavingModels[_loc3_].x <= _loc2_.characterLeaveX)
        {
          _loc2_.leavingModels[_loc3_].parent.removeChild(_loc2_.leavingModels[_loc3_]);
          _loc2_.cleanupModel(_loc2_.leavingModels[_loc3_]);
          _loc2_.leavingModels[_loc3_] = null;
          _loc2_.leavingModels.splice(_loc3_, 1);
        }
        _loc3_--;
      }
      if (_loc2_.clip.character.iris.currentFrameLabel == "stopirisout")
      {
        if (_loc2_.isClosing)
        {
          _loc2_.isClosing = false;
          _loc2_.closeMainMenuScreen();
        }
      }
    }

    public function selectCharacter(param1:Number, param2:Number = 1):void
    {
      var _loc4_:int = 0;
      var _loc5_:CustomerDataFile = null;
      var _loc3_:MainMenuScreen = this;
      if (!_loc3_.isClosing)
      {
        _loc3_.lastCharacterIndex = _loc3_.selectedCharacterIndex;
        _loc3_.selectedCharacterIndex = param1;
        _loc3_.selectedStyle = param2;
        _loc4_ = 0;
        while (_loc4_ < _loc3_.numCharacters)
        {
          if (_loc4_ == param1)
          {
            _loc3_.clip.character["thumb" + _loc4_].hilite.visible = true;
          }
          else
          {
            _loc3_.clip.character["thumb" + _loc4_].hilite.visible = false;
          }
          _loc4_++;
        }
        _loc5_ = _loc3_.gameObj.var_113.getCustomerData(param1);
        _loc3_.clip.character.name_txt.text = _loc5_.customerName;
        _loc3_.clip.character.firstgame_txt.text = _loc5_.customerFirstGame;
        _loc3_.clip.character.weaponname_txt.text = _loc5_.weaponName;
        if (_loc5_.weaponName == "Pizza Paddle" && param2 == 3)
        {
          _loc3_.clip.character.weaponname_txt.text = "Beach Umbrella";
        }
        _loc3_.clip.character.skillicon.gotoAndStop(_loc5_.skillType);
        if (_loc5_.skillType == CustomerData.SKILL_CRAWL)
        {
          _loc3_.clip.character.skillname_txt.text = "Crawl";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_DOUBLEJUMP)
        {
          _loc3_.clip.character.skillname_txt.text = "Jump";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_WALLJUMP)
        {
          _loc3_.clip.character.skillname_txt.text = "Wall";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_GLIDE)
        {
          _loc3_.clip.character.skillname_txt.text = "Glide";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_POUND)
        {
          _loc3_.clip.character.skillname_txt.text = "Pound";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_PUSH)
        {
          _loc3_.clip.character.skillname_txt.text = "Push";
        }
        else
        {
          _loc3_.clip.character.skillname_txt.text = "None";
        }
        if (_loc3_.lastCharacterName == _loc5_.customerName)
        {
          _loc3_.buildModel(true);
        }
        else
        {
          _loc3_.buildModel();
        }
        _loc3_.lastCharacterName = _loc5_.customerName;
        _loc3_.gameObj.var_106.selectedCharacter = _loc3_.selectedCharacterIndex;
        _loc3_.gameObj.var_106.selectedStyle = _loc3_.selectedStyle;
        _loc3_.updateStyleButtons();
        if (_loc3_.shouldShowGameLinks)
        {
          _loc3_.clip.character.link_btn.visible = true;
          _loc3_.clip.character.underline.visible = true;
          if (_loc5_.customerFirstGame == "Papa Louie")
          {
            _loc3_.useWhichLink = _loc3_.papalouieLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Pizzeria")
          {
            _loc3_.useWhichLink = _loc3_.pizzeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Burgeria")
          {
            _loc3_.useWhichLink = _loc3_.burgeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Taco Mia!")
          {
            _loc3_.useWhichLink = _loc3_.tacomiaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Freezeria")
          {
            _loc3_.useWhichLink = _loc3_.freezeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Pancakeria")
          {
            _loc3_.useWhichLink = _loc3_.pancakeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Wingeria")
          {
            _loc3_.useWhichLink = _loc3_.wingeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Hot Doggeria")
          {
            _loc3_.useWhichLink = _loc3_.hotdoggeriaLink;
          }
          else
          {
            _loc3_.useWhichLink = "";
            _loc3_.clip.character.link_btn.visible = false;
            _loc3_.clip.character.underline.visible = false;
          }
          _loc3_.clip.character.underline.width = _loc3_.clip.character.firstgame_txt.textWidth;
        }
        else
        {
          _loc3_.clip.character.link_btn.visible = false;
          _loc3_.clip.character.underline.visible = false;
        }
      }
    }

    public function updateStyleButtons():void
    {
      var _loc1_:MainMenuScreen = this;
      var _loc2_:UserData = _loc1_.gameObj.var_106;
      if (_loc1_.selectedStyle == 1)
      {
        _loc1_.clip.character.styleA.gotoAndStop(1);
      }
      else
      {
        _loc1_.clip.character.styleA.gotoAndStop(2);
      }
      if (_loc1_.selectedStyle == 2)
      {
        _loc1_.clip.character.styleB.gotoAndStop(1);
        _loc1_.clip.character.styleB.price_txt.text = "";
      }
      else if (_loc2_.hasOutfitUnlocked(_loc1_.selectedCharacterIndex, 1))
      {
        _loc1_.clip.character.styleB.gotoAndStop(2);
        _loc1_.clip.character.styleB.price_txt.text = "";
      }
      else if (_loc2_.getTotalMoney() >= _loc1_.gameObj.var_109.getOutfitPrice(_loc1_.selectedCharacterIndex, 1))
      {
        _loc1_.clip.character.styleB.gotoAndStop(3);
        _loc1_.clip.character.styleB.price_txt.text = _loc1_.gameObj.var_109.getOutfitPrice(_loc1_.selectedCharacterIndex, 1);
      }
      else
      {
        _loc1_.clip.character.styleB.gotoAndStop(4);
        _loc1_.clip.character.styleB.price_txt.text = "";
      }
      if (_loc1_.selectedStyle == 3)
      {
        _loc1_.clip.character.styleC.gotoAndStop(1);
        _loc1_.clip.character.styleC.price_txt.text = "";
      }
      else if (_loc2_.hasOutfitUnlocked(_loc1_.selectedCharacterIndex, 2))
      {
        _loc1_.clip.character.styleC.gotoAndStop(2);
        _loc1_.clip.character.styleC.price_txt.text = "";
      }
      else if (_loc2_.getTotalMoney() >= _loc1_.gameObj.var_109.getOutfitPrice(_loc1_.selectedCharacterIndex, 2))
      {
        _loc1_.clip.character.styleC.gotoAndStop(3);
        _loc1_.clip.character.styleC.price_txt.text = _loc1_.gameObj.var_109.getOutfitPrice(_loc1_.selectedCharacterIndex, 2);
      }
      else
      {
        _loc1_.clip.character.styleC.gotoAndStop(4);
        _loc1_.clip.character.styleC.price_txt.text = "";
      }
    }

    public function rolloverCharacterStyle(param1:MouseEvent):void
    {
      MovieClip(param1.currentTarget).rolloverclip.visible = true;
    }

    public function rolloutCharacterStyle(param1:MouseEvent):void
    {
      MovieClip(param1.currentTarget).rolloverclip.visible = false;
    }

    public function clickCharacterStyle(param1:MouseEvent):void
    {
      var _loc4_:String = null;
      var _loc5_:Number = NaN;
      var _loc6_:Boolean = false;
      var _loc7_:Boolean = false;
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      if (!_loc2_.isClosing)
      {
        _loc4_ = String(MovieClip(param1.currentTarget).name).split("style")[1];
        _loc5_ = 1;
        if (_loc4_ == "A")
        {
          _loc5_ = 1;
        }
        else if (_loc4_ == "B")
        {
          _loc5_ = 2;
        }
        else if (_loc4_ == "C")
        {
          _loc5_ = 3;
        }
        _loc6_ = false;
        _loc7_ = false;
        if (!_loc3_.hasOutfitUnlocked(_loc2_.selectedCharacterIndex, _loc5_ - 1))
        {
          _loc6_ = _loc3_.purchaseOutfit(_loc2_.selectedCharacterIndex, _loc5_ - 1);
          if (_loc6_)
          {
            _loc7_ = true;
            _loc2_.gameObj.method_103(false);
          }
        }
        else
        {
          _loc7_ = true;
        }
        if (_loc7_)
        {
          _loc2_.selectedStyle = _loc5_;
          _loc2_.buildModel(true);
          _loc2_.gameObj.var_106.selectedCharacter = _loc2_.selectedCharacterIndex;
          _loc2_.gameObj.var_106.selectedStyle = _loc2_.selectedStyle;
          if (_loc2_.gameObj.var_113.getCustomerName(_loc2_.selectedCharacterIndex) == "Papa Louie")
          {
            if (_loc2_.selectedStyle == 3)
            {
              _loc2_.clip.character.weaponname_txt.text = "Beach Umbrella";
            }
            else
            {
              _loc2_.clip.character.weaponname_txt.text = "Pizza Paddle";
            }
          }
          if (_loc6_)
          {
            _loc2_.gameObj.var_105.playSound("getstar.wav");
            _loc2_.clip.character.starburst.gotoAndPlay(2);
            _loc2_.clip.character.totalmoney_txt.text = class_10.method_84(_loc3_.getTotalMoney());
          }
          _loc2_.updateStyleButtons();
        }
      }
    }

    public function clickCharacterThumb(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = Number(String(MovieClip(param1.currentTarget).name).split("thumb")[1]);
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      _loc2_.gameObj.method_94("character", false);
      _loc2_.selectCharacter(_loc3_, _loc2_.gameObj.var_106.getBestOutfit(_loc3_));
    }

    public function rolloverCharacterThumb(param1:MouseEvent):void
    {
      param1.currentTarget.roll.visible = true;
    }

    public function rolloutCharacterThumb(param1:MouseEvent):void
    {
      param1.currentTarget.roll.visible = false;
    }

    public function clickCustomerPlayGame(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.useWhichLink != "")
      {
        // _loc2_.gameObj.var_107.api.method_83(_loc2_.useWhichLink,"CustomerGameLink","Links");
      }
    }

    private function buildModel(param1:Boolean = false):void
    {
      var _loc34_:String = null;
      var _loc35_:Class = null;
      var _loc36_:Class = null;
      var _loc37_:MovieClip = null;
      var _loc38_:MovieClip = null;
      var _loc39_:MovieClip = null;
      var _loc40_:MovieClip = null;
      var _loc41_:Class = null;
      var _loc42_:MovieClip = null;
      var _loc43_:MovieClip = null;
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Boolean = false;
      if (_loc2_.characterModel == null)
      {
        _loc3_ = true;
      }
      if (param1 == false && _loc2_.characterModel != null)
      {
        _loc2_.characterModel.gotoAndPlay("run");
        if (_loc2_.gameObj.var_113.getCustomerClipName(_loc2_.lastCharacterIndex) == "Connor")
        {
          _loc2_.characterModel.gotoAndPlay("runconnor");
        }
        _loc2_.leavingModels.push(_loc2_.characterModel);
        _loc2_.characterModel = null;
      }
      if (param1 == false)
      {
        _loc34_ = _loc2_.gameObj.var_113.getCustomerType(_loc2_.selectedCharacterIndex);
        if (_loc34_ == CustomerData.WEAPON_SWING1)
        {
          _loc2_.characterModel = new customerOneSwingMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_SWING2)
        {
          _loc2_.characterModel = new customerTwoSwingMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_SCOOTER)
        {
          _loc2_.characterModel = new customerScooterMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_KAHUNA)
        {
          _loc2_.characterModel = new customerKahunaMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_WHIP)
        {
          _loc2_.characterModel = new customerWhipMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_MELEE)
        {
          _loc2_.characterModel = new customerMeleeMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_TOSS)
        {
          _loc2_.characterModel = new customerTossMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_LONGGUN)
        {
          _loc2_.characterModel = new customerLongGunMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_PISTOL)
        {
          _loc2_.characterModel = new customerPistolMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_BAZOOKA)
        {
          _loc2_.characterModel = new customerBazookaMC();
        }
        else
        {
          _loc2_.characterModel = new customerOneSwingMC();
        }
        _loc2_.characterModel.scaleX = 0.57;
        _loc2_.characterModel.scaleY = 0.57;
        _loc2_.clip.character.charholder.addChild(_loc2_.characterModel);
        _loc2_.characterModel.x = _loc2_.characterStartX;
        _loc2_.characterModel.y = _loc2_.characterTargetY;
        if (_loc3_)
        {
          _loc2_.characterModel.x = _loc2_.characterTargetX;
        }
      }
      else
      {
        _loc2_.cleanupModel(_loc2_.characterModel);
      }
      var _loc4_:String = _loc2_.gameObj.var_113.getCustomerClipName(_loc2_.selectedCharacterIndex);
      class_9.method_119(_loc2_.characterModel, "CharacterModel_" + _loc4_ + "_" + getTimer());
      if (_loc2_.selectedStyle == 2)
      {
        _loc4_ += "2";
      }
      else if (_loc2_.selectedStyle == 3)
      {
        _loc4_ += "3";
      }
      var _loc5_:Class = getDefinitionByName("customer_" + _loc4_ + "_body") as Class;
      var _loc6_:MovieClip = new _loc5_();
      _loc6_.name = "clip";
      this.characterModel.body.addChild(_loc6_);
      var _loc7_:Class = getDefinitionByName("customer_" + _loc4_ + "_head") as Class;
      var _loc8_:MovieClip = new _loc7_();
      _loc8_.name = "clip";
      this.characterModel.head.addChild(_loc8_);
      var _loc9_:Class = getDefinitionByName("customer_" + _loc4_ + "_eyes") as Class;
      var _loc10_:MovieClip = new _loc9_();
      _loc10_.name = "clip";
      this.characterModel.eyes.addChild(_loc10_);
      var _loc11_:Class = getDefinitionByName("customer_" + _loc4_ + "_mouth") as Class;
      var _loc12_:MovieClip = new _loc11_();
      _loc12_.name = "clip";
      this.characterModel.mouth.addChild(_loc12_);
      var _loc13_:Class = getDefinitionByName("customer_" + _loc4_ + "_neck") as Class;
      var _loc14_:MovieClip = new _loc13_();
      _loc14_.name = "clip";
      this.characterModel.neck.addChild(_loc14_);
      var _loc15_:MovieClip = null;
      try
      {
        _loc35_ = getDefinitionByName("customer_" + _loc4_ + "_hair") as Class;
        _loc15_ = new _loc35_();
        _loc15_.name = "clip";
        this.characterModel.hair.addChild(_loc15_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc36_ = getDefinitionByName("customer_" + _loc4_ + "_back_hair") as Class;
        _loc37_ = new _loc36_();
        _loc37_.name = "clip";
        this.characterModel.back_hair.addChild(_loc37_);
      }
      catch (err:Error)
      {
      }
      var _loc16_:Class = getDefinitionByName("customer_" + _loc4_ + "_foot") as Class;
      var _loc17_:MovieClip = new _loc16_();
      _loc17_.name = "clip";
      this.characterModel.front_shoe.addChild(_loc17_);
      var _loc18_:MovieClip = new _loc16_();
      _loc18_.name = "clip";
      this.characterModel.back_shoe.addChild(_loc18_);
      var _loc19_:String = "customer_" + _loc4_ + "_hand";
      var _loc20_:Class = getDefinitionByName(_loc19_) as Class;
      var _loc21_:MovieClip = new _loc20_();
      _loc21_.name = "clip";
      this.characterModel.fronthand.addChild(_loc21_);
      var _loc22_:Class = getDefinitionByName("customer_" + _loc4_ + "_hand2") as Class;
      var _loc23_:MovieClip = new _loc22_();
      _loc23_.name = "clip";
      this.characterModel.backhand.addChild(_loc23_);
      var _loc24_:Class = getDefinitionByName("customer_" + _loc4_ + "_upperarm") as Class;
      var _loc25_:MovieClip = new _loc24_();
      _loc25_.name = "clip";
      this.characterModel.front_upperarm.addChild(_loc25_);
      var _loc26_:MovieClip = new _loc24_();
      _loc26_.name = "clip";
      this.characterModel.back_upperarm.addChild(_loc26_);
      var _loc27_:Class = getDefinitionByName("customer_" + _loc4_ + "_forearm") as Class;
      var _loc28_:MovieClip = new _loc27_();
      _loc28_.name = "clip";
      this.characterModel.front_forearm.addChild(_loc28_);
      var _loc29_:MovieClip = new _loc27_();
      _loc29_.name = "clip";
      this.characterModel.back_forearm.addChild(_loc29_);
      try
      {
        _loc38_ = new _loc27_();
        _loc38_.name = "clip";
        this.characterModel.cross_backforearm.addChild(_loc38_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc39_ = new _loc22_();
        _loc39_.name = "clip";
        this.characterModel.cross_back_hand.addChild(_loc39_);
      }
      catch (err:Error)
      {
      }
      var _loc30_:String = _loc2_.gameObj.var_113.getWeaponClipName(this.selectedCharacterIndex, this.selectedStyle);
      var _loc31_:Class = getDefinitionByName("weapon_" + _loc30_) as Class;
      var _loc32_:MovieClip = new _loc31_();
      _loc32_.name = "clip";
      this.characterModel.weapon.addChild(_loc32_);
      try
      {
        _loc40_ = new _loc31_();
        _loc40_.name = "clip";
        this.characterModel.cross_back_weap.addChild(_loc40_);
      }
      catch (err:Error)
      {
      }
      var _loc33_:String = _loc2_.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex);
      if (_loc33_ == "Boomer")
      {
        _loc41_ = getDefinitionByName("glider_" + _loc33_) as Class;
        _loc42_ = new _loc41_();
        _loc42_.name = "clip";
        this.characterModel.glider.addChild(_loc42_);
      }
      else
      {
        _loc43_ = new MovieClip();
        _loc43_.name = "clip";
        this.characterModel.glider.addChild(_loc43_);
      }
      if (!_loc3_ && !param1)
      {
        this.characterModel.gotoAndStop(1);
        this.characterModel.gotoAndPlay("run");
        if (_loc2_.gameObj.var_113.getCustomerClipName(_loc2_.selectedCharacterIndex) == "Connor")
        {
          this.characterModel.gotoAndPlay("runconnor");
        }
      }
      else if (_loc3_)
      {
        this.characterModel.gotoAndStop(1);
        this.characterModel.gotoAndPlay("stand");
        if (_loc2_.gameObj.var_113.getCustomerClipName(_loc2_.selectedCharacterIndex) == "Connor")
        {
          this.characterModel.gotoAndPlay("standconnor");
        }
      }
      else if (param1)
      {
        if (this.characterModel.x != _loc2_.characterTargetX)
        {
          this.characterModel.gotoAndStop(1);
          this.characterModel.gotoAndPlay("run");
          if (_loc2_.gameObj.var_113.getCustomerClipName(_loc2_.selectedCharacterIndex) == "Connor")
          {
            this.characterModel.gotoAndPlay("runconnor");
          }
        }
        else
        {
          this.characterModel.gotoAndStop(1);
          this.characterModel.gotoAndPlay("stand");
          if (_loc2_.gameObj.var_113.getCustomerClipName(_loc2_.selectedCharacterIndex) == "Connor")
          {
            this.characterModel.gotoAndPlay("standconnor");
          }
        }
      }
      _loc2_.characterModel.mouseEnabled = false;
      _loc2_.characterModel.mouseChildren = false;
    }

    private function cleanupModel(param1:MovieClip):void
    {
      var whichModel:MovieClip = param1;
      var ob:MainMenuScreen = this;
      whichModel.gotoAndStop(1);
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
        whichModel.weapon.removeChildAt(0);
      }
      catch (err:Error)
      {
        class_7.error("Error removing parts of customer");
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
        whichModel.glider.removeChildAt(0);
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
      whichModel = null;
    }

    public function setupInfo(param1:Boolean = true):void
    {
      var _loc6_:int = 0;
      var _loc7_:Number = NaN;
      var _loc8_:CustomerDataFile = null;
      var _loc9_:Number = NaN;
      var _loc10_:MovieClip = null;
      var _loc11_:String = null;
      var _loc12_:String = null;
      var _loc13_:String = null;
      var _loc14_:Number = NaN;
      var _loc15_:BitmapData = null;
      var _loc16_:Bitmap = null;
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      var _loc4_:DataManager = _loc2_.gameObj.var_109;
      if (param1 && _loc4_.currentWorldData != null)
      {
        _loc2_.rescueThumbs = new Vector.<Bitmap>();
        _loc7_ = _loc4_.currentLevel;
        _loc2_.clip.info.title_txt.text = _loc2_.gameObj.var_109.getWorldTitle(_loc7_);
        _loc2_.clip.info.levelnum_txt.text = String(_loc7_ + 1);
        if (_loc7_ == 9)
        {
          _loc2_.clip.info.levelnum_txt.text = "X";
        }
        _loc2_.clip.info.score_txt.text = class_10.method_84(_loc3_.getLevelHighScore(_loc7_));
        _loc8_ = _loc2_.gameObj.var_113.getCustomerData(_loc3_.selectedCharacter);
        _loc2_.clip.info.currentstyle.gotoAndStop(_loc3_.selectedStyle);
        _loc2_.clip.info.name_txt.text = _loc8_.customerName;
        _loc2_.clip.info.weaponname_txt.text = _loc8_.weaponName;
        if (_loc8_.weaponName == "Pizza Paddle" && _loc3_.selectedStyle == 3)
        {
          _loc2_.clip.info.weaponname_txt.text = "Beach Umbrella";
        }
        _loc2_.clip.info.skillicon.gotoAndStop(_loc8_.skillType);
        if (_loc8_.skillType == CustomerData.SKILL_CRAWL)
        {
          _loc2_.clip.info.skillname_txt.text = "Crawl";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_DOUBLEJUMP)
        {
          _loc2_.clip.info.skillname_txt.text = "Jump";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_WALLJUMP)
        {
          _loc2_.clip.info.skillname_txt.text = "Wall";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_GLIDE)
        {
          _loc2_.clip.info.skillname_txt.text = "Glide";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_POUND)
        {
          _loc2_.clip.info.skillname_txt.text = "Pound";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_PUSH)
        {
          _loc2_.clip.info.skillname_txt.text = "Push";
        }
        else
        {
          _loc2_.clip.info.skillname_txt.text = "None";
        }
        class_7.method_1("Setup Challenges for level: " + _loc7_);
        _loc6_ = 1;
        while (_loc6_ <= 6)
        {
          if (_loc3_.hasCompletedChallenge(_loc7_, _loc6_))
          {
            _loc2_.clip.info["icon" + _loc6_].gotoAndStop(2);
          }
          else
          {
            _loc2_.clip.info["icon" + _loc6_].gotoAndStop(1);
          }
          _loc2_.clip.info["icon" + _loc6_].num_txt.text = String(_loc6_);
          _loc10_ = _loc2_.clip.info["panel" + _loc6_];
          _loc11_ = _loc2_.gameObj.var_112.getChallengeType(_loc7_, _loc6_);
          _loc12_ = _loc2_.gameObj.var_112.getChallengeTargetAmount(_loc7_, _loc6_);
          _loc13_ = _loc2_.gameObj.var_112.getChallengeSkillNeeded(_loc7_, _loc6_);
          if (_loc11_ == Challenge.RESCUE)
          {
            _loc10_.description_txt.text = "Rescue:";
            _loc14_ = _loc2_.gameObj.var_113.getTrappedCustomerIndex(_loc7_, _loc6_);
            _loc15_ = _loc2_.gameObj.var_113.getCustomerBitmap(_loc14_);
            _loc16_ = new Bitmap(_loc15_);
            _loc16_.x = -8;
            _loc16_.y = -8;
            if (_loc2_.gameObj.var_113.getCustomerName(_loc14_) == "Georgito" || _loc2_.gameObj.var_113.getCustomerName(_loc14_) == "Yippy" || _loc2_.gameObj.var_113.getCustomerName(_loc14_) == "Greg")
            {
              _loc16_.y -= 8;
            }
            _loc10_.icon.gotoAndStop(1);
            _loc10_.icon.holder.addChild(_loc16_);
            _loc10_.icon.holder.mask = _loc10_.icon.masker;
            _loc2_.rescueThumbs.push(_loc16_);
          }
          else if (_loc11_ == Challenge.BURGERZILLAS)
          {
            _loc10_.description_txt.text = _loc2_.gameObj.var_112.getChallengeTallyString(_loc7_, _loc6_);
            _loc10_.icon.gotoAndStop(2);
          }
          else if (_loc11_ == Challenge.COINS)
          {
            _loc10_.description_txt.text = _loc2_.gameObj.var_112.getChallengeTallyString(_loc7_, _loc6_);
            _loc10_.icon.gotoAndStop(3);
          }
          else
          {
            _loc10_.description_txt.text = _loc2_.gameObj.var_112.getChallengeTallyString(_loc7_, _loc6_);
            _loc10_.icon.gotoAndStop(4 + _loc7_);
          }
          if (_loc13_ == CustomerData.SKILL_NONE || _loc13_ == "")
          {
            _loc10_.skill.stop();
            _loc10_.skill.visible = false;
            _loc10_.needs.visible = false;
          }
          else
          {
            _loc10_.skill.gotoAndStop(_loc13_);
          }
          if (_loc11_ == "")
          {
            _loc10_.visible = false;
            _loc2_.clip.info["icon" + _loc6_].visible = false;
          }
          _loc6_++;
        }
        _loc2_.clip.info.points_txt.text = class_10.method_84(_loc3_.getCurrentPoints());
        _loc9_ = 0;
        if (_loc2_.gameObj.var_108)
        {
          _loc9_ = _loc2_.gameObj.var_108.gameplayTimer;
        }
        _loc2_.clip.info.time_txt.text = class_10.method_109(_loc9_, true);
        _loc2_.clip.info.coins_txt.text = class_10.method_84(_loc3_.getCurrentMoney());
        _loc2_.clip.info.totalpoints_txt.text = class_10.method_84(_loc3_.getTotalScore());
        _loc2_.clip.info.totaltime_txt.text = class_10.method_109(_loc3_.totalTimePlayed.value, true, true);
        _loc2_.clip.info.totalcoins_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        _loc2_.clip.info.totalwarpcoins_txt.text = _loc3_.getWarpCoins() + "/50";
        _loc2_.clip.info.totalcustomers_txt.text = _loc3_.getTotalCustomersUnlocked() + "/28";
        _loc2_.infoModel = _loc2_.buildInfoModel(_loc3_.selectedCharacter, _loc3_.selectedStyle);
        _loc2_.clip.info.addChild(_loc2_.infoModel);
        _loc2_.infoModel.x = 555;
        _loc2_.infoModel.y = 80;
        _loc2_.infoModel.mouseEnabled = false;
        _loc2_.infoModel.mouseChildren = false;
        class_9.method_119(_loc2_.infoModel, "InfoModel" + getTimer());
      }
      else if (param1)
      {
        class_7.method_1("No area screen.");
      }
      else if (!param1)
      {
        if (Boolean(_loc2_.rescueThumbs) && _loc2_.rescueThumbs.length > 0)
        {
          _loc6_ = 0;
          while (_loc6_ < _loc2_.rescueThumbs.length)
          {
            if (_loc2_.rescueThumbs[_loc6_] != null)
            {
              _loc2_.rescueThumbs[_loc6_].bitmapData.dispose();
              _loc2_.rescueThumbs[_loc6_].bitmapData = null;
              _loc2_.rescueThumbs[_loc6_].parent.removeChild(_loc2_.rescueThumbs[_loc6_]);
              _loc2_.rescueThumbs[_loc6_] = null;
            }
            _loc6_++;
          }
          _loc2_.rescueThumbs = null;
        }
        if (_loc2_.infoModel != null)
        {
          _loc2_.clip.info.removeChild(_loc2_.infoModel);
          _loc2_.cleanupInfoModel(_loc2_.infoModel);
          _loc2_.infoModel = null;
        }
      }
    }

    public function setupMapUpsell(param1:Boolean = true):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:MovieClip = _loc2_.clip.map.upsellMC;
      if (param1)
      {
        _loc3_.appstore_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellAppstore);
        _loc3_.amazon_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellAmazon);
        _loc3_.googleplay_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellGooglePlay);
        _loc3_.kindle_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellKindle);
        _loc3_.moreinfo_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellMoreInfo);
        _loc3_.thumb.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellImage);
        _loc3_.thumb.buttonMode = true;
        _loc3_.thumb.useHandCursor = true;
        _loc2_.useWhichUpsell = Math.ceil(Math.random() * 2);
        _loc3_.thumb.gotoAndStop(_loc2_.useWhichUpsell);
        if (_loc2_.useWhichUpsell == 1)
        {
          _loc3_.appstore_btn.visible = true;
          _loc3_.amazon_btn.visible = false;
          _loc3_.googleplay_btn.visible = false;
          _loc3_.kindle_btn.visible = true;
        }
        else if (_loc2_.useWhichUpsell == 2)
        {
          _loc3_.appstore_btn.visible = true;
          _loc3_.amazon_btn.visible = false;
          _loc3_.googleplay_btn.visible = true;
          _loc3_.kindle_btn.visible = false;
        }
        if (class_3.method_47() && class_1.method_66() == false)
        {
          _loc3_.visible = false;
        }
      }
      else
      {
        _loc3_.appstore_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellAppstore);
        _loc3_.amazon_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellAmazon);
        _loc3_.googleplay_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellGooglePlay);
        _loc3_.kindle_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellKindle);
        _loc3_.moreinfo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellMoreInfo);
        _loc3_.thumb.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickUpsellImage);
      }
    }

    public function clickUpsellAppstore(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8","iPadPromoAd","Links");
      }
      else if (_loc2_.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("https://itunes.apple.com/us/app/papas-burgeria-to-go!/id600626116?ls=1&mt=8","iOSPromoToGo","Links");
      }
    }

    public function clickUpsellGooglePlay(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://play.google.com/store/apps/details?id=air.com.flipline.papasburgeria","GooglePromoAd","Links");
      }
      else if (_loc2_.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("https://play.google.com/store/apps/details?id=air.com.flipline.papasburgeriatogo","GooglePromoToGo","Links");
      }
    }

    public function clickUpsellAmazon(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00AI13AFS/ref=mas_pm_Papas_Burgeria","AmazonPromoAd","Links");
      }
      else if (_loc2_.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00BI3PT7W/ref=mas_pm_Papas_Burgeria_To_Go","AmazonPromoToGo","Links");
      }
    }

    public function clickUpsellKindle(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00AI13AFS/ref=mas_pm_Papas_Burgeria","KindlePromoAd","Links");
      }
      else if (_loc2_.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00BI3PT7W/ref=mas_pm_Papas_Burgeria_To_Go","KindlePromoToGo","Links");
      }
    }

    public function clickUpsellMoreInfo(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.papasburgeria.com/hd","PromoMoreInfoHD","Links");
      }
      else if (_loc2_.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.papasburgeria.com/togo","PromoMoreInfoToGo","Links");
      }
    }

    public function clickUpsellImage(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8","iPadPromoAd","Links");
      }
      else if (_loc2_.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("https://itunes.apple.com/us/app/papas-burgeria-to-go!/id600626116?ls=1&mt=8","iOSPromoToGo","Links");
      }
    }

    public function setupMap(param1:Boolean = true):void
    {
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:Number = NaN;
      var _loc8_:String = null;
      var _loc9_:MovieClip = null;
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      var _loc4_:DataManager = _loc2_.gameObj.var_109;
      if (param1)
      {
        _loc2_.gameObj.var_106.unlockNextLevel();
        _loc2_.setupMapUpsell(true);
        _loc2_.clip.map.score_txt.text = class_10.method_84(_loc3_.getTotalScore()) + " PTS";
        _loc2_.clip.map.coins_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        _loc2_.clip.map.warpcoins_txt.text = _loc3_.getWarpCoins();
        _loc2_.clip.map.rollover_bubble.visible = false;
        _loc2_.clip.map.rollover_bubble.mouseEnabled = false;
        _loc2_.clip.map.rollover_bubble.mouseChildren = false;
        _loc7_ = -1;
        _loc5_ = 0;
        while (_loc5_ < 10)
        {
          _loc9_ = _loc2_.clip.map["world" + (_loc5_ + 1)];
          if (_loc3_.areasUnlocked[_loc5_] == 1 && (_loc5_ == 0 || _loc3_.getLevelHighScore(_loc5_ - 1) > 0))
          {
            _loc7_ = _loc5_;
            _loc9_.visible = true;
            _loc9_.num_txt.text = String(_loc5_ + 1);
            if (_loc5_ == 9)
            {
              _loc9_.num_txt.text = "X";
            }
            _loc9_.num_txt.mouseEnabled = false;
            _loc9_.num_txt.tabEnabled = false;
            _loc9_.btn.addEventListener(MouseEvent.CLICK, _loc2_.clickPlayMap);
            _loc9_.btn.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverMapButton);
            _loc9_.btn.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutMapButton);
            _loc9_.btn.tabEnabled = false;
            _loc9_.newring.visible = false;
            _loc9_.newring.mouseEnabled = false;
            _loc9_.newring.mouseChildren = false;
            if (_loc3_.getLevelHighScore(_loc5_) == 0)
            {
              _loc9_.newring.visible = true;
            }
            _loc9_.ribbon.mouseEnabled = false;
            _loc9_.ribbon.mouseChildren = false;
            if (_loc2_.gameObj.var_109.checkpointData != null && _loc2_.gameObj.var_109.checkpointData.whichLevel == _loc5_)
            {
              _loc9_.ribbon.visible = true;
            }
            else
            {
              _loc9_.ribbon.visible = false;
            }
          }
          else
          {
            _loc9_.visible = false;
          }
          _loc5_++;
        }
        _loc8_ = String(Number(_loc7_ + 1));
        if (_loc7_ == 8 && _loc3_.getLevelHighScore(8) > 0)
        {
          if (_loc3_.getWarpCoins() == 50)
          {
            _loc8_ = "10";
          }
          else
          {
            _loc8_ = "beat";
          }
        }
        if (_loc2_.gameObj.var_106.lastAreaRevealed == _loc7_)
        {
          _loc2_.clip.map.gotoAndStop("ready" + _loc8_);
          _loc2_.willRevealMap = false;
        }
        else
        {
          _loc2_.clip.map.gotoAndPlay("unlock" + _loc8_);
          _loc2_.willRevealMap = true;
        }
        _loc2_.mapLastUnlocked = _loc7_;
      }
      else
      {
        _loc2_.setupMapUpsell(false);
        _loc5_ = 1;
        while (_loc5_ <= 10)
        {
          if (_loc2_.clip.map["world" + _loc5_].btn.hasEventListener(MouseEvent.CLICK))
          {
            _loc2_.clip.map["world" + _loc5_].btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickPlayMap);
          }
          if (_loc2_.clip.map["world" + _loc5_].btn.hasEventListener(MouseEvent.ROLL_OVER))
          {
            _loc2_.clip.map["world" + _loc5_].btn.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverMapButton);
          }
          if (_loc2_.clip.map["world" + _loc5_].btn.hasEventListener(MouseEvent.ROLL_OUT))
          {
            _loc2_.clip.map["world" + _loc5_].btn.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutMapButton);
          }
          _loc5_++;
        }
      }
    }

    public function rolloverMapButton(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = Number(String(param1.currentTarget.parent.name).split("world")[1] - 1);
      var _loc4_:int = 1;
      while (_loc4_ <= 6)
      {
        if (_loc2_.gameObj.var_106.hasCompletedChallenge(_loc3_, _loc4_))
        {
          _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].gotoAndStop(2);
        }
        else
        {
          _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].gotoAndStop(1);
        }
        _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].visible = true;
        _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].num_txt.text = String(_loc4_);
        if (_loc3_ == 8)
        {
          if (_loc4_ == 1)
          {
            _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].x = 13;
          }
          else
          {
            _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].visible = false;
          }
        }
        else if (_loc3_ == 9)
        {
          _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].visible = false;
        }
        else if (_loc4_ == 1)
        {
          _loc2_.clip.map.rollover_bubble.inside["chal" + _loc4_].x = -22.75;
        }
        _loc4_++;
      }
      _loc2_.clip.map.rollover_bubble.visible = true;
      _loc2_.clip.map.rollover_bubble.gotoAndPlay(1);
      _loc2_.clip.map.rollover_bubble.x = param1.currentTarget.parent.x;
      _loc2_.clip.map.rollover_bubble.y = param1.currentTarget.parent.y;
    }

    public function rolloutMapButton(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.clip.map.rollover_bubble.visible = false;
    }

    public function clickPlayMap(param1:MouseEvent):void
    {
      var _loc3_:Number = NaN;
      var _loc2_:MainMenuScreen = this;
      var _loc4_:Number = -1;
      _loc3_ = 1;
      while (_loc3_ <= 10)
      {
        if (param1.currentTarget == _loc2_.clip.map["world" + _loc3_].btn)
        {
          _loc4_ = _loc3_ - 1;
          break;
        }
        _loc3_++;
      }
      if (_loc4_ > -1)
      {
        _loc2_.whichLevel = _loc4_;
        _loc2_.gameObj.var_106.hasRevealedLatestArea = true;
        if (_loc2_.mapLastUnlocked > _loc2_.gameObj.var_106.lastAreaRevealed)
        {
          _loc2_.gameObj.var_106.lastAreaRevealed = _loc2_.mapLastUnlocked;
        }
        _loc2_.gameObj.var_105.playSound("buttonclick.wav");
        _loc2_.gameObj.method_94("nowarpkeys", false);
        _loc2_.isOpeningMapDetail = true;
        _loc2_.gameObj.var_107.api.method_85("MapSelectMenu", {
              "section": "character",
              "useLevel": _loc2_.whichLevel,
              "isCharSelect": true
            });
        _loc2_.gameObj.var_107.api.method_86("MainMenu");
      }
    }

    public function clickStartLevel(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.isStartingLevel = true;
      _loc2_.gameObj.method_94("challenges", false);
      _loc2_.gameObj.method_103(false);
      _loc2_.gameObj.var_106.customersUsed[this.selectedCharacterIndex] = 1;
      _loc2_.isClosing = true;
      _loc2_.gameObj.var_107.api.method_105();
      _loc2_.clip.character.iris.gotoAndPlay("irisout");
    }

    public function setupCredits(param1:Boolean = true):void
    {
      var _loc2_:MainMenuScreen = this;
      if (param1)
      {
        _loc2_.clip.credits.flipline1_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickCreditsFlipline);
        _loc2_.clip.credits.flipline2_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickCreditsFlipline);
        _loc2_.clip.credits.links.flipline3_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickCreditsFlipline);
        _loc2_.clip.credits.links.papalouie_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickCreditsPapaLouie);
        _loc2_.clip.credits.facebook_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickFacebook);
        _loc2_.clip.credits.twitter_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickTwitter);
        if (class_1.method_63() == false)
        {
          _loc2_.clip.credits.flipline1_btn.visible = false;
          _loc2_.clip.credits.flipline2_btn.visible = false;
          _loc2_.clip.credits.links.visible = false;
          _loc2_.clip.credits.facebook_btn.visible = false;
          _loc2_.clip.credits.twitter_btn.visible = false;
        }
      }
      else
      {
        _loc2_.clip.credits.flipline1_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickCreditsFlipline);
        _loc2_.clip.credits.flipline2_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickCreditsFlipline);
        _loc2_.clip.credits.links.flipline3_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickCreditsFlipline);
        _loc2_.clip.credits.links.papalouie_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickCreditsPapaLouie);
        _loc2_.clip.credits.facebook_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickFacebook);
        _loc2_.clip.credits.twitter_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickTwitter);
      }
    }

    public function clickCreditsFlipline(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.flipline.com","CreditsFlipline","Links");
    }

    public function clickCreditsPapaLouie(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.papalouie.com","CreditsPapaLouie","Links");
    }

    public function clickFacebook(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.facebook.com/pages/Flipline-Studios/121045844606187","CreditsFliplineFacebook","Links");
    }

    public function clickTwitter(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.twitter.com/FliplineStudios","CreditsFliplineTwitter","Links");
    }

    public function setupHelp(param1:Boolean = true):void
    {
      var _loc3_:int = 0;
      var _loc2_:MainMenuScreen = this;
      var _loc4_:Array = ["Moving", "Attacking", "Checkpoints", "Challenges", "Unlocking Levels", "Rescuing Customers", "Customer Skills", "Buying Outfit Styles"];
      _loc4_.push("Ground Pound", "Gliding", "Double Jump", "Crawling", "Wall Jump", "Pushing");
      _loc4_.push("Badges", "Baddies", "Controls", "Saving");
      if (param1)
      {
        _loc3_ = 1;
        while (_loc3_ <= _loc4_.length)
        {
          _loc2_.clip.help.tabholder["tab" + _loc3_].addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTab);
          _loc2_.clip.help.tabholder["tab" + _loc3_].addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverHelpTab);
          _loc2_.clip.help.tabholder["tab" + _loc3_].addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutHelpTab);
          _loc2_.clip.help.tabholder["tab" + _loc3_].mouseEnabled = true;
          _loc2_.clip.help.tabholder["tab" + _loc3_].mouseChildren = false;
          _loc2_.clip.help.tabholder["tab" + _loc3_].buttonMode = true;
          _loc2_.clip.help.tabholder["tab" + _loc3_].useHandCursor = true;
          _loc2_.clip.help.tabholder["tab" + _loc3_].name_txt.htmlText = "<b>" + _loc4_[_loc3_ - 1] + "</b>";
          _loc2_.clip.help.tabholder["tab" + _loc3_].hilite.visible = false;
          _loc2_.clip.help.tabholder["tab" + _loc3_].arrow.visible = false;
          _loc3_++;
        }
        _loc2_.setupHelpKeys();
        _loc2_.clip.help.tabholder.mask = _loc2_.clip.help.tabmasker;
        _loc2_.clip.help.side_scrollpanel.scroll_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTabDragger);
        _loc2_.clip.help.side_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart;
        _loc2_.clip.help.side_scrollpanel.scroll_btn.mouseEnabled = true;
        _loc2_.clip.help.side_scrollpanel.up_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTabArrow);
        _loc2_.clip.help.side_scrollpanel.down_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTabArrow);
        _loc2_.clip.help.mainpanel.mask = _loc2_.clip.help.mainmasker;
        _loc2_.clip.help.main_scrollpanel.scroll_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpMainDragger);
        _loc2_.clip.help.main_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart;
        _loc2_.clip.help.main_scrollpanel.scroll_btn.mouseEnabled = true;
        _loc2_.clip.help.main_scrollpanel.up_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpMainArrow);
        _loc2_.clip.help.main_scrollpanel.down_btn.addEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpMainArrow);
        _loc2_.showHelp(1);
        if (_loc2_.params != null && _loc2_.params.hasOwnProperty("useSection") && _loc2_.params.useSection == "help")
        {
          _loc2_.showHelp(15);
          _loc2_.clip.help.tabholder.y = _loc2_.clip.help.tabmasker.y - (_loc2_.clip.help.tabholder.height - _loc2_.clip.help.tabmasker.height);
          _loc2_.holdHelpTabArrow(null);
        }
      }
      else
      {
        _loc3_ = 1;
        while (_loc3_ <= _loc4_.length)
        {
          _loc2_.clip.help.tabholder["tab" + _loc3_].removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTab);
          _loc2_.clip.help.tabholder["tab" + _loc3_].removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverHelpTab);
          _loc2_.clip.help.tabholder["tab" + _loc3_].removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutHelpTab);
          _loc3_++;
        }
        _loc2_.clip.help.side_scrollpanel.scroll_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTabDragger);
        _loc2_.clip.help.side_scrollpanel.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTabArrow);
        _loc2_.clip.help.side_scrollpanel.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpTabArrow);
        _loc2_.clip.help.main_scrollpanel.scroll_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpMainDragger);
        _loc2_.clip.help.main_scrollpanel.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpMainArrow);
        _loc2_.clip.help.main_scrollpanel.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN, _loc2_.clickHelpMainArrow);
      }
    }

    public function setupHelpKeys():void
    {
      var _loc5_:String = null;
      var _loc1_:MainMenuScreen = this;
      var _loc2_:Array = ["left", "right", "up", "down", "down2", "down3", "jump", "jump2", "attack"];
      var _loc3_:Array = [DataManager.KEY_LEFT, DataManager.KEY_RIGHT, DataManager.KEY_UP, DataManager.KEY_DOWN, DataManager.KEY_DOWN, DataManager.KEY_DOWN, DataManager.KEY_JUMP, DataManager.KEY_JUMP, DataManager.KEY_ATTACK];
      var _loc4_:int = 0;
      while (_loc4_ < _loc2_.length)
      {
        _loc5_ = _loc1_.gameObj.var_109.getKeyLabel(_loc3_[_loc4_]);
        if (_loc5_ != "")
        {
          _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].visible = true;
          if (_loc5_ == "Left" || _loc5_ == "Right" || _loc5_ == "Up" || _loc5_ == "Down")
          {
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].gotoAndStop(_loc5_.toLowerCase());
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.visible = false;
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.visible = false;
          }
          else if (_loc5_.length > 1)
          {
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].gotoAndStop("wide");
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.visible = false;
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.visible = true;
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.text = _loc5_;
          }
          else
          {
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].gotoAndStop("other");
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.visible = true;
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.text = _loc5_;
            _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.visible = false;
          }
        }
        else
        {
          _loc1_.clip.help.mainpanel["key_" + _loc2_[_loc4_]].visible = false;
        }
        _loc4_++;
      }
    }

    public function clickHelpTabDragger(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      _loc2_.clip.help.side_scrollpanel.scroll_btn.startDrag(false, new Rectangle(0, 30, 0, _loc2_.helpScrollRange));
      _loc2_.clip.help.side_scrollpanel.scroll_btn.addEventListener(Event.ENTER_FRAME, _loc2_.dragHelpTabDragger);
      _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpTabDragger);
    }

    public function releaseHelpTabDragger(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpTabDragger);
      _loc2_.clip.help.side_scrollpanel.scroll_btn.removeEventListener(Event.ENTER_FRAME, _loc2_.dragHelpTabDragger);
      _loc2_.clip.help.side_scrollpanel.scroll_btn.stopDrag();
    }

    public function dragHelpTabDragger(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = (_loc2_.clip.help.side_scrollpanel.scroll_btn.y - _loc2_.helpScrollStart) / _loc2_.helpScrollRange;
      _loc2_.clip.help.tabholder.y = _loc2_.clip.help.tabmasker.y - (_loc2_.clip.help.tabholder.height - _loc2_.clip.help.tabmasker.height) * _loc3_;
    }

    public function clickHelpTabArrow(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:String = param1.currentTarget.name;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      if (_loc3_ == "up_btn")
      {
        _loc2_.helpTabScrollDir = -1;
      }
      else if (_loc3_ == "down_btn")
      {
        _loc2_.helpTabScrollDir = 1;
      }
      _loc2_.clip.help.tabholder.addEventListener(Event.ENTER_FRAME, _loc2_.holdHelpTabArrow);
      _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpTabArrow);
    }

    public function releaseHelpTabArrow(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.helpTabScrollDir = 0;
      _loc2_.clip.help.tabholder.removeEventListener(Event.ENTER_FRAME, _loc2_.holdHelpTabArrow);
      _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpTabArrow);
    }

    public function holdHelpTabArrow(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = Number(_loc2_.clip.help.tabmasker.y);
      var _loc4_:Number = _loc2_.clip.help.tabmasker.y - (_loc2_.clip.help.tabholder.height - _loc2_.clip.help.tabmasker.height);
      if (_loc2_.helpTabScrollDir == 1)
      {
        _loc2_.clip.help.tabholder.y -= 8;
      }
      else if (_loc2_.helpTabScrollDir == -1)
      {
        _loc2_.clip.help.tabholder.y += 8;
      }
      if (_loc2_.clip.help.tabholder.y < _loc4_)
      {
        _loc2_.clip.help.tabholder.y = _loc4_;
        _loc2_.helpTabScrollDir = 0;
      }
      else if (_loc2_.clip.help.tabholder.y > _loc3_)
      {
        _loc2_.clip.help.tabholder.y = _loc3_;
        _loc2_.helpTabScrollDir = 0;
      }
      var _loc5_:Number = Math.abs((_loc2_.clip.help.tabholder.y - _loc3_) / (_loc4_ - _loc3_));
      _loc2_.clip.help.side_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart + _loc5_ * _loc2_.helpScrollRange;
    }

    public function clickHelpMainDragger(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      _loc2_.clip.help.main_scrollpanel.scroll_btn.startDrag(false, new Rectangle(0, 30, 0, _loc2_.helpScrollRange));
      _loc2_.clip.help.main_scrollpanel.scroll_btn.addEventListener(Event.ENTER_FRAME, _loc2_.dragHelpMainDragger);
      _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpMainDragger);
    }

    public function releaseHelpMainDragger(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpMainDragger);
      _loc2_.clip.help.main_scrollpanel.scroll_btn.removeEventListener(Event.ENTER_FRAME, _loc2_.dragHelpMainDragger);
      _loc2_.clip.help.main_scrollpanel.scroll_btn.stopDrag();
    }

    public function dragHelpMainDragger(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = (_loc2_.clip.help.main_scrollpanel.scroll_btn.y - _loc2_.helpScrollStart) / _loc2_.helpScrollRange;
      _loc2_.clip.help.mainpanel.y = _loc2_.clip.help.mainmasker.y - (_loc2_.clip.help.mainpanel.height - _loc2_.clip.help.mainmasker.height) * _loc3_;
    }

    public function clickHelpMainArrow(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:String = param1.currentTarget.name;
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      if (_loc3_ == "up_btn")
      {
        _loc2_.helpMainScrollDir = -1;
      }
      else if (_loc3_ == "down_btn")
      {
        _loc2_.helpMainScrollDir = 1;
      }
      _loc2_.clip.help.mainpanel.addEventListener(Event.ENTER_FRAME, _loc2_.holdHelpMainArrow);
      _loc2_.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpMainArrow);
    }

    public function releaseHelpMainArrow(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.helpTabScrollDir = 0;
      _loc2_.clip.help.mainpanel.removeEventListener(Event.ENTER_FRAME, _loc2_.holdHelpMainArrow);
      _loc2_.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, _loc2_.releaseHelpMainArrow);
    }

    public function holdHelpMainArrow(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = Number(_loc2_.clip.help.mainmasker.y);
      var _loc4_:Number = _loc2_.clip.help.mainmasker.y - (_loc2_.clip.help.mainpanel.height - _loc2_.clip.help.mainmasker.height);
      if (_loc2_.helpMainScrollDir == 1)
      {
        _loc2_.clip.help.mainpanel.y -= 8;
      }
      else if (_loc2_.helpMainScrollDir == -1)
      {
        _loc2_.clip.help.mainpanel.y += 8;
      }
      if (_loc2_.clip.help.mainpanel.y < _loc4_)
      {
        _loc2_.clip.help.mainpanel.y = _loc4_;
        _loc2_.helpMainScrollDir = 0;
      }
      else if (_loc2_.clip.help.mainpanel.y > _loc3_)
      {
        _loc2_.clip.help.mainpanel.y = _loc3_;
        _loc2_.helpMainScrollDir = 0;
      }
      var _loc5_:Number = Math.abs((_loc2_.clip.help.mainpanel.y - _loc3_) / (_loc4_ - _loc3_));
      _loc2_.clip.help.main_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart + _loc5_ * _loc2_.helpScrollRange;
    }

    public function clickHelpTab(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = Number(MovieClip(param1.currentTarget).name.split("tab")[1]);
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      _loc2_.showHelp(_loc3_);
    }

    public function rolloverHelpTab(param1:MouseEvent):void
    {
      MovieClip(param1.currentTarget).hilite.visible = true;
    }

    public function rolloutHelpTab(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = Number(MovieClip(param1.currentTarget).name.split("tab")[1]);
      if (_loc2_.helpIndex != _loc3_)
      {
        MovieClip(param1.currentTarget).hilite.visible = false;
      }
    }

    public function showHelp(param1:Number):void
    {
      var _loc3_:int = 0;
      var _loc2_:MainMenuScreen = this;
      _loc2_.helpIndex = param1;
      _loc3_ = 1;
      while (_loc3_ <= 18)
      {
        if (_loc3_ == param1)
        {
          _loc2_.clip.help.tabholder["tab" + _loc3_].hilite.visible = true;
          _loc2_.clip.help.tabholder["tab" + _loc3_].arrow.visible = true;
        }
        else
        {
          _loc2_.clip.help.tabholder["tab" + _loc3_].hilite.visible = false;
          _loc2_.clip.help.tabholder["tab" + _loc3_].arrow.visible = false;
        }
        _loc3_++;
      }
      _loc2_.clip.help.mainpanel.gotoAndStop(_loc2_.helpIndex);
      _loc2_.clip.help.mainpanel.y = _loc2_.clip.help.mainmasker.y;
      _loc2_.clip.help.main_scrollpanel.scroll_btn.y = _loc2_.helpScrollStart;
    }

    public function setupControls(param1:Boolean = true):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      var _loc4_:DataManager = _loc2_.gameObj.var_109;
      if (param1)
      {
        _loc2_.clip.controls.attack_txt.text = _loc4_.getKeyLabel(DataManager.KEY_ATTACK);
        _loc2_.clip.controls.jump_txt.text = _loc4_.getKeyLabel(DataManager.KEY_JUMP);
        _loc2_.clip.controls.down_txt.text = _loc4_.getKeyLabel(DataManager.KEY_DOWN);
        _loc2_.clip.controls.up_txt.text = _loc4_.getKeyLabel(DataManager.KEY_UP);
        _loc2_.clip.controls.left_txt.text = _loc4_.getKeyLabel(DataManager.KEY_LEFT);
        _loc2_.clip.controls.right_txt.text = _loc4_.getKeyLabel(DataManager.KEY_RIGHT);
        _loc2_.clip.controls.attack_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.jump_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.down_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.up_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.left_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.right_btn.addEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.attack_btn.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.jump_btn.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.down_btn.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.up_btn.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.left_btn.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.right_btn.addEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.attack_btn.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.jump_btn.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.down_btn.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.up_btn.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.left_btn.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.right_btn.addEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.attack_btn.buttonMode = true;
        _loc2_.clip.controls.jump_btn.buttonMode = true;
        _loc2_.clip.controls.down_btn.buttonMode = true;
        _loc2_.clip.controls.up_btn.buttonMode = true;
        _loc2_.clip.controls.left_btn.buttonMode = true;
        _loc2_.clip.controls.right_btn.buttonMode = true;
        _loc2_.clip.controls.attack_btn.useHandCursor = true;
        _loc2_.clip.controls.jump_btn.useHandCursor = true;
        _loc2_.clip.controls.down_btn.useHandCursor = true;
        _loc2_.clip.controls.up_btn.useHandCursor = true;
        _loc2_.clip.controls.left_btn.useHandCursor = true;
        _loc2_.clip.controls.right_btn.useHandCursor = true;
        _loc2_.clip.controls.attack_btn.tabEnabled = false;
        _loc2_.clip.controls.jump_btn.tabEnabled = false;
        _loc2_.clip.controls.down_btn.tabEnabled = false;
        _loc2_.clip.controls.up_btn.tabEnabled = false;
        _loc2_.clip.controls.left_btn.tabEnabled = false;
        _loc2_.clip.controls.right_btn.tabEnabled = false;
        _loc2_.clip.controls.attack_btn.gotoAndStop("click");
        _loc2_.clip.controls.jump_btn.gotoAndStop("click");
        _loc2_.clip.controls.down_btn.gotoAndStop("click");
        _loc2_.clip.controls.up_btn.gotoAndStop("click");
        _loc2_.clip.controls.left_btn.gotoAndStop("click");
        _loc2_.clip.controls.right_btn.gotoAndStop("click");
      }
      else
      {
        _loc2_.clip.controls.attack_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.jump_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.down_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.up_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.left_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.right_btn.removeEventListener(MouseEvent.CLICK, _loc2_.clickControlsButton);
        _loc2_.clip.controls.attack_btn.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.jump_btn.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.down_btn.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.up_btn.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.left_btn.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.right_btn.removeEventListener(MouseEvent.ROLL_OVER, _loc2_.rolloverControlsButton);
        _loc2_.clip.controls.attack_btn.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.jump_btn.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.down_btn.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.up_btn.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.left_btn.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        _loc2_.clip.controls.right_btn.removeEventListener(MouseEvent.ROLL_OUT, _loc2_.rolloutControlsButton);
        try
        {
          _loc2_.gameObj.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _loc2_.controlsKeyListener);
        }
        catch (err:Error)
        {
        }
      }
    }

    public function clickControlsButton(param1:MouseEvent):void
    {
      var _loc3_:String = null;
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.settingWhichKey == "none")
      {
        param1.currentTarget.gotoAndStop("presskey");
        _loc3_ = param1.currentTarget.name.split("_")[0];
        _loc2_.settingWhichKey = _loc3_;
        _loc2_.gameObj.stage.addEventListener(KeyboardEvent.KEY_DOWN, _loc2_.controlsKeyListener);
      }
    }

    public function cancelSettingControls():void
    {
      var _loc1_:MainMenuScreen = this;
      if (_loc1_.settingWhichKey != "none")
      {
        try
        {
          _loc1_.gameObj.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _loc1_.controlsKeyListener);
        }
        catch (err:Error)
        {
        }
        _loc1_.clip.controls.attack_btn.gotoAndStop("click");
        _loc1_.clip.controls.jump_btn.gotoAndStop("click");
        _loc1_.clip.controls.down_btn.gotoAndStop("click");
        _loc1_.clip.controls.up_btn.gotoAndStop("click");
        _loc1_.clip.controls.left_btn.gotoAndStop("click");
        _loc1_.clip.controls.right_btn.gotoAndStop("click");
        _loc1_.settingWhichKey = "none";
      }
    }

    public function controlsKeyListener(param1:KeyboardEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      var _loc4_:DataManager = _loc2_.gameObj.var_109;
      var _loc5_:Boolean = _loc3_.setKey(param1.keyCode, _loc2_.settingWhichKey);
      if (_loc5_)
      {
        _loc2_.clip.controls[_loc2_.settingWhichKey + "_btn"].gotoAndStop("click");
        _loc2_.clip.controls.attack_txt.text = _loc4_.getKeyLabel(DataManager.KEY_ATTACK);
        _loc2_.clip.controls.jump_txt.text = _loc4_.getKeyLabel(DataManager.KEY_JUMP);
        _loc2_.clip.controls.down_txt.text = _loc4_.getKeyLabel(DataManager.KEY_DOWN);
        _loc2_.clip.controls.up_txt.text = _loc4_.getKeyLabel(DataManager.KEY_UP);
        _loc2_.clip.controls.left_txt.text = _loc4_.getKeyLabel(DataManager.KEY_LEFT);
        _loc2_.clip.controls.right_txt.text = _loc4_.getKeyLabel(DataManager.KEY_RIGHT);
        _loc2_.keysWereChanged = true;
        _loc2_.gameObj.var_107.api.method_88("ChangedControls", "Screens", true);
      }
      else
      {
        _loc2_.clip.controls[_loc2_.settingWhichKey + "_btn"].gotoAndStop("alreadyused");
      }
      try
      {
        _loc2_.gameObj.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _loc2_.controlsKeyListener);
      }
      catch (err:Error)
      {
      }
      _loc2_.settingWhichKey = "none";
    }

    public function rolloverControlsButton(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.settingWhichKey == "none")
      {
        param1.currentTarget.gotoAndStop("rollover");
      }
    }

    public function rolloutControlsButton(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      if (_loc2_.settingWhichKey == "none")
      {
        param1.currentTarget.gotoAndStop("click");
      }
    }

    public function destroy():void
    {
      var _loc1_:MainMenuScreen = this;
      _loc1_.gameObj.method_94("nowarpkeys", false);
      _loc1_.container.removeEventListener("clickMap", _loc1_.clickMap);
      _loc1_.container.removeEventListener("clickBaddies", _loc1_.clickBaddies);
      _loc1_.container.removeEventListener("clickMedals", _loc1_.clickMedals);
      _loc1_.container.removeEventListener("clickControls", _loc1_.clickControls);
      _loc1_.container.removeEventListener("clickCredits", _loc1_.clickCredits);
      _loc1_.container.removeEventListener("clickHelp", _loc1_.clickHelp);
      _loc1_.container.removeEventListener("clickExit", _loc1_.clickExit);
      _loc1_.container.removeEventListener("clickParade", _loc1_.clickParade);
      _loc1_.container.removeEventListener("clickParadeTwo", _loc1_.clickParadeTwo);
      _loc1_.container.removeEventListener("clickBaddiesRedirect", _loc1_.clickBaddiesRedirect);
      _loc1_.container.removeEventListener("clickMedalsRedirect", _loc1_.clickMedalsRedirect);
      _loc1_.container.removeEventListener("clickControlsRedirect", _loc1_.clickControlsRedirect);
      _loc1_.container.removeEventListener("clickHelpRedirect", _loc1_.clickHelpRedirect);
      _loc1_.container.removeEventListener("clickCreditsRedirect", _loc1_.clickCreditsRedirect);
      _loc1_.container.removeEventListener("clickBaddiesRedirectBack", _loc1_.clickBaddiesRedirectBack);
      _loc1_.container.removeEventListener("clickMedalsRedirectBack", _loc1_.clickMedalsRedirectBack);
      _loc1_.container.removeEventListener("clickControlsRedirectBack", _loc1_.clickControlsRedirectBack);
      _loc1_.container.removeEventListener("clickHelpRedirectBack", _loc1_.clickHelpRedirectBack);
      _loc1_.container.removeEventListener("clickCreditsRedirectBack", _loc1_.clickCreditsRedirectBack);
      _loc1_.container.removeEventListener("clickInfo", _loc1_.clickInfo);
      _loc1_.container.removeEventListener("clickBackToGame", _loc1_.clickBackToGame);
      _loc1_.container.removeEventListener("clickQuit", _loc1_.clickQuit);
      _loc1_.container.removeEventListener("clickContinueToMap", _loc1_.clickContinueToMap);
      _loc1_.container.removeEventListener("clickStartLevel", _loc1_.clickStartLevel);
      _loc1_.container.removeEventListener("clickBackToMap", _loc1_.clickBackToMap);
      _loc1_.container.removeEventListener("clickExitMapSelect", _loc1_.clickExitMapSelect);
      _loc1_.setupMap(false);
      if (!_loc1_.isOnCharSelect)
      {
        _loc1_.setupInfo(false);
      }
      if (this.isOnCharSelect)
      {
        _loc1_.setupCharacter(false);
      }
      _loc1_.setupControls(false);
      _loc1_.setupBaddies(false);
      _loc1_.setupMedals(false);
      _loc1_.setupCredits(false);
      _loc1_.setupHelp(false);
      _loc1_.setupConfirmQuit(false);
      _loc1_.container.removeChild(_loc1_.clip);
      _loc1_.clip = null;
    }

    public function clickMap(param1:Event):void
    {
      this.setSection("map");
    }

    public function clickMedals(param1:Event):void
    {
      this.setSection("medals");
    }

    public function clickBaddies(param1:Event):void
    {
      this.setSection("baddies");
    }

    public function clickControls(param1:Event):void
    {
      this.setSection("controls");
    }

    public function clickCredits(param1:Event):void
    {
      this.setSection("credits");
    }

    public function clickHelp(param1:Event):void
    {
      this.setSection("help");
      this.gameObj.var_107.api.method_88("ClickHelp", "Screens", true);
    }

    public function clickInfo(param1:Event):void
    {
      this.setSection("info");
    }

    public function clickBackToGame(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.clip.blackbg.visible = false;
      _loc2_.startClosingScreen();
    }

    public function clickContinueToMap(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.isContinuingToMap = true;
      _loc2_.startClosingScreen();
    }

    public function clickQuit(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.clip.confirmquit.visible = true;
      _loc2_.gameObj.var_107.api.disableButtons();
    }

    public function clickConfirmQuit(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.isQuittingLevel = true;
      _loc2_.clip.confirmquit.visible = false;
      _loc2_.startClosingScreen();
    }

    public function clickCancelQuit(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.clip.confirmquit.visible = false;
      _loc2_.gameObj.var_107.api.enableButtons();
    }

    public function clickExit(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.method_103(false);
      _loc2_.gameObj.var_107.api.method_85("SplashScreen");
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickExitMapSelect(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.method_103(false);
      _loc2_.gameObj.var_107.api.method_85("SplashScreen");
      _loc2_.gameObj.var_107.api.method_86("MapSelectMenu");
    }

    public function clickBackToMap(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.isReturningToMap = true;
      _loc2_.gameObj.method_103(false);
      _loc2_.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      _loc2_.gameObj.var_107.api.method_86("MapSelectMenu");
    }

    public function clickParade(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.method_147();
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickParadeTwo(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.method_121(true);
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickMedalsRedirect(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("BadgesMenu", {"section": "medals"});
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickBaddiesRedirect(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("BaddiesMenu", {"section": "baddies"});
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickControlsRedirect(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("ControlsMenu", {"section": "controls"});
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickHelpRedirect(param1:Event):void
    {
      this.gameObj.var_107.api.method_88("ClickHelp", "Screens", true);
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("HelpMenu", {"section": "help"});
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickCreditsRedirect(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("CreditsMenu", {"section": "credits"});
      _loc2_.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickMedalsRedirectBack(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      _loc2_.gameObj.var_107.api.method_86("BadgesMenu");
    }

    public function clickBaddiesRedirectBack(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      _loc2_.gameObj.var_107.api.method_86("BaddiesMenu");
    }

    public function clickControlsRedirectBack(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      _loc2_.gameObj.var_107.api.method_86("ControlsMenu");
    }

    public function clickHelpRedirectBack(param1:Event):void
    {
      this.gameObj.var_107.api.method_88("ClickHelp", "Screens", true);
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      _loc2_.gameObj.var_107.api.method_86("HelpMenu");
    }

    public function clickCreditsRedirectBack(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      _loc2_.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      _loc2_.gameObj.var_107.api.method_86("CreditsMenu");
    }

    public function setSection(param1:String):void
    {
      var _loc2_:MainMenuScreen = this;
      if (param1 != _loc2_.currentSection)
      {
        _loc2_.newSection = param1;
        _loc2_.clip.map.visible = false;
        _loc2_.clip.info.visible = false;
        _loc2_.clip.character.visible = false;
        _loc2_.clip.baddies.visible = false;
        _loc2_.clip.controls.visible = false;
        _loc2_.clip.medals.visible = false;
        _loc2_.clip.credits.visible = false;
        _loc2_.clip.help.visible = false;
        if (_loc2_.currentSection != "")
        {
          _loc2_.clip[_loc2_.currentSection].visible = true;
          _loc2_.clip[_loc2_.currentSection].y = 0;
        }
        if (_loc2_.newSection != "none")
        {
          _loc2_.clip[_loc2_.newSection].visible = true;
          _loc2_.clip[_loc2_.newSection].y = 480;
        }
        if (_loc2_.currentSection == "controls")
        {
          _loc2_.cancelSettingControls();
        }
        if (_loc2_.newSection == "help")
        {
          _loc2_.setupHelpKeys();
        }
        if (_loc2_.newSection == "map")
        {
          if (_loc2_.willRevealMap)
          {
            _loc2_.gameObj.var_105.playSound("checkpoint.wav");
          }
        }
        _loc2_.gameObj.var_107.api.disableButtons();
        _loc2_.isTransitioning = true;
        _loc2_.clip.addEventListener(Event.ENTER_FRAME, _loc2_.tweenSections);
      }
    }

    public function tweenSections(param1:Event):void
    {
      var _loc4_:Number = NaN;
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = 999;
      if (_loc2_.currentSection != "")
      {
        _loc3_ = -480 - _loc2_.clip[_loc2_.currentSection].y;
        _loc2_.clip[_loc2_.currentSection].y += _loc3_ / _loc2_.tweenSpeed;
      }
      if (_loc2_.newSection != "none")
      {
        _loc4_ = 0 - _loc2_.clip[_loc2_.newSection].y;
        _loc2_.clip[_loc2_.newSection].y += _loc4_ / _loc2_.tweenSpeed;
        if (Math.abs(_loc4_) <= 1)
        {
          _loc2_.clip[_loc2_.newSection].y = 0;
          if (_loc2_.newSection == "character")
          {
            if (!_loc2_.gameObj.var_106.hasTrained("character") && _loc2_.gameObj.var_106.getTotalCustomersUnlocked() > 2)
            {
              _loc2_.gameObj.method_102("character", false);
            }
            else if (!_loc2_.gameObj.var_106.hasTrained("challenges") && _loc2_.gameObj.var_106.hasTrained("nowarpkeys"))
            {
              class_7.method_1("Context training for challenges");
              _loc2_.gameObj.method_102("challenges", false);
            }
            else if (!_loc2_.gameObj.var_106.hasTrained("styles") && _loc2_.gameObj.var_106.getLevelHighScore(2) > 0 && _loc2_.gameObj.var_106.getTotalMoney() >= _loc2_.gameObj.var_109.getOutfitPrice(_loc2_.gameObj.var_106.selectedCharacter, 1))
            {
              _loc2_.gameObj.method_102("styles", false);
            }
            else
            {
              class_7.method_1("NO context training for challenges.... hasTrained challenges = " + _loc2_.gameObj.var_106.hasTrained("challenges") + ", hasTrained nowarpkeys = " + _loc2_.gameObj.var_106.hasTrained("nowarpkeys"));
            }
          }
          else if (_loc2_.newSection == "map")
          {
            if (!_loc2_.gameObj.var_106.hasTrained("nowarpkeys") && !_loc2_.willRevealMap && _loc2_.gameObj.var_106.getLevelHighScore(_loc2_.gameObj.var_106.lastAreaRevealed) > 0)
            {
              _loc2_.gameObj.method_102("nowarpkeys", false);
            }
          }
          if (_loc2_.currentSection != "")
          {
            _loc2_.clip[_loc2_.currentSection].visible = false;
          }
          _loc2_.currentSection = _loc2_.newSection;
          _loc2_.newSection = "";
          _loc2_.isTransitioning = false;
          _loc2_.clip.removeEventListener(Event.ENTER_FRAME, _loc2_.tweenSections);
          _loc2_.gameObj.var_107.api.method_115(_loc2_.getSectionTitle());
          _loc2_.gameObj.var_107.api.enableButtons();
        }
      }
      else if (Math.abs(_loc3_) <= 1)
      {
        _loc2_.isTransitioning = false;
        _loc2_.clip.removeEventListener(Event.ENTER_FRAME, _loc2_.tweenSections);
        if (_loc2_.isClosing)
        {
          _loc2_.closeMainMenuScreen();
        }
      }
    }

    public function startClosingScreen():void
    {
      var _loc1_:MainMenuScreen = this;
      _loc1_.isClosing = true;
      _loc1_.gameObj.var_107.api.method_105();
      _loc1_.setSection("none");
    }

    public function closeMainMenuScreen(param1:MouseEvent = null):void
    {
      var e:MouseEvent = param1;
      var screen:MainMenuScreen = this;
      if (screen.isStartingLevel)
      {
        if (screen.gameObj.var_106.getLevelHighScore(screen.whichLevel) == 0)
        {
          screen.gameObj.var_107.api.method_100("StartedLevel", screen.whichLevel + 1);
        }
        else
        {
          screen.gameObj.var_107.api.method_100("RepeatLevel", screen.whichLevel + 1);
        }
        screen.gameObj.var_107.api.method_190(screen.whichLevel + 1);
        class_7.method_1(">>>>>>>>>>>>>>>>>>>>>>>>>> SETUP GAME");
        screen.gameObj.var_158 = screen.whichLevel;
        screen.gameObj.method_116();
        class_7.method_1(">>>>>>>>>>>>>>>>>>>>>>>>>> REMOVE MAIN MENU SCREEN");
        screen.gameObj.var_107.api.method_86("MapSelectMenu");
      }
      else if (screen.isOpeningMapDetail)
      {
        screen.gameObj.var_107.api.method_85("MapSelectMenu", {
              "section": "area",
              "useLevel": screen.whichLevel
            });
        screen.gameObj.var_107.api.method_86("MainMenu");
      }
      else if (screen.isQuittingLevel)
      {
        if (screen.gameObj.var_105.isMute == false)
        {
          screen.gameObj.var_105.unmuteSound(false);
        }
        screen.gameObj.var_107.api.method_100("QuitLevel", screen.gameObj.var_109.currentLevel + 1);
        screen.gameObj.var_107.api.method_153();
        screen.gameObj.var_107.api.method_117();
        try
        {
          if (screen.gameObj.var_108)
          {
            screen.gameObj.var_106.totalTimePlayed.addValue(screen.gameObj.var_108.currentLevelTimer);
            class_7.method_1("(Updated Time Played)");
          }
        }
        catch (err:Error)
        {
        }
        screen.gameObj.var_106.saveProgress("quitlevel");
        screen.gameObj.method_108();
        screen.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
        screen.gameObj.var_107.api.method_86("PauseMenu");
      }
      else if (screen.isReturningToMap)
      {
        screen.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
        screen.gameObj.var_107.api.method_86("MapSelectMenu");
      }
      else if (screen.isContinuingToMap)
      {
        screen.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
        screen.gameObj.var_107.api.method_86("UpgradeMenu");
      }
      else
      {
        try
        {
          screen.gameObj.var_108.resumeGame(screen.keysWereChanged);
        }
        catch (err:Error)
        {
          class_7.error("Error Resuming Game");
        }
        screen.gameObj.var_107.api.method_86("PauseMenu");
      }
    }

    public function getSectionTitle():String
    {
      var _loc1_:MainMenuScreen = this;
      if (_loc1_.currentSection == "map")
      {
        return "MAP";
      }
      if (_loc1_.currentSection == "controls")
      {
        return "CONTROLS";
      }
      if (_loc1_.currentSection == "baddies")
      {
        return "BADDIES";
      }
      if (_loc1_.currentSection == "credits")
      {
        return "CREDITS";
      }
      if (_loc1_.currentSection == "medals")
      {
        return "BADGES";
      }
      if (_loc1_.currentSection == "help")
      {
        return "HELP";
      }
      if (_loc1_.currentSection == "info")
      {
        return "AREA INFO";
      }
      if (_loc1_.currentSection == "character")
      {
        return "CHOOSE YOUR CHARACTER";
      }
      return _loc1_.currentSection.toUpperCase();
    }

    private function buildInfoModel(param1:Number, param2:Number):MovieClip
    {
      var _loc5_:MovieClip = null;
      var _loc37_:Class = null;
      var _loc38_:Class = null;
      var _loc39_:MovieClip = null;
      var _loc40_:MovieClip = null;
      var _loc41_:MovieClip = null;
      var _loc42_:MovieClip = null;
      var _loc43_:Class = null;
      var _loc44_:MovieClip = null;
      var _loc45_:MovieClip = null;
      var _loc3_:MainMenuScreen = this;
      var _loc6_:String = _loc3_.gameObj.var_113.getCustomerType(param1);
      if (_loc6_ == CustomerData.WEAPON_SWING1)
      {
        _loc5_ = new customerOneSwingMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_SWING2)
      {
        _loc5_ = new customerTwoSwingMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_SCOOTER)
      {
        _loc5_ = new customerScooterMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_KAHUNA)
      {
        _loc5_ = new customerKahunaMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_WHIP)
      {
        _loc5_ = new customerWhipMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_MELEE)
      {
        _loc5_ = new customerMeleeMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_TOSS)
      {
        _loc5_ = new customerTossMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_LONGGUN)
      {
        _loc5_ = new customerLongGunMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_PISTOL)
      {
        _loc5_ = new customerPistolMC();
      }
      else if (_loc6_ == CustomerData.WEAPON_BAZOOKA)
      {
        _loc5_ = new customerBazookaMC();
      }
      else
      {
        _loc5_ = new customerOneSwingMC();
      }
      _loc5_.scaleX = -0.55;
      _loc5_.scaleY = 0.55;
      var _loc7_:String = _loc3_.gameObj.var_113.getCustomerClipName(param1);
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
      _loc5_.body.addChild(_loc9_);
      var _loc10_:Class = getDefinitionByName("customer_" + _loc7_ + "_head") as Class;
      var _loc11_:MovieClip = new _loc10_();
      _loc11_.name = "clip";
      _loc5_.head.addChild(_loc11_);
      var _loc12_:Class = getDefinitionByName("customer_" + _loc7_ + "_eyes") as Class;
      var _loc13_:MovieClip = new _loc12_();
      _loc13_.name = "clip";
      _loc5_.eyes.addChild(_loc13_);
      var _loc14_:Class = getDefinitionByName("customer_" + _loc7_ + "_mouth") as Class;
      var _loc15_:MovieClip = new _loc14_();
      _loc15_.name = "clip";
      _loc5_.mouth.addChild(_loc15_);
      var _loc16_:Class = getDefinitionByName("customer_" + _loc7_ + "_neck") as Class;
      var _loc17_:MovieClip = new _loc16_();
      _loc17_.name = "clip";
      _loc5_.neck.addChild(_loc17_);
      var _loc18_:MovieClip = null;
      try
      {
        _loc37_ = getDefinitionByName("customer_" + _loc7_ + "_hair") as Class;
        _loc18_ = new _loc37_();
        _loc18_.name = "clip";
        _loc5_.hair.addChild(_loc18_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc38_ = getDefinitionByName("customer_" + _loc7_ + "_back_hair") as Class;
        _loc39_ = new _loc38_();
        _loc39_.name = "clip";
        _loc5_.back_hair.addChild(_loc39_);
      }
      catch (err:Error)
      {
      }
      var _loc19_:Class = getDefinitionByName("customer_" + _loc7_ + "_foot") as Class;
      var _loc20_:MovieClip = new _loc19_();
      _loc20_.name = "clip";
      _loc5_.front_shoe.addChild(_loc20_);
      var _loc21_:MovieClip = new _loc19_();
      _loc21_.name = "clip";
      _loc5_.back_shoe.addChild(_loc21_);
      var _loc22_:String = "customer_" + _loc7_ + "_hand";
      var _loc23_:Class = getDefinitionByName(_loc22_) as Class;
      var _loc24_:MovieClip = new _loc23_();
      _loc24_.name = "clip";
      _loc5_.fronthand.addChild(_loc24_);
      var _loc25_:Class = getDefinitionByName("customer_" + _loc7_ + "_hand2") as Class;
      var _loc26_:MovieClip = new _loc25_();
      _loc26_.name = "clip";
      _loc5_.backhand.addChild(_loc26_);
      var _loc27_:Class = getDefinitionByName("customer_" + _loc7_ + "_upperarm") as Class;
      var _loc28_:MovieClip = new _loc27_();
      _loc28_.name = "clip";
      _loc5_.front_upperarm.addChild(_loc28_);
      var _loc29_:MovieClip = new _loc27_();
      _loc29_.name = "clip";
      _loc5_.back_upperarm.addChild(_loc29_);
      var _loc30_:Class = getDefinitionByName("customer_" + _loc7_ + "_forearm") as Class;
      var _loc31_:MovieClip = new _loc30_();
      _loc31_.name = "clip";
      _loc5_.front_forearm.addChild(_loc31_);
      var _loc32_:MovieClip = new _loc30_();
      _loc32_.name = "clip";
      _loc5_.back_forearm.addChild(_loc32_);
      try
      {
        _loc40_ = new _loc30_();
        _loc40_.name = "clip";
        _loc5_.cross_backforearm.addChild(_loc40_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc41_ = new _loc25_();
        _loc41_.name = "clip";
        _loc5_.cross_back_hand.addChild(_loc41_);
      }
      catch (err:Error)
      {
      }
      var _loc33_:String = _loc3_.gameObj.var_113.getWeaponClipName(param1, param2);
      var _loc34_:Class = getDefinitionByName("weapon_" + _loc33_) as Class;
      var _loc35_:MovieClip = new _loc34_();
      _loc35_.name = "clip";
      _loc5_.weapon.addChild(_loc35_);
      try
      {
        _loc42_ = new _loc34_();
        _loc42_.name = "clip";
        _loc5_.cross_back_weap.addChild(_loc42_);
      }
      catch (err:Error)
      {
      }
      var _loc36_:String = _loc3_.gameObj.var_113.getCustomerClipName(param1);
      if (_loc36_ == "Boomer")
      {
        _loc43_ = getDefinitionByName("glider_" + _loc36_) as Class;
        _loc44_ = new _loc43_();
        _loc44_.name = "clip";
        _loc5_.glider.addChild(_loc44_);
      }
      else
      {
        _loc45_ = new MovieClip();
        _loc45_.name = "clip";
        _loc5_.glider.addChild(_loc45_);
      }
      _loc5_.gotoAndStop(1);
      _loc5_.gotoAndPlay("stand");
      if (_loc3_.gameObj.var_113.getCustomerClipName(param1) == "Connor")
      {
        _loc5_.gotoAndPlay("standconnor");
      }
      return _loc5_;
    }

    private function cleanupInfoModel(param1:MovieClip):void
    {
      var whichModel:MovieClip = param1;
      var ob:MainMenuScreen = this;
      whichModel.gotoAndStop(1);
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
        whichModel.weapon.removeChildAt(0);
      }
      catch (err:Error)
      {
        class_7.error("Error removing parts of customer");
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
        whichModel.glider.removeChildAt(0);
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
    }

    public function clickBonusFacebook(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      if (_loc3_.didClickFacebook == false)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.facebook.com/pages/Flipline-Studios/121045844606187","BonusTipsFacebook","BonusLinks");
        _loc3_.didClickFacebook = true;
        _loc3_.totalMoney.addValue(75);
        _loc3_.saveProgress("outfit");
        _loc2_.clip.character.totalmoney_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        _loc2_.clip.character.bonus_facebook_btn.visible = false;
        if (_loc3_.didClickTwitter == false)
        {
          _loc2_.clip.character.bonus_twitter_btn.visible = true;
        }
        else
        {
          _loc2_.clip.character.bonus_twitter_btn.visible = false;
        }
        _loc2_.gameObj.var_105.playSound("buttonclick.wav");
        _loc2_.updateStyleButtons();
      }
    }

    public function clickBonusTwitter(param1:Event):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      if (_loc3_.didClickTwitter == false)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.twitter.com/FliplineStudios","BonusTipsTwitter","BonusLinks");
        _loc3_.didClickTwitter = true;
        _loc3_.totalMoney.addValue(75);
        _loc3_.saveProgress("outfit");
        _loc2_.clip.character.totalmoney_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        _loc2_.clip.character.bonus_twitter_btn.visible = false;
        _loc2_.clip.character.bonus_facebook_btn.visible = false;
        _loc2_.gameObj.var_105.playSound("buttonclick.wav");
        _loc2_.updateStyleButtons();
      }
    }

    public function clickEnemyThumb(param1:MouseEvent):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:Number = Number(String(MovieClip(param1.currentTarget).name).split("thumb")[1]);
      _loc2_.gameObj.var_105.playSound("buttonclick.wav");
      _loc2_.selectEnemy(_loc3_);
    }

    public function rolloverEnemyThumb(param1:MouseEvent):void
    {
      param1.currentTarget.roll.visible = true;
    }

    public function rolloutEnemyThumb(param1:MouseEvent):void
    {
      param1.currentTarget.roll.visible = false;
    }

    public function selectEnemy(param1:Number):void
    {
      var _loc2_:MainMenuScreen = this;
      var _loc3_:DataManager = _loc2_.gameObj.var_109;
      var _loc4_:int = 0;
      while (_loc4_ < 35)
      {
        if (_loc4_ == param1)
        {
          _loc2_.clip.baddies["thumb" + _loc4_].hilite.visible = true;
        }
        else
        {
          _loc2_.clip.baddies["thumb" + _loc4_].hilite.visible = false;
        }
        _loc4_++;
      }
      _loc2_.clip.baddies.name_txt.text = _loc3_.getEnemyName(param1);
      if (_loc3_.getEnemyIDFromIndex(param1) == 25)
      {
        _loc2_.clip.baddies.defeated_txt.text = "Encounters: " + _loc2_.gameObj.var_106.getEnemyKills(_loc3_.getEnemyIDFromIndex(param1));
      }
      else if (_loc3_.getEnemyIDFromIndex(param1) == 32)
      {
        _loc2_.clip.baddies.defeated_txt.text = "Bounced: " + _loc2_.gameObj.var_106.getEnemyKills(_loc3_.getEnemyIDFromIndex(param1));
      }
      else
      {
        _loc2_.clip.baddies.defeated_txt.text = "Defeated: " + _loc2_.gameObj.var_106.getEnemyKills(_loc3_.getEnemyIDFromIndex(param1));
      }
      if (_loc2_.enemyDetail != null)
      {
        _loc2_.enemyDetail.parent.removeChild(_loc2_.enemyDetail);
        _loc2_.enemyDetail = null;
      }
      var _loc5_:Class = getDefinitionByName("enemydetail_" + _loc3_.getEnemyClipName(param1)) as Class;
      _loc2_.enemyDetail = new _loc5_() as MovieClip;
      _loc2_.enemyDetail.mouseEnabled = false;
      _loc2_.enemyDetail.mouseChildren = false;
      _loc2_.clip.baddies.addChild(_loc2_.enemyDetail);
      _loc2_.enemyDetail.x = 10;
      _loc2_.enemyDetail.y = 101;
    }
  }
}
