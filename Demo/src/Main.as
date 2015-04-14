package {
	
	import citrus.core.starling.StarlingCitrusEngine;
    import citrus.core.starling.StarlingState;    
    import flash.events.Event;    
    import starling.core.Starling;    
    import citrus.core.starling.ViewportMode;    
    import com.greensock.TweenLite;    
    import state.MenuState;
	
	/**
	 * @author Christopher
	 */
	public class Main extends StarlingCitrusEngine{
		public function Main() {
			super();
		}
		
		override protected function handleAddedToStage(event:Event):void {
			
			super.handleAddedToStage(event);
			
			Starling.handleLostContext = true;
			Starling.multitouchEnabled = true;
			
			_baseWidth = 800;
			_baseHeight = 400;
			
			_viewportMode = ViewportMode.LETTERBOX;
			
			setUpStarling(true);
		}
		override public function handleStarlingReady():void {
			super.handleStarlingReady();
			
			state = new MenuState();
		}
		public function changeState(nextState:StarlingState):void {
			futureState = nextState;
			
			TweenLite.to(state, 1, { alpha:0, onComplete:toNewState } );
			
			function toNewState():void{
				state = futureState;
			}
		}
	}
}
