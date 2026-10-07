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
      param1.menuScreen = this;
      this.container = param2;
      this.params = param3;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      if (this.params != null && this.params.hasOwnProperty("useLevel"))
      {
        this.whichLevel = Number(this.params.useLevel);
      }
      if (this.params != null && this.params.hasOwnProperty("isCharSelect"))
      {
        this.isOnCharSelect = this.params.isCharSelect;
      }
      this.clip = new mainMenuMC();
      this.container.addChild(this.clip);
      this.container.addEventListener("clickBaddies", this.clickBaddies);
      this.container.addEventListener("clickMedals", this.clickMedals);
      this.container.addEventListener("clickControls", this.clickControls);
      this.container.addEventListener("clickCredits", this.clickCredits);
      this.container.addEventListener("clickHelp", this.clickHelp);
      this.container.addEventListener("clickExit", this.clickExit);
      this.container.addEventListener("clickParade", this.clickParade);
      this.container.addEventListener("clickParadeTwo", this.clickParadeTwo);
      this.container.addEventListener("clickBaddiesRedirect", this.clickBaddiesRedirect);
      this.container.addEventListener("clickMedalsRedirect", this.clickMedalsRedirect);
      this.container.addEventListener("clickCreditsRedirect", this.clickCreditsRedirect);
      this.container.addEventListener("clickControlsRedirect", this.clickControlsRedirect);
      this.container.addEventListener("clickHelpRedirect", this.clickHelpRedirect);
      this.container.addEventListener("clickBaddiesRedirectBack", this.clickBaddiesRedirectBack);
      this.container.addEventListener("clickMedalsRedirectBack", this.clickMedalsRedirectBack);
      this.container.addEventListener("clickControlsRedirectBack", this.clickControlsRedirectBack);
      this.container.addEventListener("clickHelpRedirectBack", this.clickHelpRedirectBack);
      this.container.addEventListener("clickCreditsRedirectBack", this.clickCreditsRedirectBack);
      this.container.addEventListener("clickInfo", this.clickInfo);
      this.container.addEventListener("clickBackToGame", this.clickBackToGame);
      this.container.addEventListener("clickQuit", this.clickQuit);
      this.container.addEventListener("clickStartLevel", this.clickStartLevel);
      this.container.addEventListener("clickBackToMap", this.clickBackToMap);
      this.container.addEventListener("clickExitMapSelect", this.clickExitMapSelect);
      this.setupMap();
      if (this.isOnCharSelect)
      {
        this.setupCharacter();
      }
      if (!this.isOnCharSelect)
      {
        this.setupInfo();
      }
      this.setupBaddies();
      this.setupControls();
      this.setupCredits();
      this.setupHelp();
      this.setupMedals();
      this.setupConfirmQuit();
      if (this.gameObj.var_109.currentWorldData == null && this.gameObj.var_105.currentTrack != "otherscreens.wav")
      {
        this.gameObj.var_105.playTrack("AlternateTrack", 1, 0, "outin");
      }
      if (this.params != null && this.params.hasOwnProperty("section"))
      {
        this.setSection(this.params.section);
      }
      else
      {
        this.setSection("map");
      }
    }

    public function setupConfirmQuit(param1:Boolean = true):void
    {
      if (param1)
      {
        this.confirmYesButton = new class_11(null, "YES", "small", "button", "clickYesQuit", null, false, false, false, null, false, 80);
        this.confirmYesButton.x = 234;
        this.confirmYesButton.y = 220;
        this.confirmNoButton = new class_11(null, "NO", "small", "button", "clickNoQuit", null, false, false, false, null, false, 80);
        this.confirmNoButton.x = 385;
        this.confirmNoButton.y = this.confirmYesButton.y;
        this.clip.confirmquit.addChild(this.confirmYesButton);
        this.clip.confirmquit.addChild(this.confirmNoButton);
        this.confirmYesButton.addEventListener("clickYesQuit", this.clickConfirmQuit);
        this.confirmNoButton.addEventListener("clickNoQuit", this.clickCancelQuit);
        this.clip.confirmquit.visible = false;
      }
      else
      {
        this.clip.confirmquit.removeChild(this.confirmYesButton);
        this.clip.confirmquit.removeChild(this.confirmNoButton);
        this.confirmYesButton.removeEventListener("clickYesQuit", this.clickConfirmQuit);
        this.confirmNoButton.removeEventListener("clickNoQuit", this.clickCancelQuit);
        this.confirmYesButton.destroy();
        this.confirmNoButton.destroy();
        this.confirmYesButton = null;
        this.confirmNoButton = null;
      }
    }

    public function setupMedals(param1:Boolean = true):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:ChallengeManager = this.gameObj.var_112;
      this.medalsPage = 0;
      this.medalsDirection = "next";
      this.medalsTransitioning = true;
      if (param1)
      {
        this.clip.medals.next_btn.addEventListener(MouseEvent.CLICK, this.clickNextMedals);
        this.clip.medals.prev_btn.addEventListener(MouseEvent.CLICK, this.clickPrevMedals);
        this.clip.medals.prev_btn.visible = false;
        this.clip.medals.total_txt.text = String(_loc3_.getTotalBadgesEarned() + "/" + _loc4_.getNumberOfBadges());
        this.populateMedals();
        this.clip.medals.panel.addEventListener(Event.ENTER_FRAME, this.animateMedalsTransition);
      }
      else
      {
        this.clip.medals.next_btn.removeEventListener(MouseEvent.CLICK, this.clickNextMedals);
        this.clip.medals.prev_btn.removeEventListener(MouseEvent.CLICK, this.clickPrevMedals);
        if (this.clip.medals.panel.hasEventListener(Event.ENTER_FRAME))
        {
          this.clip.medals.panel.removeEventListener(Event.ENTER_FRAME, this.animateMedalsTransition);
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
      var _loc2_:UserData = this.gameObj.var_106;
      var _loc3_:ChallengeManager = this.gameObj.var_112;
      var _loc4_:Number = 0 + this.medalsPage * this.medalsPerPage;
      var _loc5_:Number = Math.min(_loc3_.getNumberOfBadges() - 1, _loc4_ + (this.medalsPerPage - 1));
      var _loc6_:Number = _loc5_ - _loc4_ + 1;
      var _loc7_:int = 0;
      while (_loc7_ < this.medalsPerPage)
      {
        _loc9_ = this.clip.medals.panel["panel" + (_loc7_ + 1)];
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
            _loc9_.thumb.filters = [this.getDesaturatedFilter()];
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
      var _loc8_:Number = Math.ceil(_loc3_.getNumberOfBadges() / this.medalsPerPage);
      if (this.medalsPage > 0)
      {
        this.clip.medals.prev_btn.visible = true;
      }
      else
      {
        this.clip.medals.prev_btn.visible = false;
      }
      if (this.medalsPage < _loc8_ - 1)
      {
        this.clip.medals.next_btn.visible = true;
      }
      else
      {
        this.clip.medals.next_btn.visible = false;
      }
      this.clip.medals.page_txt.text = this.medalsPage + 1 + " / " + _loc8_;
      if (this.medalsDirection == "next")
      {
        this.clip.medals.panel.gotoAndPlay("innext");
      }
      else
      {
        this.clip.medals.panel.gotoAndPlay("inprev");
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
      if (this.clip.medals.panel.currentLabel == "outnextframe" || this.clip.medals.panel.currentLabel == "outprevframe")
      {
        this.populateMedals();
      }
      else if (this.clip.medals.panel.currentLabel == "innextframe" || this.clip.medals.panel.currentLabel == "inprevframe")
      {
        this.clip.medals.panel.removeEventListener(Event.ENTER_FRAME, this.animateMedalsTransition);
        this.medalsTransitioning = false;
      }
    }

    public function setupBaddies(param1:Boolean = true):void
    {
      var _loc5_:int = 0;
      var _loc6_:MovieClip = null;
      var _loc9_:Object = null;
      var _loc10_:BitmapData = null;
      var _loc11_:Bitmap = null;
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:DataManager = this.gameObj.var_109;
      var _loc7_:Number = 0;
      var _loc8_:Number = 0;
      if (param1)
      {
        this.enemyThumbs = new Vector.<Bitmap>();
        _loc5_ = 0;
        while (_loc5_ < 35)
        {
          _loc6_ = this.clip.baddies["thumb" + _loc5_];
          if (_loc5_ < _loc4_.enemyKey.length)
          {
            _loc8_++;
            _loc9_ = _loc4_.enemyKey[_loc5_];
            _loc6_.buttonMode = true;
            _loc6_.useHandCursor = true;
            _loc6_.hilite.visible = false;
            _loc6_.roll.visible = false;
            _loc6_.newbanner.visible = false;
            _loc6_.addEventListener(MouseEvent.MOUSE_DOWN, this.clickEnemyThumb);
            _loc6_.addEventListener(MouseEvent.ROLL_OVER, this.rolloverEnemyThumb);
            _loc6_.addEventListener(MouseEvent.ROLL_OUT, this.rolloutEnemyThumb);
            _loc6_.gotoAndStop(6);
            if (_loc9_.id == 35 || _loc9_.id == 37)
            {
              _loc6_.gotoAndStop(2);
            }
            _loc10_ = this.gameObj.var_109.getEnemyBitmap(_loc5_);
            _loc11_ = new Bitmap(_loc10_);
            _loc6_.holder.addChild(_loc11_);
            this.enemyThumbs.push(_loc11_);
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
        this.clip.baddies.tally_txt.text = String(_loc7_ + "/" + _loc8_);
        if (_loc3_.getEnemyKills(_loc4_.enemyKey[0].id) > 0)
        {
          this.selectEnemy(0);
        }
        else if (_loc3_.getEnemyKills(_loc4_.enemyKey[1].id) > 0)
        {
          this.selectEnemy(1);
        }
        else if (_loc3_.getEnemyKills(_loc4_.enemyKey[4].id) > 0)
        {
          this.selectEnemy(4);
        }
        else
        {
          this.selectEnemy(0);
        }
      }
      else
      {
        _loc5_ = 0;
        while (_loc5_ < 35)
        {
          _loc6_ = this.clip.baddies["thumb" + _loc5_];
          if (_loc5_ < _loc4_.enemyKey.length)
          {
            _loc6_.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickEnemyThumb);
            _loc6_.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverEnemyThumb);
            _loc6_.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutEnemyThumb);
          }
          _loc5_++;
        }
        _loc5_ = 0;
        while (_loc5_ < this.enemyThumbs.length)
        {
          if (this.enemyThumbs[_loc5_] != null)
          {
            this.enemyThumbs[_loc5_].bitmapData.dispose();
            this.enemyThumbs[_loc5_].bitmapData = null;
            this.enemyThumbs[_loc5_].parent.removeChild(this.enemyThumbs[_loc5_]);
            this.enemyThumbs[_loc5_] = null;
          }
          _loc5_++;
        }
        this.enemyThumbs = null;
        if (this.enemyDetail != null)
        {
          this.enemyDetail.parent.removeChild(this.enemyDetail);
          this.enemyDetail = null;
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
      var _loc3_:UserData = this.gameObj.var_106;
      this.clip.character.charholder.mouseEnabled = false;
      this.clip.character.charholder.mouseChildren = false;
      this.clip.character.title_txt.text = this.gameObj.var_109.getWorldTitle(this.whichLevel);
      this.clip.character.levelnum_txt.text = String(this.whichLevel + 1);
      if (this.whichLevel == 9)
      {
        this.clip.character.levelnum_txt.text = "X";
      }
      this.clip.character.score_txt.text = class_10.method_84(_loc3_.getLevelHighScore(this.whichLevel));
      this.clip.character.levelinside.inside.gotoAndStop(this.whichLevel + 1);
      this.clip.character.levelinside.mask = this.clip.character.levelmask;
      if (param1)
      {
        this.characterThumbs = new Vector.<Bitmap>();
        this.rescueThumbs = new Vector.<Bitmap>();
        this.leavingModels = new Vector.<MovieClip>();
        if (!class_3.method_47())
        {
          this.shouldShowGameLinks = true;
        }
        this.clip.character.link_btn.visible = false;
        this.clip.character.underline.visible = false;
        this.clip.character.link_btn.addEventListener(MouseEvent.CLICK, this.clickCustomerPlayGame);
        _loc4_ = 0;
        while (_loc4_ < this.numCharacters)
        {
          _loc6_ = this.clip.character["thumb" + _loc4_];
          _loc6_.buttonMode = true;
          _loc6_.useHandCursor = true;
          _loc6_.hilite.visible = false;
          _loc6_.roll.visible = false;
          _loc6_.newbanner.visible = false;
          if (_loc3_.customersUsed[_loc4_] == 0)
          {
            _loc6_.newbanner.visible = true;
          }
          _loc6_.addEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterThumb);
          _loc6_.addEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterThumb);
          _loc6_.addEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterThumb);
          _loc7_ = this.gameObj.var_113.getCustomerData(_loc4_);
          _loc6_.gotoAndStop(_loc7_.skillType);
          _loc8_ = this.gameObj.var_113.getCustomerBitmap(_loc4_);
          _loc9_ = new Bitmap(_loc8_);
          _loc6_.holder.addChild(_loc9_);
          this.characterThumbs.push(_loc9_);
          if (_loc3_.hasCustomerUnlocked(_loc4_) == false)
          {
            _loc6_.visible = false;
          }
          _loc4_++;
        }
        // TODO ???
        class_7.method_1("Setup Challenges for level: " + this.whichLevel);
        _loc4_ = 1;
        while (_loc4_ <= 6)
        {
          if (_loc3_.hasCompletedChallenge(this.whichLevel, _loc4_))
          {
            this.clip.character["icon" + _loc4_].gotoAndStop(2);
          }
          else
          {
            this.clip.character["icon" + _loc4_].gotoAndStop(1);
          }
          this.clip.character["icon" + _loc4_].num_txt.text = String(_loc4_);
          _loc10_ = this.clip.character["panel" + _loc4_];
          _loc11_ = this.gameObj.var_112.getChallengeType(this.whichLevel, _loc4_);
          _loc12_ = this.gameObj.var_112.getChallengeTargetAmount(this.whichLevel, _loc4_);
          _loc13_ = this.gameObj.var_112.getChallengeSkillNeeded(this.whichLevel, _loc4_);
          if (_loc11_ == Challenge.RESCUE)
          {
            _loc10_.description_txt.text = "Rescue:";
            _loc14_ = this.gameObj.var_113.getTrappedCustomerIndex(this.whichLevel, _loc4_);
            _loc15_ = this.gameObj.var_113.getCustomerBitmap(_loc14_);
            _loc16_ = new Bitmap(_loc15_);
            _loc16_.x = -8;
            _loc16_.y = -8;
            if (this.gameObj.var_113.getCustomerName(_loc14_) == "Georgito" || this.gameObj.var_113.getCustomerName(_loc14_) == "Yippy" || this.gameObj.var_113.getCustomerName(_loc14_) == "Greg")
            {
              _loc16_.y -= 8;
            }
            _loc10_.icon.gotoAndStop(1);
            _loc10_.icon.holder.addChild(_loc16_);
            _loc10_.icon.holder.mask = _loc10_.icon.masker;
            this.rescueThumbs.push(_loc16_);
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
            this.clip.character["icon" + _loc4_].visible = false;
          }
          _loc4_++;
        }
        this.clip.character.styleA.addEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterStyle);
        this.clip.character.styleB.addEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterStyle);
        this.clip.character.styleC.addEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterStyle);
        this.clip.character.styleA.addEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterStyle);
        this.clip.character.styleB.addEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterStyle);
        this.clip.character.styleC.addEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterStyle);
        this.clip.character.styleA.addEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterStyle);
        this.clip.character.styleB.addEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterStyle);
        this.clip.character.styleC.addEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterStyle);
        this.clip.character.styleA.rolloverclip.visible = false;
        this.clip.character.styleB.rolloverclip.visible = false;
        this.clip.character.styleC.rolloverclip.visible = false;
        this.clip.character.styleA.buttonMode = true;
        this.clip.character.styleA.useHandCursor = true;
        this.clip.character.styleB.buttonMode = true;
        this.clip.character.styleB.useHandCursor = true;
        this.clip.character.styleC.buttonMode = true;
        this.clip.character.styleC.useHandCursor = true;
        this.clip.character.styleB.price_txt.mouseEnabled = false;
        this.clip.character.styleC.price_txt.mouseEnabled = false;
        this.selectCharacter(this.gameObj.var_106.selectedCharacter, this.gameObj.var_106.selectedStyle);
        _loc5_ = true;
        if (class_3.method_47() && class_1.method_79() == false)
        {
          _loc5_ = false;
        }
        if (_loc5_)
        {
          if (_loc3_.didClickFacebook == false)
          {
            this.clip.character.bonus_facebook_btn.visible = true;
            this.clip.character.bonus_twitter_btn.visible = false;
          }
          else if (_loc3_.didClickTwitter == false)
          {
            this.clip.character.bonus_facebook_btn.visible = false;
            this.clip.character.bonus_twitter_btn.visible = true;
          }
          else
          {
            this.clip.character.bonus_facebook_btn.visible = false;
            this.clip.character.bonus_twitter_btn.visible = false;
          }
        }
        else
        {
          this.clip.character.bonus_facebook_btn.visible = false;
          this.clip.character.bonus_twitter_btn.visible = false;
        }
        this.clip.character.bonus_facebook_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickBonusFacebook);
        this.clip.character.bonus_twitter_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickBonusTwitter);
        this.clip.character.totalmoney_txt.text = class_10.method_84(this.gameObj.var_106.getTotalMoney());
        this.clip.character.addEventListener(Event.ENTER_FRAME, this.updateCharacter);
      }
      else
      {
        this.clip.character.bonus_facebook_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickBonusFacebook);
        this.clip.character.bonus_twitter_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickBonusTwitter);
        this.clip.character.removeEventListener(Event.ENTER_FRAME, this.updateCharacter);
        this.clip.character.link_btn.removeEventListener(MouseEvent.CLICK, this.clickCustomerPlayGame);
        _loc4_ = 0;
        while (_loc4_ < this.numCharacters)
        {
          _loc17_ = this.clip.character["thumb" + _loc4_];
          _loc17_.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterThumb);
          _loc17_.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterThumb);
          _loc17_.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterThumb);
          _loc4_++;
        }
        this.clip.character.styleA.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterStyle);
        this.clip.character.styleB.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterStyle);
        this.clip.character.styleC.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickCharacterStyle);
        this.clip.character.styleA.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterStyle);
        this.clip.character.styleB.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterStyle);
        this.clip.character.styleC.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverCharacterStyle);
        this.clip.character.styleA.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterStyle);
        this.clip.character.styleB.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterStyle);
        this.clip.character.styleC.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutCharacterStyle);
        _loc4_ = 0;
        while (_loc4_ < this.characterThumbs.length)
        {
          if (this.characterThumbs[_loc4_] != null)
          {
            this.characterThumbs[_loc4_].bitmapData.dispose();
            this.characterThumbs[_loc4_].bitmapData = null;
            this.characterThumbs[_loc4_].parent.removeChild(this.characterThumbs[_loc4_]);
            this.characterThumbs[_loc4_] = null;
          }
          _loc4_++;
        }
        this.characterThumbs = null;
        if (Boolean(this.rescueThumbs) && this.rescueThumbs.length > 0)
        {
          _loc4_ = 0;
          while (_loc4_ < this.rescueThumbs.length)
          {
            if (this.rescueThumbs[_loc4_] != null)
            {
              this.rescueThumbs[_loc4_].bitmapData.dispose();
              this.rescueThumbs[_loc4_].bitmapData = null;
              this.rescueThumbs[_loc4_].parent.removeChild(this.rescueThumbs[_loc4_]);
              this.rescueThumbs[_loc4_] = null;
            }
            _loc4_++;
          }
          this.rescueThumbs = null;
        }
        if (this.characterModel)
        {
          this.characterModel.parent.removeChild(this.characterModel);
          this.cleanupModel(this.characterModel);
          this.characterModel = null;
        }
        _loc4_ = 0;
        while (_loc4_ < this.leavingModels.length)
        {
          this.leavingModels[_loc4_].parent.removeChild(this.leavingModels[_loc4_]);
          this.cleanupModel(this.leavingModels[_loc4_]);
          this.leavingModels[_loc4_] = null;
          _loc4_++;
        }
        this.leavingModels = null;
      }
    }

    public function updateCharacter(param1:Event):void
    {
      if (this.characterModel != null)
      {
        if (this.characterModel.x > this.characterTargetX)
        {
          this.characterModel.x -= this.characterSpeed;
          if (this.characterModel.x <= this.characterTargetX)
          {
            this.characterModel.x = this.characterTargetX;
            this.characterModel.gotoAndPlay("stand");
            if (this.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex) == "Connor")
            {
              this.characterModel.gotoAndPlay("standconnor");
            }
          }
        }
      }
      var _loc3_:* = int(this.leavingModels.length - 1);
      while (_loc3_ >= 0)
      {
        this.leavingModels[_loc3_].x -= this.characterSpeed;
        if (this.leavingModels[_loc3_].x <= this.characterLeaveX)
        {
          this.leavingModels[_loc3_].parent.removeChild(this.leavingModels[_loc3_]);
          this.cleanupModel(this.leavingModels[_loc3_]);
          this.leavingModels[_loc3_] = null;
          this.leavingModels.splice(_loc3_, 1);
        }
        _loc3_--;
      }
      if (this.clip.character.iris.currentFrameLabel == "stopirisout")
      {
        if (this.isClosing)
        {
          this.isClosing = false;
          this.closeMainMenuScreen();
        }
      }
    }

    public function selectCharacter(param1:Number, param2:Number = 1):void
    {
      var _loc4_:int = 0;
      var _loc5_:CustomerDataFile = null;
      if (!this.isClosing)
      {
        this.lastCharacterIndex = this.selectedCharacterIndex;
        this.selectedCharacterIndex = param1;
        this.selectedStyle = param2;
        _loc4_ = 0;
        while (_loc4_ < this.numCharacters)
        {
          if (_loc4_ == param1)
          {
            this.clip.character["thumb" + _loc4_].hilite.visible = true;
          }
          else
          {
            this.clip.character["thumb" + _loc4_].hilite.visible = false;
          }
          _loc4_++;
        }
        _loc5_ = this.gameObj.var_113.getCustomerData(param1);
        this.clip.character.name_txt.text = _loc5_.customerName;
        this.clip.character.firstgame_txt.text = _loc5_.customerFirstGame;
        this.clip.character.weaponname_txt.text = _loc5_.weaponName;
        if (_loc5_.weaponName == "Pizza Paddle" && param2 == 3)
        {
          this.clip.character.weaponname_txt.text = "Beach Umbrella";
        }
        this.clip.character.skillicon.gotoAndStop(_loc5_.skillType);
        if (_loc5_.skillType == CustomerData.SKILL_CRAWL)
        {
          this.clip.character.skillname_txt.text = "Crawl";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_DOUBLEJUMP)
        {
          this.clip.character.skillname_txt.text = "Jump";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_WALLJUMP)
        {
          this.clip.character.skillname_txt.text = "Wall";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_GLIDE)
        {
          this.clip.character.skillname_txt.text = "Glide";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_POUND)
        {
          this.clip.character.skillname_txt.text = "Pound";
        }
        else if (_loc5_.skillType == CustomerData.SKILL_PUSH)
        {
          this.clip.character.skillname_txt.text = "Push";
        }
        else
        {
          this.clip.character.skillname_txt.text = "None";
        }
        if (this.lastCharacterName == _loc5_.customerName)
        {
          this.buildModel(true);
        }
        else
        {
          this.buildModel();
        }
        this.lastCharacterName = _loc5_.customerName;
        this.gameObj.var_106.selectedCharacter = this.selectedCharacterIndex;
        this.gameObj.var_106.selectedStyle = this.selectedStyle;
        this.updateStyleButtons();
        if (this.shouldShowGameLinks)
        {
          this.clip.character.link_btn.visible = true;
          this.clip.character.underline.visible = true;
          if (_loc5_.customerFirstGame == "Papa Louie")
          {
            this.useWhichLink = this.papalouieLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Pizzeria")
          {
            this.useWhichLink = this.pizzeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Burgeria")
          {
            this.useWhichLink = this.burgeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Taco Mia!")
          {
            this.useWhichLink = this.tacomiaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Freezeria")
          {
            this.useWhichLink = this.freezeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Pancakeria")
          {
            this.useWhichLink = this.pancakeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Wingeria")
          {
            this.useWhichLink = this.wingeriaLink;
          }
          else if (_loc5_.customerFirstGame == "Papa\'s Hot Doggeria")
          {
            this.useWhichLink = this.hotdoggeriaLink;
          }
          else
          {
            this.useWhichLink = "";
            this.clip.character.link_btn.visible = false;
            this.clip.character.underline.visible = false;
          }
          this.clip.character.underline.width = this.clip.character.firstgame_txt.textWidth;
        }
        else
        {
          this.clip.character.link_btn.visible = false;
          this.clip.character.underline.visible = false;
        }
      }
    }

    public function updateStyleButtons():void
    {
      var _loc2_:UserData = this.gameObj.var_106;
      if (this.selectedStyle == 1)
      {
        this.clip.character.styleA.gotoAndStop(1);
      }
      else
      {
        this.clip.character.styleA.gotoAndStop(2);
      }
      if (this.selectedStyle == 2)
      {
        this.clip.character.styleB.gotoAndStop(1);
        this.clip.character.styleB.price_txt.text = "";
      }
      else if (_loc2_.hasOutfitUnlocked(this.selectedCharacterIndex, 1))
      {
        this.clip.character.styleB.gotoAndStop(2);
        this.clip.character.styleB.price_txt.text = "";
      }
      else if (_loc2_.getTotalMoney() >= this.gameObj.var_109.getOutfitPrice(this.selectedCharacterIndex, 1))
      {
        this.clip.character.styleB.gotoAndStop(3);
        this.clip.character.styleB.price_txt.text = this.gameObj.var_109.getOutfitPrice(this.selectedCharacterIndex, 1);
      }
      else
      {
        this.clip.character.styleB.gotoAndStop(4);
        this.clip.character.styleB.price_txt.text = "";
      }
      if (this.selectedStyle == 3)
      {
        this.clip.character.styleC.gotoAndStop(1);
        this.clip.character.styleC.price_txt.text = "";
      }
      else if (_loc2_.hasOutfitUnlocked(this.selectedCharacterIndex, 2))
      {
        this.clip.character.styleC.gotoAndStop(2);
        this.clip.character.styleC.price_txt.text = "";
      }
      else if (_loc2_.getTotalMoney() >= this.gameObj.var_109.getOutfitPrice(this.selectedCharacterIndex, 2))
      {
        this.clip.character.styleC.gotoAndStop(3);
        this.clip.character.styleC.price_txt.text = this.gameObj.var_109.getOutfitPrice(this.selectedCharacterIndex, 2);
      }
      else
      {
        this.clip.character.styleC.gotoAndStop(4);
        this.clip.character.styleC.price_txt.text = "";
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
      var _loc3_:UserData = this.gameObj.var_106;
      this.gameObj.var_105.playSound("buttonclick.wav");
      if (!this.isClosing)
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
        if (!_loc3_.hasOutfitUnlocked(this.selectedCharacterIndex, _loc5_ - 1))
        {
          _loc6_ = _loc3_.purchaseOutfit(this.selectedCharacterIndex, _loc5_ - 1);
          if (_loc6_)
          {
            _loc7_ = true;
            this.gameObj.method_103(false);
          }
        }
        else
        {
          _loc7_ = true;
        }
        if (_loc7_)
        {
          this.selectedStyle = _loc5_;
          this.buildModel(true);
          this.gameObj.var_106.selectedCharacter = this.selectedCharacterIndex;
          this.gameObj.var_106.selectedStyle = this.selectedStyle;
          if (this.gameObj.var_113.getCustomerName(this.selectedCharacterIndex) == "Papa Louie")
          {
            if (this.selectedStyle == 3)
            {
              this.clip.character.weaponname_txt.text = "Beach Umbrella";
            }
            else
            {
              this.clip.character.weaponname_txt.text = "Pizza Paddle";
            }
          }
          if (_loc6_)
          {
            this.gameObj.var_105.playSound("getstar.wav");
            this.clip.character.starburst.gotoAndPlay(2);
            this.clip.character.totalmoney_txt.text = class_10.method_84(_loc3_.getTotalMoney());
          }
          this.updateStyleButtons();
        }
      }
    }

    public function clickCharacterThumb(param1:MouseEvent):void
    {
      var _loc3_:Number = Number(String(MovieClip(param1.currentTarget).name).split("thumb")[1]);
      this.gameObj.var_105.playSound("buttonclick.wav");
      this.gameObj.method_94("character", false);
      this.selectCharacter(_loc3_, this.gameObj.var_106.getBestOutfit(_loc3_));
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
      if (this.useWhichLink != "")
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
      var _loc3_:Boolean = false;
      if (this.characterModel == null)
      {
        _loc3_ = true;
      }
      if (param1 == false && this.characterModel != null)
      {
        this.characterModel.gotoAndPlay("run");
        if (this.gameObj.var_113.getCustomerClipName(this.lastCharacterIndex) == "Connor")
        {
          this.characterModel.gotoAndPlay("runconnor");
        }
        this.leavingModels.push(this.characterModel);
        this.characterModel = null;
      }
      if (param1 == false)
      {
        _loc34_ = this.gameObj.var_113.getCustomerType(this.selectedCharacterIndex);
        if (_loc34_ == CustomerData.WEAPON_SWING1)
        {
          this.characterModel = new customerOneSwingMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_SWING2)
        {
          this.characterModel = new customerTwoSwingMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_SCOOTER)
        {
          this.characterModel = new customerScooterMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_KAHUNA)
        {
          this.characterModel = new customerKahunaMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_WHIP)
        {
          this.characterModel = new customerWhipMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_MELEE)
        {
          this.characterModel = new customerMeleeMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_TOSS)
        {
          this.characterModel = new customerTossMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_LONGGUN)
        {
          this.characterModel = new customerLongGunMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_PISTOL)
        {
          this.characterModel = new customerPistolMC();
        }
        else if (_loc34_ == CustomerData.WEAPON_BAZOOKA)
        {
          this.characterModel = new customerBazookaMC();
        }
        else
        {
          this.characterModel = new customerOneSwingMC();
        }
        this.characterModel.scaleX = 0.57;
        this.characterModel.scaleY = 0.57;
        this.clip.character.charholder.addChild(this.characterModel);
        this.characterModel.x = this.characterStartX;
        this.characterModel.y = this.characterTargetY;
        if (_loc3_)
        {
          this.characterModel.x = this.characterTargetX;
        }
      }
      else
      {
        this.cleanupModel(this.characterModel);
      }
      var _loc4_:String = this.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex);
      class_9.method_119(this.characterModel, "CharacterModel_" + _loc4_ + "_" + getTimer());
      if (this.selectedStyle == 2)
      {
        _loc4_ += "2";
      }
      else if (this.selectedStyle == 3)
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
      var _loc30_:String = this.gameObj.var_113.getWeaponClipName(this.selectedCharacterIndex, this.selectedStyle);
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
      var _loc33_:String = this.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex);
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
        if (this.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex) == "Connor")
        {
          this.characterModel.gotoAndPlay("runconnor");
        }
      }
      else if (_loc3_)
      {
        this.characterModel.gotoAndStop(1);
        this.characterModel.gotoAndPlay("stand");
        if (this.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex) == "Connor")
        {
          this.characterModel.gotoAndPlay("standconnor");
        }
      }
      else if (param1)
      {
        if (this.characterModel.x != this.characterTargetX)
        {
          this.characterModel.gotoAndStop(1);
          this.characterModel.gotoAndPlay("run");
          if (this.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex) == "Connor")
          {
            this.characterModel.gotoAndPlay("runconnor");
          }
        }
        else
        {
          this.characterModel.gotoAndStop(1);
          this.characterModel.gotoAndPlay("stand");
          if (this.gameObj.var_113.getCustomerClipName(this.selectedCharacterIndex) == "Connor")
          {
            this.characterModel.gotoAndPlay("standconnor");
          }
        }
      }
      this.characterModel.mouseEnabled = false;
      this.characterModel.mouseChildren = false;
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
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:DataManager = this.gameObj.var_109;
      if (param1 && _loc4_.currentWorldData != null)
      {
        this.rescueThumbs = new Vector.<Bitmap>();
        _loc7_ = _loc4_.currentLevel;
        this.clip.info.title_txt.text = this.gameObj.var_109.getWorldTitle(_loc7_);
        this.clip.info.levelnum_txt.text = String(_loc7_ + 1);
        if (_loc7_ == 9)
        {
          this.clip.info.levelnum_txt.text = "X";
        }
        this.clip.info.score_txt.text = class_10.method_84(_loc3_.getLevelHighScore(_loc7_));
        _loc8_ = this.gameObj.var_113.getCustomerData(_loc3_.selectedCharacter);
        this.clip.info.currentstyle.gotoAndStop(_loc3_.selectedStyle);
        this.clip.info.name_txt.text = _loc8_.customerName;
        this.clip.info.weaponname_txt.text = _loc8_.weaponName;
        if (_loc8_.weaponName == "Pizza Paddle" && _loc3_.selectedStyle == 3)
        {
          this.clip.info.weaponname_txt.text = "Beach Umbrella";
        }
        this.clip.info.skillicon.gotoAndStop(_loc8_.skillType);
        if (_loc8_.skillType == CustomerData.SKILL_CRAWL)
        {
          this.clip.info.skillname_txt.text = "Crawl";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_DOUBLEJUMP)
        {
          this.clip.info.skillname_txt.text = "Jump";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_WALLJUMP)
        {
          this.clip.info.skillname_txt.text = "Wall";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_GLIDE)
        {
          this.clip.info.skillname_txt.text = "Glide";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_POUND)
        {
          this.clip.info.skillname_txt.text = "Pound";
        }
        else if (_loc8_.skillType == CustomerData.SKILL_PUSH)
        {
          this.clip.info.skillname_txt.text = "Push";
        }
        else
        {
          this.clip.info.skillname_txt.text = "None";
        }
        class_7.method_1("Setup Challenges for level: " + _loc7_);
        _loc6_ = 1;
        while (_loc6_ <= 6)
        {
          if (_loc3_.hasCompletedChallenge(_loc7_, _loc6_))
          {
            this.clip.info["icon" + _loc6_].gotoAndStop(2);
          }
          else
          {
            this.clip.info["icon" + _loc6_].gotoAndStop(1);
          }
          this.clip.info["icon" + _loc6_].num_txt.text = String(_loc6_);
          _loc10_ = this.clip.info["panel" + _loc6_];
          _loc11_ = this.gameObj.var_112.getChallengeType(_loc7_, _loc6_);
          _loc12_ = this.gameObj.var_112.getChallengeTargetAmount(_loc7_, _loc6_);
          _loc13_ = this.gameObj.var_112.getChallengeSkillNeeded(_loc7_, _loc6_);
          if (_loc11_ == Challenge.RESCUE)
          {
            _loc10_.description_txt.text = "Rescue:";
            _loc14_ = this.gameObj.var_113.getTrappedCustomerIndex(_loc7_, _loc6_);
            _loc15_ = this.gameObj.var_113.getCustomerBitmap(_loc14_);
            _loc16_ = new Bitmap(_loc15_);
            _loc16_.x = -8;
            _loc16_.y = -8;
            if (this.gameObj.var_113.getCustomerName(_loc14_) == "Georgito" || this.gameObj.var_113.getCustomerName(_loc14_) == "Yippy" || this.gameObj.var_113.getCustomerName(_loc14_) == "Greg")
            {
              _loc16_.y -= 8;
            }
            _loc10_.icon.gotoAndStop(1);
            _loc10_.icon.holder.addChild(_loc16_);
            _loc10_.icon.holder.mask = _loc10_.icon.masker;
            this.rescueThumbs.push(_loc16_);
          }
          else if (_loc11_ == Challenge.BURGERZILLAS)
          {
            _loc10_.description_txt.text = this.gameObj.var_112.getChallengeTallyString(_loc7_, _loc6_);
            _loc10_.icon.gotoAndStop(2);
          }
          else if (_loc11_ == Challenge.COINS)
          {
            _loc10_.description_txt.text = this.gameObj.var_112.getChallengeTallyString(_loc7_, _loc6_);
            _loc10_.icon.gotoAndStop(3);
          }
          else
          {
            _loc10_.description_txt.text = this.gameObj.var_112.getChallengeTallyString(_loc7_, _loc6_);
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
            this.clip.info["icon" + _loc6_].visible = false;
          }
          _loc6_++;
        }
        this.clip.info.points_txt.text = class_10.method_84(_loc3_.getCurrentPoints());
        _loc9_ = 0;
        if (this.gameObj.var_108)
        {
          _loc9_ = this.gameObj.var_108.gameplayTimer;
        }
        this.clip.info.time_txt.text = class_10.method_109(_loc9_, true);
        this.clip.info.coins_txt.text = class_10.method_84(_loc3_.getCurrentMoney());
        this.clip.info.totalpoints_txt.text = class_10.method_84(_loc3_.getTotalScore());
        this.clip.info.totaltime_txt.text = class_10.method_109(_loc3_.totalTimePlayed.value, true, true);
        this.clip.info.totalcoins_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        this.clip.info.totalwarpcoins_txt.text = _loc3_.getWarpCoins() + "/50";
        this.clip.info.totalcustomers_txt.text = _loc3_.getTotalCustomersUnlocked() + "/28";
        this.infoModel = this.buildInfoModel(_loc3_.selectedCharacter, _loc3_.selectedStyle);
        this.clip.info.addChild(this.infoModel);
        this.infoModel.x = 555;
        this.infoModel.y = 80;
        this.infoModel.mouseEnabled = false;
        this.infoModel.mouseChildren = false;
        class_9.method_119(this.infoModel, "InfoModel" + getTimer());
      }
      else if (param1)
      {
        class_7.method_1("No area screen.");
      }
      else if (!param1)
      {
        if (Boolean(this.rescueThumbs) && this.rescueThumbs.length > 0)
        {
          _loc6_ = 0;
          while (_loc6_ < this.rescueThumbs.length)
          {
            if (this.rescueThumbs[_loc6_] != null)
            {
              this.rescueThumbs[_loc6_].bitmapData.dispose();
              this.rescueThumbs[_loc6_].bitmapData = null;
              this.rescueThumbs[_loc6_].parent.removeChild(this.rescueThumbs[_loc6_]);
              this.rescueThumbs[_loc6_] = null;
            }
            _loc6_++;
          }
          this.rescueThumbs = null;
        }
        if (this.infoModel != null)
        {
          this.clip.info.removeChild(this.infoModel);
          this.cleanupInfoModel(this.infoModel);
          this.infoModel = null;
        }
      }
    }

    public function setupMapUpsell(param1:Boolean = true):void
    {
      var _loc3_:MovieClip = this.clip.map.upsellMC;
      if (param1)
      {
        _loc3_.appstore_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellAppstore);
        _loc3_.amazon_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellAmazon);
        _loc3_.googleplay_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellGooglePlay);
        _loc3_.kindle_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellKindle);
        _loc3_.moreinfo_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellMoreInfo);
        _loc3_.thumb.addEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellImage);
        _loc3_.thumb.buttonMode = true;
        _loc3_.thumb.useHandCursor = true;
        this.useWhichUpsell = Math.ceil(Math.random() * 2);
        _loc3_.thumb.gotoAndStop(this.useWhichUpsell);
        if (this.useWhichUpsell == 1)
        {
          _loc3_.appstore_btn.visible = true;
          _loc3_.amazon_btn.visible = false;
          _loc3_.googleplay_btn.visible = false;
          _loc3_.kindle_btn.visible = true;
        }
        else if (this.useWhichUpsell == 2)
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
        _loc3_.appstore_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellAppstore);
        _loc3_.amazon_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellAmazon);
        _loc3_.googleplay_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellGooglePlay);
        _loc3_.kindle_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellKindle);
        _loc3_.moreinfo_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellMoreInfo);
        _loc3_.thumb.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickUpsellImage);
      }
    }

    public function clickUpsellAppstore(param1:MouseEvent):void
    {
      if (this.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8","iPadPromoAd","Links");
      }
      else if (this.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("https://itunes.apple.com/us/app/papas-burgeria-to-go!/id600626116?ls=1&mt=8","iOSPromoToGo","Links");
      }
    }

    public function clickUpsellGooglePlay(param1:MouseEvent):void
    {
      if (this.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://play.google.com/store/apps/details?id=air.com.flipline.papasburgeria","GooglePromoAd","Links");
      }
      else if (this.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("https://play.google.com/store/apps/details?id=air.com.flipline.papasburgeriatogo","GooglePromoToGo","Links");
      }
    }

    public function clickUpsellAmazon(param1:MouseEvent):void
    {
      if (this.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00AI13AFS/ref=mas_pm_Papas_Burgeria","AmazonPromoAd","Links");
      }
      else if (this.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00BI3PT7W/ref=mas_pm_Papas_Burgeria_To_Go","AmazonPromoToGo","Links");
      }
    }

    public function clickUpsellKindle(param1:MouseEvent):void
    {
      if (this.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00AI13AFS/ref=mas_pm_Papas_Burgeria","KindlePromoAd","Links");
      }
      else if (this.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.amazon.com/gp/product/B00BI3PT7W/ref=mas_pm_Papas_Burgeria_To_Go","KindlePromoToGo","Links");
      }
    }

    public function clickUpsellMoreInfo(param1:MouseEvent):void
    {
      if (this.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.papasburgeria.com/hd","PromoMoreInfoHD","Links");
      }
      else if (this.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.papasburgeria.com/togo","PromoMoreInfoToGo","Links");
      }
    }

    public function clickUpsellImage(param1:MouseEvent):void
    {
      if (this.useWhichUpsell == 1)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://itunes.apple.com/us/app/papas-burgeria/id514634235?ls=1&mt=8","iPadPromoAd","Links");
      }
      else if (this.useWhichUpsell == 2)
      {
        // _loc2_.gameObj.var_107.api.method_83("https://itunes.apple.com/us/app/papas-burgeria-to-go!/id600626116?ls=1&mt=8","iOSPromoToGo","Links");
      }
    }

    public function setupMap(param1:Boolean = true):void
    {
      ExternalInterface.call("markPlayerLoaded")
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:Number = NaN;
      var _loc8_:String = null;
      var _loc9_:MovieClip = null;
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:DataManager = this.gameObj.var_109;
      if (param1)
      {
        this.gameObj.var_106.unlockNextLevel();
        this.setupMapUpsell(true);
        this.clip.map.score_txt.text = class_10.method_84(_loc3_.getTotalScore()) + " PTS";
        this.clip.map.coins_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        this.clip.map.warpcoins_txt.text = _loc3_.getWarpCoins();
        this.clip.map.rollover_bubble.visible = false;
        this.clip.map.rollover_bubble.mouseEnabled = false;
        this.clip.map.rollover_bubble.mouseChildren = false;
        _loc7_ = -1;
        _loc5_ = 0;
        while (_loc5_ < 10)
        {
          _loc9_ = this.clip.map["world" + (_loc5_ + 1)];
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
            _loc9_.btn.addEventListener(MouseEvent.CLICK, this.clickPlayMap);
            _loc9_.btn.addEventListener(MouseEvent.ROLL_OVER, this.rolloverMapButton);
            _loc9_.btn.addEventListener(MouseEvent.ROLL_OUT, this.rolloutMapButton);
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
            if (this.gameObj.var_109.checkpointData != null && this.gameObj.var_109.checkpointData.whichLevel == _loc5_)
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
        if (this.gameObj.var_106.lastAreaRevealed == _loc7_)
        {
          this.clip.map.gotoAndStop("ready" + _loc8_);
          this.willRevealMap = false;
        }
        else
        {
          this.clip.map.gotoAndPlay("unlock" + _loc8_);
          this.willRevealMap = true;
        }
        this.mapLastUnlocked = _loc7_;
      }
      else
      {
        this.setupMapUpsell(false);
        _loc5_ = 1;
        while (_loc5_ <= 10)
        {
          if (this.clip.map["world" + _loc5_].btn.hasEventListener(MouseEvent.CLICK))
          {
            this.clip.map["world" + _loc5_].btn.removeEventListener(MouseEvent.CLICK, this.clickPlayMap);
          }
          if (this.clip.map["world" + _loc5_].btn.hasEventListener(MouseEvent.ROLL_OVER))
          {
            this.clip.map["world" + _loc5_].btn.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverMapButton);
          }
          if (this.clip.map["world" + _loc5_].btn.hasEventListener(MouseEvent.ROLL_OUT))
          {
            this.clip.map["world" + _loc5_].btn.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutMapButton);
          }
          _loc5_++;
        }
      }
    }

    public function rolloverMapButton(param1:MouseEvent):void
    {
      var _loc3_:Number = Number(String(param1.currentTarget.parent.name).split("world")[1] - 1);
      var _loc4_:int = 1;
      while (_loc4_ <= 6)
      {
        if (this.gameObj.var_106.hasCompletedChallenge(_loc3_, _loc4_))
        {
          this.clip.map.rollover_bubble.inside["chal" + _loc4_].gotoAndStop(2);
        }
        else
        {
          this.clip.map.rollover_bubble.inside["chal" + _loc4_].gotoAndStop(1);
        }
        this.clip.map.rollover_bubble.inside["chal" + _loc4_].visible = true;
        this.clip.map.rollover_bubble.inside["chal" + _loc4_].num_txt.text = String(_loc4_);
        if (_loc3_ == 8)
        {
          if (_loc4_ == 1)
          {
            this.clip.map.rollover_bubble.inside["chal" + _loc4_].x = 13;
          }
          else
          {
            this.clip.map.rollover_bubble.inside["chal" + _loc4_].visible = false;
          }
        }
        else if (_loc3_ == 9)
        {
          this.clip.map.rollover_bubble.inside["chal" + _loc4_].visible = false;
        }
        else if (_loc4_ == 1)
        {
          this.clip.map.rollover_bubble.inside["chal" + _loc4_].x = -22.75;
        }
        _loc4_++;
      }
      this.clip.map.rollover_bubble.visible = true;
      this.clip.map.rollover_bubble.gotoAndPlay(1);
      this.clip.map.rollover_bubble.x = param1.currentTarget.parent.x;
      this.clip.map.rollover_bubble.y = param1.currentTarget.parent.y;
    }

    public function rolloutMapButton(param1:MouseEvent):void
    {
      this.clip.map.rollover_bubble.visible = false;
    }

    public function clickPlayMap(param1:MouseEvent):void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = -1;
      _loc3_ = 1;
      while (_loc3_ <= 10)
      {
        if (param1.currentTarget == this.clip.map["world" + _loc3_].btn)
        {
          _loc4_ = _loc3_ - 1;
          break;
        }
        _loc3_++;
      }
      if (_loc4_ > -1)
      {
        this.whichLevel = _loc4_;
        this.gameObj.var_106.hasRevealedLatestArea = true;
        if (this.mapLastUnlocked > this.gameObj.var_106.lastAreaRevealed)
        {
          this.gameObj.var_106.lastAreaRevealed = this.mapLastUnlocked;
        }
        this.gameObj.var_105.playSound("buttonclick.wav");
        this.gameObj.method_94("nowarpkeys", false);
        this.isOpeningMapDetail = true;
        this.gameObj.var_107.api.method_85("MapSelectMenu", {
              "section": "character",
              "useLevel": this.whichLevel,
              "isCharSelect": true
            });
        this.gameObj.var_107.api.method_86("MainMenu");
      }
    }

    public function clickStartLevel(param1:Event):void
    {
      this.isStartingLevel = true;
      this.gameObj.method_94("challenges", false);
      this.gameObj.method_103(false);
      this.gameObj.var_106.customersUsed[this.selectedCharacterIndex] = 1;
      this.isClosing = true;
      this.gameObj.var_107.api.method_105();
      this.clip.character.iris.gotoAndPlay("irisout");
    }

    public function setupCredits(param1:Boolean = true):void
    {
      if (param1)
      {
        this.clip.credits.flipline1_btn.addEventListener(MouseEvent.CLICK, this.clickCreditsFlipline);
        this.clip.credits.flipline2_btn.addEventListener(MouseEvent.CLICK, this.clickCreditsFlipline);
        this.clip.credits.links.flipline3_btn.addEventListener(MouseEvent.CLICK, this.clickCreditsFlipline);
        this.clip.credits.links.papalouie_btn.addEventListener(MouseEvent.CLICK, this.clickCreditsPapaLouie);
        this.clip.credits.facebook_btn.addEventListener(MouseEvent.CLICK, this.clickFacebook);
        this.clip.credits.twitter_btn.addEventListener(MouseEvent.CLICK, this.clickTwitter);
        if (class_1.method_63() == false)
        {
          this.clip.credits.flipline1_btn.visible = false;
          this.clip.credits.flipline2_btn.visible = false;
          this.clip.credits.links.visible = false;
          this.clip.credits.facebook_btn.visible = false;
          this.clip.credits.twitter_btn.visible = false;
        }
      }
      else
      {
        this.clip.credits.flipline1_btn.removeEventListener(MouseEvent.CLICK, this.clickCreditsFlipline);
        this.clip.credits.flipline2_btn.removeEventListener(MouseEvent.CLICK, this.clickCreditsFlipline);
        this.clip.credits.links.flipline3_btn.removeEventListener(MouseEvent.CLICK, this.clickCreditsFlipline);
        this.clip.credits.links.papalouie_btn.removeEventListener(MouseEvent.CLICK, this.clickCreditsPapaLouie);
        this.clip.credits.facebook_btn.removeEventListener(MouseEvent.CLICK, this.clickFacebook);
        this.clip.credits.twitter_btn.removeEventListener(MouseEvent.CLICK, this.clickTwitter);
      }
    }

    public function clickCreditsFlipline(param1:MouseEvent):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.flipline.com","CreditsFlipline","Links");
    }

    public function clickCreditsPapaLouie(param1:MouseEvent):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.papalouie.com","CreditsPapaLouie","Links");
    }

    public function clickFacebook(param1:MouseEvent):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.facebook.com/pages/Flipline-Studios/121045844606187","CreditsFliplineFacebook","Links");
    }

    public function clickTwitter(param1:MouseEvent):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      // _loc2_.gameObj.var_107.api.method_83("http://www.twitter.com/FliplineStudios","CreditsFliplineTwitter","Links");
    }

    public function setupHelp(param1:Boolean = true):void
    {
      var _loc3_:int = 0;
      var _loc4_:Array = ["Moving", "Attacking", "Checkpoints", "Challenges", "Unlocking Levels", "Rescuing Customers", "Customer Skills", "Buying Outfit Styles"];
      _loc4_.push("Ground Pound", "Gliding", "Double Jump", "Crawling", "Wall Jump", "Pushing");
      _loc4_.push("Badges", "Baddies", "Controls", "Saving");
      if (param1)
      {
        _loc3_ = 1;
        while (_loc3_ <= _loc4_.length)
        {
          this.clip.help.tabholder["tab" + _loc3_].addEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTab);
          this.clip.help.tabholder["tab" + _loc3_].addEventListener(MouseEvent.ROLL_OVER, this.rolloverHelpTab);
          this.clip.help.tabholder["tab" + _loc3_].addEventListener(MouseEvent.ROLL_OUT, this.rolloutHelpTab);
          this.clip.help.tabholder["tab" + _loc3_].mouseEnabled = true;
          this.clip.help.tabholder["tab" + _loc3_].mouseChildren = false;
          this.clip.help.tabholder["tab" + _loc3_].buttonMode = true;
          this.clip.help.tabholder["tab" + _loc3_].useHandCursor = true;
          this.clip.help.tabholder["tab" + _loc3_].name_txt.htmlText = "<b>" + _loc4_[_loc3_ - 1] + "</b>";
          this.clip.help.tabholder["tab" + _loc3_].hilite.visible = false;
          this.clip.help.tabholder["tab" + _loc3_].arrow.visible = false;
          _loc3_++;
        }
        this.setupHelpKeys();
        this.clip.help.tabholder.mask = this.clip.help.tabmasker;
        this.clip.help.side_scrollpanel.scroll_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTabDragger);
        this.clip.help.side_scrollpanel.scroll_btn.y = this.helpScrollStart;
        this.clip.help.side_scrollpanel.scroll_btn.mouseEnabled = true;
        this.clip.help.side_scrollpanel.up_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTabArrow);
        this.clip.help.side_scrollpanel.down_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTabArrow);
        this.clip.help.mainpanel.mask = this.clip.help.mainmasker;
        this.clip.help.main_scrollpanel.scroll_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpMainDragger);
        this.clip.help.main_scrollpanel.scroll_btn.y = this.helpScrollStart;
        this.clip.help.main_scrollpanel.scroll_btn.mouseEnabled = true;
        this.clip.help.main_scrollpanel.up_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpMainArrow);
        this.clip.help.main_scrollpanel.down_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpMainArrow);
        this.showHelp(1);
        if (this.params != null && this.params.hasOwnProperty("useSection") && this.params.useSection == "help")
        {
          this.showHelp(15);
          this.clip.help.tabholder.y = this.clip.help.tabmasker.y - (this.clip.help.tabholder.height - this.clip.help.tabmasker.height);
          this.holdHelpTabArrow(null);
        }
      }
      else
      {
        _loc3_ = 1;
        while (_loc3_ <= _loc4_.length)
        {
          this.clip.help.tabholder["tab" + _loc3_].removeEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTab);
          this.clip.help.tabholder["tab" + _loc3_].removeEventListener(MouseEvent.ROLL_OVER, this.rolloverHelpTab);
          this.clip.help.tabholder["tab" + _loc3_].removeEventListener(MouseEvent.ROLL_OUT, this.rolloutHelpTab);
          _loc3_++;
        }
        this.clip.help.side_scrollpanel.scroll_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTabDragger);
        this.clip.help.side_scrollpanel.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTabArrow);
        this.clip.help.side_scrollpanel.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpTabArrow);
        this.clip.help.main_scrollpanel.scroll_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpMainDragger);
        this.clip.help.main_scrollpanel.up_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpMainArrow);
        this.clip.help.main_scrollpanel.down_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickHelpMainArrow);
      }
    }

    public function setupHelpKeys():void
    {
      var _loc5_:String = null;
      var _loc2_:Array = ["left", "right", "up", "down", "down2", "down3", "jump", "jump2", "attack"];
      var _loc3_:Array = [DataManager.KEY_LEFT, DataManager.KEY_RIGHT, DataManager.KEY_UP, DataManager.KEY_DOWN, DataManager.KEY_DOWN, DataManager.KEY_DOWN, DataManager.KEY_JUMP, DataManager.KEY_JUMP, DataManager.KEY_ATTACK];
      var _loc4_:int = 0;
      while (_loc4_ < _loc2_.length)
      {
        _loc5_ = this.gameObj.var_109.getKeyLabel(_loc3_[_loc4_]);
        if (_loc5_ != "")
        {
          this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].visible = true;
          if (_loc5_ == "Left" || _loc5_ == "Right" || _loc5_ == "Up" || _loc5_ == "Down")
          {
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].gotoAndStop(_loc5_.toLowerCase());
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.visible = false;
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.visible = false;
          }
          else if (_loc5_.length > 1)
          {
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].gotoAndStop("wide");
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.visible = false;
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.visible = true;
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.text = _loc5_;
          }
          else
          {
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].gotoAndStop("other");
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.visible = true;
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].letter_txt.text = _loc5_;
            this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].word_txt.visible = false;
          }
        }
        else
        {
          this.clip.help.mainpanel["key_" + _loc2_[_loc4_]].visible = false;
        }
        _loc4_++;
      }
    }

    public function clickHelpTabDragger(param1:MouseEvent):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      this.clip.help.side_scrollpanel.scroll_btn.startDrag(false, new Rectangle(0, 30, 0, this.helpScrollRange));
      this.clip.help.side_scrollpanel.scroll_btn.addEventListener(Event.ENTER_FRAME, this.dragHelpTabDragger);
      this.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, this.releaseHelpTabDragger);
    }

    public function releaseHelpTabDragger(param1:MouseEvent):void
    {
      this.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, this.releaseHelpTabDragger);
      this.clip.help.side_scrollpanel.scroll_btn.removeEventListener(Event.ENTER_FRAME, this.dragHelpTabDragger);
      this.clip.help.side_scrollpanel.scroll_btn.stopDrag();
    }

    public function dragHelpTabDragger(param1:Event):void
    {
      var _loc3_:Number = (this.clip.help.side_scrollpanel.scroll_btn.y - this.helpScrollStart) / this.helpScrollRange;
      this.clip.help.tabholder.y = this.clip.help.tabmasker.y - (this.clip.help.tabholder.height - this.clip.help.tabmasker.height) * _loc3_;
    }

    public function clickHelpTabArrow(param1:MouseEvent):void
    {
      var _loc3_:String = param1.currentTarget.name;
      this.gameObj.var_105.playSound("buttonclick.wav");
      if (_loc3_ == "up_btn")
      {
        this.helpTabScrollDir = -1;
      }
      else if (_loc3_ == "down_btn")
      {
        this.helpTabScrollDir = 1;
      }
      this.clip.help.tabholder.addEventListener(Event.ENTER_FRAME, this.holdHelpTabArrow);
      this.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, this.releaseHelpTabArrow);
    }

    public function releaseHelpTabArrow(param1:MouseEvent):void
    {
      this.helpTabScrollDir = 0;
      this.clip.help.tabholder.removeEventListener(Event.ENTER_FRAME, this.holdHelpTabArrow);
      this.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, this.releaseHelpTabArrow);
    }

    public function holdHelpTabArrow(param1:Event):void
    {
      var _loc3_:Number = Number(this.clip.help.tabmasker.y);
      var _loc4_:Number = this.clip.help.tabmasker.y - (this.clip.help.tabholder.height - this.clip.help.tabmasker.height);
      if (this.helpTabScrollDir == 1)
      {
        this.clip.help.tabholder.y -= 8;
      }
      else if (this.helpTabScrollDir == -1)
      {
        this.clip.help.tabholder.y += 8;
      }
      if (this.clip.help.tabholder.y < _loc4_)
      {
        this.clip.help.tabholder.y = _loc4_;
        this.helpTabScrollDir = 0;
      }
      else if (this.clip.help.tabholder.y > _loc3_)
      {
        this.clip.help.tabholder.y = _loc3_;
        this.helpTabScrollDir = 0;
      }
      var _loc5_:Number = Math.abs((this.clip.help.tabholder.y - _loc3_) / (_loc4_ - _loc3_));
      this.clip.help.side_scrollpanel.scroll_btn.y = this.helpScrollStart + _loc5_ * this.helpScrollRange;
    }

    public function clickHelpMainDragger(param1:MouseEvent):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      this.clip.help.main_scrollpanel.scroll_btn.startDrag(false, new Rectangle(0, 30, 0, this.helpScrollRange));
      this.clip.help.main_scrollpanel.scroll_btn.addEventListener(Event.ENTER_FRAME, this.dragHelpMainDragger);
      this.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, this.releaseHelpMainDragger);
    }

    public function releaseHelpMainDragger(param1:MouseEvent):void
    {
      this.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, this.releaseHelpMainDragger);
      this.clip.help.main_scrollpanel.scroll_btn.removeEventListener(Event.ENTER_FRAME, this.dragHelpMainDragger);
      this.clip.help.main_scrollpanel.scroll_btn.stopDrag();
    }

    public function dragHelpMainDragger(param1:Event):void
    {
      var _loc3_:Number = (this.clip.help.main_scrollpanel.scroll_btn.y - this.helpScrollStart) / this.helpScrollRange;
      this.clip.help.mainpanel.y = this.clip.help.mainmasker.y - (this.clip.help.mainpanel.height - this.clip.help.mainmasker.height) * _loc3_;
    }

    public function clickHelpMainArrow(param1:MouseEvent):void
    {
      var _loc3_:String = param1.currentTarget.name;
      this.gameObj.var_105.playSound("buttonclick.wav");
      if (_loc3_ == "up_btn")
      {
        this.helpMainScrollDir = -1;
      }
      else if (_loc3_ == "down_btn")
      {
        this.helpMainScrollDir = 1;
      }
      this.clip.help.mainpanel.addEventListener(Event.ENTER_FRAME, this.holdHelpMainArrow);
      this.gameObj.stage.addEventListener(MouseEvent.MOUSE_UP, this.releaseHelpMainArrow);
    }

    public function releaseHelpMainArrow(param1:MouseEvent):void
    {
      this.helpTabScrollDir = 0;
      this.clip.help.mainpanel.removeEventListener(Event.ENTER_FRAME, this.holdHelpMainArrow);
      this.gameObj.stage.removeEventListener(MouseEvent.MOUSE_UP, this.releaseHelpMainArrow);
    }

    public function holdHelpMainArrow(param1:Event):void
    {
      var _loc3_:Number = Number(this.clip.help.mainmasker.y);
      var _loc4_:Number = this.clip.help.mainmasker.y - (this.clip.help.mainpanel.height - this.clip.help.mainmasker.height);
      if (this.helpMainScrollDir == 1)
      {
        this.clip.help.mainpanel.y -= 8;
      }
      else if (this.helpMainScrollDir == -1)
      {
        this.clip.help.mainpanel.y += 8;
      }
      if (this.clip.help.mainpanel.y < _loc4_)
      {
        this.clip.help.mainpanel.y = _loc4_;
        this.helpMainScrollDir = 0;
      }
      else if (this.clip.help.mainpanel.y > _loc3_)
      {
        this.clip.help.mainpanel.y = _loc3_;
        this.helpMainScrollDir = 0;
      }
      var _loc5_:Number = Math.abs((this.clip.help.mainpanel.y - _loc3_) / (_loc4_ - _loc3_));
      this.clip.help.main_scrollpanel.scroll_btn.y = this.helpScrollStart + _loc5_ * this.helpScrollRange;
    }

    public function clickHelpTab(param1:MouseEvent):void
    {
      var _loc3_:Number = Number(MovieClip(param1.currentTarget).name.split("tab")[1]);
      this.gameObj.var_105.playSound("buttonclick.wav");
      this.showHelp(_loc3_);
    }

    public function rolloverHelpTab(param1:MouseEvent):void
    {
      MovieClip(param1.currentTarget).hilite.visible = true;
    }

    public function rolloutHelpTab(param1:MouseEvent):void
    {
      var _loc3_:Number = Number(MovieClip(param1.currentTarget).name.split("tab")[1]);
      if (this.helpIndex != _loc3_)
      {
        MovieClip(param1.currentTarget).hilite.visible = false;
      }
    }

    public function showHelp(param1:Number):void
    {
      var _loc3_:int = 0;
      this.helpIndex = param1;
      _loc3_ = 1;
      while (_loc3_ <= 18)
      {
        if (_loc3_ == param1)
        {
          this.clip.help.tabholder["tab" + _loc3_].hilite.visible = true;
          this.clip.help.tabholder["tab" + _loc3_].arrow.visible = true;
        }
        else
        {
          this.clip.help.tabholder["tab" + _loc3_].hilite.visible = false;
          this.clip.help.tabholder["tab" + _loc3_].arrow.visible = false;
        }
        _loc3_++;
      }
      this.clip.help.mainpanel.gotoAndStop(this.helpIndex);
      this.clip.help.mainpanel.y = this.clip.help.mainmasker.y;
      this.clip.help.main_scrollpanel.scroll_btn.y = this.helpScrollStart;
    }

    public function setupControls(param1:Boolean = true):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:DataManager = this.gameObj.var_109;
      if (param1)
      {
        this.clip.controls.attack_txt.text = _loc4_.getKeyLabel(DataManager.KEY_ATTACK);
        this.clip.controls.jump_txt.text = _loc4_.getKeyLabel(DataManager.KEY_JUMP);
        this.clip.controls.down_txt.text = _loc4_.getKeyLabel(DataManager.KEY_DOWN);
        this.clip.controls.up_txt.text = _loc4_.getKeyLabel(DataManager.KEY_UP);
        this.clip.controls.left_txt.text = _loc4_.getKeyLabel(DataManager.KEY_LEFT);
        this.clip.controls.right_txt.text = _loc4_.getKeyLabel(DataManager.KEY_RIGHT);
        this.clip.controls.attack_btn.addEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.jump_btn.addEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.down_btn.addEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.up_btn.addEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.left_btn.addEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.right_btn.addEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.attack_btn.addEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.jump_btn.addEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.down_btn.addEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.up_btn.addEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.left_btn.addEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.right_btn.addEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.attack_btn.addEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.jump_btn.addEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.down_btn.addEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.up_btn.addEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.left_btn.addEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.right_btn.addEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.attack_btn.buttonMode = true;
        this.clip.controls.jump_btn.buttonMode = true;
        this.clip.controls.down_btn.buttonMode = true;
        this.clip.controls.up_btn.buttonMode = true;
        this.clip.controls.left_btn.buttonMode = true;
        this.clip.controls.right_btn.buttonMode = true;
        this.clip.controls.attack_btn.useHandCursor = true;
        this.clip.controls.jump_btn.useHandCursor = true;
        this.clip.controls.down_btn.useHandCursor = true;
        this.clip.controls.up_btn.useHandCursor = true;
        this.clip.controls.left_btn.useHandCursor = true;
        this.clip.controls.right_btn.useHandCursor = true;
        this.clip.controls.attack_btn.tabEnabled = false;
        this.clip.controls.jump_btn.tabEnabled = false;
        this.clip.controls.down_btn.tabEnabled = false;
        this.clip.controls.up_btn.tabEnabled = false;
        this.clip.controls.left_btn.tabEnabled = false;
        this.clip.controls.right_btn.tabEnabled = false;
        this.clip.controls.attack_btn.gotoAndStop("click");
        this.clip.controls.jump_btn.gotoAndStop("click");
        this.clip.controls.down_btn.gotoAndStop("click");
        this.clip.controls.up_btn.gotoAndStop("click");
        this.clip.controls.left_btn.gotoAndStop("click");
        this.clip.controls.right_btn.gotoAndStop("click");
      }
      else
      {
        this.clip.controls.attack_btn.removeEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.jump_btn.removeEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.down_btn.removeEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.up_btn.removeEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.left_btn.removeEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.right_btn.removeEventListener(MouseEvent.CLICK, this.clickControlsButton);
        this.clip.controls.attack_btn.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.jump_btn.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.down_btn.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.up_btn.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.left_btn.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.right_btn.removeEventListener(MouseEvent.ROLL_OVER, this.rolloverControlsButton);
        this.clip.controls.attack_btn.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.jump_btn.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.down_btn.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.up_btn.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.left_btn.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        this.clip.controls.right_btn.removeEventListener(MouseEvent.ROLL_OUT, this.rolloutControlsButton);
        try
        {
          this.gameObj.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.controlsKeyListener);
        }
        catch (err:Error)
        {
        }
      }
    }

    public function clickControlsButton(param1:MouseEvent):void
    {
      var _loc3_:String = null;
      if (this.settingWhichKey == "none")
      {
        param1.currentTarget.gotoAndStop("presskey");
        _loc3_ = param1.currentTarget.name.split("_")[0];
        this.settingWhichKey = _loc3_;
        this.gameObj.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.controlsKeyListener);
      }
    }

    public function cancelSettingControls():void
    {
      if (this.settingWhichKey != "none")
      {
        try
        {
          this.gameObj.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.controlsKeyListener);
        }
        catch (err:Error)
        {
        }
        this.clip.controls.attack_btn.gotoAndStop("click");
        this.clip.controls.jump_btn.gotoAndStop("click");
        this.clip.controls.down_btn.gotoAndStop("click");
        this.clip.controls.up_btn.gotoAndStop("click");
        this.clip.controls.left_btn.gotoAndStop("click");
        this.clip.controls.right_btn.gotoAndStop("click");
        this.settingWhichKey = "none";
      }
    }

    public function controlsKeyListener(param1:KeyboardEvent):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:DataManager = this.gameObj.var_109;
      var _loc5_:Boolean = _loc3_.setKey(param1.keyCode, this.settingWhichKey);
      if (_loc5_)
      {
        this.clip.controls[this.settingWhichKey + "_btn"].gotoAndStop("click");
        this.clip.controls.attack_txt.text = _loc4_.getKeyLabel(DataManager.KEY_ATTACK);
        this.clip.controls.jump_txt.text = _loc4_.getKeyLabel(DataManager.KEY_JUMP);
        this.clip.controls.down_txt.text = _loc4_.getKeyLabel(DataManager.KEY_DOWN);
        this.clip.controls.up_txt.text = _loc4_.getKeyLabel(DataManager.KEY_UP);
        this.clip.controls.left_txt.text = _loc4_.getKeyLabel(DataManager.KEY_LEFT);
        this.clip.controls.right_txt.text = _loc4_.getKeyLabel(DataManager.KEY_RIGHT);
        this.keysWereChanged = true;
        this.gameObj.var_107.api.method_88("ChangedControls", "Screens", true);
      }
      else
      {
        this.clip.controls[this.settingWhichKey + "_btn"].gotoAndStop("alreadyused");
      }
      try
      {
        this.gameObj.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.controlsKeyListener);
      }
      catch (err:Error)
      {
      }
      this.settingWhichKey = "none";
    }

    public function rolloverControlsButton(param1:MouseEvent):void
    {
      if (this.settingWhichKey == "none")
      {
        param1.currentTarget.gotoAndStop("rollover");
      }
    }

    public function rolloutControlsButton(param1:MouseEvent):void
    {
      if (this.settingWhichKey == "none")
      {
        param1.currentTarget.gotoAndStop("click");
      }
    }

    public function destroy():void
    {
      this.gameObj.method_94("nowarpkeys", false);
      this.container.removeEventListener("clickMap", this.clickMap);
      this.container.removeEventListener("clickBaddies", this.clickBaddies);
      this.container.removeEventListener("clickMedals", this.clickMedals);
      this.container.removeEventListener("clickControls", this.clickControls);
      this.container.removeEventListener("clickCredits", this.clickCredits);
      this.container.removeEventListener("clickHelp", this.clickHelp);
      this.container.removeEventListener("clickExit", this.clickExit);
      this.container.removeEventListener("clickParade", this.clickParade);
      this.container.removeEventListener("clickParadeTwo", this.clickParadeTwo);
      this.container.removeEventListener("clickBaddiesRedirect", this.clickBaddiesRedirect);
      this.container.removeEventListener("clickMedalsRedirect", this.clickMedalsRedirect);
      this.container.removeEventListener("clickControlsRedirect", this.clickControlsRedirect);
      this.container.removeEventListener("clickHelpRedirect", this.clickHelpRedirect);
      this.container.removeEventListener("clickCreditsRedirect", this.clickCreditsRedirect);
      this.container.removeEventListener("clickBaddiesRedirectBack", this.clickBaddiesRedirectBack);
      this.container.removeEventListener("clickMedalsRedirectBack", this.clickMedalsRedirectBack);
      this.container.removeEventListener("clickControlsRedirectBack", this.clickControlsRedirectBack);
      this.container.removeEventListener("clickHelpRedirectBack", this.clickHelpRedirectBack);
      this.container.removeEventListener("clickCreditsRedirectBack", this.clickCreditsRedirectBack);
      this.container.removeEventListener("clickInfo", this.clickInfo);
      this.container.removeEventListener("clickBackToGame", this.clickBackToGame);
      this.container.removeEventListener("clickQuit", this.clickQuit);
      this.container.removeEventListener("clickContinueToMap", this.clickContinueToMap);
      this.container.removeEventListener("clickStartLevel", this.clickStartLevel);
      this.container.removeEventListener("clickBackToMap", this.clickBackToMap);
      this.container.removeEventListener("clickExitMapSelect", this.clickExitMapSelect);
      this.setupMap(false);
      if (!this.isOnCharSelect)
      {
        this.setupInfo(false);
      }
      if (this.isOnCharSelect)
      {
        this.setupCharacter(false);
      }
      this.setupControls(false);
      this.setupBaddies(false);
      this.setupMedals(false);
      this.setupCredits(false);
      this.setupHelp(false);
      this.setupConfirmQuit(false);
      this.container.removeChild(this.clip);
      this.clip = null;
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
      this.clip.blackbg.visible = false;
      this.startClosingScreen();
    }

    public function clickContinueToMap(param1:Event):void
    {
      this.isContinuingToMap = true;
      this.startClosingScreen();
    }

    public function clickQuit(param1:Event):void
    {
      this.clip.confirmquit.visible = true;
      this.gameObj.var_107.api.disableButtons();
    }

    public function clickConfirmQuit(param1:Event):void
    {
      this.isQuittingLevel = true;
      this.clip.confirmquit.visible = false;
      this.startClosingScreen();
    }

    public function clickCancelQuit(param1:Event):void
    {
      this.clip.confirmquit.visible = false;
      this.gameObj.var_107.api.enableButtons();
    }

    public function clickExit(param1:Event):void
    {
      this.gameObj.method_103(false);
      this.gameObj.var_107.api.method_85("SplashScreen");
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickExitMapSelect(param1:Event):void
    {
      this.gameObj.method_103(false);
      this.gameObj.var_107.api.method_85("SplashScreen");
      this.gameObj.var_107.api.method_86("MapSelectMenu");
    }

    public function clickBackToMap(param1:Event):void
    {
      this.isReturningToMap = true;
      this.gameObj.method_103(false);
      this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      this.gameObj.var_107.api.method_86("MapSelectMenu");
    }

    public function clickParade(param1:Event):void
    {
      this.gameObj.method_147();
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickParadeTwo(param1:Event):void
    {
      this.gameObj.method_121(true);
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickMedalsRedirect(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("BadgesMenu", {"section": "medals"});
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickBaddiesRedirect(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("BaddiesMenu", {"section": "baddies"});
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickControlsRedirect(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("ControlsMenu", {"section": "controls"});
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickHelpRedirect(param1:Event):void
    {
      this.gameObj.var_107.api.method_88("ClickHelp", "Screens", true);
      this.gameObj.var_107.api.method_85("HelpMenu", {"section": "help"});
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickCreditsRedirect(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("CreditsMenu", {"section": "credits"});
      this.gameObj.var_107.api.method_86("MainMenu");
    }

    public function clickMedalsRedirectBack(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      this.gameObj.var_107.api.method_86("BadgesMenu");
    }

    public function clickBaddiesRedirectBack(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      this.gameObj.var_107.api.method_86("BaddiesMenu");
    }

    public function clickControlsRedirectBack(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      this.gameObj.var_107.api.method_86("ControlsMenu");
    }

    public function clickHelpRedirectBack(param1:Event):void
    {
      this.gameObj.var_107.api.method_88("ClickHelp", "Screens", true);
      this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      this.gameObj.var_107.api.method_86("HelpMenu");
    }

    public function clickCreditsRedirectBack(param1:Event):void
    {
      this.gameObj.var_107.api.method_85("MainMenu", {"section": "map"});
      this.gameObj.var_107.api.method_86("CreditsMenu");
    }

    public function setSection(param1:String):void
    {
      if (param1 != this.currentSection)
      {
        this.newSection = param1;
        this.clip.map.visible = false;
        this.clip.info.visible = false;
        this.clip.character.visible = false;
        this.clip.baddies.visible = false;
        this.clip.controls.visible = false;
        this.clip.medals.visible = false;
        this.clip.credits.visible = false;
        this.clip.help.visible = false;
        if (this.currentSection != "")
        {
          this.clip[this.currentSection].visible = true;
          this.clip[this.currentSection].y = 0;
        }
        if (this.newSection != "none")
        {
          this.clip[this.newSection].visible = true;
          this.clip[this.newSection].y = 480;
        }
        if (this.currentSection == "controls")
        {
          this.cancelSettingControls();
        }
        if (this.newSection == "help")
        {
          this.setupHelpKeys();
        }
        if (this.newSection == "map")
        {
          if (this.willRevealMap)
          {
            this.gameObj.var_105.playSound("checkpoint.wav");
          }
        }
        this.gameObj.var_107.api.disableButtons();
        this.isTransitioning = true;
        this.clip.addEventListener(Event.ENTER_FRAME, this.tweenSections);
      }
    }

    public function tweenSections(param1:Event):void
    {
      var _loc4_:Number = NaN;
      var _loc3_:Number = 999;
      if (this.currentSection != "")
      {
        _loc3_ = -480 - this.clip[this.currentSection].y;
        this.clip[this.currentSection].y += _loc3_ / this.tweenSpeed;
      }
      if (this.newSection != "none")
      {
        _loc4_ = 0 - this.clip[this.newSection].y;
        this.clip[this.newSection].y += _loc4_ / this.tweenSpeed;
        if (Math.abs(_loc4_) <= 1)
        {
          this.clip[this.newSection].y = 0;
          if (this.newSection == "character")
          {
            if (!this.gameObj.var_106.hasTrained("character") && this.gameObj.var_106.getTotalCustomersUnlocked() > 2)
            {
              this.gameObj.method_102("character", false);
            }
            else if (!this.gameObj.var_106.hasTrained("challenges") && this.gameObj.var_106.hasTrained("nowarpkeys"))
            {
              class_7.method_1("Context training for challenges");
              this.gameObj.method_102("challenges", false);
            }
            else if (!this.gameObj.var_106.hasTrained("styles") && this.gameObj.var_106.getLevelHighScore(2) > 0 && this.gameObj.var_106.getTotalMoney() >= this.gameObj.var_109.getOutfitPrice(this.gameObj.var_106.selectedCharacter, 1))
            {
              this.gameObj.method_102("styles", false);
            }
            else
            {
              class_7.method_1("NO context training for challenges.... hasTrained challenges = " + this.gameObj.var_106.hasTrained("challenges") + ", hasTrained nowarpkeys = " + this.gameObj.var_106.hasTrained("nowarpkeys"));
            }
          }
          else if (this.newSection == "map")
          {
            if (!this.gameObj.var_106.hasTrained("nowarpkeys") && !this.willRevealMap && this.gameObj.var_106.getLevelHighScore(this.gameObj.var_106.lastAreaRevealed) > 0)
            {
              this.gameObj.method_102("nowarpkeys", false);
            }
          }
          if (this.currentSection != "")
          {
            this.clip[this.currentSection].visible = false;
          }
          this.currentSection = this.newSection;
          this.newSection = "";
          this.isTransitioning = false;
          this.clip.removeEventListener(Event.ENTER_FRAME, this.tweenSections);
          this.gameObj.var_107.api.method_115(this.getSectionTitle());
          this.gameObj.var_107.api.enableButtons();
        }
      }
      else if (Math.abs(_loc3_) <= 1)
      {
        this.isTransitioning = false;
        this.clip.removeEventListener(Event.ENTER_FRAME, this.tweenSections);
        if (this.isClosing)
        {
          this.closeMainMenuScreen();
        }
      }
    }

    public function startClosingScreen():void
    {
      this.isClosing = true;
      this.gameObj.var_107.api.method_105();
      this.setSection("none");
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
      if (this.currentSection == "map")
      {
        return "MAP";
      }
      if (this.currentSection == "controls")
      {
        return "CONTROLS";
      }
      if (this.currentSection == "baddies")
      {
        return "BADDIES";
      }
      if (this.currentSection == "credits")
      {
        return "CREDITS";
      }
      if (this.currentSection == "medals")
      {
        return "BADGES";
      }
      if (this.currentSection == "help")
      {
        return "HELP";
      }
      if (this.currentSection == "info")
      {
        return "AREA INFO";
      }
      if (this.currentSection == "character")
      {
        return "CHOOSE YOUR CHARACTER";
      }
      return this.currentSection.toUpperCase();
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
      var _loc6_:String = this.gameObj.var_113.getCustomerType(param1);
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
      var _loc7_:String = this.gameObj.var_113.getCustomerClipName(param1);
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
      var _loc33_:String = this.gameObj.var_113.getWeaponClipName(param1, param2);
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
      var _loc36_:String = this.gameObj.var_113.getCustomerClipName(param1);
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
      if (this.gameObj.var_113.getCustomerClipName(param1) == "Connor")
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
      var _loc3_:UserData = this.gameObj.var_106;
      if (_loc3_.didClickFacebook == false)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.facebook.com/pages/Flipline-Studios/121045844606187","BonusTipsFacebook","BonusLinks");
        _loc3_.didClickFacebook = true;
        _loc3_.totalMoney.addValue(75);
        _loc3_.saveProgress("outfit");
        this.clip.character.totalmoney_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        this.clip.character.bonus_facebook_btn.visible = false;
        if (_loc3_.didClickTwitter == false)
        {
          this.clip.character.bonus_twitter_btn.visible = true;
        }
        else
        {
          this.clip.character.bonus_twitter_btn.visible = false;
        }
        this.gameObj.var_105.playSound("buttonclick.wav");
        this.updateStyleButtons();
      }
    }

    public function clickBonusTwitter(param1:Event):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      if (_loc3_.didClickTwitter == false)
      {
        // _loc2_.gameObj.var_107.api.method_83("http://www.twitter.com/FliplineStudios","BonusTipsTwitter","BonusLinks");
        _loc3_.didClickTwitter = true;
        _loc3_.totalMoney.addValue(75);
        _loc3_.saveProgress("outfit");
        this.clip.character.totalmoney_txt.text = class_10.method_84(_loc3_.getTotalMoney());
        this.clip.character.bonus_twitter_btn.visible = false;
        this.clip.character.bonus_facebook_btn.visible = false;
        this.gameObj.var_105.playSound("buttonclick.wav");
        this.updateStyleButtons();
      }
    }

    public function clickEnemyThumb(param1:MouseEvent):void
    {
      var _loc3_:Number = Number(String(MovieClip(param1.currentTarget).name).split("thumb")[1]);
      this.gameObj.var_105.playSound("buttonclick.wav");
      this.selectEnemy(_loc3_);
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
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:int = 0;
      while (_loc4_ < 35)
      {
        if (_loc4_ == param1)
        {
          this.clip.baddies["thumb" + _loc4_].hilite.visible = true;
        }
        else
        {
          this.clip.baddies["thumb" + _loc4_].hilite.visible = false;
        }
        _loc4_++;
      }
      this.clip.baddies.name_txt.text = _loc3_.getEnemyName(param1);
      if (_loc3_.getEnemyIDFromIndex(param1) == 25)
      {
        this.clip.baddies.defeated_txt.text = "Encounters: " + this.gameObj.var_106.getEnemyKills(_loc3_.getEnemyIDFromIndex(param1));
      }
      else if (_loc3_.getEnemyIDFromIndex(param1) == 32)
      {
        this.clip.baddies.defeated_txt.text = "Bounced: " + this.gameObj.var_106.getEnemyKills(_loc3_.getEnemyIDFromIndex(param1));
      }
      else
      {
        this.clip.baddies.defeated_txt.text = "Defeated: " + this.gameObj.var_106.getEnemyKills(_loc3_.getEnemyIDFromIndex(param1));
      }
      if (this.enemyDetail != null)
      {
        this.enemyDetail.parent.removeChild(this.enemyDetail);
        this.enemyDetail = null;
      }
      var _loc5_:Class = getDefinitionByName("enemydetail_" + _loc3_.getEnemyClipName(param1)) as Class;
      this.enemyDetail = new _loc5_() as MovieClip;
      this.enemyDetail.mouseEnabled = false;
      this.enemyDetail.mouseChildren = false;
      this.clip.baddies.addChild(this.enemyDetail);
      this.enemyDetail.x = 10;
      this.enemyDetail.y = 101;
    }
  }
}
