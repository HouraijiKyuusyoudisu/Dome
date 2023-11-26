package SystemComponent
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import game2016.RoleData;
    import flash.display.Shape;
    import flash.geom.Point;
    import flash.ui.Keyboard;
    import SystemEye.DataStorage;
    import game2016.RoleParsing;
    import flash.utils.getDefinitionByName;
    import eye.Draw.BitmapDataDraw;
    import SystemEye.SystemEvent;
    import SystemEye.GameData;
    import flash.events.KeyboardEvent;
    import SystemEye.NSGameData;
    import SystemEye.ComponentResourcesManage;
    import game2016.FPSMath;
    import gif2016.GIFManage;
    import p2p2016.P2PData;
    import SystemComponent.Word.QZ;
    import SystemComponent.Word.SkillShow;
    import SystemEye.SystemState;
    import flash.filters.ColorMatrixFilter;
    import game2016.FrameEffectManage;
    import game2016.SkillEffectManage;
    import flash.display.BlendMode;
    import SystemComponent.Word.RoleMathType;
    import SystemAPI.SkillMath;
    import person.darw.clear.BitmapClear;

    public class SystemGameRole extends Bitmap 
    {

        public var $target:String = "";
        public var $class:Class;
        private var $xml:XML;
        public var $bitmapData:BitmapData;
        public var $x:int = 300;
        public var $y:int = 300;
        public var $fps:int = 2;
        public var $fpsMath:int = 0;
        public var $actArray:Array;
        public var $keyArray:Array;
        public var $hitBoolean:Boolean = false;
        public var $jumpMath:Number = 0;
        public var $jumpBoolean:Boolean = false;
        public var $jumpFuckInt:int = 1;
        public var $jumpForFuckBoolean:Boolean = false;
        private var $fuckBoolean:Boolean = false;
        public var $jumpNumMath:int = 1;
        public var $troops:int = -1;
        public var $skillFrameInt:int = -1;
        public var $ob:Object;
        public var $skillCD:Object;
        public var $runKey:int = 0;
        public var $runEnter:int = 0;
        public var $lv:int = 10;
        public var $hit_num:Object = 0;
        public var $shouColor:Array;
        public var $fangCD:int = 0;
        public var isBreak:Boolean = false;
        public var $keyP:int = -1;
        public var $mode:String = "D";
        public var $modeString:String = "";
        public var $hpID:int = -1;
        public var fuckFlyCount:int = 0;
        public var $fuck:int = 25;
        public var $jump:int = 5;
        private var $jumpFu:Number = 1.25;
        private var $jumpFight:int = 1;
        public var $speed:int = 1;
        public var $runSpeed:int = 1;
        public var $jumpNum:int = 2;
        private var $gravity:Number = 1.2;
        public var $hpMax:int = 1500;
        private var $hp:cint;
        public var $mpMax:int = 600;
        public var $mp:int = 100;
        public var $fang:Number = 0;
        public var $god:int = 0;
        private var $reaction:int = 1;
        private var $reactionMath:int = 0;
        public var $stoic:int = 40;
        public var hurtThan:Number = 1;
        public var $rigid:int = 0;
        public var $tx:int = 0;
        public var $ty:int = 0;
        public var $fuz:int = 0;
        public var $ding:int = 0;
        private var lian:int = 0;
        public var _ex:int = 0;
        private var _ex_math:int = 0;
        private var hitkey:int = -1;
        public var qz:int = 1;
        public var qzFrameString:String = "none";
        public var $p2pmath:int = 6;
        public var roleData:RoleData;
        private var _xuanfu:int = 0;
        public var $bit:Bitmap;
        public var $dit:Bitmap;
        public var $fit:Bitmap;
        public var roleTarget:String = "";
        private var $frameStringCopy:String = "";
        public var $down:Boolean = false;
        public var $up:Boolean = false;
        public var $key:int = 0;
        public var $keyString:String = "";
        public var $keyTime:int = 0;
        public var $GameAttBoolean:Boolean = false;
        private var $runTime:int = 0;
        public var $frameInt:int = 0;
        private var $act:int = 0;
        public var $scaleX:int = 1;
        public var $scaleY:int = 1;
        private var $drawBoolean:Boolean = false;
        public var $frameString:String = "待机";
        public var $stopUpdateframeBoolean:Boolean = false;
        private var $jiuScaleX:int = 1;
        public var hitStop:int = 0;
        public var $fx:int = 0;
        public var $fy:int = 0;
        private var $hpShape:Shape;
        private var $aiRuning:String = "待机";
        private var $aiThinking:String = "平静";
        private var $seeRole:SystemGameRole;
        private var $see:int = 9900;
        private var $think:int = 80;
        private var $seeThink:int = 0;
        private var $jumpForFang:Boolean = false;
        public var $txTime:int = 0;
        public var $left:Boolean = false;
        public var $right:Boolean = false;
        private var $toRunBoolean:Boolean = false;
        private var $jx:int = 0;
        private var $jy:int = 0;
        private var xInt:int = 0;
        private var yInt:int = 0;
        private var widthInt:int = 0;
        private var heightInt:int = 0;
        private var pxy:Point;
        private var _effectiveFPS:int = 0;
        private var _fightFrame:int = 0;
        private var colorBoolean:Boolean = false;
        private var _currentFrame:int = 0;
        public var $fightOB:Object;
        public var $hrutVisible:Boolean = true;

        public function SystemGameRole(_arg_1:String)
        {
            this.$actArray = new Array();
            this.$keyArray = new Array(Keyboard.A, Keyboard.D, Keyboard.S, Keyboard.W, Keyboard.J, Keyboard.K, Keyboard.L, Keyboard.U, Keyboard.I, Keyboard.O, Keyboard.P);
            this.$ob = new Object();
            this.$skillCD = new Object();
            this.$hp = new cint(1500);
            this.$bit = new Bitmap(new BitmapData(4, 4, false, 0xFF0000));
            this.$dit = new Bitmap(new BitmapData(4, 20, false, 268435200));
            this.$fit = new Bitmap();
            this.pxy = new Point();
            this.$fightOB = new Object();
            this.$target = _arg_1;
        }

        public function set rigid(_arg_1:int):void
        {
            this.$rigid = _arg_1;
            this.frameString = "受伤";
            this.$hitBoolean = false;
            this.$frameInt = 0;
            this.$txTime = (this.$rigid * 0.8);
        }

        public function sethp(_arg_1:int)
        {
            this.$hp.value = _arg_1;
            if (this.$hp.value > this.$hpMax)
            {
                this.$hp.value = this.$hpMax;
            };
        }

        public function get gethp():int
        {
            return (this.$hp.value);
        }

        public function get Dam():int
        {
            return ((this.$fuck + this.$ob["BUFFFuck"]));
        }

        public function get Speed():int
        {
            return ((this.$speed + this.$ob["BUFFSpeed"]));
        }

        public function chanageRoleTarget(_arg_1:String):void
        {
            this.roleTarget = _arg_1;
            var _local_2:* = DataStorage.readImg(this.roleTarget);
            if (_local_2 != null)
            {
                this.$bitmapData = DataStorage.readImg(this.roleTarget);
            };
            var _local_3:* = DataStorage.readText(this.roleTarget);
            this.xml = new XML(_local_3);
            if ((((!((this.$xml.@type == undefined)))) && ((!((this.$xml.@type.indexOf("role_pkg") == -1))))))
            {
                this.roleData = new RoleData(_local_3);
                this.$class = RoleParsing;
            }
            else
            {
                this.roleData = null;
                if (this.name.indexOf("Freak") == -1)
                {
                    this.$class = (getDefinitionByName(("SystemComponent.Word.Role." + this.$target)) as Class);
                }
                else
                {
                    this.$class = (getDefinitionByName(("SystemComponent.Word.Freak." + this.$target)) as Class);
                };
            };
        }

        public function init():void
        {
            this.BUFFInit();
            this.chanageRoleTarget(this.$target);
            this.bitmapData = BitmapDataDraw.xmlForBitmapData(this.$bitmapData, this.$xml.act[0].SubTexture[0]);
            this.smoothing = true;
            if ((((this.name == "role1")) || ((this.name == "role2"))))
            {
                if (SystemP2P.$FightOK)
                {
                    if ((((this.name == "role1")) && ((SystemEvent.getP2PType() == "fight"))))
                    {
                        this.$keyP = 1;
                        this.$keyArray = GameData[(("$keyArray" + 1) + "P")];
                        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.Down);
                        stage.addEventListener(KeyboardEvent.KEY_UP, this.Up);
                    }
                    else
                    {
                        if ((((this.name == "role2")) && ((SystemEvent.getP2PType() == "accept"))))
                        {
                            this.$keyP = 1;
                            this.$keyArray = GameData[(("$keyArray" + 1) + "P")];
                            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.Down);
                            stage.addEventListener(KeyboardEvent.KEY_UP, this.Up);
                        }
                        else
                        {
                            this.$keyP = -1;
                        };
                    };
                }
                else
                {
                    this.$keyP = int(this.name.charAt(4));
                    if (!SystemP2P.$FightOK)
                    {
                        this.$keyArray = GameData[(("$keyArray" + this.$keyP) + "P")];
                    }
                    else
                    {
                        this.$keyP = 1;
                        this.$keyArray = GameData[(("$keyArray" + 1) + "P")];
                    };
                    stage.addEventListener(KeyboardEvent.KEY_DOWN, this.Down);
                    stage.addEventListener(KeyboardEvent.KEY_UP, this.Up);
                };
            };
            try
            {
                if ((((!((this.$xml.@type == undefined)))) && ((!((this.$xml.@type.indexOf("role_pkg") == -1))))))
                {
                    this.$class = RoleParsing;
                }
                else
                {
                    if (this.name.indexOf("Freak") == -1)
                    {
                        this.$class = (getDefinitionByName(("SystemComponent.Word.Role." + this.$target)) as Class);
                    }
                    else
                    {
                        this.$class = (getDefinitionByName(("SystemComponent.Word.Freak." + this.$target)) as Class);
                    };
                };
            }
            catch(e:Error)
            {
            };
            this.parent.addChild(this.$bit);
            this.parent.addChild(this.$dit);
            this.parent.addChild(this.$fit);
            this.$bit.visible = false;
            this.$dit.visible = false;
            this.$fit.visible = false;
            this.setNengLi();
        }

        public function setNengLi():void
        {
            var _local_1:Object = GameData.$roleNengLi[this.$target];
            var _local_2:Number = 0;
            if ((((((((GameData.$mode == "1PALL")) || ((GameData.$mode == "SZ")))) || ((GameData.$mode == "TwoAll")))) && ((this.$keyP == -1))))
            {
                switch (GameData.$lv)
                {
                    case 95:
                        _local_2 = 0;
                        break;
                    case 80:
                        _local_2 = 0.05;
                        break;
                    case 65:
                        _local_2 = 0.1;
                        break;
                    case 50:
                        _local_2 = 0.15;
                        break;
                    case 35:
                        _local_2 = 0.2;
                        break;
                };
            };
            if (_local_1)
            {
                this.$jump = (_local_1.jump - 5);
                this.$speed = _local_1.speed;
                if ((((!((this.name === "role1")))) && ((!((this.name === "role2"))))))
                {
                    this.$fuck = (((int(_local_1.li) * this.$lv) / 10) + (_local_1.li * _local_2));
                    this.$hpMax = (((int(_local_1.hp) * this.$lv) / 10) + (_local_1.hp * _local_2));
                    this.$hp.value = this.$hpMax;
                    this.$mpMax = ((_local_1.mp * this.$lv) / 10);
                    this.$mp = (_local_1.mp * 0.2);
                    this.$fang = (((int(_local_1.fang) * this.$lv) / 10) / 25);
                }
                else
                {
                    if (GameData.ns_select !== "none")
                    {
                        this.$lv = (NSGameData.lv * 10);
                        this.$fuck = (int(_local_1.li) * NSGameData.lv);
                        this.$hpMax = (int(_local_1.hp) * NSGameData.lv);
                        this.$hp.value = this.$hpMax;
                        this.$mpMax = (int(_local_1.mp) * NSGameData.lv);
                        this.$mp = (_local_1.mp * 0.2);
                        this.$fang = ((int(_local_1.fang) * NSGameData.lv) / 25);
                        if (NSGameData.hp !== -1)
                        {
                            this.$hp.value = NSGameData.hp;
                            this.$mp = NSGameData.mp;
                        };
                    }
                    else
                    {
                        this.$fuck = ((int(_local_1.li) * this.$lv) / 10);
                        this.$hpMax = ((int(_local_1.hp) * this.$lv) / 10);
                        this.$hp.value = this.$hpMax;
                        this.$mpMax = ((_local_1.mp * this.$lv) / 10);
                        this.$mp = (_local_1.mp * 0.2);
                        this.$fang = (((int(_local_1.fang) * this.$lv) / 10) / 25);
                    };
                };
                if ((((!((_local_1.hurt == null)))) && ((_local_1.hurt > 0))))
                {
                    this.hurtThan = _local_1.hurt;
                };
            };
        }

        public function DZ():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:* = ComponentResourcesManage.$Ob["SystemWord"].$elementsOb["bit"];
            while ((!(this.endRed(_local_3))))
            {
                _local_1 = this;
                _local_2 = (this.$y + 1);
                _local_1.$y = _local_2;
            };
            while (this.$bit.bitmapData.hitTest(new Point(this.$x, this.$y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))
            {
                _local_1 = this;
                _local_2 = (this.$y - 1);
                _local_1.$y = _local_2;
                this.$jumpBoolean = false;
            };
        }

        public function mapDZ():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:* = ComponentResourcesManage.$Ob["SystemWord"].$elementsOb["bit"];
            while (this.$bit.bitmapData.hitTest(new Point(this.$x, this.$y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))
            {
                _local_1 = this;
                _local_2 = (this.$y - 1);
                _local_1.$y = _local_2;
                this.$jumpBoolean = false;
            };
        }

        public function set xml(_arg_1:XML):void
        {
            var _local_2:* = 0;
            this.$xml = _arg_1;
            this.$actArray = [];
            while (_local_2 < this.$xml.act.length())
            {
                this.$actArray.push(String(this.$xml.act[_local_2].@name));
                _local_2++;
            };
            this.$frameInt = 0;
            this.stopSkill();
            this.frameString = "待机";
        }

        public function get xml():XML
        {
            return (this.$xml);
        }

        public function set frameString(_arg_1:String):void
        {
            if ((((_arg_1 == "行走")) && ((this.$actArray.indexOf(_arg_1) == -1))))
            {
                _arg_1 = "跑步";
                this.$toRunBoolean = true;
            };
            if (this.$actArray.indexOf(_arg_1) !== -1)
            {
                if ((((((((!((this.$frameString === _arg_1)))) && ((!(this.$hitBoolean))))) || ((_arg_1 == "受伤")))) || ((((this.$frameStringCopy == "落下")) && ((_arg_1 == "跳跃"))))))
                {
                    if ((((this.$frameStringCopy == "落下")) && ((_arg_1 == "跳跃"))))
                    {
                        this.stopSkill();
                    };
                    this.$frameString = _arg_1;
                };
            };
        }

        private function enterFrameString():void
        {
            if (this.$mode == "K")
            {
                this.$jumpBoolean = false;
            };
            if (this.$modeString !== "")
            {
                this.frameString = this.$modeString;
                this.$modeString = "";
            };
            if (this.$frameStringCopy !== this.$frameString)
            {
                this.$frameInt = 0;
                this.$fpsMath = 0;
                this.$fuckBoolean = false;
            };
        }

        public function set fuckY(_arg_1:int):void
        {
            if (_arg_1 > 8)
            {
                _arg_1 = (_arg_1 - 5);
            };
            if (_arg_1 < 0)
            {
                this.$jumpForFuckBoolean = true;
            };
            this.$jumpBoolean = true;
            this.$hitBoolean = false;
            this.$down = false;
            var _local_2:* = this;
            var _local_3:* = (this.$y - 1);
            _local_2.$y = _local_3;
            this.$y = (this.$y - ((FPSMath.getFPSScale(this) * _arg_1) + 5));
            if ((-(_arg_1) / this.$gravity) > 0)
            {
                this.$jumpMath = (this.$jumpMath + (-(_arg_1) / this.$gravity));
            }
            else
            {
                this.$jumpMath = (-(_arg_1) / this.$gravity);
            };
        }

        public function getMP(param1:String):int
        {
            var s:* = param1;
            try
            {
                if (this.$class["$ob"][s]["mp"] == undefined)
                {
                    return (0);
                };
                return (this.$class["$ob"][s]["mp"]);
            }
            catch(e:Error)
            {
                return (0);
            };
            return (0);
        }

        public function set hitString(_arg_1:String):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:* = null;
            var _local_5:* = 0;
            if (this.$actArray.indexOf(_arg_1) !== -1)
            {
                if (this.roleData)
                {
                    RoleParsing.$ob = this.roleData.skillData;
                };
                if (!this.$class.$ob)
                {
                    return;
                };
                _local_4 = "FUCK";
                if (this.$class.$ob[_arg_1] !== undefined)
                {
                    if (this.$class.$ob[_arg_1].mode !== undefined)
                    {
                        _local_4 = this.$class.$ob[_arg_1].mode;
                    };
                };
                if ((((((((!((this.$frameString === _arg_1)))) && ((!((_arg_1 === "none")))))) && ((!(this.$jumpForFuckBoolean))))) && ((((_local_4 == "DK")) || ((!((this.$frameString === "受伤"))))))))
                {
                    if ((((((_arg_1 == "空中攻击")) && ((!((this.$ob.kong === true)))))) || ((!((_arg_1 === "空中攻击"))))))
                    {
                        if (int(this.$skillCD[_arg_1]) <= 0)
                        {
                            _local_5 = this.getMP(_arg_1);
                            if ((((this.$mp >= _local_5)) || ((GameData.$mode == "1PSB"))))
                            {
                                _local_2 = this;
                                _local_3 = (this._ex + 1);
                                _local_2._ex = _local_3;
                                this._ex_math = 36;
                                this.$mp = (this.$mp - _local_5);
                                if (this.$class !== null)
                                {
                                    if (this.$class.$ob[_arg_1] !== undefined)
                                    {
                                        if ((((!(Main.IS_TEST))) || ((!(Main.IS_PREVIEW)))))
                                        {
                                            this.$skillCD[_arg_1] = (this.$class.$ob[_arg_1].cd * 36);
                                        };
                                        if (this.$skillCD[_arg_1] > 0)
                                        {
                                            this.$skillCD.setPropertyIsEnumerable(_arg_1, true);
                                        };
                                        if (this.$class.$ob[_arg_1].key == Keyboard.O)
                                        {
                                            ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                                                "fps":1,
                                                "mode":"tx",
                                                "name":"GameAtt",
                                                "fuck":0,
                                                "time":0,
                                                "role":this,
                                                "x":this.$x,
                                                "y":this.$y,
                                                "scaleX":(this.$scaleX * 1.2)
                                            });
                                            GameData.$KaTime = 20;
                                        };
                                    };
                                };
                                if ((((!((_arg_1 === "普通攻击")))) && ((!((_arg_1 === "空中攻击"))))))
                                {
                                    this.$keyString = "";
                                    this.$ob["Di"] = null;
                                };
                                if ((((_arg_1 == "空中攻击")) && ((this.$jumpFuckInt > 0))))
                                {
                                    _local_2 = this;
                                    _local_3 = (this.$jumpFuckInt - 1);
                                    _local_2.$jumpFuckInt = _local_3;
                                    this.drFrameString = _arg_1;
                                }
                                else
                                {
                                    if (_arg_1 !== "空中攻击")
                                    {
                                        this.drFrameString = _arg_1;
                                        this.$txTime = 0;
                                    };
                                };
                                if (_arg_1 == "瞬步")
                                {
                                    ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                                        "name":"shun",
                                        "fuck":0,
                                        "time":0,
                                        "role":this,
                                        "x":this.$x,
                                        "y":this.$y,
                                        "scaleX":(this.$scaleX * 0.7)
                                    });
                                };
                                this.$rigid = 0;
                                this.$tx = 0;
                                this.$txTime = 0;
                                this._fightFrame = -1;
                                if (this.$left)
                                {
                                    this.$scaleX = -1;
                                }
                                else
                                {
                                    if (this.$right)
                                    {
                                        this.$scaleX = 1;
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if (_arg_1 == "起身")
                    {
                        this.drFrameString = "起身";
                    };
                };
            };
            this.$GameAttBoolean = false;
        }

        public function set drFrameString(_arg_1:String):void
        {
            this.$frameString = _arg_1;
            this.$frameInt = 0;
            this.$fpsMath = 0;
            this.$reactionMath = 0;
            this.$hitBoolean = true;
            this.$fuckBoolean = false;
            this.$skillFrameInt = -1;
        }

        private function GameAtt(_arg_1:uint, _arg_2:String):void
        {
            if (_arg_2 !== "none")
            {
                this.$GameAttBoolean = (((_arg_1 == Keyboard.O)) || ((_arg_1 == Keyboard.NUMPAD_6)));
            }
            else
            {
                this.$GameAttBoolean = false;
            };
        }

        private function Down(_arg_1:KeyboardEvent):void
        {
            var _local_2:String;
            if (GIFManage.isSaveing())
            {
                return;
            };
            if (SystemEvent.getP2PType() == "accept")
            {
                if (P2PData.p2p)
                {
                    P2PData.p2p.send("onAcceptKeyDown", _arg_1.keyCode);
                };
                return;
            };
            if (((((GameData.$fightBoolean) && ((!((_arg_1.keyCode === this.$key)))))) && ((!((this.$keyP == -1))))))
            {
                switch (_arg_1.keyCode)
                {
                    case this.$keyArray[0]:
                        this.$keyString = (this.$keyString + "A");
                        this.$keyTime = 10;
                        break;
                    case this.$keyArray[1]:
                        this.$keyString = (this.$keyString + "D");
                        this.$keyTime = 10;
                        break;
                    case this.$keyArray[2]:
                        this.$keyString = (this.$keyString + "S");
                        this.$keyTime = 10;
                        break;
                    case this.$keyArray[3]:
                        this.$keyString = (this.$keyString + "W");
                        this.$keyTime = 10;
                        break;
                };
                if (!this.$hitBoolean)
                {
                    switch (_arg_1.keyCode)
                    {
                        case this.$keyArray[0]:
                            this.$left = true;
                            this.$runTime = 15;
                            this.toRun(this.$keyArray[0]);
                            this.$runEnter = 20;
                            break;
                        case this.$keyArray[1]:
                            this.$right = true;
                            this.$runTime = 15;
                            this.toRun(this.$keyArray[1]);
                            this.$runEnter = 20;
                            break;
                        case this.$keyArray[2]:
                            this.$down = true;
                            break;
                        case this.$keyArray[3]:
                            this.$up = true;
                            break;
                    };
                }
                else
                {
                    switch (_arg_1.keyCode)
                    {
                        case this.$keyArray[0]:
                            this.$left = true;
                            break;
                        case this.$keyArray[1]:
                            this.$right = true;
                            break;
                        case this.$keyArray[2]:
                            this.$down = true;
                            break;
                        case this.$keyArray[3]:
                            this.$up = true;
                            break;
                    };
                };
                if (!this.$hitBoolean)
                {
                    this.qz = 1;
                    this.qzFrameString = "none";
                    this.hitkey = -1;
                    this.lian = 0;
                    switch (_arg_1.keyCode)
                    {
                        case this.$keyArray[10]:
                        case this.$keyArray[9]:
                            this.qz = 0;
                        case this.$keyArray[4]:
                        case this.$keyArray[6]:
                        case this.$keyArray[7]:
                        case this.$keyArray[8]:
                        case this.$keyArray[10]:
                            _local_2 = "none";
                            _local_2 = this.getSkillName(GameData.$keyArray1P[GameData[(("$keyArray" + this.$keyP) + "P")].indexOf(_arg_1.keyCode)]);
                            this.GameAtt(_arg_1.keyCode, _local_2);
                            this.hitString = _local_2;
                            this.hitkey = _arg_1.keyCode;
                            break;
                        case this.$keyArray[5]:
                            if ((((!((this.$frameString === "受伤")))) && ((!((this.$ob.aimode === "K"))))))
                            {
                                if (!this.$down)
                                {
                                    this.goJump();
                                }
                                else
                                {
                                    if (!this.$jumpBoolean)
                                    {
                                        this.$y = (this.$y + (FPSMath.getFPSScale(this) * 20));
                                        this.$jumpMath = 5;
                                        this.$jumpBoolean = true;
                                    };
                                };
                            }
                            else
                            {
                                if (this.$ob.aimode == "K")
                                {
                                    this.$jumpForFang = true;
                                };
                            };
                            break;
                    };
                }
                else
                {
                    if (((((this.$hitBoolean) && ((((this.hitkey == _arg_1.keyCode)) || ((_arg_1.keyCode == Keyboard.K)))))) && ((!((_arg_1.keyCode === Keyboard.P))))))
                    {
                        this.lian = 9;
                        switch (_arg_1.keyCode)
                        {
                            case this.$keyArray[10]:
                            case this.$keyArray[9]:
                                this.qz = 0;
                            case this.$keyArray[4]:
                            case this.$keyArray[6]:
                            case this.$keyArray[7]:
                            case this.$keyArray[8]:
                                if (this.$frameString == "普通攻击")
                                {
                                    _local_2 = "none";
                                    _local_2 = this.getSkillName(GameData.$keyArray1P[GameData[(("$keyArray" + this.$keyP) + "P")].indexOf(_arg_1.keyCode)]);
                                    if ((((((((!((_local_2 === "普通攻击")))) && ((!((_local_2 === "空中攻击")))))) && ((((!((_local_2 === "瞬步")))) || ((this.$target == "MoHuaJianXin")))))) && ((!((_local_2 === this.$frameStringCopy))))))
                                    {
                                        this.qz--;
                                        this.hitStopClear();
                                        this.goQZ();
                                        this.GameAtt(_arg_1.keyCode, _local_2);
                                        this.hitString = _local_2;
                                        this.hitkey = _arg_1.keyCode;
                                        this.qzFrameString = _local_2;
                                    };
                                    if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asA) == "stop")
                                    {
                                        this.lian = 0;
                                        this.$frameInt++;
                                        this.$reactionMath = 0;
                                        this.$stopUpdateframeBoolean = true;
                                    };
                                }
                                else
                                {
                                    if ((((this.$frameInt >= 5)) && ((this.qz > 0))))
                                    {
                                        _local_2 = this.getSkillName(GameData.$keyArray1P[GameData[(("$keyArray" + this.$keyP) + "P")].indexOf(_arg_1.keyCode)]);
                                        if ((((((((!((_local_2 === "普通攻击")))) && ((!((_local_2 === "空中攻击")))))) && ((!((_local_2 === "瞬步")))))) && ((!((_local_2 === this.$frameStringCopy))))))
                                        {
                                            this.qz--;
                                            this.hitStopClear();
                                            this.goQZ();
                                            this.GameAtt(_arg_1.keyCode, _local_2);
                                            this.hitString = _local_2;
                                            this.hitkey = _arg_1.keyCode;
                                            this.qzFrameString = _local_2;
                                        };
                                    };
                                };
                                break;
                            case this.$keyArray[5]:
                                if ((((!((this.$frameString === "受伤")))) && ((this.$frameString == "普通攻击"))))
                                {
                                    this.goJump();
                                };
                                break;
                        };
                    }
                    else
                    {
                        if ((((((this.qz > 0)) && ((this.$frameInt >= 3)))) && ((!((_arg_1.keyCode === Keyboard.P))))))
                        {
                            switch (_arg_1.keyCode)
                            {
                                case this.$keyArray[9]:
                                    this.qz = 0;
                                case this.$keyArray[4]:
                                case this.$keyArray[6]:
                                case this.$keyArray[7]:
                                case this.$keyArray[8]:
                                case this.$keyArray[10]:
                                    _local_2 = this.getSkillName(GameData.$keyArray1P[GameData[(("$keyArray" + this.$keyP) + "P")].indexOf(_arg_1.keyCode)]);
                                    if ((((((!((_local_2 === "普通攻击")))) && ((!((_local_2 === "空中攻击")))))) && ((!((_local_2 === "瞬步"))))))
                                    {
                                        this.qz--;
                                        this.hitStopClear();
                                        this.goQZ();
                                        this.GameAtt(_arg_1.keyCode, _local_2);
                                        this.hitString = _local_2;
                                        this.hitkey = _arg_1.keyCode;
                                        this.qzFrameString = _local_2;
                                    };
                                    break;
                            };
                        };
                    };
                };
                this.$key = _arg_1.keyCode;
            };
        }

        private function getSkillName(_arg_1:int):String
        {
            var _local_2:*;
            if (this.roleData)
            {
                RoleParsing.$ob = this.roleData.skillData;
            };
            var _local_3:* = "none";
            if (this.$jumpBoolean)
            {
                _local_2 = this.$class;
                _local_3 = _local_2["getKeyJumpString"](this, _arg_1);
            }
            else
            {
                if (!this.$jumpBoolean)
                {
                    _local_2 = this.$class;
                    _local_3 = _local_2["getKeyString"](this, _arg_1);
                };
            };
            return (_local_3);
        }

        public function hitStopClear():void
        {
            this.hitStop = 0;
        }

        public function goQZ(_arg_1:Number=1, _arg_2:Number=2.55, _arg_3:Number=2.55, _arg_4:Boolean=true):void
        {
            this.alpha = 1;
            var _local_5:* = new QZ(this.bitmapData.clone(), (_arg_1 * 10), (_arg_2 * 10), (_arg_3 * 10), _arg_4);
            _local_5.x = this.x;
            _local_5.y = this.y;
            this.parent.addChildAt(_local_5, 1);
        }

        public function toDown(_arg_1:int):void
        {
            if (GameData.$fightBoolean)
            {
                switch (_arg_1)
                {
                    case this.$keyArray[0]:
                        this.$keyString = (this.$keyString + "A");
                        this.$keyTime = 10;
                        break;
                    case this.$keyArray[1]:
                        this.$keyString = (this.$keyString + "D");
                        this.$keyTime = 10;
                        break;
                    case this.$keyArray[2]:
                        this.$keyString = (this.$keyString + "S");
                        this.$keyTime = 10;
                        break;
                    case this.$keyArray[3]:
                        this.$keyString = (this.$keyString + "W");
                        this.$keyTime = 10;
                        break;
                };
                if (!this.$hitBoolean)
                {
                    if (this.$key !== _arg_1)
                    {
                        switch (_arg_1)
                        {
                            case this.$keyArray[0]:
                            case this.$keyArray[1]:
                            case this.$keyArray[2]:
                            case this.$keyArray[3]:
                            case this.$keyArray[4]:
                            case this.$keyArray[6]:
                            case this.$keyArray[7]:
                            case this.$keyArray[8]:
                            case this.$keyArray[9]:
                            case this.$keyArray[10]:
                            case this.$keyArray[5]:
                                break;
                        };
                    };
                    switch (_arg_1)
                    {
                        case this.$keyArray[0]:
                            break;
                        case this.$keyArray[1]:
                            break;
                        case this.$keyArray[2]:
                            break;
                        case this.$keyArray[3]:
                            break;
                        case this.$keyArray[4]:
                        case this.$keyArray[6]:
                        case this.$keyArray[7]:
                        case this.$keyArray[8]:
                        case this.$keyArray[9]:
                        case this.$keyArray[10]:
                            break;
                        case this.$keyArray[5]:
                            if ((((!((this.$frameString === "受伤")))) && ((!((this.$ob.aimode === "K"))))))
                            {
                                if (this.$down)
                                {
                                    if (!this.$jumpBoolean)
                                    {
                                    };
                                };
                            };
                            break;
                    };
                }
                else
                {
                    if (this.$hitBoolean)
                    {
                        if (this.$key !== GameData.$keyArray1P[GameData[(("$keyArray" + 1) + "P")].indexOf(_arg_1)])
                        {
                            switch (_arg_1)
                            {
                                case this.$keyArray[0]:
                                case this.$keyArray[1]:
                                case this.$keyArray[2]:
                                case this.$keyArray[3]:
                                case this.$keyArray[4]:
                                case this.$keyArray[6]:
                                case this.$keyArray[7]:
                                case this.$keyArray[8]:
                                case this.$keyArray[9]:
                                case this.$keyArray[10]:
                                case this.$keyArray[5]:
                                    break;
                            };
                        };
                        switch (_arg_1)
                        {
                            case this.$keyArray[0]:
                                break;
                            case this.$keyArray[1]:
                                break;
                            case this.$keyArray[2]:
                                break;
                            case this.$keyArray[3]:
                                break;
                            case this.$keyArray[4]:
                            case this.$keyArray[4]:
                            case this.$keyArray[6]:
                            case this.$keyArray[7]:
                            case this.$keyArray[8]:
                            case this.$keyArray[9]:
                            case this.$keyArray[10]:
                                if (this.$frameString == "普通攻击")
                                {
                                    if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asA) == "stop")
                                    {
                                    };
                                }
                                else
                                {
                                    if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asA) == "stop")
                                    {
                                    };
                                };
                                break;
                            case this.$keyArray[5]:
                                if ((((!((this.$frameString === "受伤")))) && ((this.$frameString == "普通攻击"))))
                                {
                                };
                                break;
                        };
                    };
                };
                this.$key = _arg_1;
            };
        }

        public function toUp(_arg_1:int):void
        {
            this.$key = -1;
            switch (_arg_1)
            {
                case this.$keyArray[0]:
                case this.$keyArray[1]:
                case this.$keyArray[2]:
                case this.$keyArray[3]:
                    break;
            };
            switch (_arg_1)
            {
                case this.$keyArray[0]:
                    return;
                case this.$keyArray[1]:
                    return;
                case this.$keyArray[2]:
                    return;
                case this.$keyArray[3]:
                    return;
                case this.$keyArray[5]:
                    return;
            };
        }

        private function Up(_arg_1:KeyboardEvent):void
        {
            var _local_2:*;
            var _local_3:SkillShow;
            if (GIFManage.isSaveing())
            {
                return;
            };
            if (SystemEvent.getP2PType() == "accept")
            {
                if (P2PData.p2p)
                {
                    P2PData.p2p.send("onAcceptKeyUp", _arg_1.keyCode);
                };
                return;
            };
            this.$key = -1;
            if (SystemState.$socketBoolean)
            {
                switch (_arg_1.keyCode)
                {
                    case this.$keyArray[0]:
                    case this.$keyArray[1]:
                    case this.$keyArray[2]:
                    case this.$keyArray[3]:
                        SystemWebSocket.app(_arg_1.keyCode, "up");
                        break;
                };
            }
            else
            {
                switch (_arg_1.keyCode)
                {
                    case this.$keyArray[0]:
                        this.$left = false;
                        this.$runKey = this.$keyArray[0];
                        return;
                    case this.$keyArray[1]:
                        this.$right = false;
                        this.$runKey = this.$keyArray[1];
                        return;
                    case this.$keyArray[2]:
                        this.$down = false;
                        this.$fangCD = 36;
                        return;
                    case this.$keyArray[3]:
                        this.$up = false;
                        if (GameData.ns_select !== "none")
                        {
                            for (_local_2 in GameData.ns_end)
                            {
                                _local_3 = GameData.ns_end[_local_2];
                                if ((((Math.abs((_local_3.$x - this.$x)) < 30)) && ((Math.abs((_local_3.$y - this.$y)) < 30))))
                                {
                                    if (_local_3.$ob.to !== -1)
                                    {
                                        GameData.$fightBoolean = false;
                                        GameData.ns_ob[GameData.ns_select]["card"] = _local_3.$ob.to;
                                        NSGameData.$tox = ((_local_3.$ob.tox) ? _local_3.$ob.tox : -1);
                                        GameData.ns_end = null;
                                        GameData.$mapTarget = _local_3.name;
                                        ComponentResourcesManage.$word.$map.updateMap();
                                        ComponentResourcesManage.$word.again();
                                    }
                                    else
                                    {
                                        GameData.ns_select = "over";
                                        ComponentResourcesManage.$word.CG();
                                        ComponentResourcesManage.$stage.$box.$api.addShow("#000000", ("&GameData.$mode - " + GameData.$mode));
                                    };
                                };
                            };
                        };
                        return;
                    case this.$keyArray[5]:
                        this.$jumpForFang = false;
                        return;
                };
            };
        }

        public function SocketDown(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case this.$keyArray[0]:
                    break;
                case this.$keyArray[1]:
                    break;
                case this.$keyArray[2]:
                    break;
                case this.$keyArray[3]:
                    break;
                case this.$keyArray[4]:
                case this.$keyArray[6]:
                case this.$keyArray[7]:
                case this.$keyArray[8]:
                case this.$keyArray[9]:
                case this.$keyArray[10]:
                    break;
                case this.$keyArray[5]:
                    if ((((this.$jumpNumMath > 0)) && ((!((this.$frameString === "受伤"))))))
                    {
                        if (this.$jumpForFuckBoolean)
                        {
                        };
                    };
                    break;
            };
            if (this.$hitBoolean)
            {
                switch (_arg_1)
                {
                    case this.$keyArray[0]:
                        return;
                    case this.$keyArray[1]:
                        return;
                    case this.$keyArray[2]:
                        return;
                    case this.$keyArray[3]:
                        return;
                    case this.$keyArray[4]:
                    case this.$keyArray[4]:
                    case this.$keyArray[6]:
                    case this.$keyArray[7]:
                    case this.$keyArray[8]:
                    case this.$keyArray[9]:
                    case this.$keyArray[10]:
                        if (this.$frameString == "普通攻击")
                        {
                            if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asA) == "stop")
                            {
                            };
                        }
                        else
                        {
                            if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asA) == "stop")
                            {
                            };
                        };
                        return;
                    case this.$keyArray[5]:
                        return;
                };
            };
        }

        public function SocketUp(_arg_1:int):void
        {
            switch (_arg_1)
            {
                case Keyboard.A:
                    this.$left = false;
                    this.$runKey = this.$keyArray[0];
                    return;
                case Keyboard.D:
                    this.$right = false;
                    this.$runKey = this.$keyArray[1];
                    return;
                case this.$keyArray[2]:
                    this.$down = false;
                    this.frameString = "待机";
                    return;
                case this.$keyArray[3]:
                    this.$up = false;
                    return;
            };
        }

        public function toFrame(_arg_1:Object=null):void
        {
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            var _local_9:*;
            var _local_5:* = null;
            var _local_6:* = null;
           
            if (GameData.$KaBoolean)
            {
                return;
            };
            var _local_7:* = new Point(this.$x, this.$y);
            var _local_8:* = ComponentResourcesManage.$word.midpoint();
            if (this.hitStop > 0)
            {
                _local_2 = this;
                _local_3 = (this.hitStop - 1);
                _local_2.hitStop = _local_3;
                this.updatePoint(_local_8, _local_7);
                return;
            };
            if ((((this.$frameString == "落地")) && (((this.$left) || (this.$right)))))
            {
                this.stopSkill();
            };
            this.$jiuScaleX = this.$scaleX;
            if (this.$class)
            {
                _local_5 = ComponentResourcesManage.$Ob["SystemWord"].$elementsOb["bit"];
                if (!GameData.$KaBoolean)
                {
                    this.BUFFInit();
                    if (!this.$hitBoolean)
                    {
                        this._ex_math = (this._ex_math - (((this._ex_math > 0)) ? 1 : 0));
                        if (this._ex_math <= 0)
                        {
                            this._ex = 0;
                        };
                    };
                    if (this.$frameString == "待机")
                    {
                        this.filters = [];
                    };
                    if (this.$keyTime > 0)
                    {
                        _local_2 = this;
                        _local_3 = (this.$keyTime - 1);
                        _local_2.$keyTime = _local_3;
                    }
                    else
                    {
                        this.$keyString = "";
                    };
                    this.$frameStringCopy = this.$frameString;
                    if (this.$runEnter > 0)
                    {
                        _local_2 = this;
                        _local_3 = (this.$runEnter - 1);
                        _local_2.$runEnter = _local_3;
                    }
                    else
                    {
                        this.$runKey = -1;
                    };
                    _local_2 = this.$ob;
                    if ((((this.$ob["StopCD"] == undefined)) || ((this.$ob["StopCD"] <= 0))))
                    {
                        this.cd();
                    }
                    else
                    {
                        _local_3 = "StopCD";
                        _local_4 = (_local_2["StopCD"] - 1);
                        _local_2[_local_3] = _local_4;
                    };
                    if ((((((this.$keyP == -1)) && (GameData.$fightBoolean))) && (((((int((_local_2.ai > 0))) || ((!(SystemP2P.$FightOK))))) || ((((!((this.name == "role2")))) && ((!((this.name == "role1"))))))))))
                    {
                        this.ai();
                    }
                    else
                    {
                        if (!GameData.$fightBoolean)
                        {
                            this.$down = false;
                            this.run = "none";
                        };
                    };
                    this.updateFrame();
                    if (this.$stoic <= 0)
                    {
                        this.downBUFF();
                    }
                    else
                    {
                        this.$tx = 0;
                        this.$txTime = 0;
                        _local_2.fangX = 0;
                    };
                    if ((((((this.$rigid <= 0)) && ((!(this.$jumpForFuckBoolean))))) && ((!((this.$frameString === "起身"))))))
                    {
                        if (((((((this.$down) && ((this.$mode == "D")))) || (((this.$jumpForFang) && ((this.$mode == "K")))))) && ((!(this.$hitBoolean)))))
                        {
                            this.frameString = "防御";
                        }
                        else
                        {
                            if (this.$txTime <= 0)
                            {
                                if ((((((((!(this.$hitBoolean))) && ((this.$rigid <= 0)))) && ((!(this.$jumpForFang))))) || ((this.$frameString == "落下"))))
                                {
                                    this.runing();
                                }
                                else
                                {
                                    this.actRuning();
                                    if (this.$class !== null)
                                    {
                                        _local_2 = this.$class;
                                        _local_9 = _local_2;
                                        var _local_10 = _local_9;
                                        (_local_10["getSkillBuff"](this));
                                        if ((((this.$frameString == "空中攻击")) && ((!(this.$jumpBoolean)))))
                                        {
                                            this.stopSkill();
                                        };
                                    };
                                };
                            };
                        };
                    };
                    if (this.$y < 5)
                    {
                        this.$y = 5;
                    };
                    this.upBUFF();
                    try
                    {
                        this.updateAct();
                    }
                    catch(e:Error)
                    {
                    };
                    if (this.$mode == "D")
                    {
                        this.hit();
                    }
                    else
                    {
                        if (((((((this.$jumpForFang) && ((this.$rigid <= 0)))) && ((!(this.$jumpForFuckBoolean))))) && ((!((this.$frameString === "起身"))))))
                        {
                            this.frameString = "防御";
                        }
                        else
                        {
                            if (this.$down)
                            {
                                this.$y = (this.$y + (FPSMath.getFPSScale(this) * 2));
                            }
                            else
                            {
                                if (this.$up)
                                {
                                    this.$y = (this.$y - (FPSMath.getFPSScale(this) * 2));
                                };
                            };
                            if (this.lidi(150))
                            {
                                this.$y = (this.$y + (FPSMath.getFPSScale(this) * 2));
                            };
                        };
                        if (this.endRed(_local_5))
                        {
                            while (this.$bit.bitmapData.hitTest(new Point(this.$bit.x, this.$bit.y), 85, _local_5.bitmapData, new Point(_local_5.x, _local_5.y), 1))
                            {
                                this.$bit.y--;
                                this.$jumpBoolean = false;
                            };
                            if ((((!((this.$txTime === 0)))) && ((((this.$frameString == "跳跃")) || ((this.$frameString == "降落"))))))
                            {
                                this.$txTime = 0;
                            };
                            if (!this.$jumpBoolean)
                            {
                                this.$y = this.$bit.y;
                            };
                            if (this.$jumpForFuckBoolean)
                            {
                                this.getUP();
                            };
                        };
                    };
                    if ((((!(this.$jumpBoolean))) && ((!((this.$frameString === "受伤"))))))
                    {
                        this.$jumpFuckInt = this.$jumpFight;
                        this.$jumpNumMath = this.$jumpNum;
                        this.$tx = 0;
                    };
                    if ((((!(this.$hitBoolean))) && ((this.$hp.value > 0))))
                    {
                        this.alpha = 1;
                    };
                    if ((((!(this.$jumpBoolean))) || ((this.$mode == "K"))))
                    {
                        this.$fuz = (this.$fuz - (((this.$fuz > 0)) ? 1 : 0));
                    };
                    if (this.$hp.value <= 0)
                    {
                        this.$hp.value = 0;
                        if ((((((!(this.$jumpBoolean))) && ((!((this.$frameStringCopy === "起身")))))) && ((!((this.$frameString === "受伤"))))))
                        {
                            this.hitString = "起身";
                        };
                        if (this.$frameStringCopy == "起身")
                        {
                            this.$frameInt = 0;
                        };
                    };
                }
                else
                {
                    if (this.$jumpForFuckBoolean)
                    {
                        this.$y = (this.$y + ((((FPSMath.getFPSScale(this) * this.$jumpMath) > 0)) ? 1 : -1));
                    };
                    if (this.$rigid > 0)
                    {
                        this.$x = (this.$x + ((((FPSMath.getFPSScale(this) * this.$tx) > 0)) ? 1 : -1));
                    };
                    while (this.endRed(_local_5))
                    {
                        _local_2 = this;
                        _local_3 = (this.$y - 1);
                        _local_2.$y = _local_3;
                    };
                };
                this.enterFrameString();
                this.actID();
                this.updateAct();
                if ((((this.$rigid > 1)) && ((!((this.$shouColor === null))))))
                {
                    _local_6 = new ColorMatrixFilter(this.$shouColor);
                    this.filters = ((this.colorBoolean) ? [] : [_local_6]);
                    this.colorBoolean = (!(this.colorBoolean));
                }
                else
                {
                    this.$shouColor = null;
                };
                if ((this.$class["PasvSkill"] is Function))
                {
                    _local_2 = this.$class;
                    _local_9 = _local_2;
                    _local_10 = _local_9;
                    (_local_10["PasvSkill"](this));
                };
                this.updatePoint(_local_8, _local_7);
                if ((((!(this.$jumpForFuckBoolean))) && (this.$jumpBoolean)))
                {
                    if ((((this.$frameString == "受伤")) && ((this.$jumpMath > 0))))
                    {
                        if (this.$rigid > 0)
                        {
                            this.$jumpMath = -1;
                        }
                        else
                        {
                            this.frameString = "待机";
                        };
                        this.$rigid = (this.$rigid - 5);
                    };
                };
                if (SystemP2P.$FightOK)
                {
                };
            };
            if (this.$hpID == -1)
            {
                this.drawHP();
            };
        }

        private function updatePoint(_arg_1:Object, _arg_2:Object):void
        {
            var _local_3:* = null;
            try
            {
                _local_3 = ComponentResourcesManage.$word.midpoint();
                if (ComponentResourcesManage.$word.$map.$scale <= 1)
                {
                    if (this.$x < (_local_3.x - 350))
                    {
                        this.$x = (_local_3.x - 350);
                    }
                    else
                    {
                        if (this.$x > (_local_3.x + 350))
                        {
                            this.$x = (_local_3.x + 350);
                        };
                    };
                };
                if ((((((ComponentResourcesManage.$word.$map.$scale <= 1.2)) && ((_local_3.h >= _arg_1.h)))) && ((_local_3.h > SystemState.$stageHeight))))
                {
                    this.$y = _arg_2.y;
                };
            }
            catch(e:Error)
            {
            };
        }

        public function lidi(_arg_1:int):Boolean
        {
            var _local_2:* = _arg_1;
            var _local_3:* = (ComponentResourcesManage.$Ob["SystemWord"].$elementsOb["bit"] as Bitmap);
            while (_arg_1 > -(_local_2))
            {
                _arg_1--;
                if (_local_3.bitmapData.getPixel(this.$x, (this.$y + _arg_1)) !== 0)
                {
                    return (false);
                };
            };
            return (true);
        }

        private function drawHP():void
        {
            if (!this.$hpShape)
            {
                this.$hpShape = new Shape();
            };
            this.parent.addChild(this.$hpShape);
            this.$hpShape.graphics.clear();
            this.$hpShape.graphics.beginFill(0);
            this.$hpShape.graphics.drawRoundRect(0, 0, 50, 5, 6);
            this.$hpShape.graphics.endFill();
            this.$hpShape.graphics.beginFill((((this.$troops == 0)) ? 13234271 : 0xFF0000));
            this.$hpShape.graphics.drawRoundRect(1, 1, (48 * (this.$hp.value / this.$hpMax)), 3, 6);
            this.$hpShape.graphics.endFill();
            this.$hpShape.x = (this.$x - (this.$hpShape.width / 2));
            this.$hpShape.y = (this.$y + 5);
            if (this.$hp.value <= 0)
            {
                this.$hp.value = 0;
                if (this.alpha > 0.4)
                {
                    this.alpha = (this.alpha - 0.05);
                }
                else
                {
                    this.CG();
                };
            };
        }

        private function BUFFInit():void
        {
            this.$ob["BUFFSpeed"] = 0;
            this.$ob["BUFFFuck"] = 0;
            if (this.$ob["BUFFFang"])
            {
                this.$fang = this.$ob["BUFFFang"];
            };
            if (this.$ob["BUFFJump"])
            {
                this.$jump = this.$ob["BUFFJump"];
            };
            if (!this.$hitBoolean)
            {
                this.$ob.kong = false;
            };
        }

        private function cd():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:*;
            var _local_4:*;
            for (_local_1 in this.$skillCD)
            {
                if (this.$skillCD[_local_1] > 0)
                {
                    _local_2 = this.$skillCD;
                    _local_3 = _local_1;
                    _local_4 = (_local_2[_local_3] - 1);
                    _local_2[_local_3] = _local_4;
                };
                if (this.$skillCD[_local_1] == 0)
                {
                    this.$skillCD.setPropertyIsEnumerable(_local_1, false);
                };
            };
        }

        public function set stoic(_arg_1:Number):void
        {
            this.$stoic = (_arg_1 * 36);
        }

        private function ai():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:* = null;
            if ((((((this.$rigid <= 0)) && ((!(this.$jumpForFuckBoolean))))) && ((!((this.$frameString === "起身"))))))
            {
                if (this.$think > 0)
                {
                    this.$think = (80 + GameData.$lv);
                    if (this.see)
                    {
                        if (((((Math.random() * 10) > 9.5)) || ((this.$mode == "D"))))
                        {
                            this.$down = false;
                            this.$up = false;
                        };
                        this.$jumpForFang = false;
                        _local_3 = this.skillObject;
                        if ((((!((_local_3 === "瞬步")))) || ((((_local_3 == "瞬步")) && (((Math.random() * 10) > 9))))))
                        {
                            if ((((((!(this.$hitBoolean))) || ((this.$frameString == "普通攻击")))) && (((Math.random() * 10) > 6))))
                            {
                                if ((((!(this.$jumpBoolean))) && ((!(this.$hitBoolean)))))
                                {
                                    if (this.$seeRole.$x >= this.$x)
                                    {
                                        this.$scaleX = 1;
                                    }
                                    else
                                    {
                                        this.$scaleX = -1;
                                    };
                                };
                                this.hitString = _local_3;
                            }
                            else
                            {
                                if ((((((!(this.$hitBoolean))) && ((Math.abs((this.$x - this.$seeRole.$x)) < 50)))) && ((!(this.$jumpBoolean)))))
                                {
                                    this.hitString = "普通攻击";
                                };
                            };
                            this.$GameAttBoolean = false;
                        };
                        if ((((this.$seeRole.y < (this.y - this.$seeRole.height))) && ((!(this.$hitBoolean)))))
                        {
                            if ((((((((!((this.$frameString === "受伤")))) && ((this.$frameString == "普通攻击")))) || ((!((this.$frameString === "受伤")))))) && (((Math.random() * 10) > 9.5))))
                            {
                                if (this.$mode == "D")
                                {
                                    this.goJump();
                                }
                                else
                                {
                                    this.$up = true;
                                };
                            };
                        }
                        else
                        {
                            if ((((((this.$seeRole.y > (this.y - this.height))) && (((Math.random() * 10) > 9.5)))) && ((!(this.$hitBoolean)))))
                            {
                                if (this.$mode == "D")
                                {
                                    if (!this.$jumpBoolean)
                                    {
                                        this.$y = (this.$y + (FPSMath.getFPSScale(this) * 20));
                                        this.$jumpMath = 5;
                                        this.$jumpBoolean = true;
                                    };
                                }
                                else
                                {
                                    this.$down = true;
                                };
                            };
                        };
                        if ((((!(this.$hitBoolean))) && ((!(this.$jumpBoolean)))))
                        {
                            if ((Math.random() * 10) > 9)
                            {
                                if ((((this.$seeRole.$x > this.$x)) && ((!(this.$jumpBoolean)))))
                                {
                                    this.$scaleX = 1;
                                }
                                else
                                {
                                    this.$scaleX = -1;
                                };
                            };
                            if ((((this.$x < 50)) || ((this.$x > (ComponentResourcesManage.$word.$map.width - 50)))))
                            {
                                if (this.$x < 50)
                                {
                                    this.run = "right";
                                }
                                else
                                {
                                    this.run = "left";
                                };
                            }
                            else
                            {
                                if ((Math.random() * 10) > 8)
                                {
                                    if (this.$scaleX == 1)
                                    {
                                        this.run = "right";
                                    }
                                    else
                                    {
                                        this.run = "left";
                                    };
                                };
                            };
                            if ((Math.random() * 10) > 9.5)
                            {
                                this.run = "none";
                            };
                        };
                        if (((((((((((Math.random() * 10) > 2)) && (this.$seeRole.$hitBoolean))) && ((!((this.$seeRole.$frameString === "普通攻击")))))) && ((!((this.$seeRole.$frameString === "起身")))))) && ((!((this.$seeRole.$frameString === "防御"))))))
                        {
                            if ((((((this.$mode == "D")) && ((!(this.$jumpBoolean))))) && ((!((this.$actArray.indexOf("防御") === -1))))))
                            {
                                this.$down = true;
                            }
                            else
                            {
                                if (this.$mode !== "D")
                                {
                                    this.$jumpForFang = true;
                                };
                            };
                        };
                    }
                    else
                    {
                        this.$down = false;
                        this.$up = false;
                        this.$jumpForFang = false;
                        this.run = "none";
                    };
                }
                else
                {
                    _local_1 = this;
                    _local_2 = (this.$think - 1);
                    _local_1.$think = _local_2;
                };
            }
            else
            {
                if ((((((!((this.$frameString === "起身")))) && ((this.$mode == "D")))) && ((!((this.$ob.aimode === "K"))))))
                {
                    if ((((((((!((this.$frameString === "受伤")))) && ((this.$frameString == "普通攻击")))) || ((!((this.$frameString === "受伤")))))) && (((Math.random() * 10) > 9.5))))
                    {
                        this.goJump();
                    };
                };
            };
        }

        public function stopSkill():void
        {
            this.$hitBoolean = false;
            this.$frameString = "待机";
        }

        public function goJump():void
        {
            var _local_1:*;
            var _local_2:*;
            if ((((((((((this.$jumpNumMath > 0)) && ((this.$hp.value > 0)))) && ((((((!(this.$hitBoolean))) || ((this.$frameStringCopy == "普通攻击")))) || ((this.$frameStringCopy == "落下")))))) && ((!((this.$actArray.indexOf("跳跃") === -1)))))) && ((this.$mode == "D"))))
            {
                if (((((((this.$jumpForFuckBoolean) && ((((this.$frameStringCopy == "倒落")) || ((this.$frameStringCopy == "落下")))))) && ((Math.abs(this.$tx) <= (this.$speed * 1.5))))) || ((!(this.$jumpForFuckBoolean)))))
                {
                    _local_1 = this;
                    _local_2 = (this.$jumpNumMath - 1);
                    _local_1.$jumpNumMath = _local_2;
                    this.$y = (this.$y + (FPSMath.getFPSScale(this) * -(this.$jump)));
                    this.$jumpMath = (-(this.$jump) - 3);
                    this.$jumpBoolean = true;
                    if (this.$jumpForFuckBoolean)
                    {
                        this.$jumpNumMath = 0;
                        this.$jumpForFuckBoolean = false;
                        this.$rigid = 0;
                        this.$txTime = 0;
                        this.$jumpMath = (this.$jumpMath * 0.8);
                        this.$god = 10;
                    };
                    this.$hitBoolean = false;
                    this.frameString = "跳跃";
                    if (!this.$down)
                    {
                        this._xuanfu = 6;
                    };
                    ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                        "name":"tx2",
                        "role":this,
                        "x":this.$x,
                        "y":this.$y,
                        "scaleX":(this.$scaleX * 0.3)
                    });
                };
            }
            else
            {
                if (this.$mode == "K")
                {
                    this.$jumpForFang = true;
                };
            };
        }

        private function get skillObject():String
        {
            var _local_2:int;
            var _local_3:String;
            var _local_1:* = undefined;
            for (_local_1 in this.$class["$ob"])
            {
                if (this.$class["$ob"][_local_1].w > Math.abs((this.$x - this.$seeRole.$x)))
                {
                    _local_2 = this.$class["$ob"][_local_1].h;
                    if (_local_2 == 0)
                    {
                        _local_2 = this.height;
                    };
                    if (_local_2 > Math.abs((this.$y - this.$seeRole.$y)))
                    {
                        if ((((this.$skillCD[_local_1] == 0)) || ((this.$skillCD[_local_1] == undefined))))
                        {
                            if ((Math.random() * 100) > GameData.$lv)
                            {
                                _local_3 = "none";
                                if ((((this.$class["$ob"][_local_1].k == true)) && (this.$jumpBoolean)))
                                {
                                    this.$keyString = this.$class["$ob"][_local_1].s;
                                    _local_3 = this.getSkillName(this.$class["$ob"][_local_1].key);
                                }
                                else
                                {
                                    if ((((!((this.$class["$ob"][_local_1].k === true)))) && ((!(this.$jumpBoolean)))))
                                    {
                                        this.$keyString = this.$class["$ob"][_local_1].s;
                                        _local_3 = this.getSkillName(this.$class["$ob"][_local_1].key);
                                    };
                                };
                                try
                                {
                                    this.GameAtt(this.$class["$ob"][_local_1].key, _local_3);
                                }
                                catch(e:Error)
                                {
                                };
                                return (_local_3);
                            };
                        };
                    };
                };
            };
            return ("");
        }

        private function get see():Boolean
        {
            var _local_1:*;
            var _local_2:*;
            var _local_3:* = null;
            var _local_4:* = undefined;
            var _local_5:* = ComponentResourcesManage.$Ob["SystemWord"][("$troops" + (-(this.$troops) + 1))];
            if (_local_5.length == 1)
            {
                this.$seeRole = _local_5[0];
            }
            else
            {
                if (_local_5.length > 0)
                {
                    if (this.$seeThink <= 0)
                    {
                        this.$seeThink = 200;
                        this.$seeRole = _local_5[int((Math.random() * 2))];
                        if (this.$seeRole.gethp <= 0)
                        {
                            _local_3 = this.$seeRole;
                            for (_local_4 in _local_5)
                            {
                                if (_local_5[_local_4].$hp > 0)
                                {
                                    if (_local_3 !== _local_5[_local_4])
                                    {
                                        this.$seeRole = _local_3;
                                        break;
                                    };
                                };
                            };
                            if (_local_3.gethp <= 0)
                            {
                                this.$seeRole = null;
                                this.$seeThink = 0;
                            };
                        };
                    }
                    else
                    {
                        _local_1 = this;
                        _local_2 = (this.$seeThink - 1);
                        _local_1.$seeThink = _local_2;
                    };
                };
            };
            return ((!((this.$seeRole === null))));
        }

        public function get seeBoolean():Boolean
        {
            if ((Math.random() * 10) > 5)
            {
                return (true);
            };
            return (false);
        }

        public function set run(_arg_1:String):void
        {
            if (_arg_1 == "left")
            {
                this.$left = true;
                this.$right = false;
            }
            else
            {
                if (_arg_1 == "right")
                {
                    this.$left = false;
                    this.$right = true;
                }
                else
                {
                    if (_arg_1 == "none")
                    {
                        this.$left = false;
                        this.$right = false;
                    };
                };
            };
        }

        private function downBUFF():void
        {
            var _local_1:Object;
            var _local_2:*;
            if ((((((!((this.$tx === 0)))) && ((((this.$txTime > 0)) || (this.$jumpBoolean))))) && ((!((this.$frameString === "起身"))))))
            {
                if (!this.$jumpBoolean)
                {
                    _local_1 = this;
                    _local_2 = (this.$txTime - 1);
                    _local_1.$txTime = _local_2;
                };
                this.$x = (this.$x + (FPSMath.getFPSScale(this) * this.$tx));
            }
            else
            {
                if (this.$frameString == "起身")
                {
                    this.$txTime = 0;
                };
            };
            _local_1 = this.$ob;
            if (this.$ob.du > 0)
            {
                _local_2 = (_local_1.du - 1);
                _local_1.du = _local_2;
                (this.$hp.value - 1);
            };
            if ((((_local_1.fangX > 0)) && (((this.$down) || (this.$jumpForFang)))))
            {
                this.$x = (this.$x - ((FPSMath.getFPSScale(this) * _local_1.fangX) * this.$scaleX));
                _local_1 = this.$ob;
                _local_2 = (_local_1.fangX - 1);
                _local_1.fangX = _local_2;
            }
            else
            {
                _local_1.fangX = 0;
            };
        }

        private function upBUFF():void
        {
            var _local_1:*;
            var _local_2:*;
            if (this.$god > 0)
            {
                _local_1 = this;
                _local_2 = (this.$god - 1);
                _local_1.$god = _local_2;
            };
            if (this.$stoic > 0)
            {
                _local_1 = this;
                _local_2 = (this.$stoic - 1);
                _local_1.$stoic = _local_2;
            };
            if (GameData.$mode == "1PSB")
            {
                ComponentResourcesManage.$word.$time.$fightTime = 99;
                if ((((this.$hp.value <= 0)) && ((this.$target.indexOf("Freak_") == -1))))
                {
                    this.$hp.value = this.$hpMax;
                };
                this.$mp = this.$mpMax;
            };
        }

        private function actID():void
        {
            var _local_1:* = this.$actArray.indexOf(this.$frameString);
            if ((((!((_local_1 === -1)))) && ((!((this.$act === _local_1))))))
            {
                this._currentFrame = -1;
                this.$act = _local_1;
                this.$drawBoolean = false;
            };
        }

        private function updateFrame():void
        {
            var _local_1:int = int(this.$xml.act[this.$act].@fps);
            var _local_2:int = ((this.$hitBoolean) ? this.$ob["fps"] : 0);
            if ((((this.$fangCD < 36)) && (this.$down)))
            {
                this.$fangCD++;
            }
            else
            {
                if (this.$fangCD > 0)
                {
                    this.$fangCD--;
                };
            };
            if (((this.$hitBoolean) && ((this.$frameString == "普通攻击"))))
            {
                _local_2++;
            };
            if (((this.$fps + _local_1) - _local_2) > this.$fpsMath)
            {
                this.$fpsMath++;
                this.lian = (this.lian - (((this.lian > 0)) ? 2 : 0));
            }
            else
            {
                if ((((this.$ob["StopMP"] == undefined)) || ((this.$ob["StopMP"] <= 0))))
                {
                    this.$mp++;
                }
                else
                {
                    this.$ob["StopMP"] = (this.$ob["StopMP"] - this.$fps);
                };
                if (this.$mp > this.$mpMax)
                {
                    this.$mp = this.$mpMax;
                };
                if (this.$hp.value > this.$hpMax)
                {
                    this.$hp.value = this.$hpMax;
                };
                if ((this.$xml.act[this.$act].SubTexture.length() - 1) > this.$frameInt)
                {
                    if ((((((String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asA) == "stop")) && ((((!((this.$keyP === -1)))) || (SystemP2P.$FightOK))))) && ((this.lian <= 0))))
                    {
                        if (this.$reactionMath < this.$reaction)
                        {
                            this.$reactionMath++;
                        }
                        else
                        {
                            this.$reactionMath = 0;
                            this.$hitBoolean = false;
                            this.frameString = "待机";
                            if ((this.$ob["Di"] is SystemGameRole))
                            {
                                if (this.$ob["Di"].$frameString == "受伤")
                                {
                                    this.$ob["Di"].rigid = 0;
                                    this.$ob["Di"] = null;
                                };
                            };
                        };
                    }
                    else
                    {
                        if (!this.$stopUpdateframeBoolean)
                        {
                            if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asA) == "stop")
                            {
                                this.lian = 0;
                            };
                            this.$frameInt++;
                            if (this.qzFrameString == this.$frameString)
                            {
                                this.goQZ();
                            };
                        }
                        else
                        {
                            this.$stopUpdateframeBoolean = false;
                        };
                    };
                }
                else
                {
                    if ((((this.$rigid > 0)) && ((!(this.$jumpBoolean)))))
                    {
                        this.$rigid = (this.$rigid - this.$fps);
                        if (this.$frameString !== "受伤")
                        {
                            this.frameString = "受伤";
                        };
                    }
                    else
                    {
                        if (((this.$hitBoolean) || ((this.$frameString == "受伤"))))
                        {
                            this.$hitBoolean = false;
                            this.$txTime = 0;
                            this.frameString = "待机";
                            SystemP2P.$frameString = "none";
                        }
                        else
                        {
                            this.$frameInt = 0;
                        };
                    };
                };
                this.$drawBoolean = false;
                this.$fpsMath = 0;
            };
        }

        private function runing():void
        {
            var _local_1:*;
            var _local_2:*;
            if (!this.$jumpBoolean)
            {
                if (this.$left)
                {
                    this.$scaleX = -1;
                }
                else
                {
                    if (this.$right)
                    {
                        this.$scaleX = 1;
                    };
                };
            };
            if (this.$left)
            {
                this.$x = (this.$x - (FPSMath.getFPSScale(this) * this.Speed));
                if (!this.$jumpBoolean)
                {
                    if (this.$toRunBoolean)
                    {
                        this.frameString = "跑步";
                        this.$x = (this.$x - (FPSMath.getFPSScale(this) * this.$runSpeed));
                    }
                    else
                    {
                        this.frameString = "行走";
                    };
                }
                else
                {
                    if (this.$jumpBoolean)
                    {
                        if (this.$toRunBoolean)
                        {
                            this.$x = (this.$x - (FPSMath.getFPSScale(this) * this.$runSpeed));
                        };
                    };
                };
            }
            else
            {
                if (this.$right)
                {
                    this.$x = (this.$x + (FPSMath.getFPSScale(this) * this.Speed));
                    if (!this.$jumpBoolean)
                    {
                        if (this.$toRunBoolean)
                        {
                            this.frameString = "跑步";
                            this.$x = (this.$x + (FPSMath.getFPSScale(this) * this.$runSpeed));
                        }
                        else
                        {
                            this.frameString = "行走";
                        };
                    }
                    else
                    {
                        if (this.$jumpBoolean)
                        {
                            if (this.$toRunBoolean)
                            {
                                this.$x = (this.$x + (FPSMath.getFPSScale(this) * this.$runSpeed));
                            };
                        };
                    };
                }
                else
                {
                    this.frameString = "待机";
                    this.$toRunBoolean = false;
                    if (this.$runTime > 0)
                    {
                        _local_1 = this;
                        _local_2 = (this.$runTime - 1);
                        _local_1.$runTime = _local_2;
                        this.$x = (this.$x + (((FPSMath.getFPSScale(this) * this.$scaleX) * this.$runTime) / 5));
                    };
                };
            };
        }

        private function toRun(_arg_1:int):void
        {
            if ((((((this.$runEnter > 0)) && ((_arg_1 == this.$runKey)))) && ((!((this.$actArray.indexOf("跑步") === -1))))))
            {
                this.$toRunBoolean = true;
            };
        }

        private function actRuning():void
        {
            if ((((this.$frameString == "空中攻击")) || ((this.$frameString == "落下"))))
            {
                if (this.$left)
                {
                    this.$x = (this.$x - (FPSMath.getFPSScale(this) * this.Speed));
                }
                else
                {
                    if (this.$right)
                    {
                        this.$x = (this.$x + (FPSMath.getFPSScale(this) * this.Speed));
                    };
                };
            };
        }

        private function jumpBUFF():void
        {
            if (this.$mode == "D")
            {
                if (((this.$jumpForFuckBoolean) && ((!(this.$hitBoolean)))))
                {
                    if (this.$ding <= 0)
                    {
                        if (this.$jumpMath < 0)
                        {
                            this.frameString = "打飞";
                        }
                        else
                        {
                            this.frameString = "倒落";
                        };
                    }
                    else
                    {
                        this.frameString = "受伤";
                    };
                }
                else
                {
                    if ((((!((this.$frameStringCopy === "受伤")))) && ((this.$rigid <= 0))))
                    {
                        if ((((this.$jumpMath < 0)) && ((!(this.$hitBoolean)))))
                        {
                            this.frameString = "跳跃";
                        }
                        else
                        {
                            if ((((this.$frameStringCopy == "跳跃")) && ((!((this.$actArray.indexOf("落下") === -1))))))
                            {
                                this.hitString = "落下";
                            }
                            else
                            {
                                this.frameString = "降落";
                            };
                        };
                    }
                    else
                    {
                        this.frameString = "受伤";
                    };
                };
            };
        }

        public function beHit():void
        {
            if ((((this.$stoic > 0)) && ((this.hitStop <= 0))))
            {
                this.hitStop = 3;
            };
        }

        private function hit():void
        {
            var _local_1:int;
            var _local_2:Boolean;
            if ((((((this.$frameString == "受伤")) && (this.$jumpBoolean))) && ((this.$rigid > 0))))
            {
            };
            var _local_3:Object = ComponentResourcesManage.$Ob["SystemWord"].$elementsOb["bit"];
            this.$bit.x = this.$x;
            this.$bit.y = this.$y;
            if ((((((((!(this.$hitBoolean))) || ((this.$frameString == "空中攻击")))) || ((this.$frameString == "落下")))) && (this.$jumpBoolean)))
            {
                if (this.$ding > 0)
                {
                    this.$ding--;
                }
                else
                {
                    this.$y = (this.$y + ((FPSMath.getFPSScale(this) * this.$jumpMath) / this.$jumpFu));
                    if (this.$jumpMath < (this.$jump * 1.5))
                    {
                        this.$jumpMath = (this.$jumpMath + this.$gravity);
                    };
                };
            }
            else
            {
                this.$jumpMath = 0;
            };
            if (this.endRed(_local_3))
            {
                while (this.$bit.bitmapData.hitTest(new Point(this.$bit.x, this.$bit.y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))
                {
                    this.$bit.y--;
                    this.$jumpBoolean = false;
                };
                if ((((!((this.$txTime === 0)))) && ((((this.$frameString == "跳跃")) || ((this.$frameString == "降落"))))))
                {
                    this.$txTime = 0;
                };
                if (!this.$jumpBoolean)
                {
                    this.$y = this.$bit.y;
                    if ((((this.$frameStringCopy == "降落")) && ((!(this.$hitBoolean)))))
                    {
                        this.hitString = "落地";
                        ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                            "name":"tx1",
                            "role":this,
                            "x":this.$bit.x,
                            "y":this.$bit.y,
                            "scaleX":(this.$scaleX * 0.5)
                        });
                    };
                };
                if (this.$jumpForFuckBoolean)
                {
                    this.getUP();
                };
            };
            if ((((((this.$jy <= this.$y)) && ((this.$jumpMath >= 0)))) && (this.$bit.bitmapData.hitTest(new Point(this.$bit.x, this.$bit.y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))))
            {
                _local_1 = 0;
                _local_2 = this.$jumpBoolean;
                while (this.$bit.bitmapData.hitTest(new Point(this.$bit.x, this.$bit.y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))
                {
                    this.$bit.y--;
                    _local_1++;
                    this.$jumpBoolean = false;
                    if ((((_local_1 > ((this.$jump / this.$jumpFu) * 1.5))) && (_local_2)))
                    {
                        this.$jumpBoolean = true;
                        this.$bit.y = (this.$bit.y + (_local_1 + (this.$jumpMath / this.$jumpFu)));
                        if (this.$jumpMath < (this.$jump * 1.5))
                        {
                            this.$jumpMath = (this.$jumpMath + this.$gravity);
                        };
                        this.jumpBUFF();
                        break;
                    };
                };
                if ((((!((this.$txTime === 0)))) && ((((this.$frameString == "跳跃")) || ((this.$frameString == "降落"))))))
                {
                    this.$txTime = 0;
                };
                if (((((((((_local_2) && ((!(this.$jumpBoolean))))) && ((!(this.$jumpForFuckBoolean))))) && ((!((this.$jy === this.$y)))))) && ((!(this.$hitBoolean)))))
                {
                    if (this.$frameStringCopy == "降落")
                    {
                        this.hitString = "落地";
                    };
                    ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                        "name":"tx1",
                        "role":this,
                        "x":this.$bit.x,
                        "y":this.$bit.y,
                        "scaleX":(this.$scaleX * 0.5)
                    });
                };
                this.getUP();
                this.$y = (this.$bit.y + 1);
                if (this.$frameString == "空中攻击")
                {
                    this.stopSkill();
                };
            }
            else
            {
                if ((((!(this.$hitBoolean))) || ((this.$frameString == "普通攻击"))))
                {
                    if (!this.$jumpBoolean)
                    {
                        this.$jumpMath = 0;
                        this.$jumpBoolean = true;
                        if (this.$dit.bitmapData.hitTest(new Point(this.$dit.x, this.$dit.y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))
                        {
                            while ((!(this.$bit.bitmapData.hitTest(new Point(this.$bit.x, this.$bit.y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))))
                            {
                                this.$bit.y++;
                                this.$jumpBoolean = false;
                            };
                            this.$y = this.$bit.y;
                        };
                        if (((this.$jumpBoolean) && ((!(this.$hitBoolean)))))
                        {
                            this.jumpBUFF();
                        };
                    }
                    else
                    {
                        if (!this.$hitBoolean)
                        {
                            this.jumpBUFF();
                        };
                    };
                };
            };
            if (!this.$dit.bitmapData.hitTest(new Point(this.$dit.x, this.$dit.y), 85, _local_3.bitmapData, new Point(_local_3.x, _local_3.y), 1))
            {
                this.$jumpBoolean = true;
                if ((((this.$frameString == "普通攻击")) && ((!((this.$ob.kong === true))))))
                {
                    this.$hitBoolean = false;
                    this.jumpBUFF();
                };
            };
            this.$jx = this.$x;
            this.$jy = this.$y;
        }

        public function updateJump():void
        {
            this.$y = (this.$y + ((FPSMath.getFPSScale(this) * this.$jumpMath) / this.$jumpFu));
            if (this.$jumpMath < (this.$jump * 1.5))
            {
                this.$jumpMath = (this.$jumpMath + this.$gravity);
            };
        }

        private function endRed(_arg_1:Object):Boolean
        {
            if (_arg_1)
            {
                if (_arg_1.bitmapData.getPixel(this.$x, this.$y) == 0xFF0000)
                {
                    return (true);
                };
                if (_arg_1.bitmapData.getPixel((this.$x + this.$bit.width), this.$y) == 0xFF0000)
                {
                    return (true);
                };
                if (_arg_1.bitmapData.getPixel(this.$x, (this.$y + this.$bit.height)) == 0xFF0000)
                {
                    return (true);
                };
                if (_arg_1.bitmapData.getPixel((this.$x + this.$bit.width), (this.$y + this.$bit.height)) == 0xFF0000)
                {
                    return (true);
                };
                return (false);
            };
            return (false);
        }

        private function getUP():void
        {
            if ((((!(this.$jumpBoolean))) && (this.$jumpForFuckBoolean)))
            {
                if ((((((this.$jumpMath > 15)) || ((Math.abs(this.$tx) >= 6)))) && ((int(this.$ob.ft) <= 6))))
                {
                    this.$ob.ft = (int(this.$ob.ft) + 1);
                    this.$jumpMath = (this.$jumpMath / -3);
                    this.$tx = (this.$tx / 3);
                    this.$jumpBoolean = true;
                    ComponentResourcesManage.$word.$map.setZhen = 0.3;
                    ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                        "name":"daodichen",
                        "role":this,
                        "x":this.$bit.x,
                        "y":this.$bit.y,
                        "scaleX":(this.$scaleX * 1)
                    });
                }
                else
                {
                    this.$ob.ft = 0;
                    this.$shouColor = null;
                    this.hitString = "起身";
                    this.$jumpForFuckBoolean = false;
                    this.$god = 40;
                    this.$rigid = 0;
                    this.$hit_num = 0;
                    this.fuckFlyCount = 0;
                };
                ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                    "name":"tx1",
                    "role":this,
                    "x":this.$bit.x,
                    "y":this.$bit.y,
                    "scaleX":(this.$scaleX * 0.5)
                });
            };
        }

        public function drawRectFight():void
        {
            if (this._fightFrame == this.$frameInt)
            {
                return;
            };
            this._fightFrame = this.$frameInt;
            if (this.$fit.bitmapData !== null)
            {
                this.$fit.bitmapData.dispose();
                this.$fit.bitmapData = null;
            };
            if ((((!((this.widthInt === 0)))) && ((!((this.heightInt === 0))))))
            {
                this.$fit.bitmapData = new BitmapData(this.widthInt, this.heightInt, false, 0);
                this.$fightOB.fuckY = int(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asY);
                this.$fightOB.fuckX = int(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asZ);
                if (this.$xml.act[this.$act].SubTexture[this.$frameInt].@asR != undefined)
                {
                    this.$fightOB.R = (int(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asR) / this.$fps);
                }
                else
                {
                    this.$fightOB.R = (int(this.$xml.act[this.$act].SubTexture[this.$frameInt].@asS) / this.$fps);
                };
                if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@isBreak) == "break")
                {
                    this.isBreak = true;
                }
                else
                {
                    this.isBreak = false;
                };
                this.$fightOB.hurt = (int(this.$xml.act[this.$act].SubTexture[this.$frameInt].@hitHurt) * this.hurtThan);
                this.$fuckBoolean = true;
            }
            else
            {
                this.$fit.bitmapData = new BitmapData(1, 1, true, 0);
                this.$fuckBoolean = false;
            };
        }

        private function updateAct():void
        {
            var _local_1:* = null;
            if ((((this._currentFrame == this.$frameInt)) && ((!((this._currentFrame == 0))))))
            {
                this.$drawBoolean = true;
            };
            if (this.$jiuScaleX !== this.$scaleX)
            {
                this.$drawBoolean = false;
            };
            if (this.$frameInt >= this.$xml.act[this.$act].SubTexture.length())
            {
                this.$frameInt = 0;
            };
            if (SystemEvent.getP2PType() != "accept")
            {
                if ((((this.$xml.act[this.$act].SubTexture[this.$frameInt].@asH == "hurt")) && ((!(this.$drawBoolean)))))
                {
                    this.xInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@Hx;
                    this.yInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@Hy;
                    this.widthInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@Hw;
                    this.heightInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@Hh;
                    this.drawRectFight();
                }
                else
                {
                    if (this.$xml.act[this.$act].SubTexture[this.$frameInt].@hitWidth != undefined)
                    {
                        this.xInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@hitX;
                        this.yInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@hitY;
                        this.widthInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@hitWidth;
                        this.heightInt = this.$xml.act[this.$act].SubTexture[this.$frameInt].@hitHeight;
                        this._effectiveFPS = (this.$frameInt + this.$xml.act[this.$act].SubTexture[this.$frameInt].@hiteffective);
                        this.drawRectFight();
                    }
                    else
                    {
                        if ((((this._effectiveFPS < this.$frameInt)) && ((!(this.$drawBoolean)))))
                        {
                            this.widthInt = 0;
                            this.heightInt = 0;
                            this.drawRectFight();
                        };
                    };
                };
            };
            FrameEffectManage.event(this, String(this.$xml.act[this.$act].@eventTag));
            FrameEffectManage.event(this, String(this.$xml.@eventTag));
            if (!this.$drawBoolean)
            {
                try
                {
                    if ((((((!((this._currentFrame == this.$frameInt)))) && ((!((this.$xml.act[this.$act].SubTexture[this.$frameInt].@soundName === undefined)))))) && ((!((String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@soundName) == ""))))))
                    {
                        _local_1 = String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@soundName);
                        _local_1 = _local_1.substr(0, _local_1.lastIndexOf("."));
                        SystemMucisPlay.setMusic = ((this.roleTarget + "_sound/") + _local_1);
                    }
                    else
                    {
                        if ((((((!((this._currentFrame == this.$frameInt)))) && ((!((this.$xml.act[this.$act].SubTexture[this.$frameInt].@sound === undefined)))))) && (GameData.$fightBoolean)))
                        {
                            SystemMucisPlay.setMusic = String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@sound);
                        };
                    };
                    if (this._currentFrame != this.$frameInt)
                    {
                        if (this.$xml.act[this.$act].SubTexture[this.$frameInt].@effects !== undefined)
                        {
                            SkillEffectManage.effectManage.parsing(this, this.$xml.act[this.$act].SubTexture[this.$frameInt].@effects);
                        };
                        FrameEffectManage.parsing(this, this.$xml.act[this.$act].SubTexture[this.$frameInt]);
                    };
                    if (this.bitmapData !== null)
                    {
                        this.bitmapData.dispose();
                        this.bitmapData = null;
                    };
                    this.bitmapData = BitmapDataDraw.xmlForBitmapData(this.$bitmapData, this.$xml.act[this.$act].SubTexture[this.$frameInt], this.$scaleX);
                    this.smoothing = true;
                    this.$drawBoolean = true;
                    this.pxy.x = int(this.$xml.act[this.$act].SubTexture[this.$frameInt].@frameX);
                    this.pxy.y = int(this.$xml.act[this.$act].SubTexture[this.$frameInt].@frameY);
                }
                catch(e:Error)
                {
                };
            };
            if (this.$god > 0)
            {
                this.bitmapData.draw(this, null, SystemColor.bodyColor, BlendMode.SCREEN);
            };
            if (this.$x < 25)
            {
                this.$x = 25;
            }
            else
            {
                if (this.$x > (ComponentResourcesManage.$Ob["SystemWord"].$map.getWidth - 25))
                {
                    this.$x = (ComponentResourcesManage.$Ob["SystemWord"].$map.getWidth - 25);
                };
            };
            this.x = (this.$x + ((int(this.$xml.@px) - this.pxy.x) * this.$scaleX));
            this.y = (this.$y + ((int(this.$xml.@py) - this.pxy.y) * this.$scaleY));
            this.$bit.x = this.$x;
            this.$bit.y = this.$y;
            this.$dit.x = this.$bit.x;
            this.$dit.y = (this.$bit.y + 4);
            this.$fit.x = (this.$x + (this.xInt * this.$scaleX));
            this.$fit.y = (this.$y + (this.yInt * this.$scaleY));
            if (this.$scaleX < 0)
            {
                this.$fit.x = (this.$fit.x - this.$fit.width);
                this.x = (this.x - this.width);
            };
            if (((this.$fuckBoolean) && (this.$hitBoolean)))
            {
                this.hitRole();
                this.$hrutVisible = true;
            };
            if (this.$stoic > 0)
            {
                this.filters = [SystemColor.dropColor];
            }
            else
            {
                if (!this.$shouColor)
                {
                    this.filters = [];
                };
            };
            this._currentFrame = this.$frameInt;
        }

        private function hitRole():void
        {
            var _local_1:*;
            var _local_2:*;
            var _local_8:*;
            var _local_3:* = undefined;
            var _local_4:* = null;
            var _local_5:* = 0;
            var _local_6:* = 1;
            var _local_7:* = ComponentResourcesManage.$Ob["SystemWord"][("$troops" + (-(this.$troops) + 1))];
            for (_local_3 in _local_7)
            {
                if ((((((_local_7[_local_3] is SystemGameRole)) && ((!((this.$fit.bitmapData === null)))))) && ((!((_local_7[_local_3] === this))))))
                {
                    if (this.$fit.bitmapData.hitTest(new Point(this.$fit.x, this.$fit.y), 85, _local_7[_local_3], new Point(_local_7[_local_3].x, _local_7[_local_3].y), 1))
                    {
                        _local_4 = _local_7[_local_3];
                        if ((((_local_4.$god <= 0)) && ((!((_local_4.$frameString === "起身"))))))
                        {
                            _local_4.beHit();
                            if (this.isBreak)
                            {
                                _local_4.stopSkill();
                            };
                            _local_1 = this.$class;
                            _local_8 = _local_1;
                            var _local_11 = _local_8;
                            (_local_11["getFightBuff"](this, (_local_4 as SystemGameRole)));
                            if ((((_local_4.$stoic <= 0)) || ((_local_4.$frameString == "防御"))))
                            {
                                if (this.$hpID !== -1)
                                {
                                    ComponentResourcesManage.$word.$hpmpArray[this.$hpID].addNum();
                                };
                                if ((((((((_local_4.$frameString == "防御")) && ((!((_local_4.$actArray.indexOf("防御") === -1)))))) || ((_local_4.$frameString == "空中格挡")))) && ((!((_local_4.$scaleX === this.$scaleX))))))
                                {
                                    _local_5 = ((this.Dam + RoleMathType.addTSHurt(this, this.$class)) * 0.3);
                                    ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                                        "mode":"tx",
                                        "name":"fangYu",
                                        "rotate":(Math.random() * 180),
                                        "role":this,
                                        "x":_local_4.$bit.x,
                                        "y":((_local_4.$bit.y - 30) + (15 - (Math.random() * 30))),
                                        "scaleX":this.$scaleX
                                    });
                                    _local_4.sethp((_local_4.gethp - (_local_5 * (1 - _local_4.$fang))));
                                    _local_4.$ob.fangX = 10;
                                    if ((((_local_4.$fangCD < 18)) && ((Math.abs((_local_4.$x - this.$x)) < 120))))
                                    {
                                        _local_4.$fangCD = 36;
                                        _local_4.stoic = 0.3;
                                        ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                                            "mode":"tx",
                                            "name":"SJFang",
                                            "rotate":(Math.random() * 180),
                                            "role":this,
                                            "x":(_local_4.$bit.x + (25 * _local_4.$scaleX)),
                                            "y":((_local_4.$bit.y - 30) + (15 - (Math.random() * 30))),
                                            "scaleX":(this.$scaleX * -1)
                                        });
                                    };
                                }
                                else
                                {
                                    if (this.$hrutVisible)
                                    {
                                        this.$mp = (this.$mp + (this.$mpMax / 60));
                                        if (this.$frameStringCopy == "普通攻击")
                                        {
                                            this.$ob["Di"] = _local_4;
                                        };
                                        if (_local_1["$ob"][this.$frameString] !== undefined)
                                        {
                                            if (_local_1["$ob"][this.$frameString].bs !== undefined)
                                            {
                                                _local_6 = _local_1["$ob"][this.$frameString].bs;
                                            };
                                        };
                                        _local_5 = ((this.Dam + RoleMathType.addTSHurt(this, this.$class)) * _local_6);
                                        _local_4.sethp((_local_4.gethp - (_local_5 * (1 - _local_4.$fang))));
                                        _local_4.rigid = this.$fightOB.R;
                                        if (this.$fightOB.fuckX !== 0)
                                        {
                                            _local_4.$tx = (this.$fightOB.fuckX * this.$scaleX);
                                        }
                                        else
                                        {
                                            _local_4.$tx = 0;
                                        };
                                        _local_4.$scaleX = -(this.$scaleX);
                                        if (this.$fightOB.fuckY !== 0)
                                        {
                                            if (((_local_4.$jumpBoolean) || ((_local_4.$mode == "K"))))
                                            {
                                                _local_4.$jumpForFuckBoolean = true;
                                                _local_4.$mode = "D";
                                            };
                                            _local_4.fuckY = (this.$fightOB.fuckY - _local_4.$fuz);
                                            if ((((((this.$fightOB.fuckY >= 5)) && ((_local_4.$fuz < 15)))) && ((this.$frameStringCopy == "普通攻击"))))
                                            {
                                                _local_4.$fuz = (_local_4.$fuz + 3);
                                            };
                                            _local_4.$ding = 0;
                                        }
                                        else
                                        {
                                            if (_local_4.$jumpBoolean)
                                            {
                                                _local_4.$ding = 15;
                                                _local_4.$jumpMath = 0;
                                            };
                                        };
                                        if (((_local_4.$jumpForFuckBoolean) && ((_local_4.$jumpNumMath > 1))))
                                        {
                                            _local_4.$jumpNumMath = 1;
                                        };
                                        if (_local_4.name.indexOf("Freak") == -1)
                                        {
                                            if ((((this.$frameStringCopy == "普通攻击")) && ((_local_4.$hit_num > 12))))
                                            {
                                                _local_4.rigid = 0;
                                                _local_4.fuckY = -5;
                                                _local_4.$jumpForFuckBoolean = true;
                                                _local_4.$y = (_local_4.$y + (FPSMath.getFPSScale(this) * 6));
                                                if ((((this.$fightOB.fuckY >= 5)) && ((_local_4.$fuz < 15))))
                                                {
                                                    _local_4.$fuz = (_local_4.$fuz + 3);
                                                };
                                            };
                                        };
                                        ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                                            "mode":"tx",
                                            "name":this.FuckClass,
                                            "rotate":(Math.random() * 180),
                                            "role":this,
                                            "x":_local_4.$x,
                                            "y":((_local_4.$y - 30) + (15 - (Math.random() * 30))),
                                            "scaleX":this.$scaleX
                                        });
                                        if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@isBlow) == "blow")
                                        {
                                            ComponentResourcesManage.$word.$map.setZhen = 0.3;
                                            this.hitStop = 6;
                                            _local_4.hitStop = 6;
                                            if (this.$fightOB.fuckY != 0)
                                            {
                                                _local_4.$jumpForFuckBoolean = true;
                                            };
                                        };
                                    };
                                };
                            }
                            else
                            {
                                _local_5 = ((this.Dam + RoleMathType.addTSHurt(this, this.$class)) * _local_6);
                                _local_4.sethp((_local_4.gethp - (_local_5 * (1 - _local_4.$fang))));
                                ComponentResourcesManage.$Ob["SystemWord"].askElements("skill", {
                                    "mode":"tx",
                                    "name":this.FuckClass,
                                    "rotate":(Math.random() * 180),
                                    "role":this,
                                    "x":_local_4.$x,
                                    "y":((_local_4.$y - (30 / 2)) + (15 - (Math.random() * 30))),
                                    "scaleX":this.$scaleX
                                });
                            };
                            this.$fuckBoolean = false;
                            ComponentResourcesManage.$word.askElements("hurt", {
                                "hurt":(_local_5 * (1 - _local_4.$fang)),
                                "point":new Point(_local_4.$x, _local_4.$y)
                            });
                            _local_1 = _local_4;
                            _local_2 = (_local_4.$hit_num + 1);
                            _local_1.$hit_num = _local_2;
                            if (_local_4.$class["beHurt"])
                            {
                                _local_1 = _local_4.$class;
                                _local_8 = _local_1;
                                _local_11 = _local_8;
                                (_local_11["beHurt"](_local_4, _local_5));
                            };
                        };
                    };
                };
            };
            _local_7 = ComponentResourcesManage.$word[("$skill" + (-(this.$troops) + 1))];
            for (_local_3 in _local_7)
            {
                if ((((((((_local_7[_local_3] is SkillShow)) && ((!((this.bitmapData === null)))))) && ((!((_local_7[_local_3] === this)))))) && ((!((_local_7[_local_3].bitmapData === null))))))
                {
                    if (this.bitmapData.hitTest(new Point(this.x, this.y), 50, _local_7[_local_3].bitmapData, new Point(_local_7[_local_3].x, _local_7[_local_3].y), 0xFF))
                    {
                        RoleMathType.setSkillHurtOrAdd(_local_7[_local_3], this.Dam);
                        _local_4 = _local_7[_local_3];
                        this.$fuckBoolean = false;
                    };
                };
            };
        }

        public function to(_arg_1:int):void
        {
            this.$frameInt = _arg_1;
            this.$drawBoolean = false;
        }

        public function toTips(_arg_1:String):void
        {
            if ((((_arg_1 == "")) || ((!(_arg_1)))))
            {
                return;
            };
            var _local_2:* = this.$xml.act[this.$act].SubTexture.length();
            var _local_3:* = 0;
            while (_local_3 < _local_2)
            {
                if (String(this.$xml.act[this.$act].SubTexture[_local_3].@findName) == _arg_1)
                {
                    this.to(_local_3);
                    return;
                };
                _local_3++;
            };
        }

        public function get FuckClass():String
        {
            var _local_1:* = "";
            if (String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@tx) !== "")
            {
                _local_1 = String(this.$xml.act[this.$act].SubTexture[this.$frameInt].@tx);
            }
            else
            {
                if (String(this.$xml.act[this.$act].@tx) !== "")
                {
                    _local_1 = String(this.$xml.act[this.$act].@tx);
                }
                else
                {
                    _local_1 = "dj1";
                };
            };
            if (_local_1 == "jian")
            {
                _local_1 = SkillMath.JianTX;
            }
            else
            {
                if (_local_1 == "")
                {
                    _local_1 = "dj1";
                }
                else
                {
                    if (((this.roleData) && ((!((_local_1 == "dj1"))))))
                    {
                        _local_1 = ((this.$target + "_effect/") + _local_1);
                    };
                };
            };
            return (_local_1);
        }

        public function get hitRoleBoolean():Boolean
        {
            var _local_1:* = undefined;
            var _local_2:* = ComponentResourcesManage.$Ob["SystemWord"][("$troops" + (-(this.$troops) + 1))];
            for (_local_1 in _local_2)
            {
                if ((((((_local_2[_local_1] is SystemGameRole)) && ((!((this.bitmapData === null)))))) && ((!((_local_2[_local_1] === this))))))
                {
                    if (this.bitmapData.hitTest(new Point(this.x, this.y), 85, _local_2[_local_1], new Point(_local_2[_local_1].x, _local_2[_local_1].y), 1))
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function get hitGameRole():SystemGameRole
        {
            var _local_1:* = undefined;
            var _local_2:* = ComponentResourcesManage.$Ob["SystemWord"][("$troops" + (-(this.$troops) + 1))];
            for (_local_1 in _local_2)
            {
                if ((((((_local_2[_local_1] is SystemGameRole)) && ((!((this.bitmapData === null)))))) && ((!((_local_2[_local_1] === this))))))
                {
                    if ((((_local_2[_local_1].$god <= 0)) && ((_local_2[_local_1].gethp > 0))))
                    {
                        if (this.bitmapData.hitTest(new Point(this.x, this.y), 85, _local_2[_local_1], new Point(_local_2[_local_1].x, _local_2[_local_1].y), 1))
                        {
                            return (_local_2[_local_1]);
                        };
                    };
                };
            };
            return (null);
        }

        public function hitRoleAndSkill(_arg_1:int, _arg_2:Boolean=false):Array
        {
            var _local_3:* = undefined;
            var _local_4:* = new Array();
            var _local_5:* = ComponentResourcesManage.$Ob["SystemWord"][("$skill" + (-(this.$troops) + 1))];
            if (!_arg_2)
            {
                for (_local_3 in _local_5)
                {
                    if ((((Math.abs((_local_5[_local_3].$x - this.$x)) < _arg_1)) && ((Math.abs((_local_5[_local_3].$y - this.$y)) < _arg_1))))
                    {
                        _local_4.push(_local_5[_local_3]);
                    };
                };
            };
            _local_5 = ComponentResourcesManage.$Ob["SystemWord"][("$troops" + (-(this.$troops) + 1))];
            for (_local_3 in _local_5)
            {
                if ((((Math.abs((_local_5[_local_3].$x - this.$x)) < _arg_1)) && ((Math.abs((_local_5[_local_3].$y - this.$y)) < _arg_1))))
                {
                    if ((((_local_5[_local_3].$god <= 0)) && ((_local_5[_local_3].gethp > 0))))
                    {
                        _local_4.push(_local_5[_local_3]);
                    };
                };
            };
            return (_local_4);
        }

        public function CG():void
        {
            var _local_1:*;
            var _local_3:*;
            if (GameData.ns_select !== "none")
            {
                if ((((this.name == "role1")) || ((this.name == "role2"))))
                {
                    NSGameData.againRole(this.$hp.value, this.$mp);
                }
                else
                {
                    if (this.$hp.value <= 0)
                    {
                    };
                };
            };
            if ((((this.name == "role1")) || ((this.name == "role2"))))
            {
                stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.Down);
                stage.removeEventListener(KeyboardEvent.KEY_UP, this.Up);
            };
            this.$bitmapData.dispose();
            if ((this.$class["CGSkill"] is Function))
            {
                _local_1 = this.$class;
                _local_3 = _local_1;
                var _local_4 = _local_3;
                (_local_4["CGSkill"](this));
            };
            BitmapClear.Clear(this.$fit);
            this.bitmapData.dispose();
            this.$bit.bitmapData.dispose();
            this.$dit.bitmapData.dispose();
            if (this.$fit.bitmapData !== null)
            {
                this.$fit.bitmapData.dispose();
                this.$fit = null;
            };
            this.$bit = null;
            this.$dit = null;
            this.$fightOB = null;
            if (this.$hpShape != null)
            {
                this.$hpShape.parent.removeChild(this.$hpShape);
                this.$hpShape = null;
            };
            var _local_2:* = ComponentResourcesManage.$word[("$troops" + this.$troops)];
            _local_2.splice(_local_2.indexOf(this), 1);
            ComponentResourcesManage.$Ob["SystemWord"].$elementsOb[this.name] = null;
            delete ComponentResourcesManage.$Ob["SystemWord"].$elementsOb[this.name];
        }


    }
}//package SystemComponent