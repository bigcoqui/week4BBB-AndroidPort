package;

import openfl.filters.ShaderFilter;

class ShockwaveHandler
{
	public static var shockwave:ShaderFilter = new ShaderFilter(new Shockwave());
	
	public static function getValue(valName:String):Array<Float>
	{
		var daShit:Array<Float> = [];
		switch(valName)
		{
			case "texOffset":
				daShit = shockwave.shader.texOffset.value;
			case "centerX":
				daShit = shockwave.shader.centerX.value;
			case "centerY":
				daShit = shockwave.shader.centerY.value;
			case "radius":
				daShit = shockwave.shader.radius.value;
			case "scale":
				daShit = shockwave.shader.scale.value;
		}
		return daShit;
	}
	
	public static function setValue(valName:String, valueData:Array<Float>):Void
	{
		if (!Highscore.getPhoto())
		{
		switch(valName)
		{
			case "texOffset":
				shockwave.shader.texOffset.value = valueData;
			case "centerX":
				shockwave.shader.centerX.value = valueData;
			case "centerY":
				shockwave.shader.centerY.value = valueData;
			case "radius":
				shockwave.shader.radius.value = valueData;
			case "scale":
				shockwave.shader.scale.value = valueData;
		}
		}
	}
}