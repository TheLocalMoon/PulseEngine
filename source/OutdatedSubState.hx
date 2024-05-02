package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var redTextFormat:FlxTextFormat = new FlxTextFormat(0xFF0000);
		var txt:FlxText = new FlxText(0, 0, FlxG.width, 32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.applyMarkup(
			"$HEY!$\n This engine is under heavy development.\n"
			+ "You can report all bugs in:\n"
			+ "https://discord.gg/zw3hDHG2wc\n"
			+ "\n"
			+ "The current engine version is 0.1.\n"
			+ "Press ESCAPE to continue\n",
			[new FlxTextFormatMarkerPair(redTextFormat, "$")]
		);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
