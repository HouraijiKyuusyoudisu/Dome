package;

import gameUI.MainUIbox;

import openfl.events.MouseEvent;
import openfl.events.*;
import zygame.utils.ZAssets;
import zygame.core.Start;
import zygame.display.ImageBitmap;

class Main extends Start {
    public var assets = new ZAssets();
	var bgimg:ImageBitmap;
	var UI:MainBox;
	var w:Int=1024;
	var h:Int= 768;
	public function new() {
		super(h, w, false);

       
	}
	
	override function onInit() {
		super.onInit();
					// 开始加载

			assets.loadFile("assets/background/bg.jpg");
			var UI = new MainBox(assets);
			assets.start((f) -> {
				if (f == 1) {
					trace("加载成功");
					bgimg = new ImageBitmap(assets.getBitmapData("bg"));
					this.addChildAt(bgimg,0);
					bgimg.scaleX=w/bgimg.width;
					bgimg.scaleY=h/bgimg.height;
					bgimg.x=0;
					UI.y = this.getStageHeight()/2-UI.height/2;
					UI.pushUi();
					this.addChild(UI);
				}
			}, (error) -> {
				trace("加载失败");
			});
			this.setFrameEvent(true);//开启帧事件
			this.setTouchEvent(true);//开启触摸事件
			UI.addEventListener(MouseEvent.CLICK,function(e) {
				UI.clickEvent(e.target);
			});

	}
	override public function onFrame():Void{

	}
	override public function onTouchOver(e:MouseEvent):Void{

	}

	override public function onTouchMove(e:TouchEvent):Void{
		}
}