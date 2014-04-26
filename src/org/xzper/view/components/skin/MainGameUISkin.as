package org.xzper.view.components.skin
{
	import org.flexlite.domUI.components.Group;
	import org.flexlite.domUI.components.Rect;
	import org.flexlite.domUI.components.StateSkin;
	import org.flexlite.domUI.states.State;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompiler
	 */
	public class MainGameUISkin extends org.flexlite.domUI.components.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var backGroundGroup:org.flexlite.domUI.components.Group;

		public var contentGroup:org.flexlite.domUI.components.Group;

		public var rect:org.flexlite.domUI.components.Rect;

		public var tileGroup:org.flexlite.domUI.components.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MainGameUISkin()
		{
			super();
			
			this.currentState = "normal";
			this.minHeight = 200;
			this.minWidth = 200;
			this.elementsContent = [rect_i(),backGroundGroup_i(),tileGroup_i(),contentGroup_i()];
			
			states = [
				new org.flexlite.domUI.states.State ({name: "normal",
					overrides: [
					]
				})
				,
				new org.flexlite.domUI.states.State ({name: "disabled",
					overrides: [
					]
				})
			];
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function backGroundGroup_i():org.flexlite.domUI.components.Group
		{
			var temp:org.flexlite.domUI.components.Group = new org.flexlite.domUI.components.Group();
			backGroundGroup = temp;
			temp.bottom = 10;
			temp.left = 10;
			temp.right = 10;
			temp.top = 10;
			return temp;
		}

		private function contentGroup_i():org.flexlite.domUI.components.Group
		{
			var temp:org.flexlite.domUI.components.Group = new org.flexlite.domUI.components.Group();
			contentGroup = temp;
			temp.percentHeight = 100;
			temp.percentWidth = 100;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function rect_i():org.flexlite.domUI.components.Rect
		{
			var temp:org.flexlite.domUI.components.Rect = new org.flexlite.domUI.components.Rect();
			rect = temp;
			temp.fillColor = 0xbbada0;
			temp.percentHeight = 100;
			temp.radius = 10;
			temp.percentWidth = 100;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function tileGroup_i():org.flexlite.domUI.components.Group
		{
			var temp:org.flexlite.domUI.components.Group = new org.flexlite.domUI.components.Group();
			tileGroup = temp;
			temp.bottom = 10;
			temp.left = 10;
			temp.right = 10;
			temp.top = 10;
			return temp;
		}

	}
}