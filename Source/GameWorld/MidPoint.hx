package gameWorld;
class MidPoint{

    public var x:Int;
    public var y:Int;
    public var h:Int;
    public var w:Int;
    public function new(){
        
    }
    public function setMid(x:Float,y:Float){
        this.x = Std.int(x);
        this.y = Std.int(y);
        this.h=0;
        this.w=0;


    }


}