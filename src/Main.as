package
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.utils.setTimeout;
	
	import org.flexlite.domDll.Dll;
	import org.flexlite.domDll.core.ConfigItem;
	import org.flexlite.domDll.events.DllEvent;
	import org.flexlite.domUI.utils.callLater;
	import org.xzper.ApplicationFacade;
	import org.xzper.app.AppContainer;
	
	public class Main extends Sprite
	{
		private var loadingSprite:DisplayObject;
		
		public function Main()
		{
			super();
			init();
		}
		
		private function init():void
		{
			Dll.eventDispather.addEventListener(DllEvent.ITEM_LOAD_FINISHED, onItemFinished);
			Dll.eventDispather.addEventListener(DllEvent.GROUP_COMPLETE, onGroupComp);
			var item1:ConfigItem = new ConfigItem("resource/config/ini.xml","xml", "resource/");
			var configList:Vector.<ConfigItem> = new <ConfigItem>[item1];
			Dll.loadConfig(configList, "1");
			Dll.loadGroup("loading",2);
			Dll.loadGroup("preload",1);
			Dll.loadGroup("uigroup",0);
		}
		
		protected function onItemFinished(event:DllEvent):void
		{
			if (!event.dllItem.loaded)
			{
				trace(event.dllItem.name+"加载失败!");
			}
		}
		
		protected function onProgress(event:DllEvent):void
		{
			if (event.groupName != "preload")
			{
				return;
			}
			this.loadingSprite["progress"] = int(event.bytesLoaded * 100 / event.bytesTotal);
		}
		
		protected function onGroupComp(event:DllEvent):void
		{
			if (event.groupName == "loading")
			{
				this.loadingSprite = (Dll.getRes("LoadingSprite") as Loader).content;
				stage.addChild(this.loadingSprite);
				this.loadingSprite.x = (stage.stageWidth - this.loadingSprite.width) / 2;
				this.loadingSprite.y = (stage.stageHeight - this.loadingSprite.height) / 2;
				Dll.eventDispather.addEventListener(DllEvent.GROUP_PROGRESS, onProgress);
			}
			else if (event.groupName == "uigroup")
			{
				allComplete();
			}
		}
		
		private function allComplete():void
		{
			Dll.eventDispather.removeEventListener(DllEvent.GROUP_COMPLETE,onGroupComp);
			Dll.eventDispather.removeEventListener(DllEvent.GROUP_PROGRESS,onProgress);
			Dll.eventDispather.removeEventListener(DllEvent.ITEM_LOAD_FINISHED,onItemFinished);
			
			if(loadingSprite){
				stage.removeChild(loadingSprite);
				loadingSprite = null;
			}

			var appContainer:AppContainer = new AppContainer();
			appContainer.visible = false;
			this.addChild(appContainer);
			
			callLater(function():void{
				appContainer.visible = true;		//延迟显示，优化体验
			});

			ApplicationFacade.getInstance().startUp(appContainer);
		}
	}
}