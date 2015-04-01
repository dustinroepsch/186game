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
		
		var LEFT: Number = 0;
		var RIGHT: Number = 1;
		
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


			var mainCharacter:MainCharacter = new MainCharacter("Bob",{x:200, y:450, width:60, height:135, updateCallEnabled:true});
			add(mainCharacter);
			
			var log1:Log = new Log(LEFT, "Left Loggy",{x:200, y:150, width:135, height:30, updateCallEnabled:true});
			add(log1);
			
			var log2:Log = new Log(RIGHT, "Right Loggy",{x:10, y:200, width:135, height:30, updateCallEnabled:true});
			add(log2);
			
			var log3:Log = new Log(LEFT, "Left Loggy2",{x:155, y:250, width:135, height:30, updateCallEnabled:true});
			add(log3);

//			var enemy : Enemy = new Enemy("enemy", {x:stage.stageWidth - 50, y:350, width:46, height:68, leftBound:20, rightBound:stage.stageWidth - 20});
	//		add(enemy);

		}
	}
}
