package {
	import citrus.view.ISpriteView;
	import Box2D.Dynamics.Contacts.b2Contact;

	import citrus.math.MathVector;
	import citrus.objects.CitrusSprite;
	import citrus.physics.box2d.Box2DUtils;
	import citrus.physics.box2d.IBox2DPhysicsObject;

	import org.osflash.signals.Signal;

	import flash.utils.Dictionary;

	public class Log extends CitrusSprite{
		
		
		public function Log(direction: int, name:String, params:Object = null){
			super(name,params);
			
			if (direction == 1) //right
				_velocity.x = 70;
			else
				_velocity.x = -70;
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			
		}
		
		
	}
}
