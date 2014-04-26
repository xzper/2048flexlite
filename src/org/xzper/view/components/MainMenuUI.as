package org.xzper.view.components
{
	import flash.events.Event;
	
	import org.flexlite.domUI.components.Button;
	import org.flexlite.domUI.components.Label;
	import org.flexlite.domUI.components.SkinnableComponent;
	import org.flexlite.domUI.effects.Move;
	import org.flexlite.domUI.events.EffectEvent;
	import org.flexlite.domUI.events.UIEvent;
	import org.xzper.ApplicationFacade;
	import org.xzper.view.MainMenuMediator;
	import org.xzper.view.components.skin.MainMenuUISkin;
	
	public class MainMenuUI extends SkinnableComponent
	{
		public var addLabel:Label;
		public var scoreLabel:Label;
		public var resetButton:Button;
		
		private var moveEffect:Move;
		
		public function MainMenuUI()
		{
			super();
			this.skinName = MainMenuUISkin;
			this.addEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
		}
		
		protected function createCompleteEvent(event:UIEvent):void
		{
			this.removeEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
			ApplicationFacade.getInstance().registerMediator( new MainMenuMediator(this) );
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName , instance);
			if(addLabel == instance){
				moveEffect = new Move(addLabel);
				moveEffect.yFrom = 30;
				moveEffect.yTo = 0;
				moveEffect.duration = 500;
				moveEffect.addEventListener(EffectEvent.EFFECT_END , moveEffect_effectEndHandler);
				moveEffect.addEventListener(EffectEvent.EFFECT_UPDATE , moveEffect_effectUpdateHandler);
			}
		}
		
		protected function moveEffect_effectUpdateHandler(event:Event):void
		{
			trace(addLabel.y);
		}
		
		/**
		 * 加分效果
		 */
		public function playScoreEffect(addScore:int):void
		{
			addLabel.text = "+"+addScore;
			if(moveEffect.isPlaying){
				moveEffect.end();
			}
			addLabel.visible = true;
			moveEffect.play();
		}
		
		protected function moveEffect_effectEndHandler(event:EffectEvent):void
		{
			addLabel.visible = false;
		}
	}
}