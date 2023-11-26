import gameWorld.GameData;
import zygame.utils.ZAssets;


class GameDataLoading{

    public static var assets:ZAssets;
    public static function GameDataLoading(){
            assets = new ZAssets();
            GameData.GameData();
            assets.loadFile("assets/img/background/game.png");
		    assets.loadFile("assets/UI/Button/start.png");
            loadingMap();
            loadingRole();
            trace("GameDataLoading加载完成");
        }
    public static function getAssets():ZAssets {
        return assets;
    }
    public static function loadingMap(){
        assets.loadFile("assets/img/map/"+GameData.mapTager+"0001.png");
        assets.loadFile("assets/img/map/"+GameData.mapTager+"0003.jpg");
    }
    public static function loadingRole(){
        assets.loadFile("assets/img/role/"+GameData.roleTager+"/"+GameData.roleTager+".png");
    }
}