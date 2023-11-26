package gameWorld;

import openfl.events.MouseEvent;
import openfl.ui.Keyboard;
import lime.ui.KeyCode;
import openfl.events.KeyboardEvent;
import openfl.display.BitmapData;
import zygame.display.ImageBitmap;
import zygame.components.ZBox;
import gameWorld.MidPoint;
import gameWorld.GameMap;
class GameRole extends ZBox{

    public var maxHp:Int=1500;
    public var Hp:Int;
    public var maxMp:Int=600;
    public var Mp:Int;
    public var dam:Int;
    public var speed:Int;
    public var def:Int;
    public var stioc:Int=30;
    public var fps:Int = 2;
    public var fpsMath:Int = 0;
    public var god:Int=0;
    public var seeGameRole:GameRole;
    public var keyArray:Array<Int>=[Keyboard.A, Keyboard.D, Keyboard.S, Keyboard.W, Keyboard.J, Keyboard.K, Keyboard.L, Keyboard.U, Keyboard.I, Keyboard.O, Keyboard.P];
    public var troops:Int = 0;
    public var bitmp:ImageBitmap;
    public var fitmp:ImageBitmap;
    public var hitY:Int=0;
    public var jumpBooleam:Bool;
	public var rigid:Int=0;
    public var hitBoolean:Bool;
    public var frameInt = 0;
    public var txTime:Int =0;
    public var frameString:String;
    private var map:GameMap;
    public var keyString:String;
    public var keys:Array<Bool>;
	public var keyTime:Int;

    public function new(bitmapData:BitmapData,x:Int,y:Int,map:GameMap){
        super();
        this.bitmp = new ImageBitmap(bitmapData);
        this.addChild(bitmp);
        this.x = x;
        this.y = y;
        this.keys=[];
        this.map =map;
        stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
    }
        
    
    public function toFream(){
        if(this.hitY>0){
           // this.y+=this.hitY;
        }
        if(this.y<400){
            jumpBooleam = true;
        }
        else{
            jumpBooleam = false;
        }
        if(jumpBooleam){
            this.hitY++;
            if(this.hitY>10){
                this.hitY=10;
            }

        }
        else{
            this.hitY= 0;

        }
    }
    private function onKeyDown(evt:KeyboardEvent):Void{
        trace("你按住了一个键");
        keys[evt.keyCode]=true;
        this.x++;
        switch (evt.keyCode)
        {
           case Keyboard.A:
                this.keyString = (this.keyString + "A");
                this.keyTime = 10;
            case Keyboard.D:
                this.keyString = (this.keyString + "D");
                this.keyTime = 10;
            case Keyboard.S:
                this.keyString = (this.keyString + "S");
                this.keyTime = 10;
            case Keyboard.W:
                this.keyString = (this.keyString + "W");
                this.keyTime = 10;
        };
    }
    private function onKeyUp(evt:KeyboardEvent):Void {

        keys[evt.keyCode] = false;
    
    }


    public function getHp():Int {
        return this.Hp;
    }
    public function setHp(hp:Int) {
        this.Hp= hp;
    }
    public function setRigid(rigid:Int)
        {
            this.rigid = rigid;
            this.frameString = "受伤";
            this.hitBoolean = false;
            this.frameInt = 0;
            this.txTime = Std.int(this.rigid * 0.8);
        }
        private function updatePoint(mid:MidPoint)
            {
                if(this.map.scaleY <= 1 && this.map.scaleX <= 1)
                    {
                        if (this.x < (mid.x - 350))
                            {
                                this.x = (mid.x - 350);
                            }
                            else
                            {
                                if (this.x > (mid.x + 350))
                                {
                                    this.x = (mid.x + 350);
                                };
                            };

                    }
            }

}