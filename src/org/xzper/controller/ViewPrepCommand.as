package org.xzper.controller
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.xzper.app.AppContainer;
	import org.xzper.view.ApplicationMediator;
	
	/**
	 * 所有的视图
	 */
	public class ViewPrepCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
//			var main:AppContainer = notification.getBody() as AppContainer;
//			facade.registerMediator( new ApplicationMediator(main) );
		}
	}
}