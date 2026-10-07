package papaGame.managers
{
  import flash.display.MovieClip;
  import flash.events.*;
  import package_2.class_10;
  import package_2.class_7;
  import package_4.class_5;
  import papaGame.data.Challenge;
  import papaGame.data.CustomerData;
  import papaGame.data.DataManager;
  import papaGame.data.UserData;
  import papaGame.models.GameHUD;

  public class ChallengeManager
  {

    public var gameObj:class_5;
    public var challenges:Array = [new Challenge(0, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Prudence!",
            "description": "You earned a Warp Key!"
          }), new Challenge(0, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Taylor!",
            "description": "You earned a Warp Key!"
          }), new Challenge(0, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_POUND,
            "title": "Rescued Clover!",
            "description": "You earned a Warp Key!"
          }), new Challenge(0, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_NONE,
            "showTally": true,
            "title": "Found All Papa Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(0, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 3,
            "skillNeeded": CustomerData.SKILL_NONE,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(0, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(1, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Big Pauly!",
            "description": "You earned a Warp Key!"
          }), new Challenge(1, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_POUND,
            "title": "Rescued Mindy!",
            "description": "You earned a Warp Key!"
          }), new Challenge(1, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "title": "Rescued Akari!",
            "description": "You earned a Warp Key!"
          }), new Challenge(1, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_NONE,
            "showTally": true,
            "title": "Found All Daisies!",
            "description": "You earned a Warp Key!"
          }), new Challenge(1, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 11,
            "skillNeeded": CustomerData.SKILL_POUND,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(1, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_CRAWL,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(2, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Boomer!",
            "description": "You earned a Warp Key!"
          }), new Challenge(2, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "title": "Rescued Kahuna!",
            "description": "You earned a Warp Key!"
          }), new Challenge(2, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_CRAWL,
            "title": "Rescued Professor Fitz!",
            "description": "You earned a Warp Key!"
          }), new Challenge(2, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_POUND,
            "showTally": true,
            "title": "Found All Gold Helmets!",
            "description": "You earned a Warp Key!"
          }), new Challenge(2, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 11,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(2, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_DOUBLEJUMP,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(3, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Georgito!",
            "description": "You earned a Warp Key!"
          }), new Challenge(3, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_CRAWL,
            "title": "Rescued Foodini!",
            "description": "You earned a Warp Key!"
          }), new Challenge(3, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_DOUBLEJUMP,
            "title": "Rescued Yippy!",
            "description": "You earned a Warp Key!"
          }), new Challenge(3, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_POUND,
            "showTally": true,
            "title": "Found All Sarge Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(3, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 6,
            "skillNeeded": CustomerData.SKILL_CRAWL,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(3, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_PUSH,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(4, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Scooter!",
            "description": "You earned a Warp Key!"
          }), new Challenge(4, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_DOUBLEJUMP,
            "title": "Rescued Kingsley!",
            "description": "You earned a Warp Key!"
          }), new Challenge(4, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_PUSH,
            "title": "Rescued Connor!",
            "description": "You earned a Warp Key!"
          }), new Challenge(4, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_POUND,
            "showTally": true,
            "title": "Found All Gummy Worms!",
            "description": "You earned a Warp Key!"
          }), new Challenge(4, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 8,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(4, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_WALLJUMP,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(5, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued James!",
            "description": "You earned a Warp Key!"
          }), new Challenge(5, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_PUSH,
            "title": "Rescued Greg!",
            "description": "You earned a Warp Key!"
          }), new Challenge(5, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_WALLJUMP,
            "title": "Rescued Captain Cori!",
            "description": "You earned a Warp Key!"
          }), new Challenge(5, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "showTally": true,
            "title": "Found All Balloons!",
            "description": "You earned a Warp Key!"
          }), new Challenge(5, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 10,
            "skillNeeded": CustomerData.SKILL_CRAWL,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(5, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_POUND,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(6, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Ninjoy!",
            "description": "You earned a Warp Key!"
          }), new Challenge(6, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_WALLJUMP,
            "title": "Rescued Peggy!",
            "description": "You earned a Warp Key!"
          }), new Challenge(6, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_POUND,
            "title": "Rescued Penny!",
            "description": "You earned a Warp Key!"
          }), new Challenge(6, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "showTally": true,
            "title": "Found All Fizzo Cans!",
            "description": "You earned a Warp Key!"
          }), new Challenge(6, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 13,
            "skillNeeded": CustomerData.SKILL_PUSH,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(6, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_DOUBLEJUMP,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(7, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Sarge Fan!",
            "description": "You earned a Warp Key!"
          }), new Challenge(7, 2, Challenge.RESCUE, {
            "whichCustomer": 2,
            "skillNeeded": CustomerData.SKILL_WALLJUMP,
            "title": "Rescued Rico!",
            "description": "You earned a Warp Key!"
          }), new Challenge(7, 3, Challenge.RESCUE, {
            "whichCustomer": 3,
            "skillNeeded": CustomerData.SKILL_CRAWL,
            "title": "Rescued Zoe!",
            "description": "You earned a Warp Key!"
          }), new Challenge(7, 4, Challenge.SPECIALITEMS, {
            "targetAmount": 5,
            "skillNeeded": CustomerData.SKILL_POUND,
            "showTally": true,
            "title": "Found All Radish Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(7, 5, Challenge.BURGERZILLAS, {
            "targetAmount": 12,
            "skillNeeded": CustomerData.SKILL_DOUBLEJUMP,
            "showTally": true,
            "title": "Defeated All Burgerzillas!",
            "description": "You earned a Warp Key!"
          }), new Challenge(7, 6, Challenge.COINS, {
            "targetAmount": 100,
            "skillNeeded": CustomerData.SKILL_GLIDE,
            "showTally": true,
            "title": "Collected 100 Coins!",
            "description": "You earned a Warp Key!"
          }), new Challenge(8, 1, Challenge.RESCUE, {
            "whichCustomer": 1,
            "skillNeeded": CustomerData.SKILL_NONE,
            "title": "Rescued Papa Louie!",
            "description": "You earned a Warp Key!"
          })];

    public var badges:Array = [new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "warpCoin",
            "targetAmount": 5,
            "showTally": true,
            "title": "Key Collector",
            "description": "Earn 5 Warp Keys",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "warpCoin",
            "targetAmount": 10,
            "showTally": true,
            "title": "Warp Key Roundup",
            "description": "Earn 10 Warp Keys",
            "rewardMoney": 30
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "warpCoin",
            "targetAmount": 25,
            "showTally": true,
            "title": "Halfway There",
            "description": "Earn 25 Warp Keys",
            "rewardMoney": 40
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "warpCoin",
            "targetAmount": 50,
            "showTally": true,
            "title": "Keymaster",
            "description": "Earn 50 Warp Keys",
            "rewardMoney": 50
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "customerUnlocked",
            "targetAmount": 5,
            "showTally": true,
            "title": "Jailbreak",
            "description": "Unlock 5 Customers",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "customerUnlocked",
            "targetAmount": 10,
            "showTally": true,
            "title": "Rescuer",
            "description": "Unlock 10 Customers",
            "rewardMoney": 30
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "customerUnlocked",
            "targetAmount": 20,
            "showTally": true,
            "title": "Uncaged",
            "description": "Unlock 20 Customers",
            "rewardMoney": 40
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "customerUnlocked",
            "targetAmount": 28,
            "showTally": true,
            "title": "Full Roster",
            "description": "Unlock All of the Customers",
            "rewardMoney": 50
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "onion",
            "targetAmount": 150,
            "showTally": true,
            "title": "Onion Ringer",
            "description": "Defeat 150 Onion Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "tomato",
            "targetAmount": 100,
            "showTally": true,
            "title": "Tomato Juicer",
            "description": "Defeat 100 Tomato Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "partysub",
            "targetAmount": 100,
            "requiredLevel": 4,
            "showTally": true,
            "title": "Party Crasher",
            "description": "Defeat 100 Party Subs",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "slider",
            "targetAmount": 50,
            "requiredLevel": 2,
            "showTally": true,
            "title": "Slider Collider",
            "description": "Defeat 50 Burger Sliders",
            "rewardMoney": 15
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "lark",
            "targetAmount": 100,
            "showTally": true,
            "requiredLevel": 2,
            "title": "Lettuce Chopper",
            "description": "Defeat 100 Lark Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "dill",
            "targetAmount": 100,
            "showTally": true,
            "requiredLevel": 4,
            "title": "Pickle Pro",
            "description": "Defeat 100 Dill Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "shroom",
            "targetAmount": 100,
            "showTally": true,
            "requiredLevel": 5,
            "title": "Mushroom Masher",
            "description": "Defeat 100 Shroom Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "burgerzilla",
            "targetAmount": 75,
            "showTally": true,
            "title": "Burger Breaker",
            "description": "Defeat 75 Burgerzillas",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "bacon",
            "targetAmount": 100,
            "showTally": true,
            "requiredLevel": 7,
            "title": "Bacon Basher",
            "description": "Defeat 100 Bacon Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "cheese",
            "targetAmount": 100,
            "showTally": true,
            "requiredLevel": 5,
            "title": "Cheese Champ",
            "description": "Defeat 100 Cheese Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "radish",
            "targetAmount": 100,
            "showTally": true,
            "requiredLevel": 7,
            "title": "Garden Variety",
            "description": "Defeat 100 Radish Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "enemyCategory": "saucer",
            "targetAmount": 30,
            "showTally": true,
            "requiredLevel": 8,
            "title": "Awesomesauce",
            "description": "Defeat 30 Awesome Saucers",
            "rewardMoney": 15
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "sargeFan",
            "targetAmount": 1,
            "requiredCustomers": ["Sarge Fan"],
            "title": "Onionception",
            "description": "Defeat Sarge with Sarge Fan",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "professor",
            "targetAmount": 1,
            "requiredCustomers": ["Professor Fitz"],
            "title": "Mad Scientists",
            "description": "Defeat Radley Madish with Professor Fitz",
            "rewardMoney": 30
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "whichWeapon": "slide",
            "targetAmount": 100,
            "showTally": true,
            "title": "Slip and Slide",
            "description": "Defeat 100 Enemies by sliding down hills",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "whichWeapon": "slideskate",
            "targetAmount": 100,
            "showTally": true,
            "requiredCustomers": ["Scooter"],
            "title": "Pro Skater",
            "description": "Defeat 100 Enemies by sliding on Scooter\'s skateboard",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.CUSTOM, {
            "tagName": Challenge.CUSTOM_TAG_PLAYASCUSTOMERS,
            "targetAmount": 7,
            "showTally": true,
            "title": "Customer Assistance",
            "description": "Complete levels using 7 different customers",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.CUSTOM, {
            "tagName": Challenge.CUSTOM_TAG_PLAYASCUSTOMERS,
            "targetAmount": 14,
            "showTally": true,
            "title": "Helping Hand",
            "description": "Complete levels using 14 different customers",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.CUSTOM, {
            "tagName": Challenge.CUSTOM_TAG_PLAYASCUSTOMERS,
            "targetAmount": 21,
            "showTally": true,
            "title": "Rescue Squad",
            "description": "Complete levels using 21 different customers",
            "rewardMoney": 30
          }), new Challenge(-1, -1, Challenge.CUSTOM, {
            "tagName": Challenge.CUSTOM_TAG_PLAYASCUSTOMERS,
            "targetAmount": 28,
            "showTally": true,
            "title": "Team Effort",
            "description": "Complete levels using all of the customers",
            "rewardMoney": 35
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "buyOutfit",
            "targetAmount": 1,
            "title": "New Threads",
            "description": "Buy a new Outfit Style for a Customer",
            "rewardMoney": 10
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "buyOutfit",
            "targetAmount": 10,
            "showTally": true,
            "title": "Change of Clothes",
            "description": "Buy 10 new Outfit Styles for Customers",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "buyOutfit",
            "targetAmount": 20,
            "showTally": true,
            "title": "Clothes Shopping",
            "description": "Buy 20 new Outfit Styles for Customers",
            "rewardMoney": 30
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "buyOutfit",
            "targetAmount": 30,
            "showTally": true,
            "title": "Expanded Wardrobe",
            "description": "Buy 30 new Outfit Styles for Customers",
            "rewardMoney": 40
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "buyOutfit",
            "targetAmount": 40,
            "showTally": true,
            "title": "Clothing Variety",
            "description": "Buy 40 new Outfit Styles for Customers",
            "rewardMoney": 30
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "buyOutfit",
            "targetAmount": 56,
            "showTally": true,
            "title": "Full Wardrobe",
            "description": "Buy All Outfit Styles for Customers",
            "rewardMoney": 40
          }), new Challenge(-1, -1, Challenge.ENEMYTALLY, {
            "whichWeapon": "groundpound",
            "targetAmount": 50,
            "showTally": true,
            "requiredCustomers": ["Big Pauly", "Kahuna", "Kingsley"],
            "title": "Look Out Below",
            "description": "Defeat 50 Enemies by Ground Pounding",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "breakBlock",
            "targetAmount": 100,
            "showTally": true,
            "requiredCustomers": ["Big Pauly", "Kahuna", "Kingsley"],
            "title": "Demolition",
            "description": "Break 100 Cracker Blocks by Ground Pounding",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "enemyStun",
            "targetAmount": 100,
            "showTally": true,
            "title": "Super Stomper",
            "description": "Stomp and stun 100 Enemies",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "enemyStun",
            "targetAmount": 250,
            "showTally": true,
            "title": "Can\'t Stop Stomping",
            "description": "Stomp and stun 250 Enemies",
            "rewardMoney": 40
          }), new Challenge(-1, -1, Challenge.CUSTOM, {
            "tagName": Challenge.CUSTOM_TAG_TREASURES,
            "targetAmount": 4,
            "showTally": true,
            "title": "Casual Collector",
            "description": "Find all of the Collectible Items in 4 Areas",
            "rewardMoney": 25
          }), new Challenge(-1, -1, Challenge.CUSTOM, {
            "tagName": Challenge.CUSTOM_TAG_TREASURES,
            "targetAmount": 8,
            "showTally": true,
            "title": "Expert Collector",
            "description": "Find all of the Collectible Items in 8 Areas",
            "rewardMoney": 40
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "gregtomato",
            "targetAmount": 60,
            "requiredCustomers": ["Greg"],
            "showTally": true,
            "title": "Tomato Fan",
            "description": "Defeat 60 Tomatoes as Greg",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "georgito",
            "targetAmount": 300,
            "requiredCustomers": ["Georgito"],
            "showTally": true,
            "title": "Moneybags",
            "description": "Collect 300 Coins as Georgito",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "ninjoypepperjack",
            "targetAmount": 30,
            "requiredLevel": 6,
            "requiredCustomers": ["Ninjoy"],
            "showTally": true,
            "title": "Hand-to-Hand Combat",
            "description": "Defeat 30 Pepperjacks as Ninjoy",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "prupickle",
            "targetAmount": 50,
            "requiredLevel": 4,
            "requiredCustomers": ["Prudence"],
            "showTally": true,
            "title": "Namesake",
            "description": "Defeat 50 Pickle Enemies as Prudence",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "martyzilla",
            "targetAmount": 40,
            "showTally": true,
            "title": "When Burgers Attack",
            "description": "Defeat 40 Burgerzillas as Marty",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "ritaslider",
            "targetAmount": 40,
            "showTally": true,
            "requiredLevel": 2,
            "title": "Mini Burgers",
            "description": "Defeat 40 Burger Sliders as Rita",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "xandra",
            "targetAmount": 1,
            "requiredCustomers": ["Xandra"],
            "title": "Back For More",
            "description": "Complete the X-Zone as Xandra",
            "rewardMoney": 20
          }), new Challenge(-1, -1, Challenge.TAGGED, {
            "tagName": "papamack",
            "targetAmount": 30,
            "showTally": true,
            "requiredCustomers": ["Papa Louie"],
            "title": "Mustache Monopoly",
            "description": "Defeat 30 Cheddar Macks as Papa Louie",
            "rewardMoney": 20
          })];

    public var badgeDropdown:MovieClip = null;
    public var badgeQueue:Array = [];
    public var challengeQueue:Array = [];
    public var treasureQueue:Array = [];
    public var dropdownX:Number = 188;
    public var dropdownStartY:Number = 0;
    public var dropdownHeight:Number = 81;
    public var dropdownSpeed:Number = 8;
    public var dropdownOnScreenWait:Number = 150;
    public var dropdownOnScreenTimer:Number = 0;
    public var dropdownCurrentType:String = "";

    public function ChallengeManager(param1:class_5)
    {
      super();
      this.gameObj = param1;
    }

    public function destroy():void
    {
    }

    public function getChallengeTitle(param1:Number, param2:Number, param3:Number = -1):String
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Challenge = null;
      var _loc5_:String = "";
      if (param1 > -1)
      {
        _loc6_ = 0;
        while (_loc6_ < this.challenges.length)
        {
          _loc7_ = this.challenges[_loc6_];
          if (_loc7_.whichWorld == param1 && _loc7_.whichChallenge == param2)
          {
            _loc5_ = _loc7_.title;
            break;
          }
          _loc6_++;
        }
      }
      else if (param3 > -1)
      {
        if (param3 < this.badges.length)
        {
          _loc8_ = this.badges[param3];
          _loc5_ = _loc8_.title;
        }
      }
      return _loc5_;
    }

    public function getChallengeSkillNeeded(param1:Number, param2:Number):String
    {
      var _loc5_:Number = NaN;
      var _loc6_:Challenge = null;
      var _loc4_:String = CustomerData.SKILL_NONE;
      if (param1 > -1)
      {
        _loc5_ = 0;
        while (_loc5_ < this.challenges.length)
        {
          _loc6_ = this.challenges[_loc5_];
          if (_loc6_.whichWorld == param1 && _loc6_.whichChallenge == param2)
          {
            _loc4_ = _loc6_.skillNeeded;
            break;
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function getChallengeType(param1:Number, param2:Number):String
    {
      var _loc5_:Number = NaN;
      var _loc6_:Challenge = null;
      var _loc4_:String = "";
      if (param1 > -1)
      {
        _loc5_ = 0;
        while (_loc5_ < this.challenges.length)
        {
          _loc6_ = this.challenges[_loc5_];
          if (_loc6_.whichWorld == param1 && _loc6_.whichChallenge == param2)
          {
            _loc4_ = _loc6_.challengeType;
            break;
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function getChallengeTargetAmount(param1:Number, param2:Number):String
    {
      var _loc5_:Number = NaN;
      var _loc6_:Challenge = null;
      var _loc4_:String = "";
      if (param1 > -1)
      {
        _loc5_ = 0;
        while (_loc5_ < this.challenges.length)
        {
          _loc6_ = this.challenges[_loc5_];
          if (_loc6_.whichWorld == param1 && _loc6_.whichChallenge == param2)
          {
            _loc4_ = String(_loc6_.targetAmount);
            break;
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function getChallengeDescription(param1:Number, param2:Number, param3:Number = -1):String
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Challenge = null;
      var _loc5_:String = "";
      if (param1 > -1)
      {
        _loc6_ = 0;
        while (_loc6_ < this.challenges.length)
        {
          _loc7_ = this.challenges[_loc6_];
          if (_loc7_.whichWorld == param1 && _loc7_.whichChallenge == param2)
          {
            _loc5_ = _loc7_.description;
            break;
          }
          _loc6_++;
        }
      }
      else if (param3 > -1)
      {
        if (param3 < this.badges.length)
        {
          _loc8_ = this.badges[param3];
          _loc5_ = _loc8_.description;
        }
      }
      return _loc5_;
    }

    public function getChallengeRewardAmount(param1:Number, param2:Number, param3:Number = -1):Number
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Challenge = null;
      var _loc5_:Number = 0;
      if (param1 > -1)
      {
        _loc6_ = 0;
        while (_loc6_ < this.challenges.length)
        {
          _loc7_ = this.challenges[_loc6_];
          if (_loc7_.whichWorld == param1 && _loc7_.whichChallenge == param2)
          {
            _loc5_ = _loc7_.rewardMoney;
            break;
          }
          _loc6_++;
        }
      }
      else if (param3 > -1)
      {
        if (param3 < this.badges.length)
        {
          _loc8_ = this.badges[param3];
          _loc5_ = _loc8_.rewardMoney;
        }
      }
      return _loc5_;
    }

    public function getChallengeTallyString(param1:Number, param2:Number):String
    {
      var _loc5_:Number = NaN;
      var _loc6_:Challenge = null;
      var _loc4_:String = "";
      if (param1 > -1)
      {
        _loc5_ = 0;
        while (_loc5_ < this.challenges.length)
        {
          _loc6_ = this.challenges[_loc5_];
          if (_loc6_.whichWorld == param1 && _loc6_.whichChallenge == param2)
          {
            if (_loc6_.showTally)
            {
              if (_loc6_.tally < _loc6_.targetAmount)
              {
                _loc4_ = "(" + _loc6_.tally + "/" + _loc6_.targetAmount + ")";
              }
            }
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function getBadgeTallyString(param1:Number):String
    {
      var _loc4_:Challenge = null;
      var _loc3_:String = "";
      if (param1 < this.badges.length)
      {
        _loc4_ = this.badges[param1];
        if (_loc4_.showTally)
        {
          if (_loc4_.tally < _loc4_.targetAmount)
          {
            _loc3_ = "(" + _loc4_.tally + "/" + _loc4_.targetAmount + ")";
          }
        }
      }
      return _loc3_;
    }

    public function getBadgeTally(param1:Number):Number
    {
      var _loc4_:Challenge = null;
      var _loc3_:Number = 0;
      if (param1 < this.badges.length)
      {
        _loc4_ = this.badges[param1];
        _loc3_ = _loc4_.tally;
      }
      return _loc3_;
    }

    public function getNumberOfBadges():Number
    {
      return this.badges.length;
    }

    public function shouldLockBadge(param1:Number):Boolean
    {
      var _loc4_:Challenge = null;
      var _loc5_:int = 0;
      var _loc3_:Boolean = false;
      if (param1 < this.badges.length)
      {
        _loc4_ = this.badges[param1];
        if (_loc4_.requiredCustomerUnlocks != null && _loc4_.requiredCustomerUnlocks.length > 0)
        {
          _loc3_ = true;
          _loc5_ = 0;
          while (_loc5_ < _loc4_.requiredCustomerUnlocks.length)
          {
            if (this.gameObj.var_106.hasCustomerUnlocked(this.gameObj.var_113.getCustomerIndex(_loc4_.requiredCustomerUnlocks[_loc5_])) == true)
            {
              _loc3_ = false;
              break;
            }
            _loc5_++;
          }
        }
        if (_loc4_.requiredLevelUnlock > 0)
        {
          if (this.gameObj.var_106.areasUnlocked[_loc4_.requiredLevelUnlock - 1] == 0)
          {
            _loc3_ = true;
          }
        }
      }
      return _loc3_;
    }

    public function recordTag(param1:String):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.TAGGED && _loc7_.tagName == param1)
          {
            _loc8_ = _loc7_.addToTally();
            if (!_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge) && _loc7_.showTally)
            {
              _loc5_.showTally(_loc7_.tally, _loc7_.targetAmount);
            }
            if (_loc8_ && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
              _loc4_.saveProgress("challenge");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.TAGGED && _loc9_.tagName == param1)
        {
          _loc10_ = _loc9_.addToTally();
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function unrecordTag(param1:String):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.TAGGED && _loc7_.tagName == param1 && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
          {
            _loc7_.removeFromTally();
            if (!_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge) && _loc7_.showTally)
            {
              _loc5_.showTally(_loc7_.tally, _loc7_.targetAmount);
            }
          }
        }
        _loc6_++;
      }
    }

    public function recordCustomerCage(param1:Number):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.RESCUE && _loc7_.whichCustomer == param1)
          {
            if (!_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
            }
          }
        }
        _loc6_++;
      }
    }

    public function recordBurgerzilla(param1:Number = 1):void
    {
      // TODO Burgerzilla check?
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      class_7.method_1("Record Burgerzilla! " + param1);
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.BURGERZILLAS)
          {
            _loc8_ = _loc7_.addToTally();
            class_7.method_1("Got Challenge. Current Tally = " + _loc7_.tally + "/" + _loc7_.targetAmount + ".  Completed?: " + _loc8_);
            if (_loc8_ && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.BURGERZILLAS)
        {
          _loc10_ = _loc9_.addToTally();
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordCoin(param1:Number = 1):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.COINS)
          {
            _loc8_ = _loc7_.addToTally();
            if ((_loc8_) && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.COINS)
        {
          _loc10_ = _loc9_.addToTally();
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordSpecialItem(param1:Number = 1):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.SPECIALITEMS)
          {
            _loc8_ = _loc7_.addToTally();
            if ((_loc8_) && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.SPECIALITEMS)
        {
          _loc10_ = _loc9_.addToTally();
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordMultiExplosion(param1:Number):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.MULTIEXPLOSION && _loc7_.targetAmount <= param1)
          {
            _loc8_ = _loc7_.setTally(param1);
            if ((_loc8_) && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
              _loc4_.saveProgress("challenge");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.MULTIEXPLOSION && _loc9_.targetAmount <= param1)
        {
          _loc10_ = _loc9_.setTally(param1);
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordMultiRocket(param1:Number):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.MULTIROCKET && _loc7_.targetAmount <= param1)
          {
            _loc8_ = _loc7_.setTally(param1);
            if ((_loc8_) && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
              _loc4_.saveProgress("challenge");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.MULTIROCKET && _loc9_.targetAmount <= param1)
        {
          _loc10_ = _loc9_.setTally(param1);
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordMultiJuggle(param1:Number):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.MULTIJUGGLE && _loc7_.targetAmount <= param1)
          {
            _loc8_ = _loc7_.setTally(param1);
            if ((_loc8_) && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
              _loc4_.saveProgress("challenge");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.MULTIJUGGLE && _loc9_.targetAmount <= param1)
        {
          _loc10_ = _loc9_.setTally(param1);
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordCombo(param1:Number):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.COMBO && _loc7_.targetAmount <= param1)
          {
            _loc8_ = _loc7_.setTally(param1);
            if ((_loc8_) && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
              _loc4_.saveProgress("challenge");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.COMBO && _loc9_.targetAmount <= param1)
        {
          _loc10_ = _loc9_.setTally(param1);
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordCompletionTime(param1:Number):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Challenge = null;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc7_ = this.challenges[_loc6_];
        if (_loc7_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc7_.challengeType == Challenge.TIMETRIAL && param1 <= _loc7_.targetAmount)
          {
            if (!_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc7_.whichChallenge);
              this.checkCustomChallenges("challenges");
              _loc4_.saveProgress("challenge");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc8_ = this.badges[_loc6_];
        if (_loc8_.challengeType == Challenge.TIMETRIAL && param1 <= _loc8_.targetAmount)
        {
          if (!_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc8_.title);
            if (_loc8_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc8_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function recordEnemyKill(param1:Number, param2:String, param3:String):void
    {
      var _loc8_:Number = NaN;
      var _loc10_:Challenge = null;
      var _loc11_:Challenge = null;
      var _loc12_:Boolean = false;
      var _loc5_:DataManager = this.gameObj.var_109;
      var _loc6_:UserData = this.gameObj.var_106;
      var _loc7_:GameHUD = this.gameObj.var_115;
      var _loc9_:Boolean = false;
      _loc8_ = 0;
      while (_loc8_ < this.challenges.length)
      {
        _loc10_ = this.challenges[_loc8_];
        if (_loc10_.whichWorld == _loc5_.currentLevel)
        {
          if (_loc10_.challengeType == Challenge.ENEMYTALLY)
          {
            if (_loc10_.meetsEnemyRequirements(param1, param2, param3))
            {
              _loc9_ = _loc10_.addToTally(1);
              if (!_loc6_.hasCompletedChallenge(_loc10_.whichWorld, _loc10_.whichChallenge) && _loc10_.showTally)
              {
                _loc7_.showTally(_loc10_.tally, _loc10_.targetAmount);
              }
              if (_loc9_ && !_loc6_.hasCompletedChallenge(_loc10_.whichWorld, _loc10_.whichChallenge))
              {
                _loc6_.completeChallenge(_loc10_.whichWorld, _loc10_.whichChallenge);
                if (_loc7_)
                {
                  _loc7_.updateDisplay();
                }
                this.showCompletingChallenge(_loc10_.whichChallenge);
                this.checkCustomChallenges("challenges");
                _loc6_.saveProgress("challenge");
              }
            }
          }
        }
        _loc8_++;
      }
      _loc8_ = 0;
      while (_loc8_ < this.badges.length)
      {
        _loc11_ = this.badges[_loc8_];
        if (_loc11_.challengeType == Challenge.ENEMYTALLY)
        {
          if (_loc11_.meetsEnemyRequirements(param1, param2, param3))
          {
            _loc12_ = _loc11_.addToTally(1);
            if ((_loc12_) && !_loc6_.hasBadge(_loc8_))
            {
              _loc6_.earnBadge(_loc8_, _loc11_.title);
              if (_loc11_.rewardMoney > 0)
              {
                _loc6_.totalMoney.addValue(_loc11_.rewardMoney);
              }
              _loc6_.saveProgress("badge");
              if (_loc7_)
              {
                _loc7_.updateDisplay();
              }
              this.showEarningBadge(_loc8_);
            }
          }
        }
        _loc8_++;
      }
    }

    public function fixBadges():void
    {
      var _loc2_:UserData = this.gameObj.var_106;
    }

    public function recordMastery(param1:String):void
    {
      var _loc6_:Number = NaN;
      var _loc8_:Challenge = null;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      var _loc7_:Boolean = false;
      _loc6_ = 0;
      while (_loc6_ < this.challenges.length)
      {
        _loc8_ = this.challenges[_loc6_];
        if (_loc8_.whichWorld == _loc3_.currentLevel)
        {
          if (_loc8_.challengeType == Challenge.MASTERY && _loc8_.meetsMasteryRequirements(this.gameObj.var_111.getWeaponType(param1)))
          {
            _loc7_ = _loc8_.addToTally(1);
            if (!_loc4_.hasCompletedChallenge(_loc8_.whichWorld, _loc8_.whichChallenge) && _loc8_.showTally)
            {
              _loc5_.showTally(_loc8_.tally, _loc8_.targetAmount);
            }
            if (_loc7_ && !_loc4_.hasCompletedChallenge(_loc8_.whichWorld, _loc8_.whichChallenge))
            {
              _loc4_.completeChallenge(_loc8_.whichWorld, _loc8_.whichChallenge);
              if (_loc5_)
              {
                _loc5_.updateDisplay();
              }
              this.showCompletingChallenge(_loc8_.whichChallenge);
              this.checkCustomChallenges("challenges");
              _loc4_.saveProgress("challenge");
            }
          }
        }
        _loc6_++;
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.MASTERY && _loc9_.meetsMasteryRequirements(this.gameObj.var_111.getWeaponType(param1)))
        {
          _loc10_ = _loc9_.addToTally(1);
          if ((_loc10_) && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            _loc4_.saveProgress("badge");
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
          }
        }
        _loc6_++;
      }
    }

    public function checkCustomChallenges(param1:String = "all"):void
    {
      var _loc6_:Number = NaN;
      var _loc7_:Challenge = null;
      var _loc8_:Boolean = false;
      var _loc9_:Challenge = null;
      var _loc10_:Boolean = false;
      var _loc11_:Number = NaN;
      var _loc12_:int = 0;
      var _loc13_:Number = NaN;
      var _loc14_:int = 0;
      var _loc3_:DataManager = this.gameObj.var_109;
      var _loc4_:UserData = this.gameObj.var_106;
      var _loc5_:GameHUD = this.gameObj.var_115;
      // TODO custom challenges
      if (param1 == "all")
      {
        _loc6_ = 0;
        while (_loc6_ < this.challenges.length)
        {
          _loc7_ = this.challenges[_loc6_];
          if (_loc7_.whichWorld == _loc3_.currentLevel)
          {
            if (_loc7_.challengeType == Challenge.CUSTOM)
            {
              _loc8_ = false;
              if (_loc7_.tagName == Challenge.CUSTOM_TAG_GOTHIT)
              {
                if (_loc4_.gotHurt == false)
                {
                  _loc8_ = true;
                }
              }
              else if (_loc7_.tagName == Challenge.CUSTOM_TAG_ENDNOWATER)
              {
                if (_loc4_.fellInWater == false)
                {
                  _loc8_ = true;
                }
              }
              else if (_loc7_.tagName == Challenge.CUSTOM_TAG_ALLNODYING)
              {
                if (_loc4_.killsTally >= _loc7_.targetAmount && _loc4_.livesLost.value == 0)
                {
                  _loc8_ = true;
                }
              }
              else if (_loc7_.tagName == Challenge.CUSTOM_TAG_ENDNODYING)
              {
                if (_loc4_.livesLost.value == 0)
                {
                  _loc8_ = true;
                }
              }
              else if (_loc7_.tagName == Challenge.CUSTOM_TAG_NOKILLS)
              {
                if (_loc4_.killsTally <= _loc7_.targetAmount)
                {
                  _loc8_ = true;
                }
              }
              if (_loc8_ && !_loc4_.hasCompletedChallenge(_loc7_.whichWorld, _loc7_.whichChallenge))
              {
                _loc4_.completeChallenge(_loc7_.whichWorld, _loc7_.whichChallenge);
                if (_loc5_)
                {
                  _loc5_.updateDisplay();
                }
                this.showCompletingChallenge(_loc7_.whichChallenge);
                this.checkCustomChallenges("challenges");
                _loc4_.saveProgress("challenge");
              }
            }
          }
          _loc6_++;
        }
      }
      _loc6_ = 0;
      while (_loc6_ < this.badges.length)
      {
        _loc9_ = this.badges[_loc6_];
        if (_loc9_.challengeType == Challenge.CUSTOM)
        {
          _loc10_ = false;
          if (_loc9_.tagName == Challenge.CUSTOM_TAG_CHALLENGES && param1 == "challenges")
          {
            if (_loc4_.getTotalChallengesCompleted() >= _loc9_.targetAmount)
            {
              _loc10_ = true;
            }
          }
          else if (_loc9_.tagName == Challenge.CUSTOM_TAG_TREASURES && param1 == "challenges")
          {
            _loc11_ = 0;
            _loc12_ = 0;
            while (_loc12_ < 8)
            {
              if (_loc4_.hasCompletedChallenge(_loc12_, 4))
              {
                _loc11_++;
              }
              _loc12_++;
            }
            _loc10_ = _loc9_.setTally(_loc11_);
          }
          else if (_loc9_.tagName == Challenge.CUSTOM_TAG_PLAYASCUSTOMERS && param1 == "all")
          {
            _loc13_ = 0;
            _loc14_ = 0;
            while (_loc14_ < _loc4_.customersUsed.length)
            {
              if (_loc4_.customersUsed[_loc14_] == 1)
              {
                _loc13_++;
              }
              _loc14_++;
            }
            _loc10_ = _loc9_.setTally(_loc13_);
          }
          if (_loc10_ && !_loc4_.hasBadge(_loc6_))
          {
            _loc4_.earnBadge(_loc6_, _loc9_.title);
            if (_loc9_.rewardMoney > 0)
            {
              _loc4_.totalMoney.addValue(_loc9_.rewardMoney);
            }
            if (_loc5_)
            {
              _loc5_.updateDisplay();
            }
            this.showEarningBadge(_loc6_);
            _loc4_.saveProgress("badge");
          }
        }
        _loc6_++;
      }
    }

    public function getMedalProgressArray():Array
    {
      var _loc4_:Challenge = null;
      var _loc2_:Array = [];
      var _loc3_:int = 0;
      while (_loc3_ < this.badges.length)
      {
        _loc4_ = this.badges[_loc3_];
        _loc2_[_loc3_] = _loc4_.tally;
        _loc3_++;
      }
      return _loc2_;
    }

    public function populateMedalProgress(param1:Array):void
    {
      var _loc4_:Number = NaN;
      var _loc5_:Challenge = null;
      var _loc3_:int = 0;
      while (_loc3_ < param1.length)
      {
        _loc4_ = 0;
        if (param1[_loc3_])
        {
          _loc4_ = Number(param1[_loc3_]);
        }
        if (this.badges.length > _loc3_)
        {
          _loc5_ = this.badges[_loc3_];
          _loc5_.setTally(_loc4_);
        }
        _loc3_++;
      }
    }

    public function getChallengeTallyForCheckpoint(param1:Number, param2:Number):Number
    {
      var _loc5_:int = 0;
      var _loc6_:Challenge = null;
      var _loc4_:Number = -1;
      if (param1 > -1)
      {
        _loc5_ = 0;
        while (_loc5_ < this.challenges.length)
        {
          _loc6_ = this.challenges[_loc5_];
          if (_loc6_.whichWorld == param1 && _loc6_.whichChallenge == param2)
          {
            if (_loc6_.challengeType == Challenge.BURGERZILLAS || _loc6_.challengeType == Challenge.COINS || _loc6_.challengeType == Challenge.SPECIALITEMS || _loc6_.challengeType == Challenge.TAGGED || _loc6_.challengeType == Challenge.MULTIJUGGLE || _loc6_.challengeType == Challenge.MULTIEXPLOSION || _loc6_.challengeType == Challenge.MULTIROCKET || _loc6_.challengeType == Challenge.COMBO || _loc6_.challengeType == Challenge.ENEMYTALLY)
            {
              _loc4_ = _loc6_.tally;
            }
          }
          _loc5_++;
        }
      }
      return _loc4_;
    }

    public function setChallengeTallyFromCheckpoint(param1:Number, param2:Number, param3:Number):void
    {
      var _loc5_:int = 0;
      var _loc6_:Challenge = null;
      if (param1 > -1)
      {
        _loc5_ = 0;
        while (_loc5_ < this.challenges.length)
        {
          _loc6_ = this.challenges[_loc5_];
          if (_loc6_.whichWorld == param1 && _loc6_.whichChallenge == param2)
          {
            if (param3 != -1)
            {
              _loc6_.setTally(param3);
            }
          }
          _loc5_++;
        }
      }
    }

    public function resetCurrentChallenges():void
    {
      var _loc4_:Challenge = null;
      var _loc2_:Number = this.gameObj.var_109.currentLevel;
      var _loc3_:int = 0;
      while (_loc3_ < this.challenges.length)
      {
        _loc4_ = this.challenges[_loc3_];
        if (_loc4_.whichWorld == _loc2_)
        {
          _loc4_.clearTally();
        }
        _loc3_++;
      }
    }

    public function resetAllTallies():void
    {
      var _loc2_:Number = NaN;
      var _loc3_:Challenge = null;
      var _loc4_:Challenge = null;
      _loc2_ = 0;
      while (_loc2_ < this.badges.length)
      {
        _loc3_ = this.badges[_loc2_];
        _loc3_.clearTally(true);
        _loc2_++;
      }
      _loc2_ = 0;
      while (_loc2_ < this.challenges.length)
      {
        _loc4_ = this.challenges[_loc2_];
        _loc4_.clearTally(true);
        _loc2_++;
      }
    }

    public function showEarningBadge(param1:Number):void
    {
      class_7.method_1("EARN BADGE #" + param1 + ". ADD TO QUEUE!");
      this.badgeQueue.push(param1);
      this.checkForDisplayingDropdown();
    }

    public function showCompletingChallenge(param1:Number):void
    {
      // TODO on earn achievemtn?
      class_7.method_1("COMPLETE CHALLENGE #" + param1 + ". ADD TO QUEUE!");
      this.challengeQueue.push(param1);
      this.checkForDisplayingDropdown();
    }

    public function showEarningTreasure(param1:Number):void
    {
      class_7.method_1("FOUND TREASURE #" + param1 + ". ADD TO QUEUE!");
      this.treasureQueue.push(param1);
      this.checkForDisplayingDropdown();
    }

    public function checkForDisplayingDropdown():void
    {
      var _loc4_:Number = NaN;
      var _loc2_:String = "none";
      var _loc3_:Number = -1;
      if (this.badgeDropdown == null)
      {
        if (this.treasureQueue.length > 0)
        {
          _loc2_ = "treasure";
          _loc3_ = Number(this.treasureQueue[0]);
        }
        else if (this.challengeQueue.length > 0)
        {
          _loc2_ = "challenge";
          _loc3_ = Number(this.challengeQueue[0]);
        }
        else if (this.badgeQueue.length > 0)
        {
          _loc2_ = "badge";
          _loc3_ = Number(this.badgeQueue[0]);
        }
      }
      if (_loc2_ != "none" && _loc3_ != -1)
      {
        _loc4_ = _loc3_;
        this.dropdownCurrentType = _loc2_;
        this.badgeDropdown = new badgeDropdownMC();
        this.badgeDropdown.buttonMode = true;
        this.badgeDropdown.mouseEnabled = true;
        this.badgeDropdown.mouseChildren = false;
        this.badgeDropdown.tabEnabled = false;
        this.badgeDropdown.x = this.dropdownX;
        if (_loc2_ == "badge")
        {
          this.badgeDropdown.challenge.visible = false;
          this.badgeDropdown.badge.visible = true;
          this.badgeDropdown.badge.panel.title_txt.text = this.getChallengeTitle(-1, -1, _loc4_);
          this.badgeDropdown.badge.panel.description_txt.text = this.getChallengeDescription(-1, -1, _loc4_);
          this.badgeDropdown.badge.panel.reward_txt.text = "+ $" + class_10.method_84(this.getChallengeRewardAmount(-1, -1, _loc4_));
          this.badgeDropdown.badge.panel.points_txt.text = this.getChallengeRewardAmount(-1, -1, _loc4_) + " Pts.";
          this.badgeDropdown.badge.panel.thumb.gotoAndStop(_loc4_ + 1);
          this.gameObj.var_105.playSound("getstar.wav");
        }
        else if (_loc2_ == "challenge")
        {
          this.badgeDropdown.challenge.visible = true;
          this.badgeDropdown.badge.visible = false;
          this.badgeDropdown.challenge.title_txt.text = this.getChallengeTitle(this.gameObj.var_109.currentLevel, _loc4_);
          this.badgeDropdown.challenge.number_txt.text = String(_loc4_);
          this.gameObj.var_105.playSound("getstar.wav");
        }
        this.dropdownOnScreenTimer = 0;
        this.dropdownStartY = 0 - this.dropdownHeight;
        if (this.gameObj.var_107.api.var_118.length == 0)
        {
          this.badgeDropdown.y = this.dropdownStartY;
          this.gameObj.addChild(this.badgeDropdown);
        }
        else
        {
          this.badgeDropdown.y = this.dropdownStartY;
          this.gameObj.addChild(this.badgeDropdown);
        }
        this.badgeDropdown.addEventListener(Event.ENTER_FRAME, this.animateBadgeDropdown);
        this.badgeDropdown.addEventListener(MouseEvent.CLICK, this.clickBadgeDropdown);
      }
    }

    public function clickBadgeDropdown(param1:MouseEvent):void
    {
      this.dropdownOnScreenTimer = this.dropdownOnScreenWait - 1;
    }

    public function animateBadgeDropdown(param1:Event):void
    {
      var _loc3_:Number = NaN;
      var _loc2_:ChallengeManager = this;
      if (_loc2_.badgeDropdown != null)
      {
        if (_loc2_.dropdownOnScreenTimer == 0)
        {
          if (_loc2_.badgeDropdown.y < _loc2_.dropdownStartY + _loc2_.dropdownHeight)
          {
            _loc3_ = _loc2_.dropdownStartY + _loc2_.dropdownHeight - _loc2_.badgeDropdown.y;
            _loc2_.badgeDropdown.y += _loc3_ / _loc2_.dropdownSpeed;
            if (_loc3_ >= -1 && _loc3_ <= 1)
            {
              _loc2_.badgeDropdown.y = _loc2_.dropdownStartY + _loc2_.dropdownHeight;
              ++_loc2_.dropdownOnScreenTimer;
            }
          }
        }
        else if (_loc2_.dropdownOnScreenTimer == _loc2_.dropdownOnScreenWait)
        {
          if (_loc2_.badgeDropdown.y > _loc2_.dropdownStartY)
          {
            _loc3_ = _loc2_.dropdownStartY - _loc2_.badgeDropdown.y;
            _loc2_.badgeDropdown.y += _loc3_ / _loc2_.dropdownSpeed;
            if (_loc3_ >= -1 && _loc3_ <= 1)
            {
              _loc2_.badgeDropdown.removeEventListener(Event.ENTER_FRAME, _loc2_.animateBadgeDropdown);
              _loc2_.badgeDropdown.removeEventListener(MouseEvent.CLICK, _loc2_.clickBadgeDropdown);
              _loc2_.badgeDropdown.parent.removeChild(_loc2_.badgeDropdown);
              _loc2_.badgeDropdown = null;
              if (_loc2_.dropdownCurrentType == "treasure")
              {
                _loc2_.treasureQueue.shift();
              }
              else if (_loc2_.dropdownCurrentType == "challenge")
              {
                _loc2_.challengeQueue.shift();
              }
              else if (_loc2_.dropdownCurrentType == "badge")
              {
                _loc2_.badgeQueue.shift();
              }
              _loc2_.checkForDisplayingDropdown();
            }
          }
        }
        else
        {
          ++_loc2_.dropdownOnScreenTimer;
        }
      }
    }
  }
}
