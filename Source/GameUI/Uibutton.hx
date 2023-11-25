package gameUI;
import openfl.display.BitmapData;
import zygame.display.ImageBitmap;
import zygame.components.ZBox;
import zygame.utils.ZAssets;
import openfl.events.TouchEvent;
import openfl.events.MouseEvent;
class Uibutton extends ZBox{
    public var Btbit:ImageBitmap;
    var bitmapdata:BitmapData;
    var assets:ZAssets;
    var addH:Float;
    var addW:Float;
    public var zhName:String;
    public function new(bitmapdata:BitmapData,name:String) {
        super();
        this.name = name;
        this.bitmapdata = bitmapdata;
        this.setTouchEvent(true);
        this.vAlign = RIGHT;
        this.addH = this.height;
        this.addW = this.width;
    }
    public function pushUi(){
        Btbit = new ImageBitmap(this.bitmapdata);
        switch (name){
            case "cancel":
                this.zhName = "退出游戏";
                Btbit.scaleX=0.2;
                Btbit.scaleY=0.2;
                
            case "start":
                this.zhName = "开始游戏";
            case "guanyu":
                this.zhName = "关于";          
        }
        this.addChild(Btbit);
    }
    public function clickEvent(){
        switch (name){
            case "cancel":
                trace("退出游戏");
                
            case "start":
                trace("开始游戏");     
            case "guanyu":
                trace("关于");        
        }
    }
    override function onInit() {
		super.onInit();

	}
    public function getName() {
       trace(this.zhName);
    }
    //在按钮上停留时
    override public function onTouchOver(e:MouseEvent):Void{
        this.alpha = 0.5;


    }
    //鼠标离开按钮时
    override public function onTouchOut(e:MouseEvent):Void{
        this.alpha =1;
        this.scaleX=1;
        this.scaleY=1;
    }
    //鼠标在按钮上面移动时
    override public function onTouchMove(e:TouchEvent):Void{


    }
    //当按下按钮时
    override public function onTouchBegin(e:TouchEvent):Void{
            trace("按下了"+this.zhName);
            this.alpha =0.6;
    }
    //当松开按钮时
    override public function onTouchEnd(e:TouchEvent):Void{
        this.scaleX=1;
        this.scaleY=1;
        this.alpha =0.5;
    }

}
