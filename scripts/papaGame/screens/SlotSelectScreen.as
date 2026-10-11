package papaGame.screens
{
  import fl.controls.TextInput;
  import flash.display.*;
  import flash.events.*;
  import flash.text.TextFormat;
  import flash.text.TextFormatAlign;
  import flash.ui.*;
  import flash.utils.getDefinitionByName;
  import package_2.class_10;
  import package_2.class_7;
  import package_3.class_11;
  import package_3.class_4;
  import package_4.class_5;
  import papaGame.data.CustomerData;
  import papaGame.data.UserData;

  public class SlotSelectScreen
  {

    public var gameObj:class_5;
    public var container:MovieClip;
    public var clip:MovieClip;
    public var selectedSlot:Number = 0;
    public var isClosing:Boolean = false;
    public var isNewSlot:Boolean = false;
    public var currentMode:String = "slots";
    public var nameContinueButton:class_11;
    public var nameBackButton:class_11;
    public var selectedCharacter:String = "marty";
    public var slotName:String = "";
    public var missingWidget:MovieClip;
    public var model1:MovieClip;
    public var model2:MovieClip;
    public var model3:MovieClip;
    public var martyModel:MovieClip = null;
    public var ritaModel:MovieClip = null;

    public function SlotSelectScreen(param1:class_5, param2:MovieClip, param3:Object = null)
    {
      super();
      this.gameObj = param1;
      this.container = param2;
      this.setupScreen();
    }

    public function setupScreen():void
    {
      var _loc5_:MovieClip = null;
      this.clip = new slotSelectMC();
      var _loc2_:int = 1;
      while (_loc2_ <= 3)
      {
        _loc5_ = this.clip.slots["slot" + _loc2_ + "MC"];
        _loc5_.new_btn.addEventListener(MouseEvent.CLICK, this.clickNewSlot);
        _loc5_.select_btn.addEventListener(MouseEvent.CLICK, this.clickExistingSlot);
        _loc5_.delete_btn.addEventListener(MouseEvent.CLICK, this.clickDeleteSlot);
        _loc5_.new_btn.tabEnabled = false;
        _loc5_.select_btn.tabEnabled = false;
        _loc5_.delete_btn.tabEnabled = false;
        _loc5_.confirmMC.yes_btn.addEventListener(MouseEvent.CLICK, this.clickDeleteYes);
        _loc5_.confirmMC.no_btn.addEventListener(MouseEvent.CLICK, this.clickDeleteNo);
        _loc5_.confirmMC.yes_btn.tabEnabled = false;
        _loc5_.confirmMC.no_btn.tabEnabled = false;
        _loc5_.savebackup_btn.addEventListener(MouseEvent.CLICK, this.clickSaveBackup);
        _loc5_.loadbackup_btn.addEventListener(MouseEvent.CLICK, this.clickLoadBackup);
        _loc5_.savebackup_btn.tabEnabled = false;
        _loc5_.loadbackup_btn.tabEnabled = false;
        _loc5_.confirmMC.visible = false;
        // class_4.method_80(_loc1_.gameObj,1,318,416);
        _loc2_++;
      }
      this.nameBackButton = new class_11(null, "< BACK", "small", "button", "clickNameCancel", null, false, false, false, null, false, 112);
      this.nameBackButton.x = 0;
      this.nameBackButton.y = 75;
      this.nameContinueButton = new class_11(null, "CONTINUE >", "small", "button", "clickNameOK", null, false, false, false, null, false, 112);
      this.nameContinueButton.x = 181;
      this.nameContinueButton.y = 75;
      this.clip.entername.input_holder.addChild(this.nameBackButton);
      this.clip.entername.input_holder.addChild(this.nameContinueButton);
      this.nameContinueButton.addEventListener("clickNameOK", this.clickEnterNameOK);
      this.nameBackButton.addEventListener("clickNameCancel", this.clickEnterNameCancel);
      var _loc3_:TextFormat = new TextFormat();
      _loc3_.font = "Arial";
      _loc3_.size = 24;
      _loc3_.bold = true;
      _loc3_.align = TextFormatAlign.CENTER;
      var _loc4_:TextInput = this.clip.entername.input_holder.input_txt;
      this.clip.entername.input_holder.input_txt.setStyle("textFormat", _loc3_);
      this.clip.entername.input_holder.input_txt.maxChars = 16;
      this.clip.entername.input_holder.input_txt.restrict = "0-9A-Za-z \'\\-";
      this.container.addEventListener("clickBack", this.clickBack);
      this.container.addChild(this.clip);
      this.clip.addEventListener(Event.ENTER_FRAME, this.animateScreen);
      this.clip.addEventListener(KeyboardEvent.KEY_DOWN, this.keyListener);
      this.clip.entername.gotoAndStop(1);
      this.clip.slots.gotoAndStop(1);
      this.clip.character.gotoAndStop(1);
      this.missingWidget = this.clip.missing;
      this.gameObj.addChild(this.missingWidget);
      this.missingWidget.visible = false;
      this.missingWidget.mouseEnabled = true;
      this.missingWidget.mouseChildren = true;
      this.missingWidget.buttonMode = true;
      this.missingWidget.useHandCursor = true;
      this.missingWidget.addEventListener(MouseEvent.CLICK, this.clickMissingWidget);
      this.clip.character.marty.name_txt.text = "Marty";
      this.clip.character.marty.select_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickMarty);
      this.clip.character.rita.name_txt.text = "Rita";
      this.clip.character.rita.select_btn.addEventListener(MouseEvent.MOUSE_DOWN, this.clickRita);
      this.showSlots();
    }

    public function keyListener(param1:KeyboardEvent):void
    {
      if (this.currentMode == "entername" && param1.keyCode == Keyboard.ENTER)
      {
        this.clickEnterNameOK();
      }
    }

    public function clickBack(param1:Event):void
    {
      class_4.method_78();
      this.gameObj.var_107.api.method_85("SplashScreen");
      this.gameObj.var_107.api.method_86("SlotSelect");
    }

    public function getSlotData():void
    {
      var _loc4_:Object = null;
      var _loc5_:MovieClip = null;
      var _loc2_:Boolean = true;
      var _loc3_:int = 1;
      while (_loc3_ <= 3)
      {
        _loc4_ = this.gameObj.var_106.loadLabelsForSlot(_loc3_);
        _loc5_ = this.clip.slots["slot" + _loc3_ + "MC"];
        if (_loc4_)
        {
          _loc5_.name_txt.text = String(_loc4_.name);
          _loc5_.textclip.visible = true;
          if (this["model" + _loc3_])
          {
            this.cleanupModel(this["model" + _loc3_]);
            this["model" + _loc3_] = null;
          }
          this["model" + _loc3_] = this.buildModel(_loc4_.char, _loc4_.style);
          _loc5_.textclip.addChild(this["model" + _loc3_]);
          this["model" + _loc3_].x = 10;
          this["model" + _loc3_].y = -60;
          _loc5_.textclip.points_txt.text = class_10.method_84(Number(_loc4_.score));
          _loc5_.textclip.coins_txt.text = class_10.method_84(Number(_loc4_.coins));
          _loc5_.textclip.time_txt.text = class_10.method_109(Number(_loc4_.time), false, true);
          _loc5_.textclip.warpcoins_txt.text = Number(_loc4_.warpcoins) + "/50";
          _loc5_.textclip.customers_txt.text = Number(_loc4_.customers) + "/28";
          _loc5_.textclip.percent_txt.text = Number(_loc4_.completion);
          if (Number(_loc4_.completion) == 100)
          {
            _loc5_.textclip.star.visible = true;
          }
          else
          {
            _loc5_.textclip.star.visible = false;
          }
          _loc5_.select_btn.visible = true;
          _loc5_.new_btn.visible = false;
          _loc5_.delete_btn.visible = true;
          if (this.gameObj.var_107.method_124())
          {
            _loc5_.savebackup_btn.visible = true;
            _loc5_.loadbackup_btn.visible = false;
          }
          else
          {
            _loc5_.savebackup_btn.visible = false;
            _loc5_.loadbackup_btn.visible = false;
          }
          _loc2_ = false;
        }
        else
        {
          _loc5_.name_txt.text = "Empty Slot";
          _loc5_.textclip.visible = false;
          _loc5_.new_btn.visible = true;
          _loc5_.select_btn.visible = false;
          _loc5_.delete_btn.visible = false;
          if (this.gameObj.var_107.method_124())
          {
            _loc5_.savebackup_btn.visible = false;
            _loc5_.loadbackup_btn.visible = true;
          }
          else
          {
            _loc5_.savebackup_btn.visible = false;
            _loc5_.loadbackup_btn.visible = false;
          }
        }
        _loc3_++;
      }
      if (_loc2_)
      {
        this.missingWidget.visible = true;
      }
      else
      {
        this.missingWidget.visible = false;
      }
    }

    public function clickNewSlot(param1:MouseEvent):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:Number = 0;
      if (param1.currentTarget == this.clip.slots.slot1MC.new_btn)
      {
        _loc4_ = 1;
      }
      else if (param1.currentTarget == this.clip.slots.slot2MC.new_btn)
      {
        _loc4_ = 2;
      }
      else if (param1.currentTarget == this.clip.slots.slot3MC.new_btn)
      {
        _loc4_ = 3;
      }
      this.gameObj.var_105.playSound("buttonclick.wav");
      this.clip.slots.mouseEnabled = false;
      this.clip.slots.mouseChildren = false;
      this.selectedSlot = _loc4_;
      this.isNewSlot = true;
      this.showCharacter();
    }

    public function clickExistingSlot(param1:MouseEvent):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:Number = 0;
      if (param1.currentTarget == this.clip.slots.slot1MC.select_btn)
      {
        _loc4_ = 1;
      }
      else if (param1.currentTarget == this.clip.slots.slot2MC.select_btn)
      {
        _loc4_ = 2;
      }
      else if (param1.currentTarget == this.clip.slots.slot3MC.select_btn)
      {
        _loc4_ = 3;
      }
      _loc3_.loadData(_loc4_);
      this.isNewSlot = false;
      this.clip.slots.gotoAndPlay("hide");
      this.clip.slots.mouseEnabled = false;
      this.clip.slots.mouseChildren = false;
      this.startClosingScreen();
    }

    public function clickSaveBackup(param1:MouseEvent):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:Number = 0;
      this.gameObj.var_105.playSound("buttonclick.wav");
      if (param1.currentTarget == this.clip.slots.slot1MC.savebackup_btn)
      {
        _loc4_ = 1;
      }
      else if (param1.currentTarget == this.clip.slots.slot2MC.savebackup_btn)
      {
        _loc4_ = 2;
      }
      else if (param1.currentTarget == this.clip.slots.slot3MC.savebackup_btn)
      {
        _loc4_ = 3;
      }
      if (_loc4_ != 0)
      {
        this.gameObj.var_107.api.method_122(_loc3_.loadSlotDataForBackup(_loc4_), _loc3_.saveSlotPrefix, "papalouie2_backup_" + _loc4_, null);
      }
    }

    public function clickLoadBackup(param1:MouseEvent):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:Number = 0;
      this.gameObj.var_105.playSound("buttonclick.wav");
      if (param1.currentTarget == this.clip.slots.slot1MC.loadbackup_btn)
      {
        _loc4_ = 1;
      }
      else if (param1.currentTarget == this.clip.slots.slot2MC.loadbackup_btn)
      {
        _loc4_ = 2;
      }
      else if (param1.currentTarget == this.clip.slots.slot3MC.loadbackup_btn)
      {
        _loc4_ = 3;
      }
      if (_loc4_ != 0)
      {
        this.gameObj.var_107.api.method_123(_loc4_, _loc3_.saveSlotPrefix, "/", this.showSlots);
      }
    }

    public function clickMissingWidget(param1:MouseEvent):void
    {
      this.gameObj.var_107.api.method_223(this.gameObj.var_107.method_124());
    }

    public function clickDeleteSlot(param1:MouseEvent):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      if (param1.currentTarget == this.clip.slots.slot1MC.delete_btn)
      {
        this.clip.slots.slot1MC.confirmMC.visible = true;
      }
      else if (param1.currentTarget == this.clip.slots.slot2MC.delete_btn)
      {
        this.clip.slots.slot2MC.confirmMC.visible = true;
      }
      else if (param1.currentTarget == this.clip.slots.slot3MC.delete_btn)
      {
        this.clip.slots.slot3MC.confirmMC.visible = true;
      }
    }

    public function clickDeleteYes(param1:MouseEvent):void
    {
      var _loc3_:UserData = this.gameObj.var_106;
      var _loc4_:Number = 0;
      if (param1.currentTarget == this.clip.slots.slot1MC.confirmMC.yes_btn)
      {
        _loc4_ = 1;
      }
      else if (param1.currentTarget == this.clip.slots.slot2MC.confirmMC.yes_btn)
      {
        _loc4_ = 2;
      }
      else if (param1.currentTarget == this.clip.slots.slot3MC.confirmMC.yes_btn)
      {
        _loc4_ = 3;
      }
      if (_loc4_ > 0)
      {
        _loc3_.eraseSlot(_loc4_);
        this.showSlots();
      }
      else
      {
        trace("Unknown Target: " + param1.currentTarget);
      }
    }

    public function clickDeleteNo(param1:MouseEvent):void
    {
      this.clip.slots.slot1MC.confirmMC.visible = false;
      this.clip.slots.slot2MC.confirmMC.visible = false;
      this.clip.slots.slot3MC.confirmMC.visible = false;
      this.gameObj.var_105.playSound("buttonclick.wav");
    }

    public function clickEnterNameOK(param1:Event = null):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      var _loc3_:String = this.clip.entername.input_holder.input_txt.text;
      if (_loc3_ == "" || _loc3_ == " " || _loc3_ == "  " || _loc3_ == "   ")
      {
        _loc3_ = "Player " + this.selectedSlot;
      }
      this.gameObj.stage.focus = this.gameObj.stage;
      this.gameObj.var_107.api.method_88("New_Game", "Slots");
      this.gameObj.var_106.createNewSlot(this.selectedSlot, _loc3_, this.selectedCharacter);
      this.clip.entername.gotoAndPlay("hide");
      this.startClosingScreen();
    }

    public function clickEnterNameCancel(param1:Event = null):void
    {
      this.gameObj.var_105.playSound("buttonclick.wav");
      this.showSlots();
    }

    public function clickMarty(param1:Event = null):void
    {
      this.selectedCharacter = "marty";
      this.clip.character.gotoAndPlay("hide");
      this.showEnterName();
    }

    public function clickRita(param1:Event = null):void
    {
      this.selectedCharacter = "rita";
      this.clip.character.gotoAndPlay("hide");
      this.showEnterName();
    }
    private function jumpToShown(param1:MovieClip):void
    {
      for each (var lbl:FrameLabel in param1.currentLabels)
      {
        if (lbl.name == "hide")
        {
          param1.gotoAndStop(lbl.frame - 1);
          return;
        }
      }
      throw new Error("jumpToShown: no 'hide' label on " + param1.name);
    }
    public function showSlots():void
    {
      this.currentMode = "slots";
      this.clip.slots.mouseEnabled = true;
      this.clip.slots.mouseChildren = true;
      this.clip.slots.slot1MC.confirmMC.visible = false;
      this.clip.slots.slot2MC.confirmMC.visible = false;
      this.clip.slots.slot3MC.confirmMC.visible = false;
      this.getSlotData();
      if (this.clip.entername.currentFrame > 1 && this.clip.entername.currentFrame < this.clip.entername.totalFrames)
      {
        this.clip.entername.gotoAndPlay("hide");
      }
      this.jumpToShown(this.clip.slots);
    }

    public function showEnterName():void
    {
      this.currentMode = "entername";
      this.clip.entername.input_holder.input_txt.text = "";
      this.clip.entername.input_holder.input_txt.setFocus();
      if (this.clip.character.currentFrame > 1 && this.clip.character.currentFrame < this.clip.character.totalFrames)
      {
        this.clip.character.gotoAndPlay("hide");
      }
      this.clip.entername.gotoAndPlay("show");
      this.gameObj.var_107.api.method_115("ENTER YOUR NAME");
    }

    public function showCharacter():void
    {
      this.currentMode = "character";
      if (this.clip.slots.currentFrame > 1 && this.clip.slots.currentFrame < this.clip.slots.totalFrames)
      {
        this.clip.slots.gotoAndPlay("hide");
      }
      if (this.martyModel == null)
      {
        this.martyModel = this.buildModel(0, 1);
        this.clip.character.marty.holder.addChild(this.martyModel);
        this.martyModel.x = -30;
        this.martyModel.scaleX = 0.48;
        this.martyModel.scaleY = 0.48;
        this.martyModel.y = -85;
        this.clip.character.marty.holder.scaleX = -1;
      }
      if (this.ritaModel == null)
      {
        this.ritaModel = this.buildModel(1, 1);
        this.clip.character.rita.holder.addChild(this.ritaModel);
        this.ritaModel.x = -30;
        this.ritaModel.y = -85;
        this.ritaModel.scaleX = 0.48;
        this.ritaModel.scaleY = 0.48;
      }
      this.clip.character.gotoAndPlay("show");
      this.gameObj.var_107.api.method_115("CHOOSE A CHARACTER");
    }

    public function animateScreen(param1:Event):void
    {
      if (this.isClosing)
      {
        if (this.currentMode == "entername" && this.clip.entername.currentFrame == this.clip.entername.totalFrames)
        {
          this.closeSlotSelectScreen();
        }
        else if (this.currentMode == "slots" && this.clip.slots.currentFrame == this.clip.slots.totalFrames)
        {
          this.closeSlotSelectScreen();
        }
      }
    }

    public function clickStart(param1:Event):void
    {
      this.clip.iris.gotoAndPlay("irisout");
      this.gameObj.var_107.api.method_105("SlotSelectScreen");
    }

    public function destroy():void
    {
      var _loc3_:MovieClip = null;
      this.missingWidget.removeEventListener(MouseEvent.CLICK, this.clickMissingWidget);
      this.missingWidget.parent.removeChild(this.missingWidget);
      this.missingWidget = null;
      if (this.clip.hasEventListener(Event.ENTER_FRAME))
      {
        this.clip.removeEventListener(Event.ENTER_FRAME, this.animateScreen);
      }
      this.container.removeEventListener("clickBack", this.clickBack);
      if (this.model1)
      {
        this.cleanupModel(this.model1);
        this.model1 = null;
      }
      if (this.model2)
      {
        this.cleanupModel(this.model2);
        this.model2 = null;
      }
      if (this.model3)
      {
        this.cleanupModel(this.model3);
        this.model3 = null;
      }
      if (this.martyModel)
      {
        this.cleanupModel(this.martyModel);
        this.martyModel = null;
      }
      if (this.ritaModel)
      {
        this.cleanupModel(this.ritaModel);
        this.ritaModel = null;
      }
      var _loc2_:int = 1;
      while (_loc2_ <= 3)
      {
        _loc3_ = this.clip.slots["slot" + _loc2_ + "MC"];
        _loc3_.new_btn.removeEventListener(MouseEvent.CLICK, this.clickNewSlot);
        _loc3_.select_btn.removeEventListener(MouseEvent.CLICK, this.clickExistingSlot);
        _loc3_.delete_btn.removeEventListener(MouseEvent.CLICK, this.clickDeleteSlot);
        _loc3_.confirmMC.yes_btn.removeEventListener(MouseEvent.CLICK, this.clickDeleteYes);
        _loc3_.confirmMC.no_btn.removeEventListener(MouseEvent.CLICK, this.clickDeleteNo);
        _loc3_.savebackup_btn.removeEventListener(MouseEvent.CLICK, this.clickSaveBackup);
        _loc3_.loadbackup_btn.removeEventListener(MouseEvent.CLICK, this.clickLoadBackup);
        _loc2_++;
      }
      this.clip.entername.input_holder.removeChild(this.nameContinueButton);
      this.clip.entername.input_holder.removeChild(this.nameBackButton);
      this.nameContinueButton.removeEventListener("clickNameOK", this.clickEnterNameOK);
      this.nameBackButton.removeEventListener("clickNameCancel", this.clickEnterNameCancel);
      this.nameContinueButton.destroy();
      this.nameBackButton.destroy();
      this.nameContinueButton = null;
      this.nameBackButton = null;
      this.clip.character.marty.select_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickMarty);
      this.clip.character.rita.select_btn.removeEventListener(MouseEvent.MOUSE_DOWN, this.clickRita);
      this.clip.removeEventListener(KeyboardEvent.KEY_DOWN, this.keyListener);
      this.container.removeChild(this.clip);
      this.clip = null;
    }

    public function startClosingScreen():void
    {
      this.isClosing = true;
      this.missingWidget.visible = false;
      this.gameObj.var_107.api.method_105();
      class_4.method_78();
    }

    public function closeSlotSelectScreen(param1:MouseEvent = null):void
    {
      this.clip.removeEventListener(Event.ENTER_FRAME, this.animateScreen);
      this.gameObj.var_113.generateCustomerBitmap();
      this.gameObj.var_109.generateEnemyBitmap();
      if (this.isNewSlot)
      {
        this.gameObj.method_217();
      }
      else
      {
        this.gameObj.var_107.api.method_85("MainMenu");
      }
      this.gameObj.var_107.api.method_86("SlotSelect");
    }

    private function buildModel(param1:Number, param2:Number):MovieClip
    {
      var _loc5_:MovieClip = null;
      var _loc38_:Class = null;
      var _loc39_:Class = null;
      var _loc40_:MovieClip = null;
      var _loc41_:MovieClip = null;
      var _loc42_:MovieClip = null;
      var _loc43_:MovieClip = null;
      var _loc44_:Class = null;
      var _loc45_:MovieClip = null;
      var _loc46_:MovieClip = null;
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
      _loc5_.scaleX = 0.35;
      _loc5_.scaleY = 0.35;
      var _loc7_:MovieClip = _loc5_;
      var _loc8_:String = this.gameObj.var_113.getCustomerClipName(param1);
      if (param2 == 2)
      {
        _loc8_ += "2";
      }
      else if (param2 == 3)
      {
        _loc8_ += "3";
      }
      var _loc9_:Class = getDefinitionByName("customer_" + _loc8_ + "_body") as Class;
      var _loc10_:MovieClip = new _loc9_();
      _loc10_.name = "clip";
      _loc7_.body.addChild(_loc10_);
      var _loc11_:Class = getDefinitionByName("customer_" + _loc8_ + "_head") as Class;
      var _loc12_:MovieClip = new _loc11_();
      _loc12_.name = "clip";
      _loc7_.head.addChild(_loc12_);
      var _loc13_:Class = getDefinitionByName("customer_" + _loc8_ + "_eyes") as Class;
      var _loc14_:MovieClip = new _loc13_();
      _loc14_.name = "clip";
      _loc7_.eyes.addChild(_loc14_);
      var _loc15_:Class = getDefinitionByName("customer_" + _loc8_ + "_mouth") as Class;
      var _loc16_:MovieClip = new _loc15_();
      _loc16_.name = "clip";
      _loc7_.mouth.addChild(_loc16_);
      var _loc17_:Class = getDefinitionByName("customer_" + _loc8_ + "_neck") as Class;
      var _loc18_:MovieClip = new _loc17_();
      _loc18_.name = "clip";
      _loc7_.neck.addChild(_loc18_);
      var _loc19_:MovieClip = null;
      try
      {
        _loc38_ = getDefinitionByName("customer_" + _loc8_ + "_hair") as Class;
        _loc19_ = new _loc38_();
        _loc19_.name = "clip";
        _loc7_.hair.addChild(_loc19_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc39_ = getDefinitionByName("customer_" + _loc8_ + "_back_hair") as Class;
        _loc40_ = new _loc39_();
        _loc40_.name = "clip";
        _loc7_.back_hair.addChild(_loc40_);
      }
      catch (err:Error)
      {
      }
      var _loc20_:Class = getDefinitionByName("customer_" + _loc8_ + "_foot") as Class;
      var _loc21_:MovieClip = new _loc20_();
      _loc21_.name = "clip";
      _loc7_.front_shoe.addChild(_loc21_);
      var _loc22_:MovieClip = new _loc20_();
      _loc22_.name = "clip";
      _loc7_.back_shoe.addChild(_loc22_);
      var _loc23_:String = "customer_" + _loc8_ + "_hand";
      var _loc24_:Class = getDefinitionByName(_loc23_) as Class;
      var _loc25_:MovieClip = new _loc24_();
      _loc25_.name = "clip";
      _loc7_.fronthand.addChild(_loc25_);
      var _loc26_:Class = getDefinitionByName("customer_" + _loc8_ + "_hand2") as Class;
      var _loc27_:MovieClip = new _loc26_();
      _loc27_.name = "clip";
      _loc7_.backhand.addChild(_loc27_);
      var _loc28_:Class = getDefinitionByName("customer_" + _loc8_ + "_upperarm") as Class;
      var _loc29_:MovieClip = new _loc28_();
      _loc29_.name = "clip";
      _loc7_.front_upperarm.addChild(_loc29_);
      var _loc30_:MovieClip = new _loc28_();
      _loc30_.name = "clip";
      _loc7_.back_upperarm.addChild(_loc30_);
      var _loc31_:Class = getDefinitionByName("customer_" + _loc8_ + "_forearm") as Class;
      var _loc32_:MovieClip = new _loc31_();
      _loc32_.name = "clip";
      _loc7_.front_forearm.addChild(_loc32_);
      var _loc33_:MovieClip = new _loc31_();
      _loc33_.name = "clip";
      _loc7_.back_forearm.addChild(_loc33_);
      try
      {
        _loc41_ = new _loc31_();
        _loc41_.name = "clip";
        _loc7_.cross_backforearm.addChild(_loc41_);
      }
      catch (err:Error)
      {
      }
      try
      {
        _loc42_ = new _loc26_();
        _loc42_.name = "clip";
        _loc7_.cross_back_hand.addChild(_loc42_);
      }
      catch (err:Error)
      {
      }
      var _loc34_:String = this.gameObj.var_113.getWeaponClipName(param1, param2);
      var _loc35_:Class = getDefinitionByName("weapon_" + _loc34_) as Class;
      var _loc36_:MovieClip = new _loc35_();
      _loc36_.name = "clip";
      _loc7_.weapon.addChild(_loc36_);
      try
      {
        _loc43_ = new _loc35_();
        _loc43_.name = "clip";
        _loc7_.cross_back_weap.addChild(_loc43_);
      }
      catch (err:Error)
      {
      }
      var _loc37_:String = this.gameObj.var_113.getCustomerClipName(param1);
      if (_loc37_ == "Boomer")
      {
        _loc44_ = getDefinitionByName("glider_" + _loc37_) as Class;
        _loc45_ = new _loc44_();
        _loc45_.name = "clip";
        _loc7_.glider.addChild(_loc45_);
      }
      else
      {
        _loc46_ = new MovieClip();
        _loc46_.name = "clip";
        _loc7_.glider.addChild(_loc46_);
      }
      _loc7_.gotoAndStop(1);
      _loc7_.gotoAndStop("stand");
      if (this.gameObj.var_113.getCustomerClipName(param1) == "Connor")
      {
        _loc7_.gotoAndStop("standconnor");
      }
      _loc7_.mouseEnabled = false;
      _loc7_.mouseChildren = false;
      return _loc7_;
    }

    private function cleanupModel(param1:MovieClip):void
    {
      var whichModel:MovieClip = param1;
      var ob:SlotSelectScreen = this;
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
  }
}
