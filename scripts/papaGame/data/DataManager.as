package papaGame.data
{
  import flash.display.BitmapData;
  import flash.display.LoaderInfo;
  import flash.display.MovieClip;
  import flash.events.*;
  import flash.filters.DropShadowFilter;
  import flash.geom.Point;
  import flash.geom.Rectangle;
  import flash.net.*;
  import flash.ui.Keyboard;
  import flash.utils.*;
  import package_2.class_7;
  import package_4.*;
  import papaGame.managers.BitmapManager;
  import papaGame.models.*;

  public class DataManager
  {

    public static const COLLISION_TILE_NUMBER:Number = 99991;

    public static const SLOPE_TILE_NUMBER:Number = 99992;

    public static const THRUBLOCK_TILE_NUMBER:Number = 99993;

    public static const GRAB_TILE_NUMBER:Number = 99994;

    public static const LADDER_TILE_NUMBER:Number = 99995;

    public static const KEY_JUMP:String = "keyCodeJump";

    public static const KEY_ATTACK:String = "keyCodeAttack";

    public static const KEY_UP:String = "keyCodeUp";

    public static const KEY_DOWN:String = "keyCodeDown";

    public static const KEY_LEFT:String = "keyCodeLeft";

    public static const KEY_RIGHT:String = "keyCodeRight";

    public static const KEY_DROP:String = "keyCodeDrop";

    public static const KEY_PAUSE:String = "keyCodePause";

    public static const STAT_ADDED_PER_UPGRADE:Number = 10;

    public static const PUNCH_STAT:Number = 10;

    public static const DEFENSE_PERCENT_PER_UPGRADE:Number = 10;

    public static const HEALTH_ADDED_PER_UPGRADE:Number = 50;

    public var gameObj:class_5;

    public var levelDataClass:LevelData;

    public var masterLevelData:XMLList;

    public var worldData:XMLList;

    public var totalLevels:Number = 0;

    public var totalWorlds:Number = 0;

    public var currentScreens:Array = [];

    public var currentScreenData:ScreenData;

    public var currentWorldData:WorldData;

    public var checkpointData:CheckpointData = null;

    public var firstPlay:Boolean = false;

    public var randomSeed:Number = 2303499;

    public var currentLevel:Number = 1;

    public var currentScreen:Number = 0;

    public var currentTileset:Number = 1;

    private var keyNameMap:Array = [];

    public var keyConstants:Array = [Keyboard.ENTER, Keyboard.SPACE, Keyboard.SHIFT, Keyboard.CONTROL, Keyboard.DELETE, Keyboard.BACKSPACE, Keyboard.UP, Keyboard.DOWN, Keyboard.LEFT, Keyboard.RIGHT];

    public var keyStrings:Array = ["enter", "space", "shift", "ctrl", "del", "back", "↑", "↓", "←", "→"];

    public var loadingClip:MovieClip;

    public var collisionArray:Array;

    public var thruArray:Array;

    public var grabArray:Array;

    public var slopeArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var standardCollisionArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var standardThruArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var standardGrabArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var trainCollisionArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0]];

    public var trainThruArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var trainGrabArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var bargeCollisionArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]];

    public var bargeThruArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var bargeGrabArray:Array = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

    public var solidTileList:Array = [50, 51, 52, 53, 112, 113, 114, 115, 174, 175, 176, 177, 236, 237, 238, 239, 1736, 1737, 1738, 1739, 1740, 1741, 1742, 1743, 1744, 1745, 1746, 1747, 1748, 1798, 1799, 1800, 1801, 1802, 1803, 1804, 1805, 1806, 1807, 1808, 1809, 1810, 1860, 1861, 1862, 1863, 1864, 1865, 1866, 1867, 1868, 1869, 1870];

    public var thruTileList:Array = [1062, 1063, 1064, 1558, 1559, 1560, 1065, 1066, 1067, 1068, 1069, 1070, 1561, 1562, 1563, 1564, 1565, 1566, 1196, 1197, 1198, 1199, 1200, 1201, 1202, 1203, 1204, 1692, 1693, 1694, 1695, 1696, 1697, 1698, 1699, 1700];

    public var slopeTileList_22A:Array = [62, 1054, 1550, 187, 1179, 1675, 195, 1187, 1683];

    public var slopeTileList_22B:Array = [63, 1055, 1551];

    public var slopeTileList_22C:Array = [64, 1056, 1552];

    public var slopeTileList_22D:Array = [65, 1057, 1553, 186, 1178, 1674, 194, 1186, 1682];

    public var slopeTileList_45A:Array = [66, 1058, 1554, 189, 1181, 1677, 686];

    public var slopeTileList_45B:Array = [67, 1059, 1555, 188, 1180, 1676, 687];

    public var slopeTileList_67A:Array = [130, 1122, 1618];

    public var slopeTileList_67B:Array = [68, 1060, 1556, 682, 684];

    public var slopeTileList_67C:Array = [69, 1061, 1557, 683, 685];

    public var slopeTileList_67D:Array = [131, 1123, 1619];

    public var slopeTileList_67E:Array = [606];

    public var slopeTileList_67F:Array = [622, 620, 408];

    public var slopeTileList_67G:Array = [623, 621, 409];

    public var slopeTileList_67H:Array = [607];

    public var slopeTileList_22E:Array = [479, 473, 350];

    public var slopeTileList_22F:Array = [351];

    public var slopeTileList_22G:Array = [352];

    public var slopeTileList_22H:Array = [478, 472, 353];

    public var slopeTileList_45C:Array = [624, 475, 608];

    public var slopeTileList_45D:Array = [625, 474, 349];

    public var slopeTileList_solid:Array = [62, 63, 64, 65, 66, 67, 130, 68, 69, 131, 186, 187, 188, 189, 194, 195, 686, 687, 682, 684, 683, 685];

    public var treasureNames:Array = ["Silver Scorpion", "Jeweled Telescope", "Emerald Crown", "Yankee Egg", "Crystal Rail Spike", "Onyx Heart", "Eternal Lantern", "Cannonball Pearl", "Golden Wheel", "Jade Skull", "Lost Cryptex", "Saved Ella"];

    public var maxUpgradeLevel:Number = 6;

    public var upgradePrices:Array = [[0, 25, 100, 280, 560, 1600], [0, 50, 110, 290, 580, 1750], [0, 60, 120, 300, 600, 1800], [0, 70, 140, 330, 660, 1850], [0, 80, 160, 360, 720, 1900], [0, 85, 170, 400, 750, 1950], [0, 100, 200, 400, 800, 2000], [0, 90, 180, 380, 740, 2000], [0, 90, 180, 380, 740, 2000]];

    public var outfitPrices:Array = [[0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120], [0, 90, 120]];

    public var arsenalArray:Array = [ {
          "title": "Machete",
          "cost": 880
        }, {
          "title": "Pipe",
          "cost": 810
        }, {
          "title": "Shovel",
          "cost": 840
        }, {
          "title": "Mallet",
          "cost": 2040
        }, {
          "title": "Cactus",
          "cost": 552
        }, {
          "title": "Stick",
          "cost": 432
        }, {
          "title": "Cleaver",
          "cost": 880
        }, {
          "title": "Guitar",
          "cost": 1200
        }, {
          "title": "Crowbar",
          "cost": 1260
        }, {
          "title": "ButterflyNet",
          "cost": 1920
        }, {
          "title": "Axe",
          "cost": 900
        }, {
          "title": "Sickle",
          "cost": 1152
        }, {
          "title": "PoolCue",
          "cost": 580
        }, {
          "title": "Pickaxe",
          "cost": 750
        }, {
          "title": "Bone",
          "cost": 1404
        }, {
          "title": "Nunchucks",
          "cost": 880
        }, {
          "title": "Cutlass",
          "cost": 2400
        }, {
          "title": "Katana",
          "cost": 2340
        }, {
          "title": "Morningstar",
          "cost": 1350
        }, {
          "title": "Longsword",
          "cost": 2400
        }, {
          "title": "Macana",
          "cost": 1920
        }, {
          "title": "Scythe",
          "cost": 1800
        }, {
          "title": "Crossbow",
          "cost": 1984
        }, {
          "title": "BBGun",
          "cost": 1500
        }, {
          "title": "HarpoonGun",
          "cost": 1920
        }, {
          "title": "Shotgun",
          "cost": 1760
        }, {
          "title": "SubMachineGun",
          "cost": 6240
        }, {
          "title": "Flamethrower",
          "cost": 5100
        }, {
          "title": "Blunderbuss",
          "cost": 2048
        }, {
          "title": "Gatling",
          "cost": 9800
        }, {
          "title": "Revolver",
          "cost": 1728
        }, {
          "title": "RomanCandle",
          "cost": 2000
        }, {
          "title": "DartGun",
          "cost": 1728
        }, {
          "title": "FlareGun",
          "cost": 900
        }, {
          "title": "HatfieldPistol",
          "cost": 2400
        }, {
          "title": "BrassKnuckles",
          "cost": 2500
        }, {
          "title": "BoxingGloves",
          "cost": 1520
        }, {
          "title": "BrawlerGloves",
          "cost": 1500
        }, {
          "title": "Iron",
          "cost": 2640
        }, {
          "title": "BearClaws",
          "cost": 2750
        }, {
          "title": "IronClad",
          "cost": 3150
        }, {
          "title": "MeatHooks",
          "cost": 2925
        }, {
          "title": "Katar",
          "cost": 3150
        }, {
          "title": "BullWhip",
          "cost": 1880
        }, {
          "title": "ChainWhip",
          "cost": 2475
        }, {
          "title": "Rope",
          "cost": 1610
        }, {
          "title": "Rattlesnake",
          "cost": 2800
        }, {
          "title": "BarbedWire",
          "cost": 2960
        }, {
          "title": "TowChain",
          "cost": 3772
        }, {
          "title": "Meteor",
          "cost": 4250
        }, {
          "title": "FlyTrap",
          "cost": 3600
        }, {
          "title": "CatOfNineTails",
          "cost": 4600
        }, {
          "title": "Dagger",
          "cost": 725
        }, {
          "title": "Egg",
          "cost": 360
        }, {
          "title": "Tomahawk",
          "cost": 1560
        }, {
          "title": "Bottle",
          "cost": 480
        }, {
          "title": "Firecracker",
          "cost": 1250
        }, {
          "title": "FuseBomb",
          "cost": 1600
        }, {
          "title": "CherryBomb",
          "cost": 1230
        }, {
          "title": "Boomerang",
          "cost": 3500
        }, {
          "title": "Lantern",
          "cost": 1500
        }, {
          "title": "TNT",
          "cost": 1140
        }, {
          "title": "PowerBall",
          "cost": 900
        }, {
          "title": "WaterBalloon",
          "cost": 1120
        }, {
          "title": "ProxyMine",
          "cost": 1200
        }, {
          "title": "ThornBomb",
          "cost": 1600
        }, {
          "title": "Chainsaw",
          "cost": 6000
        }, {
          "title": "Buzzsaw",
          "cost": 6400
        }, {
          "title": "PowerDrill",
          "cost": 6800
        }, {
          "title": "Crocodile",
          "cost": 6000
        }, {
          "title": "Bazooka",
          "cost": 1750
        }, {
          "title": "GrenadeLauncher",
          "cost": 1200
        }, {
          "title": "TearGasLauncher",
          "cost": 1200
        }, {
          "title": "Cannon",
          "cost": 1300
        }, {
          "title": "LadderSpear",
          "cost": 0
        }];

    public var weaponIDsToNames:Array = ["", "Mallet", "Revolver", "Guitar", "Cutlass", "BoxingGloves", "Blunderbuss", "Gatling", "Bazooka", "TowChain", "TwoByFour", "CatOfNineTails", "Axe", "Banjo", "BarbedWire", "Bat", "Bone", "BrassKnuckles", "BullWhip", "Cactus", "ChainWhip", "Club", "Crossbow", "Crowbar", "PoolCue", "Derringer", "Flamethrower", "HarpoonGun", "Iron", "Katana", "Longsword", "Machete", "Meteor", "Morningstar", "Nightstick", "Pickaxe", "Pipe", "Rattlesnake", "RomanCandle", "Rope", "Scythe", "Shotgun", "Shovel", "Sickle", "Stick", "SubMachineGun", "ThornWhip", "PlayingCard", "Dart", "Dagger", "Badge", "TNT", "Lantern", "CherryBomb", "Tomahawk", "Grenade", "Scorpion", "TearGas", "SquirtGun", "HatfieldPistol", "Chainsaw", "Pitchfork", "LadderSpear", "BearClaws", "BrawlerGloves", "IronClad", "Katar", "MeatHooks", "FlyTrap", "Macana", "ButterflyNet", "Cleaver", "Nunchucks", "PowerDrill", "Buzzsaw", "BBGun", "Egg", "Bottle", "Cannon", "GrenadeLauncher", "TearGasLauncher", "Crocodile", "DartGun", "FlareGun", "WaterBalloon", "ProxyMine", "PowerBall", "FuseBomb", "ThornBomb"
        , "Boomerang", "Firecracker", "Halberd", "Lance", "SharpStick", "Spear", "Trident", "BossScythe"];

    public var coinsToUnlockWorld:Array = [1, 2, 3, 5, 7, 10, 14, 18, 24, 50];

    public var enemyKey:Array = [ {
          "id": 1,
          "title": "Onion",
          "clip": "onion"
        }, {
          "id": 2,
          "title": "Brown Onion",
          "clip": "brownonion"
        }, {
          "id": 3,
          "title": "Army Onion",
          "clip": "fortonion"
        }, {
          "id": 5,
          "title": "Kaiser Onion",
          "clip": "kaiseronion"
        }, {
          "id": 6,
          "title": "Red Tomato",
          "clip": "redtomato"
        }, {
          "id": 7,
          "title": "Roma Tomato",
          "clip": "romatomato"
        }, {
          "id": 8,
          "title": "Runt Tomato",
          "clip": "runttomato"
        }, {
          "id": 11,
          "title": "Party Sub",
          "clip": "partysub"
        }, {
          "id": 12,
          "title": "Burger Slider",
          "clip": "burgerslider"
        }, {
          "id": 13,
          "title": "Brussel Lark",
          "clip": "brussellark"
        }, {
          "id": 14,
          "title": "Lettuce Lark",
          "clip": "lettucelark"
        }, {
          "id": 15,
          "title": "Leafy Lark",
          "clip": "leafylark"
        }, {
          "id": 16,
          "title": "Dill Wheel",
          "clip": "dillwheel"
        }, {
          "id": 17,
          "title": "Dill Worm",
          "clip": "dillworm"
        }, {
          "id": 18,
          "title": "Dill Weed",
          "clip": "dillweed"
        }, {
          "id": 19,
          "title": "Blue Shroom",
          "clip": "blueshroom"
        }, {
          "id": 20,
          "title": "Thorn Shroom",
          "clip": "thornshroom"
        }, {
          "id": 21,
          "title": "Bow Shroom",
          "clip": "bowshroom"
        }, {
          "id": 22,
          "title": "Bacobar",
          "clip": "bacobar"
        }, {
          "id": 23,
          "title": "Bacoburn",
          "clip": "bacoburn"
        }, {
          "id": 24,
          "title": "Bacobites",
          "clip": "bacobite"
        }, {
          "id": 25,
          "title": "Swiss Zack",
          "clip": "swisszack"
        }, {
          "id": 26,
          "title": "Cheddar Mack",
          "clip": "cheddarmack"
        }, {
          "id": 27,
          "title": "Pepper Jack",
          "clip": "pepperjack"
        }, {
          "id": 28,
          "title": "Radish",
          "clip": "radish"
        }, {
          "id": 29,
          "title": "Laddish",
          "clip": "laddish"
        }, {
          "id": 30,
          "title": "Pararadish",
          "clip": "pararadish"
        }, {
          "id": 31,
          "title": "Cheese Wheel",
          "clip": "cheesewheel"
        }, {
          "id": 32,
          "title": "Jellyback",
          "clip": "jellyback"
        }, {
          "id": 33,
          "title": "Awesome Saucer",
          "clip": "awesomesaucer"
        }, {
          "id": 34,
          "title": "Burgerzilla",
          "clip": "burgerzilla"
        }, {
          "id": 35,
          "title": "Sarge",
          "clip": "sarge"
        }, {
          "id": 37,
          "title": "Radley Madish",
          "clip": "boss"
        }];

    public var enemyThumbBMP:BitmapData;

    public function DataManager(param1:class_5)
    {
      super();
      var _loc2_:DataManager = this;
      _loc2_.gameObj = param1;
      _loc2_.levelDataClass = new LevelData();
      _loc2_.setupKeyNames();
    }

    public function weaponNameToID(param1:String):Number
    {
      var _loc2_:DataManager = this;
      var _loc3_:Number = _loc2_.weaponIDsToNames.indexOf(param1);
      if (param1 == "punch")
      {
        _loc3_ = 0;
      }
      return _loc3_;
    }

    public function getLeaderBoardID(param1:String):String
    {
      var _loc2_:DataManager = this;
      return _loc2_[param1 + "BoardID"];
    }

    public function getPropValue(param1:String, param2:*):Number
    {
      var _loc7_:int = 0;
      var _loc3_:DataManager = this;
      var _loc4_:Number = 0;
      var _loc5_:Number = 0;
      var _loc6_:Number = 0;
      if (param2 is Array)
      {
        if (param2.length > 0)
        {
          _loc7_ = 0;
          while (_loc7_ < param2.length)
          {
            _loc5_ = Math.floor(param2[_loc7_] / this.collisionArray[0].length);
            _loc6_ = param2[_loc7_] % this.collisionArray[0].length;
            if (param2[_loc7_] == DataManager.COLLISION_TILE_NUMBER)
            {
              if (param1 == "collision")
              {
                _loc4_ = 1;
              }
              else
              {
                _loc4_ = 0;
              }
            }
            else if (param2[_loc7_] == DataManager.THRUBLOCK_TILE_NUMBER)
            {
              if (param1 == "thrublock" || param1 == "thru")
              {
                _loc4_ = 1;
              }
              else
              {
                _loc4_ = 0;
              }
            }
            else if (param2[_loc7_] == DataManager.GRAB_TILE_NUMBER)
            {
              if (param1 == "grab")
              {
                _loc4_ = 1;
              }
              else
              {
                _loc4_ = 0;
              }
            }
            else if (param2[_loc7_] == DataManager.LADDER_TILE_NUMBER)
            {
              if (param1 == "ladder")
              {
                _loc4_ = 1;
              }
              else
              {
                _loc4_ = 0;
              }
            }
            else
            {
              if (param1 != "grab")
              {
                if (param1 == "thru")
                {
                  if (_loc3_.thruTileList.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 1;
                  }
                  else
                  {
                    _loc4_ = 0;
                  }
                }
                else if (param1 == "slope" || param1 == "solidslope")
                {
                  if (_loc3_.slopeTileList_22A.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 3;
                  }
                  else if (_loc3_.slopeTileList_22B.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 4;
                  }
                  else if (_loc3_.slopeTileList_22C.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 5;
                  }
                  else if (_loc3_.slopeTileList_22D.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 6;
                  }
                  else if (_loc3_.slopeTileList_45A.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 1;
                  }
                  else if (_loc3_.slopeTileList_45B.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 2;
                  }
                  else if (_loc3_.slopeTileList_67A.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 7;
                  }
                  else if (_loc3_.slopeTileList_67B.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 8;
                  }
                  else if (_loc3_.slopeTileList_67C.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 9;
                  }
                  else if (_loc3_.slopeTileList_67D.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 10;
                  }
                  if (param1 == "solidslope" && _loc4_ != 0 && _loc3_.slopeTileList_solid.indexOf(param2[_loc7_]) == -1)
                  {
                    _loc4_ = 0;
                  }
                }
                else if (param1 == "ceilingslope")
                {
                  if (_loc3_.slopeTileList_22E.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 3;
                  }
                  else if (_loc3_.slopeTileList_22F.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 4;
                  }
                  else if (_loc3_.slopeTileList_22G.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 5;
                  }
                  else if (_loc3_.slopeTileList_22H.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 6;
                  }
                  else if (_loc3_.slopeTileList_45C.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 1;
                  }
                  else if (_loc3_.slopeTileList_45D.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 2;
                  }
                  else if (_loc3_.slopeTileList_67E.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 7;
                  }
                  else if (_loc3_.slopeTileList_67F.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 8;
                  }
                  else if (_loc3_.slopeTileList_67G.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 9;
                  }
                  else if (_loc3_.slopeTileList_67H.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 10;
                  }
                }
                else if (param1 == "ceilingslopereverse")
                {
                  if (_loc3_.slopeTileList_22E.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 3;
                  }
                  else if (_loc3_.slopeTileList_22F.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 4;
                  }
                  else if (_loc3_.slopeTileList_22G.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 5;
                  }
                  else if (_loc3_.slopeTileList_22H.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 6;
                  }
                  else if (_loc3_.slopeTileList_45C.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 1;
                  }
                  else if (_loc3_.slopeTileList_45D.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 2;
                  }
                  else if (_loc3_.slopeTileList_67E.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 7;
                  }
                  else if (_loc3_.slopeTileList_67F.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 8;
                  }
                  else if (_loc3_.slopeTileList_67G.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 9;
                  }
                  else if (_loc3_.slopeTileList_67H.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 10;
                  }
                  else if (_loc3_.slopeTileList_22A.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 5;
                  }
                  else if (_loc3_.slopeTileList_22B.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 6;
                  }
                  else if (_loc3_.slopeTileList_22C.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 3;
                  }
                  else if (_loc3_.slopeTileList_22D.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 4;
                  }
                  else if (_loc3_.slopeTileList_45A.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 2;
                  }
                  else if (_loc3_.slopeTileList_45B.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 1;
                  }
                  else if (_loc3_.slopeTileList_67A.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 9;
                  }
                  else if (_loc3_.slopeTileList_67B.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 10;
                  }
                  else if (_loc3_.slopeTileList_67C.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 7;
                  }
                  else if (_loc3_.slopeTileList_67D.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 8;
                  }
                  if (_loc4_ != 0 && _loc3_.slopeTileList_solid.indexOf(param2[_loc7_]) != -1)
                  {
                    _loc4_ = 0;
                  }
                }
                else if (param1 == "collision" || param1 == "naturalcollision")
                {
                  if (_loc3_.solidTileList.indexOf(param2[_loc7_]) > -1)
                  {
                    _loc4_ = 1;
                  }
                  else
                  {
                    _loc4_ = 0;
                  }
                }
              }
              if (_loc4_ == -1)
              {
                _loc4_ = 0;
              }
            }
            if (_loc4_ > 0)
            {
              break;
            }
            _loc7_++;
          }
        }
      }
      else
      {
        class_7.error("GETPROPVALUE --- NOT ARRAY?!");
        _loc5_ = Math.floor(param2 / this.collisionArray[0].length);
        _loc6_ = param2 % this.collisionArray[0].length;
        if (param2 == DataManager.COLLISION_TILE_NUMBER)
        {
          if (param1 == "collision")
          {
            _loc4_ = 1;
          }
          else
          {
            _loc4_ = 0;
          }
        }
        else if (param1 == "collision")
        {
          if (_loc3_.solidTileList.indexOf(param2[_loc7_]) > -1)
          {
            _loc4_ = 1;
          }
          else
          {
            _loc4_ = 0;
          }
        }
      }
      return _loc4_;
    }

    private function getMainLoaderInfo():LoaderInfo
    {
      var _loc1_:DataManager = this;
      var _loc2_:LoaderInfo = _loc1_.gameObj.root.loaderInfo;
      if (_loc2_.loader != null)
      {
        _loc2_ = _loc2_.loader.loaderInfo;
      }
      return _loc2_;
    }

    public function prepareLevelData(param1:Boolean = false):void
    {
      var _loc2_:DataManager = this;
      param1 = true;
      if (param1)
      {
        _loc2_.loadingClip = _loc2_.gameObj.method_183();
        _loc2_.loadingClip.addEventListener(Event.ENTER_FRAME, _loc2_.generateLevelData);
      }
    }

    public function generateLevelData(param1:Event = null):void
    {
      var _loc2_:DataManager = this;
      class_7.method_1("GENERATE LEVEL DATA:");
      _loc2_.levelDataClass.prepareXML(_loc2_.levelDataLoaded, _loc2_.loadingClip.bar);
      _loc2_.loadingClip.removeEventListener(Event.ENTER_FRAME, _loc2_.generateLevelData);
    }

    public function levelDataLoaded(param1:Event = null, param2:Boolean = false):void
    {
      class_7.method_1("LEVEL DATA LOADED.");
      var _loc3_:DataManager = this;
      if (param2)
      {
        _loc3_.masterLevelData = _loc3_.levelDataClass.getLevelXMLList();
        _loc3_.totalLevels = _loc3_.masterLevelData.length();
        _loc3_.worldData = _loc3_.levelDataClass.getWorldXMLList();
        _loc3_.totalWorlds = _loc3_.worldData.length();
        _loc3_.gameObj.method_224();
      }
    }

    public function levelDataError(param1:IOErrorEvent):void
    {
      var _loc2_:DataManager = this;
      class_7.error("IO Error loading levels, use INTERNAL instead.");
      _loc2_.prepareLevelData(true);
    }

    public function setupLevelScreens(param1:Number):void
    {
      var manager:DataManager = null;
      var bitmapManager:BitmapManager = null;
      var i:int = 0;
      var worldXML:XML = null;
      var whichTileset:Number = NaN;
      var savedArray:Array = null;
      var roomArray:Array = null;
      var useXMLList:XMLList = null;
      var useXML:XML = null;
      var thisScreen:ScreenData = null;
      var whichLevel:Number = param1;
      manager = this;
      bitmapManager = manager.gameObj.bitmapManager;
      class_7.method_1(">>>>> Setup Level Screens: " + whichLevel);
      manager.currentTileset = whichLevel;
      worldXML = XMLList(manager.worldData.(tileset == String(whichLevel)))[0];
      if (worldXML == null)
      {
        class_7.error("WORLD DOESN\'T EXIST YET! Fixer -- Default to World 2.");
        whichLevel = 1;
        worldXML = XMLList(manager.worldData.(tileset == String(whichLevel)))[0];
      }
      manager.clearLevelScreens();
      whichTileset = whichLevel;
      manager.currentLevel = whichLevel;
      manager.currentWorldData = new WorldData(manager.gameObj, worldXML);
      if (manager.checkpointData != null && manager.checkpointData.getCheckpointLevel() == whichLevel)
      {
        class_7.info(">>>>>  Use Checkpoint Data");
        manager.currentScreen = manager.checkpointData.getStartingRoomIndex();
        savedArray = manager.checkpointData.getScreenDataArray();
        i = 0;
        while (i < savedArray.length)
        {
          manager.currentScreens.push(savedArray[i]);
          if (i == manager.currentScreen)
          {
            manager.currentScreenData = savedArray[i];
          }
          i++;
        }
      }
      else
      {
        class_7.info(">>>>> Normal Loading");
        manager.currentScreen = manager.currentWorldData.worldStartRoom;
        roomArray = manager.currentWorldData.getWorldRoomIDs();
        i = 0;
        while (i < roomArray.length)
        {
          class_7.method_1("Creating Room " + i + ": ID " + roomArray[i]);
          useXMLList = manager.masterLevelData.(roomID == String(roomArray[i]));
          useXML = useXMLList[0];
          thisScreen = new ScreenData(manager.gameObj, useXML, whichTileset, i);
          manager.currentScreens.push(thisScreen);
          if (i == manager.currentScreen)
          {
            manager.currentScreenData = thisScreen;
          }
          i++;
        }
      }
      manager.setupCollisionArrays();
    }

    public function getWorldTitle(param1:Number):String
    {
      var manager:DataManager = null;
      var returnName:String = null;
      var worldXML:XML = null;
      var whichWorld:Number = param1;
      manager = this;
      returnName = "Doesn\'t Exist Yet!";
      worldXML = XMLList(manager.worldData.(tileset == String(whichWorld)))[0];
      if (worldXML != null)
      {
        returnName = worldXML.worldTitle;
      }
      return returnName;
    }

    public function setActiveRoom(param1:Number):void
    {
      var _loc2_:DataManager = this;
      if (_loc2_.currentScreenData)
      {
        _loc2_.currentScreenData.objectsInitialized = false;
        _loc2_.currentScreenData.clearBitmaps();
      }
      _loc2_.currentScreenData = _loc2_.currentScreens[param1];
      _loc2_.currentScreen = param1;
    }

    public function saveCheckpoint(param1:Number = -1, param2:Number = -1):void
    {
      var _loc3_:DataManager = this;
      class_7.method_1("Saving Checkpoint...");
      if (_loc3_.checkpointData != null)
      {
        _loc3_.checkpointData.destroy();
        _loc3_.checkpointData = null;
      }
      _loc3_.checkpointData = new CheckpointData(_loc3_.gameObj, _loc3_.currentLevel, _loc3_.currentScreen, _loc3_.currentScreens, param1, param2);
    }

    public function clearCheckpoint():void
    {
      var _loc1_:DataManager = this;
      class_7.method_1("Clearing Checkpoint");
      if (_loc1_.checkpointData != null)
      {
        _loc1_.checkpointData.destroy();
        _loc1_.checkpointData = null;
      }
    }

    public function handleCheckpointProgress():void
    {
      var _loc1_:DataManager = this;
      if (_loc1_.checkpointData != null && _loc1_.checkpointData.whichLevel == _loc1_.currentLevel)
      {
        class_7.method_1("Repopulate variables and challenges based on checkpoint.");
        _loc1_.gameObj.var_108.gameplayTimer = _loc1_.checkpointData.save_gameplayTimer;
        _loc1_.gameObj.var_106.gotHurt = _loc1_.checkpointData.save_gotHurt;
        _loc1_.gameObj.var_106.fellInWater = _loc1_.checkpointData.save_fellInWater;
        _loc1_.gameObj.var_106.killsTally = _loc1_.checkpointData.save_killsTally;
        _loc1_.gameObj.var_106.livesLost.setValue(_loc1_.checkpointData.save_livesLost);
        _loc1_.gameObj.var_106.burgerzillas.setValue(_loc1_.checkpointData.burgerzillas_tally);
        _loc1_.gameObj.var_106.money.setValue(_loc1_.checkpointData.money_tally);
        _loc1_.gameObj.var_106.specialitems.setValue(_loc1_.checkpointData.specialitems_tally);
        _loc1_.gameObj.var_112.setChallengeTallyFromCheckpoint(_loc1_.checkpointData.whichLevel, 1, _loc1_.checkpointData.challenge1_tally);
        _loc1_.gameObj.var_112.setChallengeTallyFromCheckpoint(_loc1_.checkpointData.whichLevel, 2, _loc1_.checkpointData.challenge2_tally);
        _loc1_.gameObj.var_112.setChallengeTallyFromCheckpoint(_loc1_.checkpointData.whichLevel, 3, _loc1_.checkpointData.challenge3_tally);
        _loc1_.gameObj.var_112.setChallengeTallyFromCheckpoint(_loc1_.checkpointData.whichLevel, 4, _loc1_.checkpointData.challenge4_tally);
        _loc1_.gameObj.var_112.setChallengeTallyFromCheckpoint(_loc1_.checkpointData.whichLevel, 5, _loc1_.checkpointData.challenge5_tally);
        _loc1_.gameObj.var_112.setChallengeTallyFromCheckpoint(_loc1_.checkpointData.whichLevel, 6, _loc1_.checkpointData.challenge6_tally);
        _loc1_.gameObj.var_107.api.method_88("Started From Checkpoint", "Gameplay");
      }
    }

    public function setupCollisionArrays():void
    {
      var _loc1_:DataManager = this;
      _loc1_.collisionArray = _loc1_.standardCollisionArray;
      _loc1_.thruArray = _loc1_.standardThruArray;
      _loc1_.grabArray = _loc1_.standardGrabArray;
    }

    public function clearLevelScreens():void
    {
      var _loc2_:Number = NaN;
      var _loc1_:DataManager = this;
      if (_loc1_.currentScreenData != null)
      {
        _loc1_.currentScreenData.destroy();
        _loc1_.currentScreenData = null;
      }
      if (_loc1_.currentWorldData != null)
      {
        _loc1_.currentWorldData.destroy();
        _loc1_.currentWorldData = null;
      }
      _loc2_ = 0;
      while (_loc2_ < _loc1_.currentScreens.length)
      {
        _loc1_.currentScreens[_loc2_].destroy();
        _loc1_.currentScreens[_loc2_] = null;
        _loc2_++;
      }
      _loc1_.currentScreens = null;
      _loc1_.currentScreens = [];
    }

    public function randomize(param1:Boolean = true):Number
    {
      var _loc2_:DataManager = this;
      if (param1)
      {
        return (_loc2_.randomSeed = _loc2_.randomSeed * 16807 % 2147483647) / 2147483647 + 2.33e-10;
      }
      return Math.random();
    }

    public function initializeScreenObjects(param1:Number):void
    {
      var _loc2_:DataManager = this;
      var _loc3_:class_5 = _loc2_.gameObj;
      var _loc4_:ScreenData = _loc2_.currentScreenData;
      if (!_loc4_.objectsInitialized)
      {
        _loc3_.var_111.clearObjects(param1, true);
        _loc3_.var_110.clearEnemies(param1, true);
        _loc3_.var_120.clearItems(param1, true);
        _loc3_.var_111.buildObjects(param1);
        _loc3_.var_110.buildEnemies(param1);
        _loc3_.var_120.buildItems(param1);
        _loc3_.var_194.loadEvents(param1);
        _loc3_.var_116.preblitSheets();
        _loc3_.var_104.preblitSheets();
        _loc3_.var_110.preblitSheets();
        _loc3_.var_111.preblitSheets();
      }
      else
      {
        class_7.error("ERROR: Screen " + param1 + " is already initialized!");
      }
    }

    public function destroy():void
    {
      var _loc1_:DataManager = this;
      _loc1_.levelDataClass = null;
      _loc1_.masterLevelData = null;
      _loc1_.currentScreenData.destroy();
      _loc1_.currentScreenData = null;
      this.gameObj.var_111.clearObjects(_loc1_.currentLevel, true);
      this.gameObj.var_110.clearEnemies(_loc1_.currentLevel, true);
      this.gameObj.var_120.clearItems(_loc1_.currentLevel, true);
    }

    public function isOnTrain():Boolean
    {
      return false;
    }

    public function isOnBarge():Boolean
    {
      return false;
    }

    public function isAnimatedBackground():Boolean
    {
      var _loc1_:DataManager = this;
      if (_loc1_.currentLevel == 9)
      {
        return true;
      }
        return true;
      return false;
    }

    public function getUpgradeCost(param1:String, param2:Number):Number
    {
      var _loc3_:DataManager = this;
      var _loc4_:Number = 999999;
      if (param2 <= _loc3_.maxUpgradeLevel)
      {
        if (param1 == "punching")
        {
          _loc4_ = Number(_loc3_.upgradePrices[0][param2 - 1]);
        }
        else if (param1 == "swinging")
        {
          _loc4_ = Number(_loc3_.upgradePrices[1][param2 - 1]);
        }
        else if (param1 == "shooting")
        {
          _loc4_ = Number(_loc3_.upgradePrices[2][param2 - 1]);
        }
        else if (param1 == "throwing")
        {
          _loc4_ = Number(_loc3_.upgradePrices[3][param2 - 1]);
        }
        else if (param1 == "whipping")
        {
          _loc4_ = Number(_loc3_.upgradePrices[4][param2 - 1]);
        }
        else if (param1 == "thrusting")
        {
          _loc4_ = Number(_loc3_.upgradePrices[5][param2 - 1]);
        }
        else if (param1 == "launching")
        {
          _loc4_ = Number(_loc3_.upgradePrices[6][param2 - 1]);
        }
        else if (param1 == "health")
        {
          _loc4_ = Number(_loc3_.upgradePrices[7][param2 - 1]);
        }
        else if (param1 == "defense")
        {
          _loc4_ = Number(_loc3_.upgradePrices[8][param2 - 1]);
        }
      }
      else
      {
        _loc4_ = -1;
      }
      return _loc4_;
    }

    public function getArsenalCost(param1:String):Number
    {
      var _loc2_:DataManager = this;
      var _loc3_:Number = 999999;
      var _loc4_:int = 0;
      while (_loc4_ < _loc2_.arsenalArray.length)
      {
        if (_loc2_.arsenalArray[_loc4_].title == param1)
        {
          _loc3_ = Number(_loc2_.arsenalArray[_loc4_].cost);
        }
        _loc4_++;
      }
      if (_loc3_ != 0 && _loc3_ != 999999)
      {
        _loc3_ /= 2;
        _loc3_ = Math.round(_loc3_ / 50) * 50;
      }
      return _loc3_;
    }

    public function getNumberOfArsenal():Number
    {
      var _loc1_:DataManager = this;
      if (_loc1_.gameObj.var_106.hasEarnedEverything())
      {
        return _loc1_.arsenalArray.length + 1;
      }
      return _loc1_.arsenalArray.length;
    }

    public function getOutfitPrice(param1:Number, param2:Number):Number
    {
      var _loc3_:DataManager = this;
      if (param1 < _loc3_.outfitPrices.length)
      {
        if (param2 < _loc3_.outfitPrices[param1].length)
        {
          return _loc3_.outfitPrices[param1][param2];
        }
        return 999999;
      }
      return 999999;
    }

    public function setupKeyNames():void
    {
      this.keyNameMap = [];
      this.keyNameMap[65] = "A";
      this.keyNameMap[66] = "B";
      this.keyNameMap[67] = "C";
      this.keyNameMap[68] = "D";
      this.keyNameMap[69] = "E";
      this.keyNameMap[70] = "F";
      this.keyNameMap[71] = "G";
      this.keyNameMap[72] = "H";
      this.keyNameMap[73] = "I";
      this.keyNameMap[74] = "J";
      this.keyNameMap[75] = "K";
      this.keyNameMap[76] = "L";
      this.keyNameMap[77] = "M";
      this.keyNameMap[78] = "N";
      this.keyNameMap[79] = "O";
      this.keyNameMap[80] = "P";
      this.keyNameMap[81] = "Q";
      this.keyNameMap[82] = "R";
      this.keyNameMap[83] = "S";
      this.keyNameMap[84] = "T";
      this.keyNameMap[85] = "U";
      this.keyNameMap[86] = "V";
      this.keyNameMap[87] = "W";
      this.keyNameMap[88] = "X";
      this.keyNameMap[89] = "Y";
      this.keyNameMap[90] = "Z";
      this.keyNameMap[48] = "0";
      this.keyNameMap[49] = "1";
      this.keyNameMap[50] = "2";
      this.keyNameMap[51] = "3";
      this.keyNameMap[52] = "4";
      this.keyNameMap[53] = "5";
      this.keyNameMap[54] = "6";
      this.keyNameMap[55] = "7";
      this.keyNameMap[56] = "8";
      this.keyNameMap[57] = "9";
      this.keyNameMap[96] = "Num 0";
      this.keyNameMap[97] = "Num 1";
      this.keyNameMap[98] = "Num 2";
      this.keyNameMap[99] = "Num 3";
      this.keyNameMap[100] = "Num 4";
      this.keyNameMap[101] = "Num 5";
      this.keyNameMap[102] = "Num 6";
      this.keyNameMap[103] = "Num 7";
      this.keyNameMap[104] = "Num 8";
      this.keyNameMap[105] = "Num 9";
      this.keyNameMap[106] = "Num *";
      this.keyNameMap[107] = "Num +";
      this.keyNameMap[13] = "Enter";
      this.keyNameMap[109] = "Num -";
      this.keyNameMap[110] = "Num .";
      this.keyNameMap[111] = "Num /";
      this.keyNameMap[9] = "Tab";
      this.keyNameMap[8] = "Bksp";
      this.keyNameMap[19] = "Pause";
      this.keyNameMap[16] = "Shift";
      this.keyNameMap[17] = "Ctrl";
      this.keyNameMap[32] = "Space";
      this.keyNameMap[33] = "PgUp";
      this.keyNameMap[34] = "PgDn";
      this.keyNameMap[35] = "End";
      this.keyNameMap[36] = "Home";
      this.keyNameMap[37] = "Left";
      this.keyNameMap[38] = "Up";
      this.keyNameMap[39] = "Right";
      this.keyNameMap[40] = "Down";
      this.keyNameMap[45] = "Ins";
      this.keyNameMap[46] = "Del";
      this.keyNameMap[186] = ";";
      this.keyNameMap[187] = "+=";
      this.keyNameMap[189] = "-";
      this.keyNameMap[191] = "/?";
      this.keyNameMap[192] = "~";
      this.keyNameMap[219] = "[";
      this.keyNameMap[221] = "]";
      this.keyNameMap[220] = "|";
      this.keyNameMap[222] = "\'";
      this.keyNameMap[188] = ",";
      this.keyNameMap[190] = ".";
    }

    public function getKeyLabel(param1:String):String
    {
      var _loc2_:DataManager = this;
      var _loc3_:UserData = _loc2_.gameObj.var_106;
      var _loc4_:String = "???";
      var _loc5_:Number = 0;
      if (param1 == DataManager.KEY_ATTACK)
      {
        _loc5_ = _loc3_.keyCodeAttack;
      }
      else if (param1 == DataManager.KEY_JUMP)
      {
        _loc5_ = _loc3_.keyCodeJump;
      }
      else if (param1 == DataManager.KEY_DROP)
      {
        _loc5_ = _loc3_.keyCodeDrop;
      }
      else if (param1 == DataManager.KEY_RIGHT)
      {
        _loc5_ = _loc3_.keyCodeRight;
      }
      else if (param1 == DataManager.KEY_LEFT)
      {
        _loc5_ = _loc3_.keyCodeLeft;
      }
      else if (param1 == DataManager.KEY_UP)
      {
        _loc5_ = _loc3_.keyCodeUp;
      }
      else if (param1 == DataManager.KEY_DOWN)
      {
        _loc5_ = _loc3_.keyCodeDown;
      }
      else if (param1 == DataManager.KEY_PAUSE)
      {
        _loc5_ = _loc3_.keyCodePause;
      }
      if (this.keyNameMap.length > _loc5_ && this.keyNameMap[_loc5_] != null && this.keyNameMap[_loc5_] != undefined && this.keyNameMap[_loc5_] != "")
      {
        _loc4_ = this.keyNameMap[_loc5_];
      }
      return _loc4_;
    }

    public function isArrow(param1:String):Boolean
    {
      if (param1 == "Up" || param1 == "Down" || param1 == "Left" || param1 == "Right")
      {
        return true;
      }
      return false;
    }

    public function getEnemyName(param1:Number = -1, param2:Number = -1):String
    {
      var _loc5_:int = 0;
      var _loc3_:DataManager = this;
      var _loc4_:String = "???";
      if (param1 != -1 && param1 < _loc3_.enemyKey.length)
      {
        _loc4_ = _loc3_.enemyKey[param1].title;
      }
      else
      {
        _loc5_ = 0;
        while (_loc5_ < _loc3_.enemyKey.length)
        {
          if (_loc3_.enemyKey[_loc5_].id == param2)
          {
            _loc4_ = _loc3_.enemyKey[_loc5_].title;
            break;
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function getEnemyClipName(param1:Number = -1, param2:Number = -1):String
    {
      var _loc5_:int = 0;
      var _loc3_:DataManager = this;
      var _loc4_:String = "???";
      if (param1 != -1 && param1 < _loc3_.enemyKey.length)
      {
        _loc4_ = _loc3_.enemyKey[param1].clip;
      }
      else
      {
        _loc5_ = 0;
        while (_loc5_ < _loc3_.enemyKey.length)
        {
          if (_loc3_.enemyKey[_loc5_].id == param2)
          {
            _loc4_ = _loc3_.enemyKey[_loc5_].clip;
            break;
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function getEnemyIDFromIndex(param1:Number):Number
    {
      var _loc2_:DataManager = this;
      if (param1 > -1 && param1 < _loc2_.enemyKey.length)
      {
        return _loc2_.enemyKey[param1].id;
      }
      return -1;
    }

    public function generateEnemyBitmap():void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:BitmapData = null;
      var _loc8_:MovieClip = null;
      var _loc9_:DropShadowFilter = null;
      var _loc10_:Class = null;
      var _loc11_:int = 0;
      var _loc12_:Number = NaN;
      var _loc1_:DataManager = this;
      var _loc2_:Number = getTimer();
      if (_loc1_.enemyThumbBMP == null)
      {
        _loc3_ = _loc1_.enemyKey.length;
        _loc4_ = 45;
        _loc5_ = 45;
        _loc6_ = 0;
        _loc1_.enemyThumbBMP = new BitmapData(_loc4_ * _loc3_, _loc5_ * 1, true, 0);
        _loc7_ = new BitmapData(_loc4_, _loc5_, true, 0);
        _loc9_ = new DropShadowFilter(4, 45, 0, 0.5);
        _loc11_ = 0;
        while (_loc11_ < _loc3_)
        {
          _loc8_ = null;
          _loc10_ = getDefinitionByName("enemythumb_" + _loc1_.enemyKey[_loc11_].clip) as Class;
          _loc8_ = new _loc10_() as MovieClip;
          _loc8_.mouseEnabled = false;
          _loc8_.mouseChildren = false;
          _loc8_.filters = [_loc9_];
          _loc7_.fillRect(_loc7_.rect, 0);
          _loc7_.draw(_loc8_, _loc8_.transform.matrix, _loc8_.transform.colorTransform);
          this.enemyThumbBMP.copyPixels(_loc7_, _loc7_.rect, new Point(_loc11_ * _loc4_, 0), null, null, true);
          _loc11_++;
        }
        _loc7_.dispose();
        _loc7_ = null;
        _loc8_ = null;
        _loc9_ = null;
        _loc12_ = getTimer() - _loc2_;
      }
    }

    public function getEnemyBitmap(param1:Number):BitmapData
    {
      var _loc2_:DataManager = this;
      var _loc5_:BitmapData = new BitmapData(45, 45, true, 0);
      var _loc6_:Number = param1 * 45;
      _loc5_.copyPixels(_loc2_.enemyThumbBMP, new Rectangle(_loc6_, 0, 45, 45), new Point(0, 0), null, null, true);
      return _loc5_;
    }
  }
}
