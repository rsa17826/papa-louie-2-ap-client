package papaGame.models.items
{
  import flash.external.ExternalInterface;
  import flash.geom.Rectangle;
  import package_4.class_5;
  import papaGame.managers.ItemManager;
  import papaGame.models.GameItem;

  public class GameItem_Coin extends GameItem
  {

    public function GameItem_Coin(param1:class_5, param2:Number, param3:Number, param4:Number, param5:Number, param6:Array, param7:Boolean)
    {
      super(param1, param2, param3, param4, param5, param6, param7);
    }

    override public function defineVars():void
    {
      sheetname = "item_coin";
      sheetIsBitmap = false;
      type = "_Coin";
      spritewidth = 32;
      spriteheight = 32;
      spriteCenterX = 16;
      spriteCenterY = 16;
      spriteTargetX = 16;
      spriteTargetY = 16;
      height = 8;
      width = 8;
      collRect = new Rectangle(-8, -8, 16, 16);
      sheetWidth = 24;
      sheetHeight = 1;
      jumpstart = 0;
      gravity = 0;
      normalgravity = 0;
      speed = 0;
      bounceY = false;
      foreground = false;
      points = 5;
      moneyValue = 1;
      animCycleFrames = ["anim", 2, 1, 0, 0, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]];
      flickerCycleFrames = ["flicker", 2, 1, 0, 0, [5, 99]];
      doesMove = false;
      doesDisappear = false;
      shouldSaveOnRoomChange = true;
    }

    override public function collectItem():void
    {
      var _loc2_:ItemManager = this.gameObj.var_120;
      this.gameObj.var_106.earnMoney(this.moneyValue);
      this.gameObj.var_106.earnPoints(this.points);
      this.gameObj.var_112.recordCoin();
      if (Boolean(this.gameObj.playerObj) && this.gameObj.playerObj.playerData.customerName == "Georgito")
      {
        this.gameObj.var_112.recordTag("georgito");
      }
      this.gameObj.var_104.addEffect(0, 0, "ItemCoinEffect", "", true, 0, -50);
      this.gameObj.var_105.playSound("getcoin.wav");
      ExternalInterface.call("log", "this.gameObj.var_106.isCoinsDeadly", this.gameObj.var_106.isCoinsDeadly);
      if (this.gameObj.var_106.isCoinsDeadly)
      {
        this.gameObj.playerObj.hurtPlayer(0, 1, true);
      }
      _loc2_.removeItem(this.id);
    }
  }
}
