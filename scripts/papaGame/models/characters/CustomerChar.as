package papaGame.models.characters
{
  import flash.geom.*;
  import flash.media.SoundChannel;
  import flash.media.SoundTransform;
  import package_2.class_15;
  import package_2.class_7;
  import package_4.*;
  import papaGame.data.*;
  import papaGame.display.GameDisplay;
  import papaGame.events.*;
  import papaGame.managers.*;
  import papaGame.models.*;
  import papaGame.models.effects.*;

  public class CustomerChar extends PlayerChar
  {

    public var standCycleFrames:Array = ["stand", 2, 1, 0, 0, [0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3]];
    public var runCycleFrames:Array = ["run", 2, 1, 0, 0, [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]];
    public var skidCycleFrames:Array = ["skid", 2, 1, 0, 2, [20, 21, 22]];
    public var jumpCycleFrames:Array = ["jump", 2, 1, 0, 2, [26, 27, 28]];
    public var fallCycleFrames:Array = ["fall", 2, 1, 0, 2, [29, 30, 31]];
    public var turnaroundCycleFrames:Array = ["turnaround", 2, 1, 0, -1, [23, 24, 25, 25, 25]];
    public var duckCycleFrames:Array = ["duck", 2, 1, 0, 4, [32, 33, 34, 35, 36]];
    public var unduckCycleFrames:Array = ["unduck", 2, 1, 0, -1, [34, 33, 32]];
    public var jump_hurtCycleFrames:Array = ["jump_hurt", 2, 1, 0, 2, [53, 54, 55, 56, 57, 58, 57, 56]];
    public var fall_hurtCycleFrames:Array = ["fall_hurt", 2, 1, 0, 2, [56, 57, 58]];
    public var deadCycleFrames:Array = ["dead", 2, 1, 0, -1, [59, 60, 61, 62, 63, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64]];
    public var crawldeadCycleFrames:Array = ["crawldead", 2, 1, 0, -1, [122, 119, 120, 121, 120, 119, 122, 119, 120, 121, 120, 119, 122, 123, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124]];
    public var climbCycleFrames:Array = ["climb", 2, 1, 0, 0, [37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52]];
    public var slideCycleFrames:Array = ["slide", 2, 1, 0, 3, [65, 66, 67, 68]];
    public var slide22upCycleFrames:Array = ["slide22up", 2, 1, 0, 3, [65, 66, 67, 108]];
    public var slide45upCycleFrames:Array = ["slide45up", 2, 1, 0, 3, [65, 66, 67, 109]];
    public var slide67upCycleFrames:Array = ["slide67up", 2, 1, 0, 3, [65, 66, 67, 110]];
    public var slide22downCycleFrames:Array = ["slide22down", 2, 1, 0, 3, [65, 66, 67, 111]];
    public var slide45downCycleFrames:Array = ["slide45down", 2, 1, 0, 3, [65, 66, 67, 112]];
    public var slide67downCycleFrames:Array = ["slide67down", 2, 1, 0, 3, [65, 66, 67, 113]];
    public var attack1_swing1CycleFrames:Array = ["attack1_swing1", 2, 1, 0, -1, [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80]];
    public var attack2_swing1CycleFrames:Array = ["attack2_swing1", 2, 1, 0, -1, [81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93]];
    public var attack1_meleeCycleFrames:Array = ["attack1_melee", 2, 1, 0, -1, [69, 70, 71, 71, 71, 71, 71, 71, 72]];
    public var attack2_meleeCycleFrames:Array = ["attack2_melee", 2, 1, 0, -1, [73, 74, 75, 75, 75, 75, 75, 75, 76]];
    public var attack3_meleeCycleFrames:Array = ["attack3_melee", 2, 1, 0, -1, [77, 78, 79, 80, 80, 80, 80, 80, 81]];
    public var attack4_meleeCycleFrames:Array = ["attack4_melee", 2, 1, 0, -1, [82, 83, 84, 84, 84, 84, 84, 84, 85]];
    public var shoot_longgunCycleFrames:Array = ["shoot_longgun", 2, 1, 0, -1, [69, 70, 71, 72, 73]];
    public var shoot_pistolCycleFrames:Array = ["shoot_pistol", 2, 1, 0, -1, [69, 70, 71, 72, 73, 74, 75, 76, 77]];
    public var shoot_bazookaCycleFrames:Array = ["shoot_bazooka", 2, 1, 0, -1, [73, 74, 75, 75, 74, 69, 70, 71, 72, 73]];
    public var jumphappyCycleFrames:Array = ["jumphappy", 2, 1, 0, 2, [94, 95, 96]];
    public var fallhappyCycleFrames:Array = ["falljappy", 2, 1, 0, 2, [97, 98, 99]];
    public var grabCycleFrames:Array = ["grab", 2, 1, 0, 1, [100, 101]];
    public var goneCycleFrames:Array = ["gone", 2, 1, 0, 0, [999]];
    public var poundCycleFrames:Array = ["pound", 2, 1, 0, 5, [102, 102, 103, 103, 104, 104]];
    public var doublejumpCycleFrames:Array = ["doublejump", 2, 1, 0, 2, [102, 103, 104]];
    public var doublefallCycleFrames:Array = ["doublefall", 2, 1, 0, 2, [105, 106, 107]];
    public var glideCycleFrames:Array = ["glide", 2, 1, 0, 4, [102, 103, 104, 105, 106, 107, 108]];
    public var wallslideCycleFrames:Array = ["wallslide", 2, 1, 0, 3, [102, 103, 104, 105]];
    public var crawlCycleFrames:Array = ["crawl", 2, 1, 0, 4, [32, 33, 34, 36, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117]];
    public var turncrawlCycleFrames:Array = ["turncrawl", 2, 1, 0, -1, [118, 118, 118]];
    public var hurtcrawlCycleFrames:Array = ["hurtcrawl", 2, 1, 0, 0, [122, 119, 120, 121, 120, 119]];
    public var pushCycleFrames:Array = ["push", 2, 1, 0, 3, [120, 119, 118, 102, 102, 103, 103, 104, 104, 105, 105, 106, 106, 107, 107, 108, 108, 109, 109, 110, 110, 111, 111, 112, 112, 113, 113, 114, 114, 115, 115, 116, 116, 117, 117]];
    public var finishpushCycleFrames:Array = ["finishpush", 2, 1, 0, -1, [102, 118, 119, 120]];
    public var foot_standCycleFrames:Array = ["foot_stand", 2, 1, 0, 0, [0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3]];
    public var foot_runCycleFrames:Array = ["foot_run", 2, 1, 0, 0, [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]];
    public var foot_skidCycleFrames:Array = ["foot_skid", 2, 1, 0, 2, [20, 21, 22]];
    public var foot_jumpCycleFrames:Array = ["foot_jump", 2, 1, 0, 2, [26, 27, 28]];
    public var foot_fallCycleFrames:Array = ["foot_fall", 2, 1, 0, 2, [29, 30, 31]];
    public var foot_turnaroundCycleFrames:Array = ["foot_turnaround", 2, 1, 0, 4, [23, 24, 25, 25, 25]];
    public var foot_duckCycleFrames:Array = ["foot_duck", 2, 1, 0, 4, [32, 33, 34, 35, 36]];
    public var foot_unduckCycleFrames:Array = ["foot_unduck", 2, 1, 0, 2, [34, 33, 32]];
    public var foot_jump_hurtCycleFrames:Array = ["foot_jump_hurt", 2, 1, 0, 2, [53, 54, 55]];
    public var foot_fall_hurtCycleFrames:Array = ["foot_fall_hurt", 2, 1, 0, 2, [56, 57, 58]];
    public var foot_deadCycleFrames:Array = ["foot_dead", 2, 1, 0, 7, [59, 60, 61, 62, 63, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64]];
    public var foot_crawldeadCycleFrames:Array = ["foot_crawldead", 2, 1, 0, 16, [122, 119, 120, 121, 120, 119, 122, 119, 120, 121, 120, 119, 122, 123, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124, 124]];
    public var foot_climbCycleFrames:Array = ["foot_climb", 2, 1, 0, 0, [37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52]];
    public var foot_slideCycleFrames:Array = ["foot_slide", 2, 1, 0, 3, [65, 66, 67, 68]];
    public var foot_slide22upCycleFrames:Array = ["foot_slide22up", 2, 1, 0, 3, [65, 66, 67, 108]];
    public var foot_slide45upCycleFrames:Array = ["foot_slide45up", 2, 1, 0, 3, [65, 66, 67, 109]];
    public var foot_slide67upCycleFrames:Array = ["foot_slide67up", 2, 1, 0, 3, [65, 66, 67, 110]];
    public var foot_slide22downCycleFrames:Array = ["foot_slide22down", 2, 1, 0, 3, [65, 66, 67, 111]];
    public var foot_slide45downCycleFrames:Array = ["foot_slide45down", 2, 1, 0, 3, [65, 66, 67, 112]];
    public var foot_slide67downCycleFrames:Array = ["foot_slide67down", 2, 1, 0, 3, [65, 66, 67, 113]];
    public var foot_attack1_swing1CycleFrames:Array = ["foot_attack1_swing1", 2, 1, 0, -1, [69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80]];
    public var foot_attack2_swing1CycleFrames:Array = ["foot_attack2_swing1", 2, 1, 0, -1, [81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93]];
    public var foot_attack1_meleeCycleFrames:Array = ["foot_attack1_melee", 2, 1, 0, -1, [69, 70, 71, 71, 71, 71, 71, 71, 72]];
    public var foot_attack2_meleeCycleFrames:Array = ["foot_attack2_melee", 2, 1, 0, -1, [73, 74, 75, 75, 75, 75, 75, 75, 76]];
    public var foot_attack3_meleeCycleFrames:Array = ["foot_attack3_melee", 2, 1, 0, -1, [77, 78, 79, 80, 80, 80, 80, 80, 81]];
    public var foot_attack4_meleeCycleFrames:Array = ["foot_attack4_melee", 2, 1, 0, -1, [82, 83, 84, 84, 84, 84, 84, 84, 85]];
    public var foot_shoot_longgunCycleFrames:Array = ["foot_shoot_longgun", 2, 1, 0, -1, [69, 70, 71, 72, 73]];
    public var foot_shoot_pistolCycleFrames:Array = ["foot_shoot_pistol", 2, 1, 0, -1, [69, 70, 71, 72, 73, 74, 75, 76, 77]];
    public var foot_shoot_bazookaCycleFrames:Array = ["foot_shoot_bazooka", 2, 1, 0, -1, [69, 70, 71, 72, 73]];
    public var foot_jumphappyCycleFrames:Array = ["foot_jumphappy", 2, 1, 0, 2, [94, 95, 96]];
    public var foot_fallhappyCycleFrames:Array = ["foot_falljappy", 2, 1, 0, 2, [97, 98, 99]];
    public var foot_grabCycleFrames:Array = ["foot_grab", 2, 1, 0, 1, [100, 101]];
    public var foot_poundCycleFrames:Array = ["foot_pound", 2, 1, 0, 2, [102, 103, 104]];
    public var foot_doublejumpCycleFrames:Array = ["foot_doublejump", 2, 1, 0, 2, [102, 103, 104]];
    public var foot_doublefallCycleFrames:Array = ["foot_doublefall", 2, 1, 0, 2, [105, 106, 107]];
    public var foot_glideCycleFrames:Array = ["foot_glide", 2, 1, 0, 4, [102, 103, 104, 105, 106, 107, 108]];
    public var foot_wallslideCycleFrames:Array = ["foot_wallslide", 2, 1, 0, 3, [102, 103, 104, 105]];
    public var foot_crawlCycleFrames:Array = ["foot_crawl", 2, 1, 0, 4, [32, 33, 34, 36, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117]];
    public var foot_turncrawlCycleFrames:Array = ["foot_turncrawl", 2, 1, 0, -1, [118, 118, 118]];
    public var foot_hurtcrawlCycleFrames:Array = ["foot_hurtcrawl", 2, 1, 0, 0, [122, 119, 120, 121, 120, 119]];
    public var foot_pushCycleFrames:Array = ["foot_push", 2, 1, 0, 3, [120, 119, 118, 102, 102, 103, 103, 104, 104, 105, 105, 106, 106, 107, 107, 108, 108, 109, 109, 110, 110, 111, 111, 112, 112, 113, 113, 114, 114, 115, 115, 116, 116, 117, 117]];
    public var foot_finishpushCycleFrames:Array = ["foot_finishpush", 2, 1, 0, -1, [102, 118, 119, 120]];
    public var foot_goneCycleFrames:Array = ["gone", 2, 1, 0, 0, [999]];
    public var torsoOffsetsY:Array = [0, 0, 0, 0, 0, -1, -2, -3, -4, -3, -2, -1, 0, -1, -2, -3, -4, -3, -2, -1, 0, 0, 0, -1, -2, -3, -3, -2, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var torsoOffsetsX:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    public var blitter:CharacterBlitter;
    public var footAnimationFrame:Number = 0;
    public var footCycleFrame:Number = 0;
    public var footCycleName:String = "none";
    public var hasWeaponType:String = "unknown";
    public var attackVariation:Number = 1;
    public var isFinalBlow:Boolean = false;
    public var isSkidding:Boolean = false;
    public var useSkidSpeed:Number = 0;
    public var skidSpeed:Number = 0;
    public var skidTimer:Number = 0;
    public var skidTimerInterval:Number = 2;
    public var skidDecayTimer:Number = 0;
    public var skidDecayTimerInterval:Number = 1;
    public var skidDecayAmount:Number = 1;
    public var maxSkidSpeed:Number = 8;
    public var baseWalkSpeed:Number = 8;
    public var maxSlideSpeed:Number = 24;
    public var slideDecayTimerInterval:Number = 2;
    public var isAttackLunging:Boolean = false;
    public var useLungeSpeed:Number = 0;
    public var lungeSpeed:Number = 0;
    public var lungeTimer:Number = 0;
    public var lungeTimerInterval:Number = 1;
    public var initialLungeSpeed:Number = 12;
    public var lungeDirection:Number = 1;
    public var isFinishPushing:Boolean = false;
    public var wasPushing:Boolean = false;
    public var wasJumping:Boolean = false;
    public var wasTurning:Boolean = false;
    public var postAttackDelayTimer:Number = 0;
    public var postAttackDelayMax:Number = 1;
    public var bulletTimer:Number = 0;
    public var bulletsFired:Number = 0;
    public var bulletsPerRound:Number = 1;
    public var bulletFrequency:Number = 5;
    public var lastShotTime:Number = 0;
    public var reloadTimer:Number = 0;
    public var reloadTimerMax:Number = 1;
    public var shoot_longgun_offsetsX:Array = [30, 30, 30, 30, 30];
    public var shoot_longgun_offsetsY:Array = [-28, -28, -28, -28, -28];
    public var shoot_pistol_offsetsX:Array = [30, 30, 30, 30, 30];
    public var shoot_pistol_offsetsY:Array = [-34, -34, -34, -34, -34];
    public var shoot_bazooka_offsetsX:Array = [30, 30, 30, 30, 30];
    public var shoot_bazooka_offsetsY:Array = [-50, -50, -50, -50, -50];
    public var shoot_toss_offsetsX:Array = [20, 20, 20, 20, 20];
    public var shoot_toss_offsetsY:Array = [-70, -70, -70, -70, -70];
    public var landStartTime:Number = 0;
    public var landStunDuration:Number = 250;
    public var forceGrabYOffsetAmount:Number = 0;
    public var attackRect:Rectangle = new Rectangle(0, 0, 10, 10);
    public var melee_attackRect:Rectangle = new Rectangle(0, -60, 80, 60);
    public var swing_attackRect:Rectangle = new Rectangle(0, -70, 80, 70);
    public var whip_attackRect:Rectangle = new Rectangle(0, -70, 145, 70);
    public var other_attackRect:Rectangle = new Rectangle(0, 0, 0, 0);
    public var pound_collRect:Rectangle = new Rectangle(-16, -10, 32, 40);
    public var stomp_collRect:Rectangle = new Rectangle(-16, -10, 32, 28);
    public var melee_frameRange:Array = [0, 8, 6];
    public var swing_frameRange:Array = [3, 11, 8];
    public var whip_frameRange:Array = [7, 12, 10];
    public var other_frameRange:Array = [999, 999, 999];
    public var startAttackFrame:Number = 0;
    public var endAttackFrame:Number = 4;
    public var repeatAttackFrame:Number = 6;
    public var ridingObjectDirX:Number = 0;
    public var isPushingObject:Boolean = false;
    public var whichJumpSound:Number = 1;
    public var whichPunchSound:Number = 1;
    public var whichSwingSound:Number = 1;
    public var defaultHealth:Number = 3;
    public var playerLastX:Number = 0;
    public var climbFrameMin:Number = 37;
    public var climbFrameMax:Number = 52;
    public var balloonFXID:Number = -1;
    public var foodiniGlideBalloonIDs:Array = [];
    public var copterSound:SoundChannel = null;
    public var poundSound:SoundChannel = null;

    public function CustomerChar(param1:class_5)
    {
      super(param1);
      this.currentHealth = this.maxHealth;
      this.blitter = new CharacterBlitter(this.gameObj);
    }

    override public function destroy():void
    {
      if (this.blitter)
      {
        this.blitter.destroy();
        this.blitter = null;
      }
      try
      {
        if (this.copterSound != null)
        {
          this.copterSound.stop();
          this.copterSound = null;
        }
      }
      catch (err:Error)
      {
      }
      try
      {
        if (this.poundSound != null)
        {
          this.poundSound.stop();
          this.poundSound = null;
        }
      }
      catch (err:Error)
      {
      }
      super.destroy();
    }

    override public function defineVars():void
    {
      height = 15;
      width = 15;
      spritewidth = 74;
      spriteheight = 60;
      spriteCenterX = 37;
      spriteCenterY = 30;
      spriteTargetX = 37;
      spriteTargetY = 30;
      sheetWidth = 17;
      sheetHeight = 10;
      heightmultiplier = 5;
      widthmultiplier = 1;
      speed = 8;
      walkspeed = 8;
      climbSpeed = 5;
      jumpspeed = 0;
      jumpstart = -23;
      flipBlitOffset = 300;
      collRect = new Rectangle(-15, -80, 30, 90);
      standCollRect = new Rectangle(-8, -63, 16, 73);
      jumpCollRect = new Rectangle(-8, -63, 16, 73);
      duckCollRect = new Rectangle(-8, -20, 16, 30);
      gravity = 2;
      normalgravity = 2;
      jumpgravity = 2;
      currentHealth = 3;
      maxHealth = 3;
      stunDuration = 60;
      hitDuration = 30;
      shouldCheckCeilingSlopes = true;
      this.playerData = this.gameObj.var_113.getCustomerData(this.gameObj.var_106.selectedCharacter);
      this.skillType = this.playerData.skillType;
      this.hasWeaponType = this.playerData.weaponType;
      if (this.skillType == CustomerData.SKILL_CRAWL)
      {
        this.playerheight = 50;
      }
      if (this.skillType == CustomerData.SKILL_CRAWL)
      {
        this.canCrawl = true;
      }
      else
      {
        this.canCrawl = false;
      }
      if (this.skillType == CustomerData.SKILL_PUSH)
      {
        this.canPush = true;
      }
      else
      {
        this.canPush = false;
      }
      if (this.hasProjectile())
      {
        this.gameObj.var_116.addToPreblit(this.playerData.bulletName);
      }
      this.jumpstart = this.playerData.jumpstart;
      this.jumpgravity = this.playerData.jumpgravity;
      this.baseWalkSpeed = this.playerData.walkspeed;
      this.walkspeed = this.baseWalkSpeed;
      this.maxSkidSpeed = this.playerData.maxskidspeed;
      this.skidDecayTimerInterval = this.playerData.skiddecay;
      this.skidDecayAmount = this.playerData.skiddecayamount;
      this.bulletFrequency = this.playerData.bulletstart;
    }

    override public function grabAnimationCycle():Array
    {
      var _loc4_:Array = null;
      var _loc2_:GameControls = this.gameObj.var_108;
      var _loc3_:GameDisplay = this.gameObj.var_103;
      if (this.isGone)
      {
        _loc4_ = this.goneCycleFrames;
      }
      else if (this.isDead)
      {
        if (this.isCrawling)
        {
          _loc4_ = this.crawldeadCycleFrames;
        }
        else if (this.jump && this.jumpspeed < 0)
        {
          _loc4_ = this.jump_hurtCycleFrames;
        }
        else if (this.jump && this.jumpspeed >= 0)
        {
          _loc4_ = this.jump_hurtCycleFrames;
        }
        else
        {
          _loc4_ = this.deadCycleFrames;
        }
      }
      else if (this.isHit)
      {
        if (this.isCrawling)
        {
          _loc4_ = this.hurtcrawlCycleFrames;
        }
        else if (this.jump && this.jumpspeed < 0)
        {
          _loc4_ = this.jump_hurtCycleFrames;
        }
        else if (this.jump && this.jumpspeed >= 0)
        {
          _loc4_ = this.jump_hurtCycleFrames;
        }
        else
        {
          _loc4_ = this.skidCycleFrames;
        }
      }
      else if (this.isRidingObject || this.isGrabbing)
      {
        _loc4_ = this.grabCycleFrames;
      }
      else if (this.isClimbingLadder)
      {
        _loc4_ = this.climbCycleFrames;
      }
      else if (this.isAttacking)
      {
        if (this.playerData.weaponType == CustomerData.WEAPON_MELEE)
        {
          _loc4_ = this["attack" + this.attackVariation + "_meleeCycleFrames"];
        }
        else if (this.playerData.weaponType == CustomerData.WEAPON_LONGGUN)
        {
          _loc4_ = this.shoot_longgunCycleFrames;
        }
        else if (this.playerData.weaponType == CustomerData.WEAPON_PISTOL)
        {
          _loc4_ = this.shoot_pistolCycleFrames;
        }
        else if (this.playerData.weaponType == CustomerData.WEAPON_BAZOOKA)
        {
          _loc4_ = this.shoot_bazookaCycleFrames;
        }
        else if (this.attackVariation == 2)
        {
          _loc4_ = this.attack2_swing1CycleFrames;
        }
        else
        {
          _loc4_ = this.attack1_swing1CycleFrames;
        }
      }
      else if (this.isFinishPushing)
      {
        _loc4_ = this.finishpushCycleFrames;
        this.isTurning = false;
      }
      else if (this.isSliding)
      {
        _loc4_ = this.slideCycleFrames;
        if (playerData.customerName == "Scooter")
        {
          if (this.onSlope == 1 && this.facingDir == 1)
          {
            _loc4_ = this.slide45upCycleFrames;
          }
          else if ((this.onSlope == 3 || this.onSlope == 4) && this.facingDir == 1)
          {
            _loc4_ = this.slide22upCycleFrames;
          }
          else if ((this.onSlope == 7 || this.onSlope == 8) && this.facingDir == 1)
          {
            _loc4_ = this.slide67upCycleFrames;
          }
          else if (this.onSlope == 1 && this.facingDir == -1)
          {
            _loc4_ = this.slide45downCycleFrames;
          }
          else if ((this.onSlope == 3 || this.onSlope == 4) && this.facingDir == -1)
          {
            _loc4_ = this.slide22downCycleFrames;
          }
          else if ((this.onSlope == 7 || this.onSlope == 8) && this.facingDir == -1)
          {
            _loc4_ = this.slide67downCycleFrames;
          }
          else if (this.onSlope == 2 && this.facingDir == -1)
          {
            _loc4_ = this.slide45upCycleFrames;
          }
          else if ((this.onSlope == 5 || this.onSlope == 6) && this.facingDir == -1)
          {
            _loc4_ = this.slide22upCycleFrames;
          }
          else if ((this.onSlope == 9 || this.onSlope == 10) && this.facingDir == -1)
          {
            _loc4_ = this.slide67upCycleFrames;
          }
          else if (this.onSlope == 2 && this.facingDir == 1)
          {
            _loc4_ = this.slide45downCycleFrames;
          }
          else if ((this.onSlope == 5 || this.onSlope == 6) && this.facingDir == 1)
          {
            _loc4_ = this.slide22downCycleFrames;
          }
          else if ((this.onSlope == 9 || this.onSlope == 10) && this.facingDir == 1)
          {
            _loc4_ = this.slide67downCycleFrames;
          }
          else
          {
            _loc4_ = this.slideCycleFrames;
          }
        }
      }
      else if (this.isGroundPounding)
      {
        _loc4_ = this.poundCycleFrames;
      }
      else if (this.isWallSliding)
      {
        _loc4_ = this.wallslideCycleFrames;
      }
      else if (this.isPushingObject)
      {
        _loc4_ = this.pushCycleFrames;
      }
      else if (this.isTurning && !this.jump)
      {
        if (this.duck && this.skillType == CustomerData.SKILL_CRAWL)
        {
          _loc4_ = this.turncrawlCycleFrames;
        }
        else
        {
          _loc4_ = this.turnaroundCycleFrames;
        }
      }
      else if (this.isGliding)
      {
        _loc4_ = this.glideCycleFrames;
      }
      else if (this.jump)
      {
        if (this.isDoubleJumping)
        {
          if (this.jumpspeed < 0)
          {
            _loc4_ = this.doublejumpCycleFrames;
          }
          else
          {
            _loc4_ = this.doublefallCycleFrames;
          }
        }
        else if (this.isFinishingLevel)
        {
          if (this.jumpspeed < 0)
          {
            _loc4_ = this.jumphappyCycleFrames;
          }
          else
          {
            _loc4_ = this.fallhappyCycleFrames;
          }
        }
        else if (this.jumpspeed < 0)
        {
          _loc4_ = this.jumpCycleFrames;
        }
        else
        {
          _loc4_ = this.fallCycleFrames;
        }
        this.isTurning = false;
        this.isSkidding = false;
      }
      else if (this.isWalking && !this.isSkidding)
      {
        if (this.isPushingObject)
        {
          _loc4_ = this.runCycleFrames;
        }
        else if (this.duck && this.skillType == CustomerData.SKILL_CRAWL)
        {
          _loc4_ = this.crawlCycleFrames;
        }
        else
        {
          _loc4_ = this.runCycleFrames;
        }
      }
      else if (this.duck)
      {
        _loc4_ = this.duckCycleFrames;
      }
      else if (this.isDucking)
      {
        _loc4_ = this.unduckCycleFrames;
      }
      else if (this.isSkidding)
      {
        if (this.isPushingObject)
        {
          _loc4_ = this.skidCycleFrames;
        }
        else
        {
          _loc4_ = this.skidCycleFrames;
        }
      }
      else if (this.isPushingObject)
      {
        _loc4_ = this.standCycleFrames;
      }
      else
      {
        _loc4_ = this.standCycleFrames;
      }
      return _loc4_;
    }

    public function grabFootAnimationCycle():Array
    {
      var _loc4_:Array = null;
      var _loc2_:GameControls = this.gameObj.var_108;
      var _loc3_:GameDisplay = this.gameObj.var_103;
      if (this.isGone)
      {
        _loc4_ = this.foot_goneCycleFrames;
      }
      else if (this.isDead)
      {
        if (this.isCrawling)
        {
          _loc4_ = this.foot_crawldeadCycleFrames;
        }
        else if (this.jump && this.jumpspeed < 0)
        {
          _loc4_ = this.foot_jump_hurtCycleFrames;
        }
        else if (this.jump && this.jumpspeed >= 0)
        {
          _loc4_ = this.foot_fall_hurtCycleFrames;
        }
        else
        {
          _loc4_ = this.foot_deadCycleFrames;
        }
      }
      else if (this.isHit)
      {
        if (this.isCrawling)
        {
          _loc4_ = this.foot_hurtcrawlCycleFrames;
        }
        else if (this.jump && this.jumpspeed < 0)
        {
          _loc4_ = this.foot_jump_hurtCycleFrames;
        }
        else if (this.jump && this.jumpspeed >= 0)
        {
          _loc4_ = this.foot_fall_hurtCycleFrames;
        }
        else
        {
          _loc4_ = this.foot_skidCycleFrames;
        }
      }
      else if (this.isRidingObject || this.isGrabbing)
      {
        _loc4_ = this.foot_grabCycleFrames;
      }
      else if (this.isClimbingLadder)
      {
        _loc4_ = this.foot_climbCycleFrames;
      }
      else if (this.isFinishPushing)
      {
        _loc4_ = this.foot_finishpushCycleFrames;
      }
      else if (this.isSliding)
      {
        _loc4_ = this.foot_slideCycleFrames;
        if (playerData.customerName == "Scooter")
        {
          if (this.onSlope == 1 && this.facingDir == 1)
          {
            _loc4_ = this.foot_slide45upCycleFrames;
          }
          else if ((this.onSlope == 3 || this.onSlope == 4) && this.facingDir == 1)
          {
            _loc4_ = this.foot_slide22upCycleFrames;
          }
          else if ((this.onSlope == 7 || this.onSlope == 8) && this.facingDir == 1)
          {
            _loc4_ = this.foot_slide67upCycleFrames;
          }
          else if (this.onSlope == 1 && this.facingDir == -1)
          {
            _loc4_ = this.foot_slide45downCycleFrames;
          }
          else if ((this.onSlope == 3 || this.onSlope == 4) && this.facingDir == -1)
          {
            _loc4_ = this.foot_slide22downCycleFrames;
          }
          else if ((this.onSlope == 7 || this.onSlope == 8) && this.facingDir == -1)
          {
            _loc4_ = this.foot_slide67downCycleFrames;
          }
          else if (this.onSlope == 2 && this.facingDir == -1)
          {
            _loc4_ = this.foot_slide45upCycleFrames;
          }
          else if ((this.onSlope == 5 || this.onSlope == 6) && this.facingDir == -1)
          {
            _loc4_ = this.foot_slide22upCycleFrames;
          }
          else if ((this.onSlope == 9 || this.onSlope == 10) && this.facingDir == -1)
          {
            _loc4_ = this.foot_slide67upCycleFrames;
          }
          else if (this.onSlope == 2 && this.facingDir == 1)
          {
            _loc4_ = this.foot_slide45downCycleFrames;
          }
          else if ((this.onSlope == 5 || this.onSlope == 6) && this.facingDir == 1)
          {
            _loc4_ = this.foot_slide22downCycleFrames;
          }
          else if ((this.onSlope == 9 || this.onSlope == 10) && this.facingDir == 1)
          {
            _loc4_ = this.foot_slide67downCycleFrames;
          }
          else
          {
            _loc4_ = this.foot_slideCycleFrames;
          }
        }
      }
      else if (this.isWallSliding)
      {
        _loc4_ = this.foot_wallslideCycleFrames;
      }
      else if (this.isPushingObject)
      {
        _loc4_ = this.foot_pushCycleFrames;
      }
      else if (this.isGroundPounding)
      {
        _loc4_ = this.foot_poundCycleFrames;
      }
      else if (this.isAttacking && this.playerData.customerName == "Ninjoy" && (this.attackVariation == 4 || this.attackVariation == 2))
      {
        _loc4_ = this["foot_attack" + this.attackVariation + "_meleeCycleFrames"];
      }
      else if (this.isAttacking && this.playerData.customerName == "Clover" && (this.attackVariation == 4 || this.attackVariation == 3))
      {
        _loc4_ = this["foot_attack" + this.attackVariation + "_meleeCycleFrames"];
      }
      else if (this.isTurning)
      {
        if (this.duck && this.skillType == CustomerData.SKILL_CRAWL)
        {
          _loc4_ = this.foot_turncrawlCycleFrames;
        }
        else
        {
          _loc4_ = this.foot_turnaroundCycleFrames;
        }
      }
      else if (this.isGliding)
      {
        _loc4_ = this.foot_glideCycleFrames;
      }
      else if (this.jump)
      {
        if (this.isDoubleJumping)
        {
          if (this.jumpspeed < 0)
          {
            _loc4_ = this.foot_doublejumpCycleFrames;
          }
          else
          {
            _loc4_ = this.foot_doublefallCycleFrames;
          }
        }
        else if (this.isFinishingLevel)
        {
          if (this.jumpspeed < 0)
          {
            _loc4_ = this.foot_jumphappyCycleFrames;
          }
          else
          {
            _loc4_ = this.foot_fallhappyCycleFrames;
          }
        }
        else if (this.jumpspeed < 0)
        {
          _loc4_ = this.foot_jumpCycleFrames;
        }
        else
        {
          _loc4_ = this.foot_fallCycleFrames;
        }
      }
      else if (this.isWalking && !this.isSkidding)
      {
        if (this.duck && this.skillType == CustomerData.SKILL_CRAWL)
        {
          _loc4_ = this.foot_crawlCycleFrames;
        }
        else
        {
          _loc4_ = this.foot_runCycleFrames;
        }
      }
      else if (this.duck)
      {
        _loc4_ = this.foot_duckCycleFrames;
      }
      else if (this.isDucking)
      {
        _loc4_ = this.foot_unduckCycleFrames;
      }
      else if (this.isSkidding)
      {
        _loc4_ = this.foot_skidCycleFrames;
      }
      else if (this.isAttacking)
      {
        if (this.playerData.weaponType == CustomerData.WEAPON_MELEE)
        {
          _loc4_ = this["foot_attack" + this.attackVariation + "_meleeCycleFrames"];
        }
        else if (this.playerData.weaponType == CustomerData.WEAPON_LONGGUN)
        {
          _loc4_ = this.foot_shoot_longgunCycleFrames;
        }
        else if (this.playerData.weaponType == CustomerData.WEAPON_PISTOL)
        {
          _loc4_ = this.foot_shoot_pistolCycleFrames;
        }
        else if (this.playerData.weaponType == CustomerData.WEAPON_BAZOOKA)
        {
          _loc4_ = this.foot_shoot_bazookaCycleFrames;
        }
        else if (this.attackVariation == 2)
        {
          _loc4_ = this.foot_attack2_swing1CycleFrames;
        }
        else
        {
          _loc4_ = this.foot_attack1_swing1CycleFrames;
        }
      }
      else
      {
        _loc4_ = this.foot_standCycleFrames;
      }
      return _loc4_;
    }

    public function getTorsoOffsetX():Number
    {
      if (this.isAttacking)
      {
        return this.torsoOffsetsX[this.footAnimationFrame];
      }
      return 0;
    }

    public function getTorsoOffsetY():Number
    {
      if (this.isAttacking)
      {
        return this.torsoOffsetsY[this.footAnimationFrame];
      }
      return 0;
    }

    override public function endAnimationCycle():void
    {
      if (this.cycleName == "pickup_map")
      {
        this.gameObj.var_108.stopCycle = true;
        this.gameObj.var_103.startMainIrisOut();
      }
      else if (this.cycleName == "dead" || this.cycleName == "crawldead")
      {
        this.skidSpeed = 0;
        this.isSkidding = false;
        this.isWalking = false;
        this.isHit = false;
        this.restartPlayer();
      }
      else if (this.cycleName == "hit" || this.cycleName == "gloves_hit")
      {
        this.isHit = false;
        this.walkingDir = this.facingDir;
        this.gameObj.var_108.stopHurtControls = false;
      }
      else if (this.cycleName == "skid")
      {
        this.isSkidding = false;
      }
      else if (this.cycleName == "turnaround")
      {
        this.isTurning = false;
      }
      else if (this.cycleName == "turncrawl")
      {
        this.isTurning = false;
      }
      else if (this.cycleName == "unduck")
      {
        this.isDucking = false;
        this.duck = false;
        this.isCrawling = false;
      }
      else if (this.cycleName == "finishpush")
      {
        this.isFinishPushing = false;
      }
      else if (this.cycleName == "attack1_swing1" || this.cycleName == "attack2_swing1" || this.cycleName == "attack1_melee" || this.cycleName == "attack2_melee" || this.cycleName == "attack3_melee" || this.cycleName == "attack4_melee")
      {
        this.isAttacking = false;
        if (this.balloonFXID != -1)
        {
          FoodiniBalloonEffect(this.gameObj.var_104.getEffect(this.balloonFXID)).resetBalloon();
        }
      }
      else if (this.cycleName == "shoot_longgun")
      {
        if (this.gameObj.var_108.keyPressedAction)
        {
          if (this.bulletsFired < this.bulletsPerRound)
          {
            this.cycleFrame = 0;
            this.animationFrame = this[this.cycleName + "CycleFrames"][5][0];
          }
          else
          {
            this.isAttacking = false;
          }
        }
        else
        {
          this.isAttacking = false;
        }
      }
      else if (this.cycleName == "shoot_pistol")
      {
        if (this.gameObj.var_108.keyPressedAction)
        {
          if (this.bulletsFired < this.bulletsPerRound)
          {
            this.cycleFrame = 0;
            this.animationFrame = this[this.cycleName + "CycleFrames"][5][0];
          }
          else
          {
            this.isAttacking = false;
          }
        }
        else
        {
          this.isAttacking = false;
        }
      }
      else if (this.cycleName == "shoot_bazooka")
      {
        if (this.gameObj.var_108.keyPressedAction)
        {
          if (this.bulletsFired < this.bulletsPerRound)
          {
            this.cycleFrame = 0;
            this.animationFrame = this[this.cycleName + "CycleFrames"][5][0];
          }
          else
          {
            this.isAttacking = false;
          }
        }
        else
        {
          this.isAttacking = false;
        }
      }
    }

    override public function stopGrabRiding():void
    {
      var _loc2_:Number = NaN;
      if (this.isRidingObject)
      {
        _loc2_ = 0;
        if (this.whichObjectRiding != null)
        {
          _loc2_ = this.whichObjectRiding.getRideableDirection();
          this.whichObjectRiding.releaseRideableObject();
          this.whichObjectRiding = null;
        }
        this.isRidingObject = false;
        if (_loc2_ != 0)
        {
          this.walkingDir = this.facingDir;
          this.dirx = this.walkingDir;
          this.isSkidding = false;
          this.skidSpeed = this.walkspeed * 2;
          this.speed = this.walkspeed * 2;
          this.isWalking = true;
          this.jump = true;
        }
      }
    }

    override public function updateObject():void
    {
      var baseSpeed:Number = NaN;
      var fx:Effect = null;
      var cust:* = undefined;
      var distx:Number = NaN;
      var disty:Number = NaN;
      var portal:* = undefined;
      var decayInterval:Number = NaN;
      var star:int = 0;
      var starfx:* = undefined;
      var st:SoundTransform = null;
      var currv:Number = NaN;
      var st2:SoundTransform = null;
      var b1:Number = NaN;
      var b6:Number = NaN;
      var b2:Number = NaN;
      var b5:Number = NaN;
      var b3:Number = NaN;
      var b4:Number = NaN;
      var bb:int = 0;
      var bfx:* = undefined;
      var ob:CustomerChar = this;
      if (ob.hasWeaponType == "unknown")
      {
        ob.hasWeaponType = ob.playerData.weaponType;
      }
      if (ob.duck)
      {
        ob.collRect = ob.duckCollRect;
      }
      else if (ob.jump)
      {
        ob.collRect = ob.jumpCollRect;
      }
      else
      {
        ob.collRect = ob.standCollRect;
      }
      ob.forceGrabYoffset = 0;
      if (ob.bossDelayMusicTimer > 0)
      {
        ++ob.bossDelayMusicTimer;
        if (ob.bossDelayMusicTimer >= ob.bossDelayMusicTimerMax)
        {
          ob.gameObj.var_105.playTrack("AlternateTrack", int.MAX_VALUE, 0, "crossfade");
          ob.bossDelayMusicTimer = 0;
        }
      }
      if (ob.isDoubleJumping)
      {
        if (!ob.jump)
        {
          if (Boolean(ob.playerData.customerName == "Scooter") && (Boolean((ob.isWalking || ob.isSkidding || ob.onSlope) && ob.speed > 0)) && ob.gameObj.var_108.keyPressedDown)
          {
            ob.startSliding(ob.speed, false);
          }
          ob.isDoubleJumping = false;
        }
      }
      ob.updateSprite();
      if (!ob.isDead)
      {
        if (ob.isFinishingLevel)
        {
          ob.isSkidding = false;
          ob.skidSpeed = 0;
          if (ob.finishType == "cage")
          {
            if (!ob.jump && !ob.isRidingObject && ob.x != ob.finishTargetX)
            {
              ob.isWalking = true;
              ob.speed = ob.walkspeed;
              if (ob.finishTargetX > ob.x)
              {
                ob.facingDir = 1;
                ob.walkingDir = 1;
                ob.dirx = 1;
                ob.moveChar(ob.dirx, 0, 0);
                if (ob.x > ob.finishTargetX)
                {
                  ob.x = ob.finishTargetX;
                }
              }
              else
              {
                ob.facingDir = -1;
                ob.walkingDir = -1;
                ob.dirx = -1;
                ob.moveChar(ob.dirx, 0, 0);
                if (ob.x < ob.finishTargetX)
                {
                  ob.x = ob.finishTargetX;
                }
              }
            }
            else if (ob.x == ob.finishTargetX || ob.finishAddedPortal)
            {
              ob.isWalking = false;
              if (ob.finishJumps < ob.finishJumpsMax)
              {
                if (!ob.jump)
                {
                  ++ob.finishJumps;
                  ob.jumpspeed = ob.jumpstart / 2;
                  ob.jump = true;
                }
                else if (ob.jump && ob.jumpspeed >= 0)
                {
                  try
                  {
                    fx = ob.gameObj.var_104.getEffect(ob.finishCustomerFXIndex);
                    if (fx != null)
                    {
                      if (fx.jump == false)
                      {
                        fx.jump = true;
                        fx.jumpspeed = ob.jumpstart / 2;
                      }
                    }
                  }
                  catch (err:Error)
                  {
                    class_7.error("Error making the customer FX jump");
                  }
                }
              }
              else if (!ob.jump && !ob.finishAddedPortal)
              {
                ob.finishPortalID = ob.gameObj.var_104.addEffect(ob.x + 54 * ob.facingDir, ob.y - 54, "EndPortalEffect");
                ob.finishAddedPortal = true;
                ob.gameObj.var_105.playSound("portalsound_spin.wav");
              }
              else if (ob.finishAddedPortal)
              {
                ++ob.finishWaitTimer;
                if (ob.finishWaitTimer == ob.finishWaitTimerMax - 1)
                {
                  ob.gameObj.var_103.startMainIrisOut(ob.gameObj.var_104.getEffect(ob.finishPortalID).x, ob.gameObj.var_104.getEffect(ob.finishPortalID).y);
                }
                else if (ob.finishWaitTimer == ob.finishWaitTimerMax)
                {
                  try
                  {
                    cust = ob.gameObj.var_104.getEffect(ob.finishCustomerFXIndex);
                    if (cust != null)
                    {
                      cust.portalX = ob.gameObj.var_104.getEffect(ob.finishPortalID).x;
                      cust.portalY = ob.gameObj.var_104.getEffect(ob.finishPortalID).y;
                    }
                  }
                  catch (err:Error)
                  {
                    class_7.error("Error making the customer FX finish jump");
                  }
                  ob.gravity = 0;
                  ob.jumpgravity = 0;
                  ob.normalgravity = 0;
                  ob.isWalking = false;
                  ob.isSkidding = false;
                  ob.speed = 0;
                  ob.walkspeed = 0;
                  ob.isTurning = false;
                  ob.jump = false;
                }
                else if (ob.finishWaitTimer > ob.finishWaitTimerMax)
                {
                  ob.jump = true;
                  ob.jumpspeed = 0;
                  distx = ob.gameObj.var_104.getEffect(ob.finishPortalID).x - ob.x;
                  disty = ob.gameObj.var_104.getEffect(ob.finishPortalID).y - ob.y;
                  ob.x += distx / 3;
                  ob.y += disty / 3;
                  if (Math.abs(distx) <= 4 && Math.abs(disty) <= 4 && !ob.isGone)
                  {
                    ob.isGone = true;
                    portal = ob.gameObj.var_104.getEffect(ob.finishPortalID);
                    portal.isClosed = true;
                    ob.gameObj.var_103.flashPortal = true;
                    ob.gameObj.var_105.playSound("portalsound_spinfallout.wav");
                    ob.gameObj.var_104.removeEffect(ob.finishCustomerFXIndex);
                  }
                }
              }
            }
          }
          else if (ob.finishType == "fake")
          {
            if (!ob.jump && !ob.isRidingObject && ob.x != ob.finishTargetX)
            {
              ob.isWalking = true;
              ob.speed = ob.walkspeed;
              if (ob.finishTargetX > ob.x)
              {
                ob.facingDir = 1;
                ob.walkingDir = 1;
                ob.dirx = 1;
                ob.moveChar(ob.dirx, 0, 0);
                if (ob.x > ob.finishTargetX)
                {
                  ob.x = ob.finishTargetX;
                }
              }
              else
              {
                ob.facingDir = -1;
                ob.walkingDir = -1;
                ob.dirx = -1;
                ob.moveChar(ob.dirx, 0, 0);
                if (ob.x < ob.finishTargetX)
                {
                  ob.x = ob.finishTargetX;
                }
              }
            }
            else if (ob.x == ob.finishTargetX)
            {
              ob.facingDir = -1;
              ob.walkingDir = -1;
              ob.dirx = -1;
              ob.isWalking = false;
              if (ob.finishJumps < ob.finishJumpsMax)
              {
                if (!ob.jump)
                {
                  ++ob.finishJumps;
                  ob.jumpspeed = ob.jumpstart / 2;
                  ob.jump = true;
                }
              }
              else if (ob.jump)
              {
              }
            }
          }
          else
          {
            class_7.method_1("Some other kind of finishing: " + ob.finishType + ". Don\'t know what to do...");
          }
        }
        if (ob.onMovingTile)
        {
          ob.isSkidding = false;
          ob.skidSpeed = 0;
        }
        if (!ob.isHit && ob.isWalking && !ob.isGrabbing && (ob.isWallJumping || ob.gameObj.var_108.keyPressedLeft || ob.gameObj.var_108.keyPressedRight) && (ob.playerData.weaponType != CustomerData.WEAPON_MELEE || (!ob.isAttacking || ob.jump)))
        {
          if (ob.isSkidding)
          {
            ob.skidTimer = 0;
            ob.skidSpeed = 0;
            ob.isSkidding = false;
          }
          if (ob.skidTimer % ob.skidTimerInterval == 0 && ob.skidSpeed < ob.maxSkidSpeed)
          {
            ++ob.skidSpeed;
          }
          if (ob.skidSpeed > Math.abs(ob.speed))
          {
            ob.skidSpeed = Math.abs(ob.speed);
          }
          if (ob.isWallJumping)
          {
            ob.skidSpeed = ob.walkspeed;
          }
          ob.skidDecayTimer = 0;
          ++ob.skidTimer;
        }
        else
        {
          if (ob.isHit)
          {
          }
          if (!ob.isSkidding && ob.skidSpeed > Math.abs(ob.speed))
          {
            ob.skidSpeed = Math.abs(ob.speed);
          }
          if (ob.skidSpeed > 0 && !ob.jump && !ob.isGrabbing && !ob.isShoved)
          {
            ob.isSkidding = true;
            ++ob.skidDecayTimer;
            if (ob.cycleName == "stand")
            {
              ob.updateSprite();
            }
            decayInterval = ob.skidDecayTimerInterval;
            if (ob.isHit)
            {
              decayInterval = 3;
            }
            if (ob.skidDecayTimer % decayInterval == 0)
            {
              ob.skidSpeed -= ob.skidDecayAmount;
              if (ob.skidSpeed <= 0)
              {
                ob.skidSpeed = 0;
                ob.skidTimer = 0;
                ob.isSkidding = false;
                ob.skidDecayTimer = 0;
              }
            }
          }
        }
        if (ob.onSlope == 1 || ob.onSlope == 2)
        {
          ob.useSkidSpeed = ob.skidSpeed * Math.cos(class_15.degreesToRads(45));
        }
        else if (ob.onSlope == 3 || ob.onSlope == 4 || ob.onSlope == 5 || ob.onSlope == 6)
        {
          ob.useSkidSpeed = ob.skidSpeed * Math.cos(class_15.degreesToRads(22));
        }
        else if (ob.onSlope == 7 || ob.onSlope == 8)
        {
          ob.useSkidSpeed = ob.skidSpeed * Math.cos(class_15.degreesToRads(55));
        }
        else if (ob.onSlope == 9 || ob.onSlope == 10)
        {
          ob.useSkidSpeed = ob.skidSpeed * Math.cos(class_15.degreesToRads(55));
        }
        else
        {
          ob.useSkidSpeed = ob.skidSpeed;
        }
        if (ob.isHit)
        {
          if (!ob.jump && !ob.isSkidding)
          {
            ob.isHit = false;
            ob.walkingDir = ob.facingDir;
            ob.gameObj.var_108.stopHurtControls = false;
            ob.isStunned = true;
            ob.stunStartTime = 0;
          }
        }
        if (ob.isStunned)
        {
          ++ob.stunStartTime;
          if (ob.stunStartTime >= ob.stunDuration)
          {
            ob.isStunned = false;
          }
        }
        if (!ob.isStunned && !ob.isHit && ob.stunStarIDs.length > 0)
        {
          try
          {
            star = 0;
            while (star < ob.stunStarIDs.length)
            {
              starfx = ob.gameObj.var_104.getEffect(ob.stunStarIDs[star]);
              if (starfx)
              {
                starfx.stopStun();
              }
              star++;
            }
            ob.stunStarIDs = [];
          }
          catch (err:Error)
          {
          }
        }
        if (ob.isAttackLunging)
        {
          ++ob.lungeTimer;
          if (ob.lungeTimer % ob.lungeTimerInterval == 0)
          {
            --ob.lungeSpeed;
            if (ob.lungeSpeed <= 0)
            {
              ob.isAttackLunging = false;
              ob.lungeTimer = 0;
              ob.lungeSpeed = 0;
              ob.useLungeSpeed = 0;
            }
          }
        }
        if (ob.onSlope == 1 || ob.onSlope == 2)
        {
          ob.useLungeSpeed = ob.lungeSpeed * Math.cos(class_15.degreesToRads(45));
        }
        else if (ob.onSlope == 3 || ob.onSlope == 4 || ob.onSlope == 5 || ob.onSlope == 6)
        {
          ob.useLungeSpeed = ob.lungeSpeed * Math.cos(class_15.degreesToRads(22));
        }
        else if (ob.onSlope == 7 || ob.onSlope == 8)
        {
          ob.useLungeSpeed = ob.lungeSpeed * Math.cos(class_15.degreesToRads(55));
        }
        else if (ob.onSlope == 9 || ob.onSlope == 10)
        {
          ob.useLungeSpeed = ob.lungeSpeed * Math.cos(class_15.degreesToRads(55));
        }
        else
        {
          ob.useLungeSpeed = ob.lungeSpeed;
        }
        baseSpeed = ob.baseWalkSpeed;
        if (ob.duck && ob.skillType == CustomerData.SKILL_CRAWL)
        {
          baseSpeed = 5;
        }
        else if (ob.isInQuicksand)
        {
          baseSpeed = 5;
        }
        else if (ob.onMovingTile && ob.whichMovingTile != null)
        {
          try
          {
            baseSpeed = Number(ob.whichMovingTile.standingWalkSpeed);
          }
          catch (err:Error)
          {
          }
        }
        if (ob.onSlope == 1 || ob.onSlope == 2)
        {
          ob.walkspeed = baseSpeed * Math.cos(class_15.degreesToRads(45));
        }
        else if (ob.onSlope == 3 || ob.onSlope == 4 || ob.onSlope == 5 || ob.onSlope == 6)
        {
          ob.walkspeed = baseSpeed * Math.cos(class_15.degreesToRads(22));
        }
        else if (ob.onSlope == 7 || ob.onSlope == 8)
        {
          if (ob.walkingDir == 1)
          {
            ob.walkspeed = baseSpeed * Math.cos(class_15.degreesToRads(67));
          }
          else
          {
            ob.walkspeed = baseSpeed * Math.cos(class_15.degreesToRads(55));
          }
        }
        else if (ob.onSlope == 9 || ob.onSlope == 10)
        {
          if (ob.walkingDir == -1)
          {
            ob.walkspeed = baseSpeed * Math.cos(class_15.degreesToRads(67));
          }
          else
          {
            ob.walkspeed = baseSpeed * Math.cos(class_15.degreesToRads(55));
          }
        }
        else
        {
          ob.walkspeed = baseSpeed;
        }
        if (ob.isSliding)
        {
          ob.walkingDir = ob.facingDir;
          ob.dirx = ob.facingDir;
          if (ob.jump)
          {
            ob.isSliding = false;
            ob.skidSpeed = ob.slideSpeed;
            if (ob.playerData.customerName == "Scooter")
            {
              ob.gameObj.var_105.playSound("skateboard_hop.wav");
            }
          }
          else if (ob.onSlope > 0)
          {
            if (ob.baseSlideSpeed == 0 || ob.gameObj.var_108.gameplayTimer % ob.slideDecayTimerInterval == 0)
            {
              if (ob.baseSlideSpeed < 0)
              {
                ob.isSliding = false;
                ob.baseSlideSpeed = 0;
                ob.slideSpeed = 0;
                if (ob.playerData.customerName == "Scooter" || ob.playerData.customerName == "Kahuna")
                {
                  ob.jump = true;
                  ob.jumpspeed = -12;
                  if (ob.playerData.customerName == "Scooter")
                  {
                    ob.gameObj.var_105.playSound("skateboard_hop.wav");
                  }
                }
                else
                {
                  ob.isDucking = true;
                }
              }
              else if (ob.onSlope == 1 || ob.onSlope == 3 || ob.onSlope == 4 || ob.onSlope == 7 || ob.onSlope == 8)
              {
                if (ob.facingDir == -1)
                {
                  if (ob.baseSlideSpeed < ob.maxSlideSpeed)
                  {
                    if (ob.onSlope == 3 || ob.onSlope == 4)
                    {
                      ob.baseSlideSpeed += 1;
                    }
                    else
                    {
                      ob.baseSlideSpeed += 2;
                    }
                  }
                  if (ob.baseSlideSpeed > ob.maxSlideSpeed)
                  {
                    ob.baseSlideSpeed = ob.maxSlideSpeed;
                  }
                }
                else if (ob.baseSlideSpeed >= 0)
                {
                  if (ob.playerData.customerName == "Scooter")
                  {
                    if (ob.onSlope == 3 || ob.onSlope == 4)
                    {
                      if (ob.gameObj.var_108.gameplayTimer % 2 == 0)
                      {
                        --ob.baseSlideSpeed;
                      }
                    }
                    else
                    {
                      --ob.baseSlideSpeed;
                    }
                  }
                  else if (ob.onSlope == 3 || ob.onSlope == 4)
                  {
                    --ob.baseSlideSpeed;
                  }
                  else
                  {
                    ob.baseSlideSpeed -= 2;
                  }
                }
              }
              else if (ob.onSlope == 2 || ob.onSlope == 5 || ob.onSlope == 6 || ob.onSlope == 9 || ob.onSlope == 10)
              {
                if (ob.facingDir == 1)
                {
                  if (ob.baseSlideSpeed < ob.maxSlideSpeed)
                  {
                    if (ob.onSlope == 5 || ob.onSlope == 6)
                    {
                      ob.baseSlideSpeed += 1;
                    }
                    else
                    {
                      ob.baseSlideSpeed += 2;
                    }
                  }
                  if (ob.baseSlideSpeed > ob.maxSlideSpeed)
                  {
                    ob.baseSlideSpeed = ob.maxSlideSpeed;
                  }
                }
                else if (ob.baseSlideSpeed >= 0)
                {
                  if (ob.playerData.customerName == "Scooter")
                  {
                    if (ob.onSlope == 5 || ob.onSlope == 6)
                    {
                      if (ob.gameObj.var_108.gameplayTimer % 2 == 0)
                      {
                        --ob.baseSlideSpeed;
                      }
                    }
                    else
                    {
                      --ob.baseSlideSpeed;
                    }
                  }
                  else if (ob.onSlope == 5 || ob.onSlope == 6)
                  {
                    --ob.baseSlideSpeed;
                  }
                  else
                  {
                    ob.baseSlideSpeed -= 2;
                  }
                }
              }
            }
          }
          else if (ob.baseSlideSpeed > 0)
          {
            if (ob.playerData.customerName == "Scooter")
            {
              if (ob.gameObj.var_108.gameplayTimer % (ob.slideDecayTimerInterval * 2) == 0)
              {
                --ob.baseSlideSpeed;
              }
            }
            else if (ob.gameObj.var_108.gameplayTimer % ob.slideDecayTimerInterval == 0)
            {
              --ob.baseSlideSpeed;
            }
          }
          else if (ob.onSlope == 0 && ob.baseSlideSpeed <= 0 && ob.isSkidding == false)
          {
            ob.isSliding = false;
            ob.baseSlideSpeed = 0;
            ob.slideSpeed = 0;
            if (ob.playerData.customerName == "Scooter" || ob.playerData.customerName == "Kahuna")
            {
              ob.jump = true;
              ob.jumpspeed = -12;
              if (ob.playerData.customerName == "Scooter")
              {
                ob.gameObj.var_105.playSound("skateboard_hop.wav");
              }
            }
            else
            {
              ob.isDucking = true;
            }
          }
        }
        else
        {
          ob.baseSlideSpeed = 0;
          ob.slideSpeed = 0;
        }
        if (!ob.isSliding && !ob.isWallSliding && ob.slideSound != null)
        {
          ob.slideSound.stop();
          ob.slideSound = null;
        }
        else if (ob.isSliding && ob.slideSound != null)
        {
          try
          {
            st = new SoundTransform();
            st.volume = ob.baseSlideSpeed / ob.maxSlideSpeed;
            if (ob.playerData.customerName == "Scooter")
            {
              st.volume *= 2;
              if (st.volume > 1)
              {
                st.volume = 1;
              }
            }
            ob.slideSound.soundTransform = st;
          }
          catch (err:Error)
          {
          }
        }
        else if (ob.isWallSliding && ob.slideSound != null)
        {
          if (ob.gameObj.var_108.gameplayTimer % 3 == 0)
          {
            try
            {
              currv = ob.slideSound.soundTransform.volume;
              currv += 0.1;
              if (currv > 1)
              {
                currv = 1;
              }
              st2 = new SoundTransform();
              st2.volume = currv;
              ob.slideSound.soundTransform = st2;
            }
            catch (err:Error)
            {
            }
          }
        }
        else if (ob.isWallSliding && ob.slideSound == null)
        {
          ob.slideSound = ob.gameObj.var_105.playSound("hill_slide.wav", true, 0.1);
        }
        if (ob.baseSlideSpeed > 0)
        {
          if (ob.onSlope == 1 || ob.onSlope == 2)
          {
            ob.slideSpeed = ob.baseSlideSpeed * Math.cos(class_15.degreesToRads(45));
          }
          else if (ob.onSlope == 3 || ob.onSlope == 4 || ob.onSlope == 5 || ob.onSlope == 6)
          {
            ob.slideSpeed = ob.baseSlideSpeed * Math.cos(class_15.degreesToRads(22));
          }
          else if (ob.onSlope == 7 || ob.onSlope == 8)
          {
            if (ob.walkingDir == 1)
            {
              ob.slideSpeed = ob.baseSlideSpeed * Math.cos(class_15.degreesToRads(67));
            }
            else
            {
              ob.slideSpeed = ob.baseSlideSpeed * Math.cos(class_15.degreesToRads(55));
            }
          }
          else if (ob.onSlope == 9 || ob.onSlope == 10)
          {
            if (ob.walkingDir == -1)
            {
              ob.slideSpeed = ob.baseSlideSpeed * Math.cos(class_15.degreesToRads(67));
            }
            else
            {
              ob.slideSpeed = ob.baseSlideSpeed * Math.cos(class_15.degreesToRads(55));
            }
          }
          else
          {
            ob.slideSpeed = ob.baseSlideSpeed;
          }
        }
        if (ob.isGroundPounding)
        {
          ob.checkForPoundingObjects();
          ob.fallChar();
          if (ob.poundSound == null)
          {
            ob.poundSound = ob.gameObj.var_105.playSound("groundpound_dive.wav", true);
            ob.gameObj.var_105.playSound("groundpound_start.wav");
          }
          if (!ob.jump)
          {
            ob.isGroundPounding = false;
            ob.jumpspeed = ob.jumpstart / 2;
            ob.jump = true;
            ob.gameObj.var_119.setCameraJiggle(10, 10);
            ob.gameObj.var_105.playSound("papow.wav");
          }
        }
        else if (ob.poundSound != null)
        {
          ob.poundSound.stop();
          ob.poundSound = null;
        }
        if (ob.isGliding)
        {
          if (ob.playerData.customerClipName == "Foodini" && ob.foodiniGlideBalloonIDs.length == 0)
          {
            b1 = ob.gameObj.var_104.addEffect(ob.x, ob.y, "FoodiniGlideEffect", "glide", false, -12, -35);
            b6 = ob.gameObj.var_104.addEffect(ob.x, ob.y, "FoodiniGlideEffect", "glide", false, 13, -34);
            b2 = ob.gameObj.var_104.addEffect(ob.x, ob.y, "FoodiniGlideEffect", "glide", false, -9, -40);
            b5 = ob.gameObj.var_104.addEffect(ob.x, ob.y, "FoodiniGlideEffect", "glide", false, 10, -38);
            b3 = ob.gameObj.var_104.addEffect(ob.x, ob.y, "FoodiniGlideEffect", "glide", false, -4, -44);
            b4 = ob.gameObj.var_104.addEffect(ob.x, ob.y, "FoodiniGlideEffect", "glide", false, 5, -45);
            ob.foodiniGlideBalloonIDs.push(b1, b2, b3, b4, b5, b6);
          }
          if (!ob.jump)
          {
            ob.isGliding = false;
          }
        }
        else if (!ob.isGliding && ob.foodiniGlideBalloonIDs.length > 0)
        {
          try
          {
            bb = 0;
            while (bb < ob.foodiniGlideBalloonIDs.length)
            {
              bfx = ob.gameObj.var_104.getEffect(ob.foodiniGlideBalloonIDs[bb]);
              bfx.floatAway();
              if (bb == ob.foodiniGlideBalloonIDs.length - 1 && bfx.isAttached == false)
              {
                ob.balloonsLastFloatedAway = ob.gameObj.var_108.gameplayTimer;
              }
              bb++;
            }
            ob.foodiniGlideBalloonIDs = [];
          }
          catch (err:Error)
          {
          }
        }
        if (ob.canGlideBoost == false && !ob.jump)
        {
          ob.canGlideBoost = true;
        }
        if (ob.isWallJumping)
        {
          if (!ob.jump || ob.jumpspeed > 0)
          {
            ob.isWallJumping = false;
            ob.triggerjump = false;
            ob.triggerjumpx = false;
            ob.speed = ob.walkspeed;
          }
          else if (ob.facingDir == 1 && ob.checkIfAgainstWall(1) || ob.facingDir == -1 && ob.checkIfAgainstWall(-1))
          {
          }
          ob.isWallSliding = false;
        }
        else if (ob.onSlope == 0 && !ob.isWallJumping && ob.jump && !ob.isCheesed && !ob.isInQuicksand && !ob.isAttacking && !ob.gameObj.var_108.keyPressedDown && ob.jumpspeed >= 0 && ((ob.gameObj.var_108.keyPressedRight || ob.canAutoWallJump) && ob.facingDir == 1 && ob.checkIfAgainstWall(1) || (ob.gameObj.var_108.keyPressedLeft || ob.canAutoWallJump) && ob.facingDir == -1 && ob.checkIfAgainstWall(-1)))
        {
          ++ob.wallSlideStartTimer;
          if (ob.canAutoWallJump || ob.wallSlideStartTimer >= ob.wallSlideStartTimerMax)
          {
            if (!ob.isWallSliding)
            {
              ob.jumpspeed = 1;
            }
            ob.isWallSliding = true;
            ob.wallSlideCancelTimer = 0;
          }
        }
        else if (ob.isWallSliding && (ob.gameObj.var_108.keyPressedDown || !ob.jump || ob.onSlope > 0 || ob.facingDir == 1 && ob.checkIfAgainstWall(1) == false || ob.facingDir == -1 && ob.checkIfAgainstWall(-1) == false))
        {
          ob.isWallSliding = false;
          ob.canAutoWallJump = false;
          ob.jumpspeed = 1;
        }
        else if (ob.isWallSliding && (ob.checkIfAgainstWall(1) && ob.facingDir == 1 && (ob.canAutoWallJump == false && ob.gameObj.var_108.keyPressedRight == false) || ob.checkIfAgainstWall(-1) && ob.facingDir == -1 && (ob.canAutoWallJump == false && ob.gameObj.var_108.keyPressedLeft == false)))
        {
          ++ob.wallSlideCancelTimer;
          if (ob.wallSlideCancelTimer >= ob.wallSlideCancelTimerMax)
          {
            ob.isWallSliding = false;
            ob.canAutoWallJump = false;
            ob.jumpspeed = 1;
          }
        }
        if (!ob.jump && !ob.isWallSliding && ob.canAutoWallJump)
        {
          ob.canAutoWallJump = false;
        }
        if (!ob.jump || !ob.checkIfAgainstWall())
        {
          ob.wallSlideStartTimer = 0;
        }
        ob.checkIfAttacking();
        ob.checkForHittingEnemies();
        ob.checkForHittingObjects();
        ob.checkForCollectingItems();
        ob.checkForGrabbingTile();
        ob.gameObj.var_111.checkSteppingOnObjects(ob);
        // ob.adjustCarriedObject();
        ob.checkIfOnDoor();
        ob.updateStunTime();
        ob.updateComboTimer();
        if (!ob.isGrabbing && !ob.isRidingObject && (!ob.isRidingElevator || ob.isDead))
        {
          ob.fallChar();
        }
        if (!ob.jump && !ob.isGrabbing)
        {
          if (Boolean(ob.gameObj.var_114.getTileProperty(ob.xtile, ob.ytile + 1, "collision")) || Boolean(ob.gameObj.var_114.getTileProperty(ob.xtile, ob.ytile + 1, "thrublock")))
          {
            ob.lastSafeX = ob.xtile;
            ob.lastSafeY = ob.ytile;
          }
        }
        if (ob.isClimbingLadder && ob.climbDir != 0 && ob.cycleFrame == 1)
        {
          ob.gameObj.var_105.playSound("ladder_step1.wav");
        }
        else if (ob.isClimbingLadder && ob.climbDir != 0 && ob.cycleFrame == 9)
        {
          ob.gameObj.var_105.playSound("ladder_step2.wav");
        }
      }
      else if (ob.isDead)
      {
        if (!ob.jump)
        {
          ob.walkingDir = ob.facingDir;
          ob.dirx = ob.facingDir;
          if (ob.wasJumping || ob.isCrawling)
          {
            if (!ob.finishAddedPortal)
            {
              ob.finishPortalID = ob.gameObj.var_104.addEffect(ob.x, ob.y - 44, "EndPortalEffect", "delay");
              ob.gameObj.var_105.playSound("portalsound_spin.wav");
              ob.finishAddedPortal = true;
            }
          }
        }
      }
      if (ob.wasJumping && !ob.jump && !ob.isGrabbing && !ob.isRidingObject && !ob.isInQuicksand)
      {
        ob.gameObj.var_104.addEffect(ob.x, ob.y + 18, "DustEffect", "anim", false, -1, 0);
        ob.gameObj.var_104.addEffect(ob.x, ob.y + 18, "DustEffect", "anim", false, 1, 0);
        ob.gameObj.var_105.playSound("jumpland");
      }
      if (!ob.wasTurning && ob.isTurning && !ob.jump && !ob.isGrabbing && !ob.isCrawling)
      {
        if (ob.dirx == -1)
        {
          ob.gameObj.var_104.addEffect(ob.x + 8, ob.y + 18, "DustEffect", "anim", false, 1, 0);
          ob.gameObj.var_104.addEffect(ob.x + 4, ob.y + 18, "DustEffect", "anim", false, 1, -1);
        }
        else if (ob.dirx == 1)
        {
          ob.gameObj.var_104.addEffect(ob.x - 8, ob.y + 18, "DustEffect", "anim", false, -1, 0);
          ob.gameObj.var_104.addEffect(ob.x - 4, ob.y + 18, "DustEffect", "anim", false, -1, -1);
        }
      }
      else if (ob.isSliding && ob.gameObj.var_108.gameplayTimer % 2 == 0)
      {
        ob.gameObj.var_104.addEffect(ob.x - 6 * ob.facingDir, ob.y + 13, "DustEffect");
      }
      else if (ob.isAttackLunging && !ob.jump && ob.gameObj.var_108.gameplayTimer % 3 == 0 && ob.lungeSpeed > 4)
      {
        ob.gameObj.var_104.addEffect(ob.x - 6 * ob.facingDir, ob.y + 13, "DustEffect");
      }
      if (ob.jump)
      {
        ob.wasJumping = true;
      }
      else
      {
        ob.wasJumping = false;
      }
      if (ob.isTurning)
      {
        ob.wasTurning = true;
      }
      else
      {
        ob.wasTurning = false;
      }
      ob.playerLastX = ob.x;
      if (ob.isCrawling)
      {
        ob.gameObj.method_94("crawl");
      }
      if (ob.isGliding && ob.playerData.customerName == "Professor Fitz" && ob.copterSound == null)
      {
        ob.copterSound = ob.gameObj.var_105.playSound("fitzcopter.wav", true);
      }
      else if (!ob.isGliding && ob.playerData.customerName == "Professor Fitz" && ob.copterSound != null)
      {
        ob.copterSound.stop();
        ob.copterSound = null;
      }
    }

    override public function fallChar():void
    {
      if (!this.jump && !this.isFlying && !this.isClimbingLadder)
      {
        this.getMyCorners(this.x, this.y + 1);
        if (!this.HitDownLeft && !this.HitDownRight && !this.checkIfOnCloud() && !checkMovingTiles(1) && !this.onSlope && !this.isInQuicksand)
        {
          this.jumpspeed = 0;
          this.jump = true;
          this.jumpedFromX = this.x;
          this.jumpedFromY = this.y;
        }
        else if (!this.duck && !this.isCrawling)
        {
          this.lastSafeTime = this.gameObj.var_108.gameplayTimer;
        }
      }
    }

    public function checkIfAttacking():void
    {
      var _loc1_:CustomerChar = this;
      if (_loc1_.playerData.weaponType == CustomerData.WEAPON_BAZOOKA || _loc1_.playerData.weaponType == CustomerData.WEAPON_LONGGUN || _loc1_.playerData.weaponType == CustomerData.WEAPON_PISTOL || _loc1_.playerData.weaponType == CustomerData.WEAPON_TOSS || _loc1_.playerData.customerName == "Xandra")
      {
        if (!_loc1_.canAttack && !_loc1_.isAttacking)
        {
          ++_loc1_.reloadTimer;
          if (_loc1_.reloadTimer >= _loc1_.reloadTimerMax && !_loc1_.gameObj.var_108.keyPressedAction)
          {
            _loc1_.canAttack = true;
          }
        }
        else if (_loc1_.isAttacking)
        {
          if (_loc1_.bulletTimer > 0 && _loc1_.bulletTimer % _loc1_.bulletFrequency == 0 && _loc1_.bulletsFired < _loc1_.bulletsPerRound)
          {
            _loc1_.shootWeapon(_loc1_.playerData.bulletName, false, null);
          }
          ++_loc1_.bulletTimer;
          if (_loc1_.bulletsFired > 0)
          {
            ++_loc1_.reloadTimer;
            if (_loc1_.reloadTimer >= _loc1_.reloadTimerMax && !_loc1_.gameObj.var_108.keyPressedAction)
            {
              _loc1_.canAttack = true;
            }
          }
        }
        if (!_loc1_.isShoved && (!_loc1_.canPressLeft || !_loc1_.canPressRight))
        {
          _loc1_.canPressLeft = true;
          _loc1_.canPressRight = true;
        }
      }
      else
      {
        if (!_loc1_.canAttack && !_loc1_.isAttacking)
        {
          _loc1_.canAttack = true;
        }
        else if (_loc1_.isAttacking && !_loc1_.canAttack && _loc1_.cycleFrame >= _loc1_.repeatAttackFrame)
        {
          _loc1_.canAttack = true;
        }
        if (!_loc1_.isAttacking)
        {
          _loc1_.canDealDamage = true;
        }
        if (!_loc1_.isShoved && (!_loc1_.canPressLeft || !_loc1_.canPressRight))
        {
          if (_loc1_.jump)
          {
            _loc1_.canPressLeft = true;
            _loc1_.canPressRight = true;
          }
          else if (_loc1_.canDealDamage)
          {
            ++_loc1_.postAttackDelayTimer;
            if (_loc1_.postAttackDelayTimer >= _loc1_.postAttackDelayMax)
            {
              _loc1_.canPressLeft = true;
              _loc1_.canPressRight = true;
            }
          }
        }
        if (_loc1_.isAttacking && _loc1_.hasWeaponType == "whip" && _loc1_.cycleFrame == _loc1_.startAttackFrame)
        {
          _loc1_.gameObj.var_105.playSound("attack_whip.wav");
        }
      }
    }

    public function startThrowingObject():void
    {
      this.canAttack = false;
      if (this.isCarryingObject && Boolean(this.whichObjectGrabbed))
      {
        this.isThrowingObject = true;
      }
    }

    override public function cancelAttack():void
    {
      super.cancelAttack();
      if (this.balloonFXID != -1)
      {
        FoodiniBalloonEffect(this.gameObj.var_104.getEffect(this.balloonFXID)).resetBalloon();
      }
    }

    public function startAttacking():void
    {
      var _loc2_:Array = null;
      if (!this.isGrabbing && !this.isRidingObject)
      {
        this.canDealDamage = true;
        this.isAttacking = true;
        this.canAttack = false;
        this.bulletTimer = 0;
        this.bulletsFired = 0;
        this.reloadTimer = 0;
        if (this.playerData.weaponType == CustomerData.WEAPON_WHIP || this.playerData.weaponType == CustomerData.WEAPON_TOSS)
        {
          this.attackVariation = 1;
        }
        else if (this.playerData.weaponType == CustomerData.WEAPON_MELEE)
        {
          if (this.jump)
          {
            this.attackVariation = 4;
          }
          else
          {
            _loc2_ = [1, 2, 3, 4];
            _loc2_.splice(_loc2_.indexOf(this.attackVariation), 1);
            this.attackVariation = _loc2_[Math.floor(Math.random() * _loc2_.length)];
          }
        }
        else if (this.attackVariation == 1)
        {
          this.attackVariation = 2;
        }
        else
        {
          this.attackVariation = 1;
        }
        this.setupAttackRect();
        this.isTurning = false;
        this.walkingDir = this.facingDir;
        if (this.jump && this.speed < 0)
        {
          this.speed *= -1;
        }
        this.isDoubleJumping = false;
        this.isGliding = false;
        if (this.balloonFXID != -1)
        {
          FoodiniBalloonEffect(this.gameObj.var_104.getEffect(this.balloonFXID)).isVisible = false;
        }
        if (this.playerData.weaponType == CustomerData.WEAPON_MELEE)
        {
        }
        if (this.playerData.weaponType == CustomerData.WEAPON_MELEE || this.playerData.weaponType == CustomerData.WEAPON_TOSS)
        {
          this.gameObj.var_105.playSound("attack_punch_" + Math.min(2, this.attackVariation) + ".wav");
        }
        else if (this.hasWeaponType == "swing1" || this.hasWeaponType == "swing2" || this.hasWeaponType == "kahuna" || this.hasWeaponType == "scooter")
        {
          this.gameObj.var_105.playSound("attack_swing_" + Math.min(2, this.attackVariation) + ".wav");
          if (this.playerData.customerName == "Xandra")
          {
            this.gameObj.var_105.playSound("xandra_sparkle.wav");
          }
        }
        else if (this.hasWeaponType == "whip")
        {
        }
      }
    }

    public function setupAttackRect():void
    {
      var _loc2_:Rectangle = null;
      var _loc3_:Array = null;
      if (this.hasWeaponType == "swing1" || this.hasWeaponType == "swing2" || this.hasWeaponType == "scooter" || this.hasWeaponType == "kahuna")
      {
        _loc2_ = this.swing_attackRect;
        _loc3_ = this.swing_frameRange;
      }
      else if (this.hasWeaponType == "melee")
      {
        _loc2_ = this.melee_attackRect;
        _loc3_ = this.melee_frameRange;
      }
      else if (this.hasWeaponType == "whip")
      {
        _loc2_ = this.whip_attackRect;
        _loc3_ = this.whip_frameRange;
      }
      else if (this.hasWeaponType == "longgun" || this.hasWeaponType == "pistol" || this.hasWeaponType == "bazooka" || this.hasWeaponType == "toss")
      {
        _loc2_ = this.other_attackRect;
        _loc3_ = this.other_frameRange;
        this.reloadTimerMax = 5;
      }
      else
      {
        _loc2_ = this.other_attackRect;
        _loc3_ = this.other_frameRange;
      }
      this.attackRect.x = _loc2_.x;
      this.attackRect.y = _loc2_.y;
      this.attackRect.width = _loc2_.width;
      this.attackRect.height = _loc2_.height;
      this.startAttackFrame = _loc3_[0];
      this.endAttackFrame = _loc3_[1];
      this.repeatAttackFrame = _loc3_[2];
      if (this.facingDir == -1)
      {
        this.attackRect.x = _loc2_.x * -1 - _loc2_.width;
      }
    }

    override public function updateSprite():void
    {
      var _loc2_:Array = null;
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:Number = NaN;
      var _loc6_:String = null;
      var _loc7_:Number = NaN;
      var _loc8_:Number = 1;
      _loc2_ = this.grabFootAnimationCycle();
      if (_loc2_[0] == "foot_climb")
      {
        _loc8_ = this.climbDir;
      }
      _loc3_ = this.footAnimationFrame;
      _loc5_ = this.footCycleFrame;
      _loc6_ = _loc2_[0];
      _loc7_ = Number(_loc2_[1]);
      if (_loc7_ == 1)
      {
        _loc4_ = Number(_loc2_[5]);
      }
      else if (_loc7_ == 2)
      {
        _loc4_ = Number(_loc2_[5][0]);
      }
      if (_loc6_ != this.footCycleName)
      {
        this.adjustFootFrameSync(_loc6_, this.footCycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
      }
      else
      {
        this.adjustFootFrameSync(_loc6_, this.footCycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
        this.footSpriteChangeFrame(_loc8_, _loc2_, _loc7_);
      }
      _loc2_ = this.grabAnimationCycle();
      _loc3_ = this.animationFrame;
      _loc5_ = this.cycleFrame;
      _loc6_ = _loc2_[0];
      _loc7_ = Number(_loc2_[1]);
      if (_loc7_ == 1)
      {
        _loc4_ = Number(_loc2_[5]);
      }
      else if (_loc7_ == 2)
      {
        _loc4_ = Number(_loc2_[5][0]);
      }
      if (_loc6_ != this.cycleName)
      {
        this.adjustFrameSync(_loc6_, this.cycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
      }
      else
      {
        this.adjustFrameSync(_loc6_, this.cycleName, _loc4_, _loc3_, _loc5_, _loc7_, _loc2_);
        this.spriteChangeFrame(_loc8_, _loc2_, _loc7_);
      }
      this.animationBlitStyle = _loc2_[2];
    }

    public function footSpriteChangeFrame(param1:Number, param2:Array, param3:Number):void
    {
      var _loc5_:Number = NaN;
      var _loc6_:Number = NaN;
      var _loc7_:Number = NaN;
      var _loc8_:Number = NaN;
      var _loc9_:Number = NaN;
      if (param3 == 1)
      {
        this.footAnimationFrame += param1;
        _loc5_ = Number(param2[3]);
        _loc6_ = Number(param2[4]);
        _loc7_ = Number(param2[5]);
        _loc8_ = Number(param2[6]);
        if (this.footAnimationFrame > _loc8_)
        {
          if (_loc6_ == -1)
          {
            this.footAnimationFrame = _loc8_;
          }
          else
          {
            this.footAnimationFrame = _loc6_;
          }
        }
        if (this.footAnimationFrame < _loc6_ && this.facingDir != this.walkingDir)
        {
          this.footAnimationFrame = _loc8_;
        }
      }
      else if (param3 == 2)
      {
        _loc9_ = Number(param2[5].length);
        _loc5_ = Number(param2[3]);
        _loc6_ = Number(param2[4]);
        _loc7_ = Number(param2[5][0]);
        _loc8_ = param2[5].length - 1;
        this.footCycleFrame += param1;
        if (this.footCycleFrame < 0)
        {
          this.footCycleFrame = _loc8_;
        }
        else if (this.footCycleFrame > _loc8_)
        {
          if (_loc6_ == -1)
          {
            this.footCycleFrame = _loc8_;
          }
          else
          {
            this.footCycleFrame = _loc6_;
          }
        }
        this.footAnimationFrame = param2[5][this.footCycleFrame];
      }
    }

    public function adjustFootFrameSync(param1:String, param2:String, param3:Number, param4:Number, param5:Number, param6:Number, param7:Array):void
    {
      var _loc9_:Array = null;
      var _loc10_:Array = null;
      var _loc11_:Number = NaN;
      var _loc12_:Number = NaN;
      if (param1 == "foot_duck" && (param2 == "foot_crawl" || param2 == "foot_turncrawl" || param2 == "foot_hurtcrawl"))
      {
        this.footCycleFrame = param7[5].length - 1;
        this.footAnimationFrame = param7[5][this.footCycleFrame];
        this.footCycleName = param1;
      }
      else if (param1 == "foot_crawl" && (param2 == "foot_duck" || param2 == "foot_turncrawl" || param2 == "foot_hurtcrawl"))
      {
        this.footCycleFrame = param7[4];
        this.footAnimationFrame = param7[5][this.footCycleFrame];
        this.footCycleName = param1;
      }
      else if ((param2 == "foot_doublejump" || param2 == "foot_doublefall") && param1 == "foot_attack1_swing1" && this.playerData.customerClipName == "Cooper")
      {
        this.footCycleFrame = 4;
        this.footAnimationFrame = param7[5][this.footCycleFrame];
        this.footCycleName = param1;
      }
      else if (param1.indexOf("foot_slide") == 0 && (param2.indexOf("foot_slide") == 0 || param2.indexOf("foot_double") == 0) && param1 != param2)
      {
        _loc9_ = ["foot_slide67down", "foot_slide45down", "foot_slide22down", "foot_slide", "foot_slide22up", "foot_slide45up", "foot_slide67up"];
        _loc10_ = [113, 112, 111, 68, 108, 109, 110];
        _loc11_ = _loc9_.indexOf(param1);
        _loc12_ = _loc9_.indexOf(param2);
        if (param2.indexOf("foot_double") == 0)
        {
          _loc12_ = _loc9_.indexOf("slide");
        }
        if (_loc12_ < _loc11_ && _loc11_ - _loc12_ > 1)
        {
          param1 = _loc9_[_loc12_ + 1];
          this.footCycleFrame = param7[4];
          this.footAnimationFrame = _loc10_[_loc12_ + 1];
          this.footCycleName = param1;
        }
        else if (_loc12_ > _loc11_ && _loc12_ - _loc11_ > 1)
        {
          param1 = _loc9_[_loc12_ - 1];
          this.footCycleFrame = param7[4];
          this.footAnimationFrame = _loc10_[_loc12_ - 1];
          this.footCycleName = param1;
        }
        else
        {
          this.footCycleFrame = param7[4];
          this.footAnimationFrame = param7[5][this.cycleFrame];
          this.footCycleName = param1;
        }
      }
      else if (param1 == "foot_push" && param2 == "foot_finishpush")
      {
        this.footCycleFrame = param7[5].indexOf(this.footAnimationFrame);
        this.footCycleName = param1;
      }
      else if (param1 != param2)
      {
        this.footAnimationFrame = param3;
        this.footCycleFrame = 0;
        this.footCycleName = param1;
      }
    }

    override public function adjustFrameSync(param1:String, param2:String, param3:Number, param4:Number, param5:Number, param6:Number, param7:Array):void
    {
      var _loc9_:Array = null;
      var _loc10_:Array = null;
      var _loc11_:Number = NaN;
      var _loc12_:Number = NaN;
      if (param1 != param2)
      {
        if (param1 == "duck" && (param2 == "crawl" || param2 == "turncrawl" || param2 == "hurtcrawl"))
        {
          this.cycleFrame = param7[5].length - 1;
          this.animationFrame = param7[5][this.cycleFrame];
          this.cycleName = param1;
        }
        else if (param1 == "crawl" && (param2 == "duck" || param2 == "turncrawl" || param2 == "hurtcrawl"))
        {
          this.cycleFrame = param7[4];
          this.animationFrame = param7[5][this.cycleFrame];
          this.cycleName = param1;
        }
        else if (param1.indexOf("shoot_") > -1 && param2.indexOf("shoot_") > -1)
        {
          this.cycleName = param1;
        }
        else if ((param2 == "doublejump" || param2 == "doublefall") && param1 == "attack1_swing1" && this.playerData.customerClipName == "Connor")
        {
          this.cycleFrame = 4;
          this.animationFrame = param7[5][this.cycleFrame];
          this.cycleName = param1;
          this.bulletTimer += 4;
        }
        else if (param1.indexOf("slide") == 0 && (param2.indexOf("slide") == 0 || param2.indexOf("double") == 0))
        {
          _loc9_ = ["slide67down", "slide45down", "slide22down", "slide", "slide22up", "slide45up", "slide67up"];
          _loc10_ = [113, 112, 111, 68, 108, 109, 110];
          _loc11_ = _loc9_.indexOf(param1);
          _loc12_ = _loc9_.indexOf(param2);
          if (param2.indexOf("double") == 0)
          {
            _loc12_ = _loc9_.indexOf("slide");
          }
          if (_loc12_ < _loc11_ && _loc11_ - _loc12_ > 1)
          {
            param1 = _loc9_[_loc12_ + 1];
            this.cycleFrame = param7[4];
            this.animationFrame = _loc10_[_loc12_ + 1];
            this.cycleName = param1;
          }
          else if (_loc12_ > _loc11_ && _loc12_ - _loc11_ > 1)
          {
            param1 = _loc9_[_loc12_ - 1];
            this.cycleFrame = param7[4];
            this.animationFrame = _loc10_[_loc12_ - 1];
            this.cycleName = param1;
          }
          else
          {
            this.cycleFrame = param7[4];
            this.animationFrame = param7[5][this.cycleFrame];
            this.cycleName = param1;
          }
        }
        else if (param1 == "push" && param2 == "finishpush")
        {
          this.cycleFrame = param7[5].indexOf(this.animationFrame);
          this.cycleName = param1;
        }
        else
        {
          this.animationFrame = param3;
          this.cycleFrame = 0;
          this.cycleName = param1;
        }
      }
    }

    override public function checkForGrabbingTile():void
    {
      var _loc3_:Number = NaN;
      var _loc4_:Number = NaN;
      var _loc5_:ObjectManager = null;
      var _loc6_:Rectangle = null;
      var _loc7_:int = 0;
      var _loc8_:GameObject = null;
      var _loc9_:Number = NaN;
      var _loc2_:MapManager = this.gameObj.var_114;
      if (this.jump && this.jumpspeed >= 0 && !this.isGrabbing && !this.isRidingObject && !this.isHit && !this.isShoved && !this.isCarryingObject && !this.gameObj.var_108.keyPressedDown)
      {
        _loc3_ = Number(_loc2_.getTileProperty(this.leftX, this.ytile + this.grabTileYOffset, "grab"));
        _loc4_ = Number(_loc2_.getTileProperty(this.rightX, this.ytile + this.grabTileYOffset, "grab"));
        if (_loc3_ > 0 || _loc4_ > 0)
        {
          if ((_loc3_ == 2 || _loc4_ == 2) && (this.gameObj.var_108.keyPressedLeft || this.gameObj.var_108.keyPressedRight))
          {
            this.isStartingGrabbing = false;
          }
          else
          {
            this.isStartingGrabbing = true;
          }
          this.isGrabbing = true;
          this.isSkidding = false;
          this.isThrowingObject = false;
          this.isGrabbingObject = false;
          this.isCarryingObject = false;
          this.cancelAttack();
          this.skidSpeed = 0;
          this.jump = false;
          this.y = this.ytile * this.gameObj.var_103.tileWidth + 10;
        }
        else
        {
          _loc5_ = this.gameObj.var_111;
          _loc6_ = new Rectangle(this.x - 20, this.y - 80, 40, 40);
          _loc7_ = 0;
          while (_loc7_ < _loc5_.objects.length)
          {
            _loc8_ = _loc5_.objects[_loc7_];
            if (_loc8_.checkOnScreen() && _loc8_.isGrabRideable && !_loc8_.isGrabRiding && !_loc8_.delayRideableUntilPickup && _loc8_.checkSpriteCollision(_loc6_))
            {
              this.isRidingObject = true;
              this.whichObjectRiding = _loc8_;
              this.skidSpeed = 0;
              this.jump = false;
              _loc9_ = _loc8_.getRideableDirection();
              this.ridingObjectDirX = _loc9_;
              if (_loc9_ != 0)
              {
                this.facingDir = _loc9_;
                this.walkingDir = this.facingDir;
                this.dirx = this.facingDir;
              }
              this.cancelAttack();
              _loc8_.grabRideableObject(this);
              break;
            }
            _loc7_++;
          }
        }
      }
    }

    override public function checkForHittingEnemies(param1:Boolean = false):Boolean
    {
      var _loc14_:Enemy = null;
      var _loc15_:Boolean = false;
      var _loc3_:Rectangle = new Rectangle(this.x + this.collRect.x, this.y + this.collRect.y, this.collRect.width, this.collRect.height);
      var _loc4_:Rectangle = new Rectangle(this.x + this.stomp_collRect.x, this.y + this.stomp_collRect.y, this.stomp_collRect.width, this.stomp_collRect.height);
      var _loc5_:Rectangle = new Rectangle(this.x + this.getTorsoOffsetX() + this.attackRect.x, this.y + this.getTorsoOffsetY() + this.attackRect.y, this.attackRect.width, this.attackRect.height);
      if (this.isGroundPounding)
      {
        _loc4_ = new Rectangle(this.x + this.pound_collRect.x, this.y + this.pound_collRect.y, this.pound_collRect.width, this.pound_collRect.height);
      }
      var _loc6_:Boolean = false;
      var _loc7_:EffectManager = this.gameObj.var_104;
      var _loc8_:Boolean = false;
      var _loc9_:Boolean = false;
      var _loc10_:String = this.playerData.weaponClipName;
      var _loc11_:Boolean = false;
      var _loc12_:EnemyManager = this.gameObj.var_110;
      var _loc13_:int = 0;
      while (_loc13_ < _loc12_.enemies.length)
      {
        if (_loc12_.enemies[_loc13_] != 0)
        {
          _loc14_ = _loc12_.enemies[_loc13_];
          if (param1)
          {
            _loc6_ = false;
            break;
          }
          if (this.canDealDamage && this.isAttacking && this.cycleFrame >= this.startAttackFrame && this.cycleFrame <= this.endAttackFrame)
          {
            if (_loc14_.checkSpriteCollision(_loc5_))
            {
              _loc15_ = false;
              if (!_loc14_.isHit)
              {
                _loc15_ = _loc14_.getHit(this.statAttack, this.facingDir, false, _loc10_);
              }
              if (!_loc14_.isDodging && _loc14_.isHit)
              {
                _loc8_ = true;
                if (_loc15_)
                {
                  _loc9_ = true;
                }
              }
              if (!_loc14_.isDead)
              {
                if (this.usingPowerTool())
                {
                  if (Math.abs(this.x - _loc14_.x) <= 30)
                  {
                    if (this.x < _loc14_.x)
                    {
                      this.shovePlayer(-1);
                    }
                    else
                    {
                      this.shovePlayer(1);
                    }
                  }
                }
                else if (this.x < _loc14_.x)
                {
                  this.shovePlayer(-1, 0);
                }
                else
                {
                  this.shovePlayer(1, 0);
                }
              }
            }
          }
          else if (this.isSliding && _loc14_.checkSpriteCollision(_loc3_) && !_loc14_.isDead)
          {
            if (playerData.customerName == "Scooter")
            {
              _loc14_.getHit(this.statAttack, this.facingDir, false, "slideskate");
            }
            else
            {
              _loc14_.getHit(this.statAttack, this.facingDir, false, "slide");
            }
          }
          else if (this.isGroundPounding && _loc14_.checkSpriteCollision(_loc4_) && !_loc14_.isDead && _loc14_.canBeStunned)
          {
            _loc14_.getHit(this.statAttack, this.facingDir, false, "groundpound");
            this.jumpspeed = -16;
            this.jump = true;
            this.isGliding = false;
            this.isDoubleJumping = false;
            this.isWallJumping = false;
            this.isGroundPounding = false;
            this.gameObj.var_119.setCameraJiggle(10, 10);
            this.gameObj.var_105.playSound("papow.wav");
          }
          else if (this.canGetHit() && !param1)
          {
            if (_loc14_.checkSpriteCollision(_loc3_) && !_loc14_.isDead)
            {
              if (this.isCheesed && this.jump && this.jumpspeed >= 0)
              {
                class_7.info("Hit enemy while cheesed!  Kill it.");
                if (!_loc14_.isDead)
                {
                  _loc14_.killMe();
                }
                break;
              }
              if (_loc14_.canBeStunned && (this.jump && this.jumpspeed >= 0 || !this.jump && this.wasJumping) && (_loc14_.stompRect == null || _loc14_.checkSpriteCollision(_loc4_, _loc14_.stompRect)))
              {
                _loc14_.stunEnemy();
                _loc11_ = true;
                this.gravity = _loc14_.stunBounceGravity;
                this.jumpspeed = _loc14_.stunBounceJumpSpeed;
                this.triggerjump = true;
                this.jump = true;
                this.isGliding = false;
                this.isDoubleJumping = false;
                this.isWallJumping = false;
                this.isWallSliding = false;
                this.isGroundPounding = false;
                if (!_loc14_.isDead && !_loc14_.isHit)
                {
                  this.gameObj.var_105.playSound("stunbounce.wav", false, 0.7);
                }
                break;
              }
              if (!_loc14_.isStunned && !_loc14_.isUnstunning && !_loc11_ && _loc14_.canDealDamage)
              {
                if (_loc14_.x > this.x)
                {
                  this.hurtPlayer(-1, 1);
                  _loc14_.reactToHurtingPlayer();
                  break;
                }
                this.hurtPlayer(1, 1);
                _loc14_.reactToHurtingPlayer();
                break;
              }
              if ((_loc14_.isStunned || _loc14_.isUnstunning || _loc14_.canDealDamage == false) && (!this.jump || this.jumpspeed >= 0))
              {
                if (this.x < _loc14_.x)
                {
                  this.shovePlayer(-1, _loc14_.shoveAmount);
                  break;
                }
                this.shovePlayer(1, _loc14_.shoveAmount);
              }
              break;
            }
          }
        }
        _loc13_++;
      }
      if (_loc8_ && !this.usingPowerTool())
      {
        this.canDealDamage = false;
      }
      if (_loc8_ && _loc9_)
      {
        this.isFinalBlow = true;
      }
      else if (_loc8_ && !_loc9_)
      {
        this.isFinalBlow = false;
      }
      else if (!_loc8_ && this.canDealDamage)
      {
        this.isFinalBlow = false;
      }
      return _loc6_;
    }

    public function checkForHittingBullets():Boolean
    {
      var _loc2_:class_5 = this.gameObj;
      var _loc3_:BulletManager = _loc2_.var_116;
      var _loc4_:Rectangle = new Rectangle(this.x + this.getTorsoOffsetX() + this.attackRect.x, this.y + this.getTorsoOffsetY() + this.attackRect.y, this.attackRect.width, this.attackRect.height);
      var _loc5_:Number = _loc3_.bullets.length;
      var _loc6_:Boolean = false;
      var _loc7_:Bullet = null;
      var _loc8_:int = 0;
      while (_loc8_ < _loc5_)
      {
        _loc7_ = _loc3_.bullets[_loc8_];
        if (_loc7_.playerCanDeflect && _loc7_.fromEnemy == true)
        {
          if (this.canDealDamage && this.isAttacking && this.cycleFrame >= this.startAttackFrame && this.cycleFrame <= this.endAttackFrame)
          {
            if (_loc7_.checkSpriteCollision(_loc4_))
            {
              _loc7_.getHit();
              _loc6_ = true;
            }
          }
        }
        _loc8_++;
      }
      return _loc6_;
    }

    override public function checkForHittingObjects():Boolean
    {
      var _loc9_:GameObject = null;
      var _loc10_:Number = NaN;
      var _loc11_:Number = NaN;
      var _loc2_:Rectangle = new Rectangle(this.x + this.getTorsoOffsetX() + this.attackRect.x, this.y + this.getTorsoOffsetY() + this.attackRect.y, this.attackRect.width, this.attackRect.height);
      var _loc3_:EffectManager = this.gameObj.var_104;
      var _loc4_:Boolean = false;
      var _loc6_:Boolean = false;
      var _loc7_:ObjectManager = this.gameObj.var_111;
      var _loc8_:int = 0;
      while (_loc8_ < _loc7_.objects.length)
      {
        if (_loc7_.objects[_loc8_] != 0)
        {
          _loc9_ = _loc7_.objects[_loc8_];
          if (this.canDealDamage && this.isAttacking && this.cycleFrame >= this.startAttackFrame && this.cycleFrame <= this.endAttackFrame)
          {
            if (_loc9_.checkSpriteCollision(_loc2_) && _loc9_.acceptsDamage("weapon", "punch"))
            {
              _loc9_.getHit();
              _loc4_ = true;
              _loc10_ = _loc9_.x;
              _loc11_ = _loc9_.y - 20 - Math.ceil(Math.random() * 14);
              if (_loc9_.x > this.x)
              {
                _loc10_ -= Math.ceil(Math.random() * 7);
              }
              else
              {
                _loc10_ += Math.ceil(Math.random() * 7);
              }
            }
          }
          if (_loc9_.isPushable)
          {
            if (_loc9_.checkPushingObject() == true)
            {
              _loc6_ = true;
            }
          }
        }
        _loc8_++;
      }
      if (_loc4_ && !this.usingPowerTool())
      {
        this.canDealDamage = false;
      }
      if (_loc6_ && !this.jump && !this.isAttacking && !this.isHit && !this.duck)
      {
        this.isFinishPushing = false;
        this.isPushingObject = true;
        this.wasPushing = true;
      }
      else
      {
        this.isPushingObject = false;
        if (this.wasPushing)
        {
          this.isFinishPushing = true;
          this.wasPushing = false;
        }
      }
      return _loc4_;
    }

    public function checkForPoundingObjects():void
    {
      var _loc4_:* = 0;
      var _loc5_:GameObject = null;
      var _loc2_:Rectangle = new Rectangle(this.x + this.pound_collRect.x, this.y + this.pound_collRect.y, this.pound_collRect.width, this.pound_collRect.height);
      var _loc3_:ObjectManager = this.gameObj.var_111;
      if (this.isGroundPounding)
      {
        _loc4_ = int(_loc3_.objects.length - 1);
        while (_loc4_ >= 0)
        {
          if (_loc3_.objects[_loc4_] != 0)
          {
            _loc5_ = _loc3_.objects[_loc4_];
            if (_loc5_.checkSpriteCollision(_loc2_) && _loc5_.acceptsDamage("weapon", "Pound"))
            {
              _loc5_.getHit();
            }
          }
          _loc4_--;
        }
      }
    }

    public function checkIfAgainstWall(param1:Number = 0):Boolean
    {
      var _loc3_:Boolean = false;
      if (this.skillType == CustomerData.SKILL_WALLJUMP)
      {
        if (param1 == 0 || param1 == -1)
        {
          this.getMyCorners(this.x - 6, this.y);
          if ((this.HitDownLeft || this.HitMidLeft) && this.HitUpLeft)
          {
            _loc3_ = true;
          }
        }
        if (param1 == 0 || param1 == 1)
        {
          this.getMyCorners(this.x + 6, this.y);
          if ((this.HitDownRight || this.HitMidRight) && this.HitUpRight)
          {
            _loc3_ = true;
          }
        }
      }
      return _loc3_;
    }

    override public function checkForCrawlGap(param1:Number):Boolean
    {
      var _loc3_:Boolean = false;
      var _loc4_:String = "";
      if (this.skillType == CustomerData.SKILL_CRAWL && !this.jump && !this.isAttacking)
      {
        if (param1 == -1 && !this.HitDownLeft && (this.HitUpLeft || this.HitUpMidLeft || this.HitDownMidLeft))
        {
          _loc3_ = true;
          this.duck = true;
          this.isDucking = true;
          this.isTurning = false;
          _loc4_ = "left";
        }
        else if (param1 == 1 && !this.HitDownRight && (this.HitUpRight || this.HitUpMidRight || this.HitDownMidRight))
        {
          _loc3_ = true;
          this.duck = true;
          this.isDucking = true;
          this.isTurning = false;
          _loc4_ = "right";
        }
        else if (this.onSlope == 9 && param1 == -1 && !this.HitDownMidLeft && (this.HitUpMidLeft || this.HitUpLeft))
        {
          _loc3_ = true;
          this.duck = true;
          this.isDucking = true;
          this.isTurning = false;
          _loc4_ = "9-1";
        }
        else if (this.onSlope == 8 && param1 == 1 && !this.HitDownMidRight && (this.HitUpMidRight || this.HitUpRight))
        {
          _loc3_ = true;
          this.duck = true;
          this.isDucking = true;
          this.isTurning = false;
          _loc4_ = "8-1";
        }
        else if (this.onSlope == 9 && param1 == -1 && !this.HitDownMidLeft && this.onSlopeWallLeft)
        {
          _loc3_ = true;
          this.duck = true;
          this.isDucking = true;
          this.isTurning = false;
          _loc4_ = "9-2";
        }
        else if (this.onSlope == 8 && param1 == 1 && !this.HitDownMidRight && this.onSlopeWallRight)
        {
          _loc3_ = true;
          this.duck = true;
          this.isDucking = true;
          this.isTurning = false;
          _loc4_ = "8-2";
        }
      }
      if (_loc3_ == true)
      {
        class_7.method_1("Start Crawling into gap! (" + _loc4_ + ")");
      }
      return _loc3_;
    }

    override public function isInsideCrawlGap():Boolean
    {
      var _loc2_:Boolean = false;
      if (this.duck)
      {
        this.getMyCorners(this.x, this.y);
        if (gameObj.var_114.getTileProperty(this.leftX, this.standupY, "collision") > 0 || gameObj.var_114.getTileProperty(this.rightX, this.standupY, "collision") > 0)
        {
          _loc2_ = true;
        }
        else if (gameObj.var_114.getTileProperty(this.leftX, this.standupmidY, "collision") > 0 || gameObj.var_114.getTileProperty(this.rightX, this.standupmidY, "collision") > 0)
        {
          _loc2_ = true;
        }
        else if (gameObj.var_114.getTileProperty(this.leftX, this.upY, "collision") > 0 || gameObj.var_114.getTileProperty(this.rightX, this.upY, "collision") > 0)
        {
          _loc2_ = true;
        }
        else if (this.onSlope == 9 && this.facingDir == -1 && Boolean(gameObj.var_114.getTileProperty(this.xtile - 1, this.ytile - 2, "collision")))
        {
          _loc2_ = true;
        }
        else if (this.onSlope == 8 && this.facingDir == 1 && Boolean(gameObj.var_114.getTileProperty(this.xtile + 1, this.ytile - 2, "collision")))
        {
          _loc2_ = true;
        }
        else if (gameObj.var_114.getTileProperty(this.leftX, this.standupY, "ceilingslope") > 0 || gameObj.var_114.getTileProperty(this.rightX, this.standupY, "ceilingslope") > 0)
        {
          _loc2_ = true;
        }
        else if (gameObj.var_114.getTileProperty(this.leftX, this.standupmidY, "ceilingslope") > 0 || gameObj.var_114.getTileProperty(this.rightX, this.standupmidY, "ceilingslope") > 0)
        {
          _loc2_ = true;
        }
        else if (gameObj.var_114.getTileProperty(this.leftX, this.upY, "ceilingslope") > 0 || gameObj.var_114.getTileProperty(this.rightX, this.upY, "ceilingslope") > 0)
        {
          _loc2_ = true;
        }
      }
      return _loc2_;
    }

    override public function usingGun():Boolean
    {
      if (this.hasWeaponType == "longgun" || this.hasWeaponType == "pistol" || this.hasWeaponType == "gatling" || this.hasWeaponType == "bazooka")
      {
        return true;
      }
      return false;
    }

    override public function usingPowerTool():Boolean
    {
      if (this.hasWeaponType == "powertool")
      {
        return true;
      }
      return false;
    }

    public function hasProjectile():Boolean
    {
      if (this.hasWeaponType == "longgun" || this.hasWeaponType == "pistol" || this.hasWeaponType == "bazooka" || this.hasWeaponType == "toss")
      {
        return true;
      }
      return false;
    }

    override public function startupPlayer(param1:Number, param2:Number, param3:Boolean = false, param4:Boolean = false):void
    {
      super.startupPlayer(param1, param2, param3, param4);
      if (this.hasProjectile())
      {
        this.gameObj.var_116.addToPreblit(this.playerData.bulletName);
      }
      if (this.playerData.customerName == "Foodini")
      {
        this.balloonFXID = this.gameObj.var_104.addEffect(this.x, this.y - 32, "FoodiniBalloonEffect");
        this.foodiniGlideBalloonIDs = [];
      }
    }

    public function shootWeapon(param1:String, param2:Boolean = false, param3:String = null, param4:Number = 2, param5:Number = 0.5):void
    {
      var _loc6_:CustomerChar = this;
      var _loc7_:BulletManager = _loc6_.gameObj.var_116;
      var _loc8_:EffectManager = _loc6_.gameObj.var_104;
      var _loc9_:Number = _loc6_.facingDir;
      var _loc11_:Number = 0;
      var _loc12_:Number = 0;
      if (_loc6_.playerData.weaponType == CustomerData.WEAPON_TOSS)
      {
        _loc11_ = _loc6_.shoot_toss_offsetsX[0] * _loc6_.facingDir;
        _loc12_ = Number(_loc6_.shoot_toss_offsetsY[0]);
      }
      else if (_loc6_.playerData.weaponType == CustomerData.WEAPON_BAZOOKA)
      {
        _loc11_ = _loc6_.shoot_bazooka_offsetsX[0] * _loc6_.facingDir;
        _loc12_ = Number(_loc6_.shoot_bazooka_offsetsY[0]);
      }
      else if (_loc6_.playerData.weaponType == CustomerData.WEAPON_LONGGUN || _loc6_.playerData.customerName == "Xandra")
      {
        _loc11_ = _loc6_.shoot_longgun_offsetsX[0] * _loc6_.facingDir;
        _loc12_ = Number(_loc6_.shoot_longgun_offsetsY[0]);
      }
      else if (_loc6_.playerData.weaponType == CustomerData.WEAPON_PISTOL)
      {
        _loc11_ = _loc6_.shoot_pistol_offsetsX[0] * _loc6_.facingDir;
        _loc12_ = Number(_loc6_.shoot_pistol_offsetsY[0]);
      }
      _loc11_ += _loc6_.playerData.toss_offset_extra_x * _loc6_.facingDir;
      _loc12_ += _loc6_.playerData.toss_offset_extra_y;
      var _loc13_:Number = Math.round(_loc6_.x + _loc6_.getTorsoOffsetX() + _loc11_);
      var _loc14_:Number = Math.round(_loc6_.y + _loc6_.getTorsoOffsetY() + _loc12_);
      if (_loc6_.isWalking)
      {
        _loc13_ += _loc6_.baseWalkSpeed * _loc6_.facingDir;
      }
      var _loc15_:Number = _loc13_;
      var _loc16_:Number = _loc14_;
      _loc15_ += 50 * _loc6_.facingDir;
      var _loc17_:Number = _loc13_ - _loc15_;
      var _loc18_:Number = _loc14_ - _loc16_;
      var _loc19_:Number = Math.sqrt(_loc17_ * _loc17_ + _loc18_ * _loc18_);
      var _loc20_:Number = Math.atan2(_loc18_, _loc17_);
      var _loc21_:Number = 1;
      if (_loc15_ < _loc6_.x)
      {
        _loc21_ = -1;
      }
      if (_loc6_.playerData.customerName == "Xandra")
      {
        if (_loc6_.gameObj.var_108.gameplayTimer - _loc6_.lastShotTime > 8)
        {
          _loc7_.addBullet(_loc13_, _loc14_, _loc21_, _loc20_ + 0.2, "XandraStar", "", true, _loc6_.getNormalAttackPower(), false, _loc6_.playerData.weaponClipName);
          _loc7_.addBullet(_loc13_, _loc14_, _loc21_, _loc20_, "XandraStar", "", true, _loc6_.getNormalAttackPower(), false, _loc6_.playerData.weaponClipName);
          _loc7_.addBullet(_loc13_, _loc14_, _loc21_, _loc20_ - 0.2, "XandraStar", "", true, _loc6_.getNormalAttackPower(), false, _loc6_.playerData.weaponClipName);
          _loc6_.lastShotTime = _loc6_.gameObj.var_108.gameplayTimer;
        }
      }
      else
      {
        _loc7_.addBullet(_loc13_, _loc14_, _loc21_, _loc20_, param1, "", true, _loc6_.getNormalAttackPower(), false, _loc6_.playerData.weaponClipName);
        _loc6_.lastShotTime = _loc6_.gameObj.var_108.gameplayTimer;
      }
      if (_loc6_.playerData.weaponType == CustomerData.WEAPON_PISTOL)
      {
        _loc6_.gameObj.var_105.playSound("shoot_romancandle.wav");
      }
      else if (_loc6_.playerData.weaponType == CustomerData.WEAPON_LONGGUN)
      {
        _loc6_.gameObj.var_105.playSound("shoot_squirtgun.wav");
      }
      else if (_loc6_.playerData.weaponType == CustomerData.WEAPON_BAZOOKA)
      {
        _loc6_.gameObj.var_105.playSound("shoot_bazooka.wav");
      }
      ++_loc6_.bulletsFired;
      if (_loc6_.playerData.weaponType == CustomerData.WEAPON_BAZOOKA)
      {
        _loc6_.gameObj.var_119.setCameraJiggle(5, 5);
      }
    }
  }
}
