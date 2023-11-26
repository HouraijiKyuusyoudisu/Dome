package gameWorld;


import zygame.display.ImageBitmap;
import openfl.display.BitmapData;
import zygame.components.ZBox;
import gameWorld.MidPoint;
class GameMap extends ZBox{
    public var Stagewidth:Int = 700;
    public var Stageheight:Int = 500;
    public var backbitmap:ImageBitmap;
    public var beforbitmap:ImageBitmap;
    public function new(backbitmap:BitmapData,beforbitmap:BitmapData){
        super();
        this.backbitmap = new ImageBitmap(backbitmap);
        this.beforbitmap = new ImageBitmap(beforbitmap);
        this.addChildAt(this.backbitmap,0);
        this.addChildAt(this.beforbitmap,1);
        this.x=0;
        this.y=0;
        this.width = 200;
        this.height = 200;
    }
    public function updataMap(){

        
    }
    public function toFream(mid:MidPoint){

        




    }




}