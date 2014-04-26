package org.xzper.view.components.skin
{
	import org.flexlite.domUI.components.StateSkin;
	import org.flexlite.domUI.components.UIMovieClip;
	import org.flexlite.domUI.states.State;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompiler
	 */
	public class TileUISkin extends org.flexlite.domUI.components.StateSkin
	{
		public var numMC:org.flexlite.domUI.components.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TileUISkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [numMC_i()];
			
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


		private function numMC_i():org.flexlite.domUI.components.UIMovieClip
		{
			var temp:org.flexlite.domUI.components.UIMovieClip = new org.flexlite.domUI.components.UIMovieClip();
			numMC = temp;
			temp.height = 100;
			temp.skinName = "SWF__D295A736";
			temp.width = 100;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}