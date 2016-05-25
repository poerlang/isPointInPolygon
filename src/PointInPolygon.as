package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	
	public class PointInPolygon extends Sprite
	{

		private var txt:TextField;

		private var p:Yuan;

		private var container:Sprite;
		public function PointInPolygon()
		{
			container = new Sprite(); addChild(container);
			Yuan.container = container;
			txt = new TextField();
			txt.width = 200;
			txt.height = 30;
			txt.textColor = 0x333333;
			addChild(txt);
			stage.addEventListener(MouseEvent.CLICK,function(e:MouseEvent):void{
				new Yuan(e.stageX,e.stageY);
			});
			stage.addEventListener(MouseEvent.RIGHT_CLICK,function(e:MouseEvent):void{
				check();
			});
			p = new Yuan(150,150,0xff0000);
		}
		public static function ptInPolygon (p:*, areaPoints:Array):Boolean
		{
			// 交点个数
			var nCross:int = 0;
			for (var i:int = 0; i < areaPoints.length; i++)
			{
				var p1:* = areaPoints[i];
				var p2:* = areaPoints[(i + 1) % areaPoints.length];// 最后一个点与第一个点连线
				if ( p1.y == p2.y )
					continue;
				if ( p.y < Math.min(p1.y, p2.y) )
					continue;
				if ( p.y >=Math.max(p1.y, p2.y) )
					continue;
				// 求交点的x坐标
				var x:Number = (Number)(p.y - p1.y) * (Number)(p2.x - p1.x) / (Number)(p2.y - p1.y) + p1.x;
				// 只统计p1p2与p向右射线的交点
				if ( x > p.x )
				{
					nCross++;
				}
			}
			// 交点为偶数，点在多边形之外
			return (nCross % 2 == 1);
		}
		
		
		protected function check():void
		{
			var areaPoints:Array = [];
			for (var i:int = 0; i < container.numChildren; i++){
				var a:DisplayObject = container.getChildAt(i);
				if(a==p)continue;
				areaPoints.push(a);
			}
			txt.text = "红点是否在绿色矩形内: "+(ptInPolygon(p,areaPoints));
		}
	}
}