package org.xzper.view.components
{
	import org.flexlite.domUI.components.Button;
	import org.flexlite.domUI.components.Label;
	import org.flexlite.domUI.components.SkinnableComponent;
	import org.flexlite.domUI.events.UIEvent;
	import org.xzper.ApplicationFacade;
	import org.xzper.view.ResultWindowMediator;
	import org.xzper.view.components.skin.ResultWindowSkin;
	
	public class ResultWindow extends SkinnableComponent
	{
		public var textLabel:Label;
		public var tryAgainButton:Button;
		
		public function ResultWindow()
		{
			super();
			this.skinName = ResultWindowSkin;
			this.addEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
		}
		
		protected function createCompleteEvent(event:UIEvent):void
		{
			this.removeEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
			ApplicationFacade.getInstance().registerMediator( new ResultWindowMediator(this) );
		}
		
		private var _won:Boolean = false;
		/**
		 * 设置文本
		 */
		public function get won():Boolean
		{
			return _won;
		}
		
		private var textChanged:Boolean;
		public function set won(value:Boolean):void
		{
			if(value == _won){
				return;
			}
			textChanged = true;
			_won = value;
			invalidateProperties();
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if(textChanged){
				if(_won){
					textLabel.text = "Congratulations I Won! ";
				}else{
					textLabel.text = "Game Over! ";
				}
			}
		}
	}
}