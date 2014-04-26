package org.xzper.view.components.skin
{
	import org.flexlite.domUI.components.Button;
	import org.flexlite.domUI.components.Label;
	import org.flexlite.domUI.components.Rect;
	import org.flexlite.domUI.components.StateSkin;
	import org.flexlite.domUI.states.State;
	import org.xzper.view.components.skin.ResetButtonSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompiler
	 */
	public class ResultWindowSkin extends org.flexlite.domUI.components.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var textLabel:org.flexlite.domUI.components.Label;

		public var tryAgainButton:org.flexlite.domUI.components.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ResultWindowSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ResultWindowSkin_Rect1_i(),textLabel_i(),tryAgainButton_i()];
			
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
		private function __ResultWindowSkin_Rect1_i():org.flexlite.domUI.components.Rect
		{
			var temp:org.flexlite.domUI.components.Rect = new org.flexlite.domUI.components.Rect();
			temp.alpha = 0.2;
			temp.fillColor = 0xffff00;
			temp.percentHeight = 100;
			temp.percentWidth = 100;
			return temp;
		}

		private function textLabel_i():org.flexlite.domUI.components.Label
		{
			var temp:org.flexlite.domUI.components.Label = new org.flexlite.domUI.components.Label();
			textLabel = temp;
			temp.horizontalCenter = 0;
			temp.size = 50;
			temp.text = "Game Over";
			temp.textColor = 0x776E65;
			temp.verticalCenter = 0;
			return temp;
		}

		private function tryAgainButton_i():org.flexlite.domUI.components.Button
		{
			var temp:org.flexlite.domUI.components.Button = new org.flexlite.domUI.components.Button();
			tryAgainButton = temp;
			temp.height = 38;
			temp.horizontalCenter = 0;
			temp.label = "Try again";
			temp.skinName = org.xzper.view.components.skin.ResetButtonSkin;
			temp.verticalCenter = 81;
			temp.width = 122;
			return temp;
		}

	}
}