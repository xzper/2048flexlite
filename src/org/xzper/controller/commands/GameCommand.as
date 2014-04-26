package org.xzper.controller.commands
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.xzper.ApplicationFacade;
	import org.xzper.model.GameProxy;
	import org.xzper.model.GridProxy;
	
	public class GameCommand extends SimpleCommand implements ICommand
	{
		public static const NAME:String = "GameCommand";
		
		/**
		 * 游戏重置
		 */
		public static const GAME_RESET:String = "game_reset";
		
		/**
		 * 处理移动后的事务 , body  {score , won , moved}
		 */
		public static const USER_MOVED:String = "user_moved";
		
		/**
		 * 执行移动 , body  0: 上, 1: 右, 2:下, 3: 左
		 */
		public static const USER_MOVE:String = "user_move";
		
		/**
		 * 注册消息
		 */
		public function register():void
		{
			facade.registerCommand(GameCommand.GAME_RESET , GameCommand);
			facade.registerCommand(GameCommand.USER_MOVED , GameCommand);
			facade.registerCommand(GameCommand.USER_MOVE , GameCommand);
		}
		
		override public function execute(notification:INotification):void
		{
			var gameProxy:GameProxy = facade.retrieveProxy(GameProxy.NAME) as GameProxy;
			var gridProxy:GridProxy = facade.retrieveProxy(GridProxy.NAME) as GridProxy;
			var data:Object = notification.getBody();
			switch(notification.getName())
			{
				case GAME_RESET:
				{
					gameProxy.reset();
					gridProxy.reset();
					gridProxy.addStartTiles();
					break;
				}
				case USER_MOVED:
				{
					gameProxy.updateScore(data["score"]);
					if(!data["won"]){
						if(data["moved"]){
							gridProxy.computerMove();
						}
					}else{
						gameProxy.setResult(true);
					}
					if(!gridProxy.movesAvailable()){
						gameProxy.setResult(false);
					}
					break;
				}
				case USER_MOVE:
				{
					gridProxy.move(int(data));
					break;
				}
			}
		}
	}
}