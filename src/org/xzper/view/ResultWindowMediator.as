package org.xzper.view
{
	import flash.events.MouseEvent;
	
	import org.flexlite.domUI.core.IVisualElementContainer;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.xzper.controller.commands.GameCommand;
	import org.xzper.view.components.ResultWindow;
	
	public class ResultWindowMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ResultWindowMediator";

		public function ResultWindowMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
			resultWindow.tryAgainButton.addEventListener(MouseEvent.CLICK , tryAgainButtonClick);
		}
		
		protected function tryAgainButtonClick(event:MouseEvent):void
		{
			sendNotification(GameCommand.GAME_RESET);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				GameCommand.GAME_RESET
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case GameCommand.GAME_RESET:
				{
					(resultWindow.parent as IVisualElementContainer).removeElement(resultWindow);
					facade.removeMediator("ResultWindowMediator");
					break;
				}
			}
		}
		
		protected function get resultWindow():ResultWindow
		{
			return viewComponent as ResultWindow;
		}
	}
}