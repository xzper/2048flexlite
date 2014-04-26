package org.xzper.view.components.skin
{
	import org.flexlite.domUI.components.Label;
	import org.flexlite.domUI.components.Rect;
	import org.flexlite.domUI.components.StateSkin;
	import org.flexlite.domUI.states.State;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompiler
	 */
	public class ResetButtonSkin extends org.flexlite.domUI.components.StateSkin
	{
		public var labelDisplay:org.flexlite.domUI.components.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ResetButtonSkin()
		{
			super();
			
			this.currentState = "up";
			this.elementsContent = [__ResetButtonSkin_Rect1_i(),labelDisplay_i()];
			
			states = [
				new org.flexlite.domUI.states.State ({name: "up",
					overrides: [
					]
				})
				,
				new org.flexlite.domUI.states.State ({name: "over",
					overrides: [
					]
				})
				,
				new org.flexlite.domUI.states.State ({name: "down",
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
		private function __ResetButtonSkin_Rect1_i():org.flexlite.domUI.components.Rect
		{
			var temp:org.flexlite.domUI.components.Rect = new org.flexlite.domUI.components.Rect();
			temp.fillColor = 0x8F7A66;
			temp.percentHeight = 100;
			temp.radius = 5;
			temp.percentWidth = 100;
			return temp;
		}

		private function labelDisplay_i():org.flexlite.domUI.components.Label
		{
			var temp:org.flexlite.domUI.components.Label = new org.flexlite.domUI.components.Label();
			labelDisplay = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.size = 19;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.textColor = 0xF9F6F2;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}