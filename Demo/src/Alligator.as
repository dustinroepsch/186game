package {
	/**
	 * @author veneciaalvarez
	 */
	public class Alligator extends Log {
		
		public static const ALL_WIDTH: int = 130;
		public static const ALL_HEIGHT: int = 35;
		var isEnemy: Boolean;
		
		public function Alligator(direction : int, name : String, params : Object = null) {
			super(direction, name, params);
			isEnemy = false;
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			
			//Randomly open mouth
			var randNum:Number=Math.floor(Math.random()*100)+1; //1-100
			
			if (!isEnemy)
			{
				if (randNum == 1)
				{
					moveMouth();
				}
			}
			else if (isEnemy)
			{
				if (randNum < 3)
				{
					moveMouth();
				}
			}
		
			
		}
		
		private function moveMouth(): void{
			if (!isEnemy) //open mouth
			{
				isEnemy = true;
				//change sprite to open mouth
				trace("I'm an enemy alligator!");
			}
			else //close mouth& turn to enemy
			{
				isEnemy = false;
				//change spritie to closed mouth
				trace("I'm a friendly alligator!");
			}
		}
	}
	
}
