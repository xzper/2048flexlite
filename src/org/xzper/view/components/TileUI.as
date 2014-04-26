package org.xzper.view.components
{
	import org.flexlite.domUI.components.Group;
	import org.flexlite.domUI.components.Label;
	import org.flexlite.domUI.components.Rect;
	import org.flexlite.domUI.components.SkinnableComponent;
	import org.flexlite.domUI.components.UIMovieClip;
	import org.flexlite.domUI.effects.Move;
	import org.flexlite.domUI.effects.Scale;
	import org.flexlite.domUI.events.EffectEvent;
	import org.xzper.model.vos.TileVO;
	import org.xzper.view.components.skin.TileUISkin;
	
	public class TileUI extends SkinnableComponent
	{
		private static var tileColor:Object =
			{
				0:{"background":0xccc0b3 , "fontSize":30 , "fontColor":0x776e65} ,
				2:{"background":0xeee4da , "fontSize":30 , "fontColor":0x776e65} ,
				4:{"background":0xede0c8 , "fontSize":30 , "fontColor":0x776e65} ,
				8:{"background":0xf2b179 , "fontSize":30 , "fontColor":0xf9f6f2} ,
				16:{"background":0xf59563 , "fontSize":30 , "fontColor":0xf9f6f2} ,
				32:{"background":0xf67c5f , "fontSize":30 , "fontColor":0xf9f6f2} ,
				64:{"background":0xf65e3b , "fontSize":30 , "fontColor":0xf9f6f2} ,
				128:{"background":0xedcf72 , "fontSize":30 , "fontColor":0xf9f6f2} ,
				256:{"background":0xedcc61 , "fontSize":30 , "fontColor":0xf9f6f2} ,
				512:{"background":0xedc850 , "fontSize":30 , "fontColor":0xf9f6f2} ,
				1024:{"background":0xedc53f , "fontSize":30 , "fontColor":0xf9f6f2} ,
				2048:{"background":0xedc22e , "fontSize":30 , "fontColor":0xf9f6f2}
			};
//		
//		public var rect:Rect;
//		public var numLabel:Label;
		
		public var numMC:UIMovieClip;
		
		public function TileUI()
		{
			super();
			this.width = 100;
			this.height = 100;
			this.skinName = TileUISkin;
		}
		
		private var _tileVO:TileVO;
		/**
		 * 格子的数据
		 */
		public function get tileVO():TileVO
		{
			return _tileVO;
		}
		
		public function set tileVO(value:TileVO):void
		{
			if(value == _tileVO){
				return;
			}
			_tileVO = value;
			invalidateProperties();
		}
		
		override protected function commitProperties():void
		{
			if(_tileVO){
				updateView();
			}
		}
		
		private function updateView():void
		{
			if(_tileVO.value == 0){
				numMC.gotoAndStop(0);
			}else{
				var mi:int = int(Math.log(_tileVO.value)/Math.log(2));
				numMC.gotoAndStop(mi-1);
			}
//			var obj:Object = tileColor[tileVO.value];
//			rect.fillColor = obj["background"];
//			numLabel.textColor = obj["fontColor"];
//			numLabel.size = obj["fontSize"];
//			numLabel.text = tileVO.value.toString();
		}
		
		/**
		 * 播放缩放效果 merged是否是合并方块
		 */
		public function playScale(merged:Boolean = false):void
		{
			var scale:Scale = new Scale(this);
			scale.duration = 120;
			scale.scaleXFrom= 0.1;
			scale.scaleYFrom = 0.1;
			if(!merged){
				scale.scaleXTo = 1;
				scale.scaleYTo = 1;
			}else{
				scale.scaleXTo = 1.1;
				scale.scaleYTo = 1.1;
				var effectEndEvent:Function = function(event:EffectEvent):void
				{
					scale.removeEventListener(EffectEvent.EFFECT_END , effectEndEvent);
					scale.scaleXFrom= 1.1;
					scale.scaleYFrom = 1.1;
					scale.scaleXTo = 1;
					scale.scaleYTo = 1;
					scale.play();
				}
				scale.addEventListener(EffectEvent.EFFECT_END , effectEndEvent);
			}
			scale.play();
		}
		
		public function playmove(xTo:Number, yTo:Number):void
		{
			var move:Move = new Move(this);
			move.duration = 150;
			move.xTo = xTo;
			move.yTo = yTo;
			move.play();
		}
	}
}