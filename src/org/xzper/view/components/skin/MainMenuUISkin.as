package org.xzper.view.components.skin
{
	import org.flexlite.domUI.components.Button;
	import org.flexlite.domUI.components.Group;
	import org.flexlite.domUI.components.Label;
	import org.flexlite.domUI.components.Rect;
	import org.flexlite.domUI.components.StateSkin;
	import org.flexlite.domUI.states.State;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompiler
	 */
	public class MainMenuUISkin extends org.flexlite.domUI.components.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var addLabel:org.flexlite.domUI.components.Label;

		public var resetButton:org.flexlite.domUI.components.Button;

		public var scoreLabel:org.flexlite.domUI.components.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MainMenuUISkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [resetButton_i(),__MainMenuUISkin_Label1_i(),__MainMenuUISkin_Label2_i(),__MainMenuUISkin_Group1_i()];
			
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
		private function __MainMenuUISkin_Group1_i():org.flexlite.domUI.components.Group
		{
			var temp:org.flexlite.domUI.components.Group = new org.flexlite.domUI.components.Group();
			temp.height = 80;
			temp.right = 0;
			temp.top = 0;
			temp.width = 80;
			temp.elementsContent = [__MainMenuUISkin_Rect1_i(),__MainMenuUISkin_Label3_i(),scoreLabel_i(),addLabel_i()];
			return temp;
		}

		private function __MainMenuUISkin_Label1_i():org.flexlite.domUI.components.Label
		{
			var temp:org.flexlite.domUI.components.Label = new org.flexlite.domUI.components.Label();
			temp.size = 80;
			temp.text = "2048";
			temp.textColor = 0x776E65;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MainMenuUISkin_Label2_i():org.flexlite.domUI.components.Label
		{
			var temp:org.flexlite.domUI.components.Label = new org.flexlite.domUI.components.Label();
			temp.size = 20;
			temp.text = "Join the numbers and get to the 2048 tile!";
			temp.textColor = 0x776E65;
			temp.x = 0;
			temp.y = 83;
			return temp;
		}

		private function __MainMenuUISkin_Label3_i():org.flexlite.domUI.components.Label
		{
			var temp:org.flexlite.domUI.components.Label = new org.flexlite.domUI.components.Label();
			temp.horizontalCenter = 0;
			temp.size = 15;
			temp.text = "Score";
			temp.textColor = 0xFFFFFF;
			temp.verticalCenter = -24;
			return temp;
		}

		private function __MainMenuUISkin_Rect1_i():org.flexlite.domUI.components.Rect
		{
			var temp:org.flexlite.domUI.components.Rect = new org.flexlite.domUI.components.Rect();
			temp.fillColor = 0xbbada0;
			temp.height = 80;
			temp.radius = 5;
			temp.width = 80;
			return temp;
		}

		private function addLabel_i():org.flexlite.domUI.components.Label
		{
			var temp:org.flexlite.domUI.components.Label = new org.flexlite.domUI.components.Label();
			addLabel = temp;
			temp.horizontalCenter = 0;
			temp.size = 20;
			temp.textColor = 0x8B8177;
			temp.y = 30;
			return temp;
		}

		private function resetButton_i():org.flexlite.domUI.components.Button
		{
			var temp:org.flexlite.domUI.components.Button = new org.flexlite.domUI.components.Button();
			resetButton = temp;
			temp.horizontalCenter = 0;
			temp.label = "重置游戏";
			temp.top = 37;
			return temp;
		}

		private function scoreLabel_i():org.flexlite.domUI.components.Label
		{
			var temp:org.flexlite.domUI.components.Label = new org.flexlite.domUI.components.Label();
			scoreLabel = temp;
			temp.height = 43;
			temp.horizontalCenter = 0;
			temp.size = 23;
			temp.text = "+32";
			temp.textAlign = "center";
			temp.textColor = 0xFFFFFF;
			temp.verticalAlign = "middle";
			temp.percentWidth = 100;
			temp.y = 30;
			return temp;
		}

	}
}