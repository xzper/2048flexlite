package org.xzper.controller
{
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.xzper.controller.commands.GameCommand;
	
	public class ControllerPrepCommand extends SimpleCommand implements ICommand
	{
		override public function execute(notification:INotification):void
		{
			(new GameCommand()).register();
		}
	}
}