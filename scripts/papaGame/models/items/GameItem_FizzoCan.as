package papaGame.models.items
{
  import flash.external.ExternalInterface;
  import flash.geom.Rectangle;
  import package_4.class_5;
  import papaGame.managers.ItemManager;
  import papaGame.models.GameItem;

  public class GameItem_FizzoCan extends GameItem
  {

    public function GameItem_FizzoCan(param1:class_5, param2:Number, param3:Number, param4:Number, param5:Number, param6:Array, param7:Boolean)
    {
      super(param1, param2, param3, param4, param5, param6, param7);
    }

    override public function defineVars():void
    {
      sheetname = "item_fizzocan";
      sheetIsBitmap = false;
      type = "_FizzoCan";
      spritewidth = 15;
      spriteheight = 29;
      spriteCenterX = 7;
      spriteCenterY = 14;
      spriteTargetX = 7;
      spriteTargetY = 13;
      height = 8;
      width = 8;
      collRect = new Rectangle(-7, -12, 14, 24);
      sheetWidth = 1;
      sheetHeight = 1;
      jumpstart = 0;
      gravity = 0;
      normalgravity = 0;
      speed = 0;
      bounceY = false;
      foreground = false;
      points = 10;
      moneyValue = 1;
      animCycleFrames = ["anim", 2, 1, 0, 0, [0]];
      flickerCycleFrames = ["flicker", 2, 1, 0, 0, [0, 99]];
      doesMove = false;
      doesDisappear = false;
      shouldSaveOnRoomChange = true;
    }

    override public function collectItem():void
    {
      var _loc2_:ItemManager = this.gameObj.var_120;
      if (this.gameObj.var_109.currentLevel == 1)
      {
        ExternalInterface.call("newItem", "level1 - collectCheck:fizzocan");
      }
      this.gameObj.var_106.collectSpecialItem();
      this.gameObj.var_106.earnPoints(this.points);
      this.gameObj.var_104.addEffect(0, 0, "ItemFizzoCanEffect", "", true, 0, -50);
      this.gameObj.var_105.playSound("grabitem.wav");
      _loc2_.removeItem(this.id);
    }
  }
}
