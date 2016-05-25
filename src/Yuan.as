package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;

	public class Yuan extends Sprite
	{
		public static var container:Sprite;
		public function Yuan(xx,yy,color:uint=0x00ff00,w:uint=2)
		{
			super();
			var g:Graphics = graphics;
			g.beginFill(color,1);
			g.drawCircle(0,0,w);
			g.endFill();
			x = xx;
			y = yy;
			container.addChild(this);
			buttonMode = true;
		}
		public function get pos():Point
		{
			return new Point(x,y);
		}
	}
}