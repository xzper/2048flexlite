package org.xzper.view
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.xzper.app.AppContainer;
	import org.xzper.controller.commands.GameCommand;
	import org.xzper.model.common.CommonData;
	
	public class ApplicationMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ApplicationMediator";
		public function ApplicationMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
//			facade.registerMediator( new MainMenuMediator(main.mainMenuUI) );
//			facade.registerMediator( new MainGameMediator(main.mainGameUI) );
			
			main.addEventListener(KeyboardEvent.KEY_DOWN , keyDownEvent);
			main.addEventListener(MouseEvent.CLICK , clickEvent);
			
			sendNotification(GameCommand.GAME_RESET);
		}
		
		protected function clickEvent(event:MouseEvent):void
		{
			//设置焦点
			main.setFocus();
		}
		
		/**
		 * 上次移动的时间 ， 防止过快设置移动
		 */
		private var lastMoveTime:uint = 0;
		protected function keyDownEvent(event:KeyboardEvent):void
		{
			if(CommonData.isRunning && (getTimer() - lastMoveTime)>=100){
				switch(event.keyCode){
					case Keyboard.UP:
						sendNotification(GameCommand.USER_MOVE , 0);
						break;
					case Keyboard.RIGHT:
						sendNotification(GameCommand.USER_MOVE , 1);
						break;
					case Keyboard.DOWN:
						sendNotification(GameCommand.USER_MOVE , 2);
						break;
					case Keyboard.LEFT:
						sendNotification(GameCommand.USER_MOVE , 3);
						break;
				}
				lastMoveTime = getTimer();
			}
		}
		
		override public function listNotificationInterests():Array
		{
			return [];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
			}
		}
		
		protected function get main():AppContainer
		{
			return viewComponent as AppContainer;
		}
	}
}