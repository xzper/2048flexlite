package org.xzper.model.vos
{
	import flash.geom.Point;
	import flash.utils.ByteArray;

	public class TileVO extends Object
	{
		/**
		 * 列
		 */
		public var x:int;
		
		/**
		 * 行
		 */
		public var y:int;
		
		/**
		 * 数值
		 */
		public var value:int;
		
		/**
		 * 是否已合并
		 */
		public var merged:Boolean;
		/**
		 * 移动之前的位置
		 */
		public var previousPosition:Object;
		
		public function TileVO()
		{
		}
		
		public function clone():TileVO
		{
			var tileVO:TileVO = new TileVO();
			tileVO.x = this.x;
			tileVO.y = this.y;
			tileVO.value = this.value;
			if(previousPosition){
				tileVO.previousPosition = {"x":previousPosition.x , "y":previousPosition.y};
			}
			tileVO.merged = merged;
			return tileVO;
		}

	}
}