package org.xzper.model
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import org.xzper.model.common.CommonData;
	
	public class GameProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "GameProxy";

		/**
		 * 分数更新 , body  {totalScore:int , addScore:int}
		 */
		public static const UPDATE_SCORE:String = "update_score";
		
		public static const GAME_RESULT:String = "game_result";
		
		public static const RESET_SCORE:String = "reset_score";
		
		private var _score:int = 0;

		private var won:Boolean = false;
		private var over:Boolean = false;
		
		
		public function GameProxy()
		{
			super(NAME);
		}
		
		/**
		 * 游戏分数
		 */
		public function get score():int
		{
			return _score;
		}
		
		/**
		 * 重置游戏数据
		 */
		public function reset():void
		{
			_score = 0;
			won = false;
			over = false;
			CommonData.isRunning = true;
			sendNotification(RESET_SCORE);
		}

		/**
		 * 更新分数
		 */
		public function updateScore(addScore:int):void
		{
			if(addScore != 0){
				_score += addScore;
				sendNotification(UPDATE_SCORE , {"totalScore":score , "addScore":addScore});
			}
		}
		
		/**
		 * 游戏是否胜利
		 */
		public function setResult(b:Boolean):void
		{
			if(b){
				this.won = true;
			}else{
				this.over = true;
			}
			CommonData.isRunning = false;
			sendNotification(GAME_RESULT , b);
		}
	}
}