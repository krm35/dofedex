class dofus.graphics.gapi.ui.NpcDialog["\x0f\b"] extends ank.gapi.core.UIBasicComponent
{
	function §\x0f\b§()
	{
		super();
	}
	function setValue(var2, var3, var4)
	{
		if(var2)
		{
			this._lblName.text = var4.name;
			this._lblLevel.text = var4.level;
		}
		else if(this._lblName.text != undefined)
		{
			this._lblName.text = "";
			this._lblLevel.text = "";
		}
	}
	function init()
	{
		super.init(false);
	}
}
