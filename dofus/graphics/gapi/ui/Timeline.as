class dofus.graphics.gapi.ui.Timeline extends dofus.graphics.gapi.core.DofusAdvancedComponent
{
	static var CLASS_NAME = "Timeline";
	static var bTimelineUpPosition = false;
	static var OPTION_BUTTONS_MOVE_DISTANCE = 40;
	static var UI_TIMELINE_MOVE_DISTANCE = 350;
	static var UI_PARTY_MOVE_DISTANCE = 39;
	function Timeline()
	{
		super();
	}
	static function __get__isTimelineUpPosition()
	{
		return dofus.graphics.gapi.ui.Timeline.bTimelineUpPosition;
	}
	function update()
	{
		this._tl.update();
	}
	function nextTurn(var2, var3)
	{
		this._tl.nextTurn(var2,var3);
	}
	function __get__timelineControl()
	{
		return this._tl;
	}
	function hideItem(var2)
	{
		this._tl.hideItem(var2);
	}
	function showItem(var2)
	{
		this._tl.showItem(var2);
	}
	function startChrono(var2)
	{
		this._tl.startChrono(var2);
	}
	function stopChrono()
	{
		this._tl.stopChrono();
	}
	function init()
	{
		super.init(false,dofus.graphics.gapi.ui.Timeline.CLASS_NAME);
	}
	function createChildren()
	{
		this.addToQueue({object:this,method:this.addListeners});
		if(dofus.graphics.gapi.ui.Timeline.bTimelineUpPosition)
		{
			this.moveTimeline(- dofus.graphics.gapi.ui.Timeline.UI_TIMELINE_MOVE_DISTANCE);
			var var2 = this.api.ui.getUIComponent("FightOptionButtons");
			if(var2 != undefined && var2._btnFlag._y == 370)
			{
				var2.moveButtons(dofus.graphics.gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
			}
			var var3 = this.api.ui.getUIComponent("Party");
			if(var3 != undefined && var3._btnBlockJoinerExceptParty._y == 41)
			{
				var3.moveUI(dofus.graphics.gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
			}
			this._btnUp._visible = false;
		}
		else
		{
			this._btnDown._visible = false;
		}
	}
	function addListeners()
	{
		this._btnUp.addEventListener("click",this);
		this._btnDown.addEventListener("click",this);
	}
	function click(var2)
	{
		var var3 = var2.target._name;
		if((var var0 = var3) !== "_btnUp")
		{
			if(var0 === "_btnDown")
			{
				dofus.graphics.gapi.ui.Timeline.bTimelineUpPosition = false;
				this._btnUp._visible = true;
				this._btnDown._visible = false;
				this.moveTimeline(dofus.graphics.gapi.ui.Timeline.UI_TIMELINE_MOVE_DISTANCE);
				this.api.ui.getUIComponent("FightOptionButtons").moveButtons(- dofus.graphics.gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
				this.api.ui.getUIComponent("Party").moveUI(- dofus.graphics.gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
			}
		}
		else
		{
			dofus.graphics.gapi.ui.Timeline.bTimelineUpPosition = true;
			this._btnUp._visible = false;
			this._btnDown._visible = true;
			this.moveTimeline(- dofus.graphics.gapi.ui.Timeline.UI_TIMELINE_MOVE_DISTANCE);
			this.api.ui.getUIComponent("FightOptionButtons").moveButtons(dofus.graphics.gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
			this.api.ui.getUIComponent("Party").moveUI(dofus.graphics.gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
		}
	}
	function destroy()
	{
		if(dofus.graphics.gapi.ui.Timeline.bTimelineUpPosition)
		{
			var var2 = this.api.ui.getUIComponent("FightOptionButtons");
			if(var2 != undefined && var2._btnFlag._y == 370 + dofus.graphics.gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE)
			{
				var2.moveButtons(- dofus.graphics.gapi.ui.Timeline.OPTION_BUTTONS_MOVE_DISTANCE);
			}
			var var3 = this.api.ui.getUIComponent("Party");
			if(var3 != undefined && var3._btnBlockJoinerExceptParty._y == 41 + dofus.graphics.gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE)
			{
				var3.moveUI(- dofus.graphics.gapi.ui.Timeline.UI_PARTY_MOVE_DISTANCE);
			}
		}
	}
	function moveTimeline(var2)
	{
		this._tl._y = this._tl._y + var2;
		this._btnUp._y = this._btnUp._y + var2;
		this._btnDown._y = this._btnDown._y + var2;
	}
}
