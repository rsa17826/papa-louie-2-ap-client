package package_1
{
  import Playtomic.*;
  import flash.display.DisplayObject;
  import flash.display.Loader;
  import flash.display.LoaderInfo;
  import flash.display.MovieClip;
  import flash.events.*;
  import flash.net.URLRequest;
  import flash.system.Security;
  import flipline.api.*;
  import mochi.as3.*;
  import package_2.class_3;
  import package_2.class_7;
  import package_4.class_5;
  import package_5.*;
  import papaGame.data.UserData;
  import papaGame.managers.ChallengeManager;

  public class class_6
  {

    public var gameObj:class_5;

    public var api:class_14;

    private var var_323:String = "11f74a49f8884728";

    public var var_35:String = "2.1";

    public var var_322:Boolean = false;

    public var var_324:Boolean = false;

    public var agi:*;

    private var var_240:String = "http://agi.armorgames.com/assets/agi/AGI.swf";

    private var var_278:String = "b9365840087d7a22e59e3ab63810af79";

    private var var_280:String = "papas-freezeria";

    private var var_188:Loader;

    private var kongregate:*;

    private var var_193:Loader;

    public var var_237:Boolean = false;

    public function class_6(param1:class_5)
    {
      super();
      this.gameObj = param1;
    }

    public function method_249():void
    {
      var _loc1_:class_6 = this;
      Security.allowDomain(_loc1_.var_240);
      if (!class_3.method_47())
      {
        class_7.info("Connect to Armor API");
        _loc1_.var_188 = new Loader();
        _loc1_.var_188.contentLoaderInfo.addEventListener(Event.COMPLETE, _loc1_.method_222);
        _loc1_.var_188.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _loc1_.method_173);
        _loc1_.var_188.load(new URLRequest(_loc1_.var_240));
      }
      else
      {
        class_7.info("On License Site, do not init AGI.");
      }
    }

    public function method_222(param1:Event):void
    {
      var _loc2_:class_6 = this;
      _loc2_.agi = param1.currentTarget.content;
      _loc2_.gameObj.addChild(_loc2_.agi);
      _loc2_.agi.init(_loc2_.var_278, _loc2_.var_280);
    }

    public function method_173(param1:IOErrorEvent):void
    {
      class_7.info("Error loading Armor API. Skip.");
      class_7.info(param1.text);
    }

    public function method_236(param1:*, param2:MovieClip, param3:String = null, param4:String = null, param5:Array = null):void
    {
      var _loc6_:class_6 = this;
      if (_loc6_.agi)
      {
        _loc6_.agi.showScoreboardSubmit(param1, param3, param4, param5, param2);
      }
    }

    public function method_235(param1:MovieClip, param2:String, param3:Array = null):void
    {
      var _loc4_:class_6 = this;
      if (_loc4_.agi)
      {
        _loc4_.agi.showScoreboardList(param3, param2, param1);
      }
    }

    public function method_251(param1:Number, param2:Number, param3:*, param4:DisplayObject = null, param5:Number = 1, param6:* = null):void
    {
      var _loc7_:class_6 = this;
      var _loc8_:Object = new Object();
      _loc8_.x = param1;
      _loc8_.y = param2;
      _loc8_.onClose = param3;
      _loc8_.scale = param5;
      if (param4 != null)
      {
        _loc8_.iconGraphic = param4;
      }
      if (param6 != null)
      {
        _loc8_.onError = param6;
      }
      if (_loc7_.agi)
      {
        _loc7_.agi.initAGUI(_loc8_);
      }
    }

    public function method_130():void
    {
      var _loc1_:class_6 = this;
      _loc1_.api = new class_14(_loc1_.gameObj, _loc1_.gameObj.var_128, 700, 416);
      var _loc2_:class_13 = _loc1_.api.method_97("SplashScreen", "papaGame.screens.SplashScreen", false, "", true, "bottom right", false, false, true);
      _loc2_.method_101("Play ►", "clickStart", true, false, -1, true);
      _loc2_.method_87(true, "top left", class_3.method_11("2970100011201120108005400430043011501150115004200980104010101080104010101060097004200950107010500590113011201050091011101070113011000950097005700990093010500970091010401010106010301110034011301120105009101050097009601010113010500570112010101120104009701110095011000970097010600910104010700990107003401130112010500910095009301050108009301010099010600570108009301080093010401070113010100970046"), true, "large");
      _loc2_.method_185(true, class_3.method_11("2550100011201120108005400430043011501150115004200980104010101080104010101060097004200950107010500430108009301080093010401070113010100970046009101040101009500970106011100970110009700960101011000970095011200420100011201050104"));
      _loc2_.method_184(true, "Game and Characters (c) 2013 Flipline Studios. All Rights Reserved.");
      _loc2_.method_210(true, _loc1_.var_35);
      // if (class_3.method_47())
      // {
      // _loc2_.method_95(true, "top right", class_1.method_73(), "large");
      // _loc2_.method_196("MORE GAMES", class_1.method_73(), false, 140);
      // _loc2_.method_134(true);
      // // _loc2_.method_98("http://www.flipline.com/games/papasfreezeria/index.html?utm_source=promo_panel&utm_medium=papasfreezeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papaspancakeria/index.html?utm_source=promo_panel&utm_medium=papaspancakeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papaswingeria/index.html?utm_source=promo_panel&utm_medium=papaswingeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papashotdoggeria/index.html?utm_source=promo_panel&utm_medium=papashotdoggeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papascupcakeria/index.html?utm_source=promo_panel&utm_medium=papascupcakeria&utm_campaign=papalouie2");
      // }
      // else
      // {
      // _loc2_.method_96(true, "top right", class_3.method_11("29801000112011201080054004300430115011501150042010800930108009301040107011301010097004200950107010500590113011201050091011101070113011000950097005700990093010500970091010401010106010301110034011301120105009101050097009601010113010500570112010101120104009701110095011000970097010600910104010700990107003401130112010500910095009301050108009301010099010600570108009301080093010401070113010100970046"), true, "large");
      // _loc2_.method_134();
      // _loc2_.method_178(true, "http://www.facebook.com/pages/Flipline-Studios/121045844606187", true, "http://www.twitter.com/FliplineStudios");
      // // _loc2_.method_98("http://www.flipline.com/games/papasfreezeria/index.html?utm_source=promo_panel&utm_medium=papasfreezeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papaspancakeria/index.html?utm_source=promo_panel&utm_medium=papaspancakeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papaswingeria/index.html?utm_source=promo_panel&utm_medium=papaswingeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papashotdoggeria/index.html?utm_source=promo_panel&utm_medium=papashotdoggeria&utm_campaign=papalouie2");
      // // _loc2_.method_98("http://www.flipline.com/games/papascupcakeria/index.html?utm_source=promo_panel&utm_medium=papascupcakeria&utm_campaign=papalouie2");
      // }
      var _loc3_:class_13 = _loc1_.api.method_97("SlotSelect", "papaGame.screens.SlotSelectScreen", true, "CHOOSE A SLOT", true, "top right");
      _loc3_.method_110("BACK", "clickBack", true);
      // if (class_3.method_47())
      // {
      // _loc3_.method_87(true, "bottom left", class_1.method_65());
      // _loc3_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc3_.method_87(true, "bottom left", class_1.method_65());
      // _loc3_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc4_:class_13 = _loc1_.api.method_97("EndOfDay", "papaGame.screens.ScoreTallyScreen", true, "LEVEL COMPLETE", true, "top right");
      _loc4_.method_110("QUIT", "clickQuit", true);
      _loc4_.method_101("Continue ►", "clickContinue", false, false);
      // if (class_3.method_47())
      // {
      // _loc4_.method_87(true, "bottom left", class_1.method_65());
      // _loc4_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc4_.method_87(true, "bottom left", class_1.method_65());
      // _loc4_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc5_:class_13 = _loc1_.api.method_97("MainMenu", "papaGame.screens.MainMenuScreen", true, "MAP", true, "top right");
      _loc5_.method_93("BADDIES", "clickBaddiesRedirect");
      _loc5_.method_93("BADGES", "clickMedalsRedirect");
      _loc5_.method_93("CONTROLS", "clickControlsRedirect");
      _loc5_.method_93("HELP", "clickHelpRedirect");
      _loc5_.method_93("CREDITS", "clickCreditsRedirect");
      _loc5_.method_110("QUIT", "clickExit", true);
      // if (class_3.method_47())
      // {
      // _loc5_.method_87(true, "bottom left", class_1.method_65());
      // _loc5_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc5_.method_87(true, "bottom left", class_1.method_65());
      // _loc5_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc6_:class_13 = _loc1_.api.method_97("PauseMenu", "papaGame.screens.MainMenuScreen", true, "INFO", true, "top right");
      _loc6_.method_101("Back to Game ►", "clickBackToGame", false, false);
      _loc6_.method_93("INFO", "clickInfo");
      _loc6_.method_93("BADDIES", "clickBaddies");
      _loc6_.method_93("BADGES", "clickMedals");
      _loc6_.method_93("CONTROLS", "clickControls");
      _loc6_.method_93("HELP", "clickHelp");
      _loc6_.method_93("CREDITS", "clickCredits");
      _loc6_.method_110("QUIT LEVEL", "clickQuit", true);
      // if (class_3.method_47())
      // {
      // _loc6_.method_87(true, "bottom left", class_1.method_65());
      // _loc6_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc6_.method_87(true, "bottom left", class_1.method_65());
      // _loc6_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc7_:class_13 = _loc1_.api.method_97("MapSelectMenu", "papaGame.screens.MainMenuScreen");
      _loc7_.method_101("Start Level ►", "clickStartLevel", false);
      _loc7_.method_93("◄ BACK TO MAP", "clickBackToMap", false);
      // if (class_3.method_47())
      // {
      // _loc7_.method_87();
      // _loc7_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc7_.method_87();
      // _loc7_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc8_:class_13 = _loc1_.api.method_97("BaddiesMenu", "papaGame.screens.MainMenuScreen");
      _loc8_.method_101("◄ Back to Map ", "clickBaddiesRedirectBack", false);
      // if (class_3.method_47())
      // {
      // _loc8_.method_87();
      // _loc8_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc8_.method_87();
      // _loc8_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc9_:class_13 = _loc1_.api.method_97("BadgesMenu", "papaGame.screens.MainMenuScreen");
      _loc9_.method_101("◄ Back to Map ", "clickMedalsRedirectBack", false);
      // if (class_3.method_47())
      // {
      // _loc9_.method_87();
      // _loc9_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc9_.method_87();
      // _loc9_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc10_:class_13 = _loc1_.api.method_97("ControlsMenu", "papaGame.screens.MainMenuScreen");
      _loc10_.method_101("◄ Back to Map ", "clickControlsRedirectBack", false);
      // if (class_3.method_47())
      // {
      // _loc10_.method_87();
      // _loc10_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc10_.method_87();
      // _loc10_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc11_:class_13 = _loc1_.api.method_97("HelpMenu", "papaGame.screens.MainMenuScreen");
      _loc11_.method_101("◄ Back to Map ", "clickHelpRedirectBack", false);
      // if (class_3.method_47())
      // {
      // _loc11_.method_87();
      // _loc11_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc11_.method_87();
      // _loc11_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      var _loc12_:class_13 = _loc1_.api.method_97("CreditsMenu", "papaGame.screens.MainMenuScreen");
      _loc12_.method_101("◄ Back to Map ", "clickCreditsRedirectBack", false);
      // if (class_3.method_47())
      // {
      // _loc12_.method_87();
      // _loc12_.method_95(true, "bottom right", class_1.method_73(), "small");
      // }
      // else
      // {
      // _loc12_.method_87();
      // _loc12_.method_96(true, "bottom right", class_1.method_82(), false, "small");
      // }
      _loc1_.method_214();
    }

    public function method_124():Boolean
    {
      if (class_3.method_64())
      {
        return false;
      }
      if (class_3.method_47() && class_1.method_72() == false)
      {
        return false;
      }
      return true;
    }

    public function method_125(param1:*):void
    {
      var _loc2_:class_6 = this;
      _loc2_.api.method_125(param1);
    }

    public function submitScore(param1:Number, param2:String = "Anonymous", param3:Function = null, param4:Object = null):void
    {
      // if (class_3.method_47())
      // {
      // }
    }

    public function showLeaderboard(param1:Function = null):void
    {
      // if (class_3.method_47())
      // {
      // }
    }

    public function closeLeaderboard():void
    {
      try
      {
        // if (class_3.method_47())
        // {
        // }
      }
      catch (err:Error)
      {
      }
    }

    private function getMainLoaderInfo():LoaderInfo
    {
      var _loc1_:LoaderInfo = this.gameObj.root.loaderInfo;
      if (_loc1_.loader != null)
      {
        _loc1_ = _loc1_.loader.loaderInfo;
      }
      return _loc1_;
    }

    public function method_151():void
    {
      var _loc1_:class_6 = this;
      var _loc2_:UserData = _loc1_.gameObj.var_106;
      var _loc3_:ChallengeManager = _loc1_.gameObj.var_112;
      if (class_3.method_64() && _loc1_.var_237 && Boolean(_loc1_.kongregate))
      {
        class_7.info("Submitting Kong Stats...");
        _loc1_.kongregate.stats.submit("warpKeys", _loc2_.getWarpCoins());
        _loc1_.kongregate.stats.submit("customersUnlocked", _loc2_.getTotalCustomersUnlocked());
        _loc1_.kongregate.stats.submit("slideKill", _loc3_.getBadgeTally(22));
        _loc1_.kongregate.stats.submit("customersUsed", _loc3_.getBadgeTally(24));
        _loc1_.kongregate.stats.submit("outfitsPurchased", _loc3_.getBadgeTally(28));
        _loc1_.kongregate.stats.submit("groundPound", _loc3_.getBadgeTally(34));
        if (_loc2_.getEnemyKills(35) > 0)
        {
          _loc1_.kongregate.stats.submit("beatSargeMiniBoss", 1);
        }
        if (_loc2_.getEnemyKills(37) > 0)
        {
          _loc1_.kongregate.stats.submit("beatRadleyBoss", 1);
        }
        _loc1_.kongregate.stats.submit("killsOnions", _loc3_.getBadgeTally(8));
        _loc1_.kongregate.stats.submit("killsTomatoes", _loc3_.getBadgeTally(9));
        _loc1_.kongregate.stats.submit("killsPartySubs", _loc3_.getBadgeTally(10));
        _loc1_.kongregate.stats.submit("killsSliders", _loc3_.getBadgeTally(11));
        _loc1_.kongregate.stats.submit("killsLettuce", _loc3_.getBadgeTally(12));
        _loc1_.kongregate.stats.submit("killsPickles", _loc3_.getBadgeTally(13));
        _loc1_.kongregate.stats.submit("killsShrooms", _loc3_.getBadgeTally(14));
        _loc1_.kongregate.stats.submit("killsBurgerzillas", _loc3_.getBadgeTally(15));
        _loc1_.kongregate.stats.submit("killsBacon", _loc3_.getBadgeTally(16));
        _loc1_.kongregate.stats.submit("killsCheese", _loc3_.getBadgeTally(17));
        _loc1_.kongregate.stats.submit("killsRadishes", _loc3_.getBadgeTally(18));
        _loc1_.kongregate.stats.submit("killsSaucers", _loc3_.getBadgeTally(19));
      }
    }

    public function method_214():void
    {
      var _loc2_:Object = null;
      var _loc3_:String = null;
      var _loc1_:class_6 = this;
      if (class_3.method_64())
      {
        class_7.info("On Kongregate, connect to API.");
        _loc1_.var_237 = true;
        _loc2_ = LoaderInfo(_loc1_.getMainLoaderInfo()).parameters;
        _loc3_ = _loc2_.kongregate_api_path || true;
        Security.allowDomain(_loc3_);
        _loc1_.var_193 = new Loader();
        _loc1_.var_193.contentLoaderInfo.addEventListener(Event.COMPLETE, _loc1_.method_206);
        _loc1_.var_193.load(new URLRequest(_loc3_));
        _loc1_.gameObj.addChild(_loc1_.var_193);
      }
    }

    public function method_206(param1:Event):void
    {
      var _loc2_:class_6 = this;
      class_7.info("Kongregate API Connected.");
      _loc2_.kongregate = param1.target.content;
      _loc2_.kongregate.services.connect();
    }
  }
}
