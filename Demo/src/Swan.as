package {
	/**
	 * @author veneciaalvarez
	 */
	public class Swan extends Log {
		var underwater: Boolean;
		
		public function Swan(direction : int, name : String, params : Object = null) {
			super(direction, name, params);
			underwater = false;
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			
			//Randomly disappear
			var randNum:Number=Math.floor(Math.random()*100)+1; //1-100
			
			if (!underwater)
			{
				if (randNum == 1)
				{
					swim();
				}
			}
			else if (underwater)
			{
				if (randNum < 3)
				{
					swim();
				}
			}
		
			
		}
		
		private function swim(): void{
			
			if (!underwater) //go under water
			{
				underwater = true;
				//change sprite to bubbles?
				trace("I'm underwater, fear me!");
			}
			else //go above water
			{
				underwater = false;
				//change spritie to swan
				trace("I'm floating, hop on!");
			}
		}
	}
}
