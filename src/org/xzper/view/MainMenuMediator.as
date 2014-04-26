package org.xzper.view
{
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.xzper.controller.commands.GameCommand;
	import org.xzper.model.GameProxy;
	import org.xzper.model.common.CommonData;
	import org.xzper.view.components.MainMenuUI;
	
	public class MainMenuMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "MainMenuMediator";

		public function MainMenuMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
			mainGameUI.resetButton.addEventListener(MouseEvent.CLICK , startButtonClick);
		}
		
		protected function startButtonClick(event:MouseEvent):void
		{
			sendNotification(GameCommand.GAME_RESET);
		}		
		
		override public function listNotificationInterests():Array
		{
			return [GameProxy.UPDATE_SCORE , GameProxy.RESET_SCORE];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var data:Object = notification.getBody();
			switch(notification.getName())
			{
				case GameProxy.UPDATE_SCORE:
				{
					mainGameUI.scoreLabel.text = data["totalScore"];
					mainGameUI.playScoreEffect(data["addScore"]);
					break;
				}

				case GameProxy.RESET_SCORE:
				{
					mainGameUI.scoreLabel.text = "0";
					break;
				}
			}
		}
		
		protected function get mainGameUI():MainMenuUI
		{
			return viewComponent as MainMenuUI;
		}
	}
}