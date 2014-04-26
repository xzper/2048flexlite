package org.xzper.view.components
{
	import org.flexlite.domUI.components.Group;
	import org.flexlite.domUI.components.Rect;
	import org.flexlite.domUI.components.SkinnableContainer;
	import org.flexlite.domUI.events.UIEvent;
	import org.xzper.ApplicationFacade;
	import org.xzper.model.common.CommonData;
	import org.xzper.model.vos.TileVO;
	import org.xzper.view.MainGameMediator;
	import org.xzper.view.components.skin.MainGameUISkin;
	
	public class MainGameUI extends SkinnableContainer
	{
		public var backGroundGroup:Group;
		public var tileGroup:Group;
		public var resultWindow:ResultWindow;
		
		public function MainGameUI()
		{
			super();
			this.skinName = MainGameUISkin;
			this.addEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
		}
		
		protected function createCompleteEvent(event:UIEvent):void
		{
			this.removeEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
			ApplicationFacade.getInstance().registerMediator( new MainGameMediator(this) );
			
			initBackGround(CommonData.size);
		}
		
		private var gap:int = 10;
		
		/**
		 * 初始化背景
		 */
		public function initBackGround(size:int):void
		{
			backGroundGroup.removeAllElements();
			for (var i:int = 0; i < size; i++) 
			{
				for (var j:int = 0; j < size; j++) 
				{
					var tile:Rect = new Rect();
					tile.width = 100;
					tile.height = 100;
					tile.x = i * (tile.width+gap);
					tile.y = j * (tile.height+gap);
					tile.fillColor = 0xccc0b3;
					backGroundGroup.addElement(tile);
				}
			}
		}
		
		/**
		 * 创建一个格子
		 */
		public function createTile(tileVO:TileVO):void
		{
			var tile:TileUI = new TileUI();
			tile.tileVO = tileVO;
			tile.includeInLayout = false;
			tile.x = tileVO.x * (tile.width+gap);
			tile.y = tileVO.y * (tile.height+gap);
			tileGroup.addElement(tile);
			if(tileVO.merged){
				tile.playScale(true);
			}else{
				tile.playScale(false);
			}
		}
		
		public function getTileUI(x:int , y:int):TileUI
		{
			for (var i:int = 0; i < tileGroup.numElements; i++) 
			{
				var tile:TileUI = tileGroup.getElementAt(i) as TileUI;
				if(tile.tileVO.x == x && tile.tileVO.y == y){
					return tile;
				}
			}
			return null;
		}
		
		/**
		 * 清除一个格子
		 */
		public function removeTile(tileVO:TileVO):void
		{
			var tile:TileUI = getTileUI(tileVO.x , tileVO.y);
			if(tile){
				tileGroup.removeElement(tile);
			}
		}
		
		/**
		 * 移动一个格子
		 */
		public function moveTile(tileVO:TileVO):void
		{
			var tile:TileUI = getTileUI(tileVO.previousPosition.x , tileVO.previousPosition.y);
			if(tile){
				tile.tileVO.x = tileVO.x;
				tile.tileVO.y = tileVO.y;
				tile.playmove( tileVO.x * (tile.width+gap) , tileVO.y * (tile.height+gap) );
			}
		}
		
		/**
		 * 清除所有
		 */
		public function clearTiles():void
		{
			tileGroup.removeAllElements();
		}
		
//使用皮肤代替子组件
//		override protected function createChildren():void
//		{
//			super.createChildren();
//			var rect:Rect = new Rect();
//			rect.radius = gap;
//			rect.fillColor = 0xbbada0;
//			rect.percentWidth = 100;
//			rect.percentHeight = 100;
//			this.addElement(rect);
//			
//			backGroundGroup = new Group();
//			backGroundGroup.left = gap;
//			backGroundGroup.top = gap;
//			backGroundGroup.right = gap;
//			backGroundGroup.bottom = gap;
//			this.addElement(backGroundGroup);
//			
//			tileGroup = new Group();
//			tileGroup.left = gap;
//			tileGroup.top = gap;
//			this.addElement(tileGroup);
//			
//			resultWindow = new ResultWindow();
//			resultWindow.percentWidth = 100;
//			resultWindow.percentHeight = 100;
//			resultWindow.visible = false;
//			this.addElement(resultWindow);
//		}
		
	}
}