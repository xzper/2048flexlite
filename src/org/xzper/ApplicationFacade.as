package org.xzper
{
	import flash.display.DisplayObjectContainer;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.xzper.controller.StartupCommand;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const STARTUP:String = "startup";
		
		public static function getInstance():ApplicationFacade
		{
			if ( instance == null ) instance = new ApplicationFacade();
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(ApplicationFacade.STARTUP, StartupCommand);
		}
		
		/**
		 * 启动PureMVC，在应用程序中调用此方法，并传递应用程序本身的引用
		 * @param	rootView	-	PureMVC应用程序的根视图root，包含其它所有的View Componet
		 */
		public function startUp(rootView:DisplayObjectContainer):void
		{
			sendNotification(STARTUP, rootView);
			removeCommand(STARTUP); //PureMVC初始化完成，注销STARUP命令
		}
	}
}