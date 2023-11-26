package gameUI;
import zygame.display.ImageBitmap;
import zygame.components.ZBox.VBox;
import zygame.utils.ZAssets;
import gameUI.Uibutton;
class  MainBox extends VBox{
    var escBts:Array<ImageBitmap>=[];
    var assets:ZAssets;
    var uiName:Array<String>=[];
    public var buttonUis:Array<Uibutton>=[];

    public function new(assets:ZAssets) {
        super();
        this.gap = 20;
        this.assets = assets;
        this.assets.loadFile("assets/UI/Button/start.png");
        this.assets.loadFile("assets/UI/Button/guanyu.png");
        this.assets.loadFile("assets/UI/Button/cancel.png");
        uiName.push("cancel");
        uiName.push("start");
        uiName.push("guanyu");
    }
    public function pushUi(){
        for(i in 0...uiName.length){
            buttonUis[i] = new Uibutton(this.assets.getBitmapData(uiName[i]),uiName[i]);
            buttonUis[i].pushUi();
        }
        for(an in buttonUis){
            if(an.Btbit !=null){
            this.addChild(an);
            this.updateLayout();
            trace("已载入"+an.zhName+"按钮。");
            an.getName();
            }
        }
        
    }
    public function clickEvent(e){
        trace("你点击到了UI主界面");
    }
    override function onInit() {
		super.onInit();

	}
}