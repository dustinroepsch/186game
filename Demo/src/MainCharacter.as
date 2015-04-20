package{
	import citrus.objects.CitrusSprite;
	public class MainCharacter extends CitrusSprite{
		public var inputChannel:uint = 0;
		private var movingRight:Boolean;
		private var movingLeft:Boolean;
		private var movingUp:Boolean;
		private var movingDown:Boolean;
		private var accelerationX:Number = 300;
		private var accelerationY:Number = 300;
		
		public static const MAIN_WIDTH = 32;
		public static const MAIN_HEIGHT = 32;
		public static var colliding:Boolean;
		
		public function MainCharacter(name:String, params:Object = null){
			super(name,params);
			
			colliding = false;
			movingRight = false;
			movingLeft = false;
			movingUp =false;
			movingDown = false;
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			
			if (_ce.input.isDoing("right",inputChannel)){
				if (movingRight == false){
					movingRight = true;
					
					_velocity.x = 900;
				}
			}
			if (_ce.input.isDoing("left",inputChannel)){
				if (movingLeft == false){
					movingLeft = true;
					
					_velocity.x = -900;
				}
			}
			if (_ce.input.isDoing("up",inputChannel)){
				if (movingUp == false){
					movingUp = true;
					
					_velocity.y = -900;
				}
			}
			if (_ce.input.isDoing("down",inputChannel)){
				if (movingDown == false){
					movingDown = true;
					
					_velocity.y = 900;
				}
			}
			
			if(colliding == false){
				if (_velocity.x <= -300){
					_velocity.x += accelerationX;
				}else if (_velocity.x >= 300){
					_velocity.x -= accelerationX;
				}else{
					_velocity.x = 0;
					movingRight = false;
					movingLeft = false;
				}
			}
			
			if (_velocity.y <= -300){
				_velocity.y += accelerationY;
			}else if (_velocity.y >= 300){
				_velocity.y -= accelerationY;
			}else{
				_velocity.y = 0;
				movingUp = false;
				movingDown = false;
			}
		}
			
		public function changeVelocity(speed: int):void{
			_velocity.x = speed;			
		}
		
		public function restart(): void{
			colliding = false;
			x = 200;
			y = 350;
		}
	}
}