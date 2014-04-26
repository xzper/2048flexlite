package org.xzper.app
{
	import org.flexlite.domCore.Injector;
	import org.flexlite.domUI.core.ISkinAdapter;
	import org.flexlite.domUI.core.Theme;
	import org.flexlite.domUI.events.UIEvent;
	import org.flexlite.domUI.managers.SystemManager;
	import org.xzper.ApplicationFacade;
	import org.xzper.view.ApplicationMediator;
	import org.xzper.view.components.MainGameUI;
	import org.xzper.view.components.MainMenuUI;
	
	public class AppContainer extends SystemManager
	{
		public var mainMenuUI:MainMenuUI;
		public var mainGameUI:MainGameUI;
		
		public function AppContainer()
		{
			super();
			Injector.mapClass(ISkinAdapter, SkinAdapter);
			Injector.mapClass(Theme, AppTheme);
			
			this.addEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
		}
		
		protected function createCompleteEvent(event:UIEvent):void
		{
			this.removeEventListener(UIEvent.CREATION_COMPLETE , createCompleteEvent);
			ApplicationFacade.getInstance().registerMediator( new ApplicationMediator(this) );
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			mainMenuUI = new MainMenuUI();
			mainMenuUI.top = 4;
			mainMenuUI.horizontalCenter = 0;
			this.addElement(mainMenuUI);
			
			mainGameUI = new MainGameUI();
			mainGameUI.verticalCenter = 30;
			mainGameUI.horizontalCenter = 0;
			this.addElement(mainGameUI);
		}
		
	}
}