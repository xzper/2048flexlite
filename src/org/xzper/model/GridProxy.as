package org.xzper.model
{
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import org.xzper.controller.commands.GameCommand;
	import org.xzper.model.common.CommonData;
	import org.xzper.model.vos.TileVO;
	
	public class GridProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "GridProxy";
		
		public static const RESET_TILE:String = "reset_tile";
		public static const MOVE_TILE:String = "move_tile";
		public static const INSERT_TILE:String = "insert_tile";
		public static const REMOVE_TILE:String = "remove_tile";
		
		private var cells:Array = [];
		private var startTiles:int = 2;
		private var playerTurn:Boolean = true;
		private var size:int = CommonData.size;

		public function GridProxy()
		{
			super(NAME);
		}
		
		/**
		 * 初始化数据
		 */
		public function reset():void
		{
			cells = [];
			for (var x:int = 0; x < this.size; x++) {
				var row:Array = [];
				cells.push(row);
				for (var y:int = 0; y < this.size; y++) {
					row.push(null);
				}
			}
			this.playerTurn = true;
			sendNotification(RESET_TILE);
		}
		
		/**
		 * 向某一方向移动
		 * @param direction 0: 上, 1: 右, 2:下, 3: 左
		 */
		public function move(direction:int):void
		{
			var won:Boolean = false;
			var moved:Boolean = false;
			var score:int = 0;
			
			this.prepareTiles();
			var tiles:Array = buildMoveOrder(direction);
			for (var i:int = 0; i < tiles.length; i++) 
			{
				var tile:TileVO = tiles[i] as TileVO;
				if(tile){
					var farthestPosition:Object = findFarthestPosition({"x":tile.x , "y":tile.y} , direction);
					var nextPosition:Object = getNextPosition(farthestPosition , direction);
					var nextTile:TileVO = cellContent(nextPosition.x , nextPosition.y);
					if(nextTile && nextTile.value == tile.value && !nextTile.merged){ //可以向下合并
						
						//创建新格子
						var mergedTile:TileVO = new TileVO();
						mergedTile.x = nextTile.x;
						mergedTile.y = nextTile.y;
						mergedTile.value = tile.value + nextTile.value;
						mergedTile.merged = true;
						
						//更新格子
						removeTile(nextTile);
						removeTile(tile);
						insertTile(mergedTile);
						
						tile.x = nextTile.x;
						tile.y = nextTile.y;
						
						//更新分数
						score += mergedTile.value;

						if(mergedTile.value == 2048){   //2048游戏结束
							won = true;
						}
					} else {
						moveTile(tile , farthestPosition.x , farthestPosition.y);
					}
					
					if(tile.x != tile.previousPosition.x || tile.y != tile.previousPosition.y){  //格子移动了
						this.playerTurn = false;
						moved = true;
					}
				}
			}
			sendNotification(GameCommand.USER_MOVED , {"won":won , "moved":moved , "score":score});
		}
		
		/**
		 * 电脑添加一个格子
		 */
		public function computerMove():void
		{
			this.addRandomTile();
			this.playerTurn = true;
		}
		
		/**
		 * 获取某一方向的格子
		 */
		private function buildMoveOrder(direction:int):Array
		{
			var arr:Array = [];
			var vector:Object = getVector(direction);
			var xReverse:Boolean = (vector.x==1)?true:false;
			var yReverse:Boolean = (vector.y==1)?true:false;
			var x:int = xReverse? (this.size-1) : 0;
			while(x>=0 && x<this.size){
				var y:int = yReverse? (this.size-1) : 0;
				while(y>=0 && y<this.size){
					arr.push(cellContent(x,y));
					y = y + (yReverse?-1:1);
				}
				x = x + (xReverse?-1:1);
			}
			return arr;
		}
		
		/**
		 * 获取指定方向上能移动到的位置
		 */
		private function findFarthestPosition(position:Object , direction:int):Object
		{
			var vector:Object = getVector(direction);
			var lastPosition:Object;
			do{
				lastPosition = position;
				position = getNextPosition(position , direction);
			}while(withinBounds(position.x , position.y) && isAvailable(position.x , position.y));
			return lastPosition;
		}
		
		/**
		 * 获取某一位置指定方向的下一个位置
		 */
		private function getNextPosition(position:Object , direction:int):Object
		{
			var vector:Object = getVector(direction);
			return {"x":position.x+vector.x , "y":position.y+vector.y};
		}
		
		/**
		 * 存储移动前状态
		 */
		private function prepareTiles():void
		{
			for (var x:int = 0; x < this.size; x++) {
				for (var y:int = 0; y < this.size; y++) {
					var tile:TileVO = this.cells[x][y] as TileVO;
					if(tile){
						tile.merged = false;
						tile.previousPosition = {"x":tile.x , "y":tile.y};
					}
				}
			}
		}
		
		/**
		 * 添加游戏开始的格子
		 */
		public function addStartTiles():void
		{
			for (var i:int = 0; i<this.startTiles; i++) {
				this.addRandomTile();
			}
		}
		
		/**
		 * 随机添加一个格子
		 */
		private function addRandomTile():void
		{
			if (this.cellsAvailable()) {
				var position:Object = randomAvailableCell;
				var tile:TileVO = new TileVO();
				tile.x = position.x;
				tile.y = position.y;
				tile.value = Math.random() < 0.9 ? 2 : 4;
				this.insertTile(tile);
			}
		}
		
		/**
		 * 是否能够继续游戏
		 */
		public function movesAvailable():Boolean
		{
			for (var i:int = 0; i < size; i++) 
			{
				for (var j:int = 0; j < size; j++) 
				{
					var tile:TileVO = this.cells[i][j] as TileVO;
					if (tile) {
						for (var direction:int = 0; direction < 4; direction++) 
						{
							 var nextPosition:Object = getNextPosition({"x":tile.x , "y":tile.y} , direction);
							 var nextTileVO:TileVO = cellContent(nextPosition.x , nextPosition.y);
							 if( (!nextTileVO && withinBounds(nextPosition.x,nextPosition.y)) ||    //某一位置是空的
							 		(nextTileVO && nextTileVO.value == tile.value) ){     //某一位置可以合并
								 return true;
							 }
						}
					}
				}
			}
			return false;
		}
		
		/**
		 * 是否存在空格子
		 */
		private function cellsAvailable():Boolean
		{
			if(availableCells.length > 0) {
				return true;
			}
			return false;
		}
		
		/**
		 * 获取指定位置的格子是否可用
		 */
		private function isAvailable(x:int , y:int):Boolean
		{
			return !isOccupied(x,y);
		}
		
		/**
		 * 获取指定位置的格子是否被占用
		 */
		private function isOccupied(x:int , y:int):Boolean
		{
			if(cellContent(x,y)){
				return true;
			}else{
				return false;
			}
		}
		
		/**
		 * 获取指定位置的格子
		 */
		private function cellContent(x:int , y:int):TileVO
		{
			if (this.withinBounds(x , y)) {
				return this.cells[x][y] as TileVO;
			} else {
				return null;
			}
		}
		
		/**
		 * 检查位置是否合法
		 */
		private function withinBounds(x:int , y:int):Boolean {
			return x >= 0 && x < this.size && y >= 0 && y < this.size;
		};
		
		/**
		 * 移动格子
		 */
		private function moveTile(tile:TileVO, x:int , y:int):void{
			if(tile.x == x && tile.y == y){
				return;
			}
			this.cells[tile.x][tile.y] = null;
			tile.x = x;
			tile.y = y;
			this.cells[tile.x][tile.y] = tile;
			sendNotification(MOVE_TILE , tile.clone());
		}
		
		/**
		 * 添加一个格子
		 */
		private function insertTile(tile:TileVO):void
		{
			this.cells[tile.x][tile.y] = tile;
			sendNotification(INSERT_TILE , tile.clone());
		}
		
		/**
		 * 移除一个格子
		 */
		private function removeTile(tile:TileVO):void
		{
			this.cells[tile.x][tile.y] = null;
			sendNotification(REMOVE_TILE , tile.clone());
		}
		
		/**
		 * 获取某一方向的偏移位置
		 * @param direction 0: 上, 1: 右, 2:下, 3: 左
		 */
		private function getVector(direction:int):Object
		{
			if(direction == 0){ return {"x":0 , "y":-1}; }
			else if(direction == 1){ return {"x":1 , "y":0}; }
			else if(direction == 2){ return {"x":0 , "y":1}; }
			else if(direction == 3){ return {"x":-1 , "y":0}; }
			else { return null; }
		}
		
		/**
		 * 随机获取一个空格子的位置
		 */
		private function get randomAvailableCell():Object
		{
			var arr:Array = this.availableCells;
			if (arr.length) {
				return arr[Math.floor(Math.random() * arr.length)];
			}
			return null;
		}
		
		/**
		 * 所有的空格子的位置
		 */
		private function get availableCells():Array
		{
			var arr:Array = [];
			for (var x:int = 0; x < this.size; x++) {
				for (var y:int = 0; y < this.size; y++) {
					if(!this.cells[x][y]){
						arr.push({"x":x , "y":y});
					}
				}
			}
			return arr;
		}
		
	}
}