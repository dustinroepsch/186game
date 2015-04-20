package {
	import citrus.core.starling.StarlingState;
	import citrus.input.controllers.displaylist.VirtualJoystick;
	import citrus.math.MathVector;
	import citrus.objects.CitrusSprite;
	import citrus.physics.box2d.Box2D;
	import citrus.physics.simple.SimpleCitrusSolver;
	import citrus.utils.Mobile;

	import flash.display.Bitmap;

	/**
	 * @author dusti_000
	 */
	public class StarlingDemoGameState extends StarlingState {
			
				
		public function StarlingDemoGameState() {
			super();
		}
		[Embed(source="Level.png")]
		private var Level:Class;
		var level:Bitmap = new Level();
		
		
		override public function initialize() : void {
			super.initialize();
			if (Mobile.isIOS() || Mobile.isAndroid()){
				var vj:VirtualJoystick = new VirtualJoystick("joy");
			}
			var box2D : Box2D = new Box2D("box2D");
			box2D.visible = true;
			add(box2D);

			var solver: SimpleCitrusSolver = new SimpleCitrusSolver("solver", MainCharacter);
			add(solver);
			solver.overlap(MainCharacter, Obstacle);
			solver.collide(MainCharacter, Water);
			solver.overlap(MainCharacter, Log);
			solver.overlap(MainCharacter, Background);

			//y:384
			//x: 224
			
			var background: Background = new Background("ISU",{x:0, y:0, width:224, height:384, updateCallEnabled:true, view:level});
			add(background);	
			
			var lake: Water = new Water("Lake Laverne",{x:0, y:50, width:224, height:50, updateCallEnabled:true});
			add(lake);		
			
			var log1:Log = new Log(Log.LOG_LEFT, "Loggy",{x:200, y:150, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true});
			add(log1);
			
			var log2:Log = new Log(Log.LOG_RIGHT, "Logger",{x:10, y:200, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true});
			add(log2);
			
			var log3:Log = new Log(Log.LOG_LEFT, "Logathan",{x:155, y:250, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true});
			add(log3);
			
			var swan1:Swan = new Swan(Log.LOG_RIGHT, "Lancelot",{x:160, y:200, width:32, height:32, updateCallEnabled:true});
			add(swan1);
			
			var alligator1: Alligator = new Alligator(Log.LOG_LEFT, "Franklin",{x:155, y:250, width:Log.LOG_WIDTH, height:Log.LOG_HEIGHT, updateCallEnabled:true});
			add(alligator1);
			
			var mainCharacter:MainCharacter = new MainCharacter("Bob",{x:200, y:350, width:MainCharacter.MAIN_WIDTH, height:MainCharacter.MAIN_HEIGHT,
				 updateCallEnabled:true});
			add(mainCharacter);
			
			var obstacle:Obstacle = new Obstacle(Obstacle.OBSTACLE_RIGHT, "Car", {x: 100, y: 280, width: 60, height: 45, updateCallEnabled:true});
			add(obstacle);
			
			mainCharacter.onCollide.add(_collisionStart);
		}
		
		private function _collisionStart(self:CitrusSprite, other:CitrusSprite, normal:MathVector, impact:Number):void {
			var obj: MainCharacter = MainCharacter(self);
			
			if ((other is Water) || (other is Obstacle)){ //Obstacle or water
				obj.restart();
				trace("dead squirrel :(");
			}
			else if (other is Log){ //Log, Swan, or Alligator
				MainCharacter.colliding = true;
				if (other is Alligator){ //Alligator
					var obj2: Alligator = Alligator(other);
					if (obj2.isEnemy == true){ //kill if enemy
						obj.restart();
						trace("died via enemy alligator");
					}
					else{ //ride alligator if friendly
						obj.changeVelocity(obj2.getSpeed());
						trace("riding friendly alligator");
					}
				}
				
				else if (other is Swan){ //Swan
					var obj3: Swan = Swan(other);
					if (obj3.underwater == true){ //kill if Swan is underwater
						obj.restart();
						trace("died via underwater Swan");
					}
					else{ //ride floating swan
						obj.changeVelocity(obj3.getSpeed());
						trace("riding floating swan");
					}
				}
				else{ //just a log
					var obj4: Log = Log(other);
					obj.changeVelocity(obj4.getSpeed());
					trace("just riding a log:)");
				}
			}
			else if (other is Background){ //Background
				MainCharacter.colliding = false;
				trace("just chillin");
			}
		}
		
	}
}
