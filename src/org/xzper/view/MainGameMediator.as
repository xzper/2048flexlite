package org.xzper.view
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	import org.xzper.model.GameProxy;
	import org.xzper.model.GridProxy;
	import org.xzper.model.common.CommonData;
	import org.xzper.model.vos.TileVO;
	import org.xzper.view.components.MainGameUI;
	import org.xzper.view.components.ResultWindow;
	import org.xzper.view.components.TileUI;
	
	public class MainGameMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "MainGameMediator";
		
		private var gap:int;
		
		public function MainGameMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				GridProxy.INSERT_TILE ,
				GridProxy.MOVE_TILE , 
				GridProxy.REMOVE_TILE , 
				GridProxy.RESET_TILE , 
				GameProxy.GAME_RESULT
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var data:Object = notification.getBody();
			switch(notification.getName())
			{
				case GridProxy.INSERT_TILE:
				{
					mainGameUI.createTile(data as TileVO);
					break;
				}

				case GridProxy.MOVE_TILE:
				{
					mainGameUI.moveTile(data as TileVO);
					break;
				}

				case GridProxy.REMOVE_TILE:
				{
					mainGameUI.removeTile(data as TileVO);
					break;
				}
				case GridProxy.RESET_TILE:
				{
					mainGameUI.clearTiles();
					break;
				}
				case GameProxy.GAME_RESULT:
				{
					showResultWindow(data as Boolean);
					break;
				}
			}
		}
		
		private function showResultWindow(won:Boolean):void
		{
			var resultWindow:ResultWindow = new ResultWindow();
			resultWindow.won = won;
			resultWindow.percentWidth = 100;
			resultWindow.percentHeight = 100;
			mainGameUI.addElement(resultWindow);
		}
		
		protected function get mainGameUI():MainGameUI
		{
			return viewComponent as MainGameUI;
		}
	}
}