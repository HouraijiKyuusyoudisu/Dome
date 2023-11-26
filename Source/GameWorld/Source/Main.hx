package;

import lime.ui.MouseButton;
import openfl.display.BitmapData;
import zygame.components.ZLabel;
import gameUI.MainUIbox;
import GameDataLoading;
import gameWorld.SystemWorld;
import openfl.events.MouseEvent;
import gameWorld.SystemWorld;
import openfl.events.*;
import zygame.utils.ZAssets;
import zygame.core.Start;
import zygame.display.ImageBitmap;
import zygame.components.ZBox;
import gameUI.Uibutton;
import gameWorld.GameData;
import GameDataLoading;
import openfl.ui.Keyboard;
class Main extends Start {
    public static var assets = new ZAssets();
	var bgimg:ImageBitmap;
	var UI:MainBox;
	var w:Int = 700;
	var h:Int = 500;
	var time:Int=0;
	var world:SystemWorld;
	var startGamebit:ImageBitmap;
	var startgameAn:Uibutton;
	public var gameStart:Bool;




	public function new() {
		super(w, h, false);
		this.setFrameEvent(false);
       
	}
	
	override function onInit() {
		super.onInit();
					// 开始加载
					trace("开始加载");
			GameData.GameData();
			GameDataLoading.GameDataLoading();
			GameDataLoading.assets.start((f) -> {
				if (f == 1) {
					assets = GameDataLoading.getAssets();
					trace("资源加载完成");
					bgimg = new ImageBitmap(assets.getBitmapData("game"));
					startgameAn = new Uibutton(assets.getBitmapData("start"),"startgame");
					startgameAn.pushUi();
					this.addChildAt(bgimg,0);
					this.addChild(startgameAn);
					startgameAn.x = w/2-startgameAn.width/2;
					startgameAn.y = h-startgameAn.height-20;
					bgimg.scaleX=w/bgimg.width;
					bgimg.scaleY=h/bgimg.height;
					bgimg.x=0;
					time = 100;
					//this.setFrameEvent(true);//开启帧事件
					//this.setTouchEvent(true);//开启触摸事件
				}
			}, (error) -> {
				trace("加载失败");
			});
			
	}
	public static function getAssets(values):ZAssets {
		return assets;
	}
	public function LoadWorld(){
		world = new SystemWorld(assets);
		this.setFrameEvent(false);//关闭帧事件
		this.setTouchEvent(false);//关闭触摸事件
		this.removeChild(bgimg);
		this.removeChild(bgimg);
		this.addChild(world);
		}


	override public function onFrame():Void{
		if(time == 100){
		if(this.startgameAn.gamestar==1 ){
			
			startgameAn.gamestar=0;
			LoadWorld();
		}
	}

	}
	override public function onTouchOver(e:MouseEvent):Void{

	}

	override public function onTouchMove(e:TouchEvent):Void{
		}


		
}