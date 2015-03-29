package {
	import citrus.input.controllers.displaylist.VirtualJoystick;
	import citrus.utils.Mobile;
	import citrus.objects.platformer.box2d.Enemy;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import citrus.core.starling.StarlingState;

	/**
	 * @author dusti_000
	 */
	public class StarlingDemoGameState extends StarlingState {
		public function StarlingDemoGameState() {
			super();
		}

		override public function initialize() : void {
			super.initialize();
			if (Mobile.isIOS() || Mobile.isAndroid()){
				var vj:VirtualJoystick = new VirtualJoystick("joy");
			}
			var box2D : Box2D = new Box2D("box2D");
			box2D.visible = true;
			add(box2D);

			add(new Platform("bottom", {x:stage.stageWidth / 2, y:stage.stageHeight, width:stage.stageWidth}));
//			add(new Platform("cloud", {x:250, y:250, width:170, oneWay:true}));

	//		var coin : Coin = new Coin("coin", {x:360, y:200});
		//	add(coin);

			//var mainCharacter:MainCharacter = new MainCharacter("Bob",{x:100, y:350, width:60, height:135});
			var mainCharacter:MainCharacter = new MainCharacter("Bob",{x:100, y:350, width:60, height:135, updateCallEnabled:true});
			
			add(mainCharacter);

//			var enemy : Enemy = new Enemy("enemy", {x:stage.stageWidth - 50, y:350, width:46, height:68, leftBound:20, rightBound:stage.stageWidth - 20});
	//		add(enemy);

		}
	}
}
