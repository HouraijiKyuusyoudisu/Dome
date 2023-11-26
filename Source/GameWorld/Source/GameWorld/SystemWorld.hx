package gameWorld;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import openfl.utils.Object;
import zygame.components.ZBox;
import gameWorld.GameMap;
import zygame.display.ImageBitmap;
import openfl.display.BitmapData;
import zygame.components.ZImage;
import zygame.utils.ZAssets;
import gameWorld.GameData;
import gameWorld.SkillShow;
import gameWorld.GameRole;
import gameWorld.MidPoint;
class SystemWorld extends ZBox{
    public var map:GameMap;
    private var assets:ZAssets; 
    public var allPlayer:Array<GameRole>=[];
    public var skills:Array<SkillShow>=[];
    public var p1:GameRole;
    public var p2:GameRole;
    public var p3:GameRole;
    public var p4:GameRole;
    public var NS:GameRole;
    public var mid:MidPoint;
    public function new(assets:ZAssets){
        super();
        trace("主世界开始创建");
        this.assets = assets;
        map = new GameMap(assets.getBitmapData(GameData.mapTager+"0003"),assets.getBitmapData(GameData.mapTager+"0001"));
        this.addChildAt(map,0);
        trace("加入地图"+GameData.mapTager);
        p1 = new GameRole(assets.getBitmapData(GameData.roleTager),200,0,map);
        this.addChild(p1);
        allPlayer.push(p1);
        trace("加入一个玩家");
       this.setFrameEvent(true);
        trace("开启主世界帧事件");
        mid = new MidPoint();
        
    }
    override public function onFrame():Void{
		trace("开始循环");
        mid.setMid(p1.x,p1.y);
        for(sprite in this.allPlayer){
                sprite.toFream();
        }
        map.toFream(mid);
	}





    public function midpoint():Object{
        return ({
            "x":p1.x,
            "y":p1.y,
            "w":0,
            "h":0
        });
    }
}