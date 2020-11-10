/*--------------------------------*\
| 🔔 script: Halcyon
| 🔥 author: au7yn
| 📅 version: 1.0 ALPHA B2
| 📛 Encryption By NoFairPlay Team 
|
| ⛔ Anti Non-launcher Load
| ⛔ Don't Remove Any Credits 
| ⛔ Don't Take Any Codes & Ideas
| ⛔ Don't Edit Encrypted Script Or May 
| ⛔ Be It Won't Work
\*--------------------------------*/




ModPE.langEdit("menu.copyright", "© Mojang AB | §4H§falcyon");

const ctx = com.mojang.minecraftpe.MainActivity.currentMainActivity.get(),
    getWidth = ctx.getWindowManager().getDefaultDisplay().getWidth(),
    getHeight = ctx.getWindowManager().getDefaultDisplay().getHeight(),
    sdcard = android.os.Environment.getExternalStorageDirectory(),
    GradientDrawable = android.graphics.drawable.GradientDrawable,
    Color = android.graphics.Color,
    parseColor = Color.parseColor,
    HSV = Color.HSVToColor,
    TextView = android.widget.TextView,
    LinearLayout = android.widget.LinearLayout,
    RelativeLayout = android.widget.RelativeLayout,
    Gravity = android.view.Gravity,
    LayoutParams = LinearLayout.LayoutParams,
    PopupWindow = android.widget.PopupWindow,
    ScrollView = android.widget.ScrollView,
    OnClickListener = android.view.View.OnClickListener,
    File = java.io.File,
    View = android.view.View,
    BufferedReader = java.io.BufferedReader,
    FileReader = java.io.FileReader,
    FOS = java.io.FileOutputStream,
    fromHtml = android.text.Html.fromHtml;

var Halcyon = new Object({
    isDev: false,
    totalModules: 0,
    mods: new Array()
});
var errorMessage = (error) => {
    clientMessage("§f[§4H§f] §e" + error.toString() + " §f(§l§o§7" + error.lineNumber + "§r§f)");
    print("(#" + error.lineNumber + ") > " + error);
};

var ifont = "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";

/*--------------------------------*\
| 🔔 Module system
| 🔥 author: au7yn
\*--------------------------------*/


var createModule = (names, states, category_) => {
    Halcyon.mods.push({
        name: names.split(","), //.split(":")
        state: states,
        category: category_,
        settings: [],
        view: [null, null], //1 - array 2 - bind
        bind: null,
        code: 0
    });
    Halcyon.totalModules++;
};
var getModule = (named) => {
    for (var i in Halcyon.mods) {
        if (Halcyon.mods[i].name[0] == named) {
            return Halcyon.mods[i];
        }
    }
};
var getState = (mod) => {
    return mod.state[0];
};
var getBindState = (mod) => {
    return mod.state[1];
};
var getCode = (mod) => {
    return mod.code;
};
var createSettings = (module, names, types, value) => {
    module.settings.push(new Object({
        name: names,
        type: types,
        values: types == "bool" ? value : value.split(",")
    }));
    //log, + in settings changer .split(":") when type var or string
};
var getSettings = (module, named, id) => {
    for (let i in module.settings) {
        if (module.settings[i].name == named) {
            if (module.settings[i].type == "bool") return module.settings[i].values;
            if (module.settings[i].type == "string") return module.settings[i].values[id];
            if (module.settings[i].type == "int") return module.settings[i].values[id]; //.split(",")

        };
    }

};
var associateModule = (name, states, categ, settings, code) => {
    try {
        createModule(name, states, categ);
        if (settings != 0) {
            settings.forEach(function (e) {
                createSettings(getModule(name.split(",")[0]), e.name, e.type, e.value);
            })
        } else {};
        getModule(name.split(",")[0]).code = code;
    } catch (e) {
        errorMessage(e)
    }
};

/*------------------------*\
| 🔥 Modules
\*------------------------*/

associateModule("HitBox,H", [!1, !1], "Combat", [{
    name: "X-Scale",
    type: "int",
    value: "10,0.1,15"
}, {
    name: "Y-Scale",
    type: "int",
    value: "10,0.1,15"
}, {
    name: "From EntityList",
    type: "bool",
    value: false
}, {
    name: "Type",
    type: "string",
    value: "Pointed,Nearest,Pointed,All"
}], {
    getNearestEntity(range) {
        var mod = getModule("HitBox");
        var sett = getSettings(mod, "From EntityList", 0);
        var list = getCode(getModule("EntityList")).list;
        if (sett) {
            var players = list;
        } else {
            var players = Server.getAllPlayers();
        }
        var small = range;
        var ent = null;
        for (var i = 0; i < players.length; i++) {
            if (!getCode(getModule("ClickFriends")).isFriend(i)) {
                var x = Entity.getX(players[i]) - getPlayerX();
                var y = Entity.getY(players[i]) - getPlayerY();
                var z = Entity.getZ(players[i]) - getPlayerZ();
                var dist = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
                if (dist < small && dist > 0 && Entity.getHealth(players[i]) >= 1) {
                    small = dist;
                    ent = players[i];
                }
            }
        }
        return ent;
    },
    tick() {
        var mod = getModule("HitBox");
        var sett = getSettings(mod, "Type", 0);
        if (sett == "Nearest") {
            if (getState(mod) && confirmScreenSafe()) {
                let x = getSettings(mod, "X-Scale", 0);
                let y = getSettings(mod, "Y-Scale", 0);
                if (getCode(mod).getNearestEntity(15) != null) {
                    Entity.setCollisionSize(getCode(mod).getNearestEntity(15), x, y);
                }
            }
        }
    },
    attack(a, v) {
        var mod = getModule("HitBox");
        var sett = getSettings(mod, "Type", 0);
        if (sett == "Pointed") {
            if (!getCode(getModule("ClickFriends")).isFriend(v)) {
                if (getState(mod)) {
                    let x = getSettings(mod, "X-Scale", 0);
                    let y = getSettings(mod, "Y-Scale", 0);
                    if (a == Player.getEntity()) {
                        Entity.setCollisionSize(v, x, y);
                    }
                } else {
                    if (a == Player.getEntity()) {
                        Entity.setCollisionSize(v, 0.8, 1.8);
                    }
                }
            }
        }

    },
    toggle() {
        //customMessage('lol')
    }
});
associateModule("KillAura,K", [!1, !1], "Combat", [{
    name: "CPS",
    type: "int",
    value: "20,1,20"
}, {
    name: "Range",
    type: "int",
    value: "4.2,0.1,8"
}, {
    name: "From EntityList",
    type: "bool",
    value: false
}, {
    name: "Mode",
    type: "string",
    value: "Single,Single,Switch,Multi"
}], {
    toggled: false,
    last: 0,
    getNearestEntity(range) {
        var mod = getModule("KillAura");
        var sett = getSettings(mod, "From EntityList", 0);
        var list = getCode(getModule("EntityList")).list;
        if (sett) {
            var players = list;
        } else {
            var players = Server.getAllPlayers();
        }
        var small = range;
        var ent = null;
        for (var i = 0; i < players.length; i++) {
            if (!getCode(getModule("ClickFriends")).isFriend(i)) {
                var x = Entity.getX(players[i]) - getPlayerX();
                var y = Entity.getY(players[i]) - getPlayerY();
                var z = Entity.getZ(players[i]) - getPlayerZ();
                var dist = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
                if (dist < small && dist > 0 && Entity.getHealth(players[i]) >= 1) {
                    small = dist;
                    ent = players[i];
                }
            }
        }
        return ent;
    },
    getDistance(ent) {
        var x = Player.getX();
        var y = Player.getY();
        var z = Player.getZ();
        var x1 = Entity.getX(ent);
        var y1 = Entity.getY(ent);
        var z1 = Entity.getZ(ent);
        var x2 = Math.pow(x1 - x, 2);
        var y2 = Math.pow(y1 - y, 2);
        var z2 = Math.pow(z1 - z, 2);
        return Math.sqrt(x2 + y2 + z2);
    },
    swing() {
        var mod = getModule("KillAura");
        var CPS = getSettings(mod, "CPS", 0);
        var Range = getSettings(mod, "Range", 0);
        var Mode = getSettings(mod, "Mode", 0);
        var sett = getSettings(mod, "From EntityList", 0);
        var state = getState(mod);
        var inst = new android.app.Instrumentation;
        if (state && confirmScreenSafe()) {
            if (Mode == "Single") {
                var ent = getCode(mod).getNearestEntity(Range);
                if (ent != -1  && getCode(getModule("EntityList")).isValid(ent)) {
                    Entity.setCollisionSize(ent, getCode(mod).getDistance(ent) * 2 + 2, getCode(mod).getDistance(ent) * 2 + 2);
                    inst.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_Q);
                }
            };
            if (Mode == "Switch") {
                var ent = getCode(mod).getNearestEntity(Range);
                if (ent != -1 && getCode(getModule("EntityList")).isValid(ent)) {
                    Entity.setCollisionSize(ent, getCode(mod).getDistance(ent) * 2 + 2, getCode(mod).getDistance(ent) * 2 + 2);
                    inst.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_Q);
                    Entity.setCollisionSize(ent, 0.8, 1.8);
                }
            };
            if (Mode == "Multi") {
                let nearestEntities = [];
                var list = getCode(getModule("EntityList")).list;
                if (sett) {
                    var players = list;
                } else {
                    var players = Server.getAllPlayers();
                }
                players.forEach(function (e) {
                    if (e != getPlayerEnt() && !getCode(getModule("ClickFriends")).isFriend(e) && e!= -1) {
                        if (getCode(mod).getDistance(e) <= Range) {
                            nearestEntities.push(e);
                        }
                    }
                });
                if (nearestEntities.length != 0) {
                    Entity.setCollisionSize(nearestEntities[getCode(mod).last], getCode(mod).getDistance(nearestEntities[getCode(mod).last]) * 2 + 2, getCode(mod).getDistance(nearestEntities[getCode(mod).last]) * 2 + 2);
                    inst.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_Q);
                    getCode(mod).last++;
                };
                var lngth = nearestEntities.length - 1;
                if (getCode(mod).last > lngth) {
                    getCode(mod).last = 0;
                };
                players.forEach(function (e) {
                    Entity.setCollisionSize(e, 0.8, 1.8);
                });
            };
        }
    },
    init() {
        try {
            var mod = getModule("KillAura");
            var CPS = getSettings(mod, "CPS", 0);
            var Range = getSettings(mod, "Range", 0);
            var Mode = getSettings(mod, "Mode", 0);
            var sett = getSettings(mod, "From EntityList", 0);
            var state = getState(mod);
            var hostThread = new java.lang.Thread(new java.lang.Runnable({
                run() {
                    try {
                        android.os.Looper.prepare();
                        new android.os.Handler().postDelayed(new java.lang.Runnable({
                            run() {
                                try {
                                    if(getState(mod)) getCode(mod).swing();

                                    new android.os.Handler().postDelayed(this, 1000 / CPS);
                                } catch (e) {
                                    //getCode(mod).swing();

                                    //new android.os.Handler().postDelayed(this, 1000 / CPS);
                                    errorMessage(e + ' at #' + e.lineNumber);
                                    getCode(mod).init(); //reload
                                }
                            }
                        }), 1000 / CPS);
                        android.os.Looper.loop();
                    } catch (e) {
                        errorMessage(e)
                    }

                }
            }))
            hostThread.start();
        } catch (e) {
            errorMessage(e)
        }
    },
    toggle() {
        try {
            var mod = getModule("KillAura");
            if (getCode(mod).toggled == false) {
                getCode(mod).init();
                getCode(mod).toggled = true;
            }
        } catch (e) {
            errorMessage(e)
        }
    }

}); //q - 45
associateModule("AutoClicker,C", [!1, !1], "Combat", [{
    name: "CPS",
    type: "int",
    value: "20,1,20"
}], {
    toggled: false,
    init() {
        try {
            var mod = getModule("AutoClicker");
            var CPS = getSettings(mod, "CPS", 0);
            var state = getState(mod);
            var inst = new android.app.Instrumentation;


            var hostThread = new java.lang.Thread(new java.lang.Runnable({
                run() {
                    try {
                        android.os.Looper.prepare();
                        new android.os.Handler().postDelayed(new java.lang.Runnable({
                            run() {
                                try {
                                    var mod = getModule("AutoClicker");
                                    var CPS = getSettings(mod, "CPS", 0);
                                    var state = getState(mod);
                                    var inst = new android.app.Instrumentation;
                                    if (state && confirmScreenSafe()) {
                                        inst.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_Q);
                                    }

                                    new android.os.Handler().postDelayed(this, 1000 / CPS);
                                } catch (e) {
                                    //getCode(mod).swing();

                                    //new android.os.Handler().postDelayed(this, 1000 / CPS);
                                    errorMessage(e + ' at #' + e.lineNumber);
                                    getCode(mod).init(); //reload
                                }
                            }
                        }), 1000 / CPS);
                        android.os.Looper.loop();
                    } catch (e) {
                        errorMessage(e)
                    }

                }
            }))
            hostThread.start();
        } catch (e) {
            errorMessage(e)
        }
    },
    toggle() {
        try {
            var mod = getModule("AutoClicker");
            if (getCode(mod).toggled == false) {
                getCode(mod).init();
                getCode(mod).toggled = true;
            }
        } catch (e) {
            errorMessage(e)
        }
    }

}); //q - 45
associateModule("AntiKnockback,AK", [!1, !1], "Combat", 0, {
    timing: 0,
    hp: 0,
    tick() {
        var mod = getModule("AntiKnockback");
        if (getState(mod) && confirmGameScreen()) {
            getCode(mod).timing = 0;
            if (getCode(mod).hp > Entity.getHealth(Player.getEntity())) {
                getCode(mod).timing = 1;
                setVelX(Player.getEntity(), 0);
                setVelY(Player.getEntity(), 0);
                setVelZ(Player.getEntity(), 0);
                Entity.setImmobile(Player.getEntity(), true);
            }
            if (getCode(mod).timing == 0) {
                Entity.setImmobile(Player.getEntity(), false);
            }
            getCode(mod).hp = Entity.getHealth(Player.getEntity());
            if (getCode(mod).timing != 0) {
                getCode(mod).timing--;
            }
        }
    }
});
associateModule("HitAim,HA", [!1, !1], "Combat", [{
    name: "HeadLock",
    type: "bool",
    value: true
}, {
    name: "Lock",
    type: "bool",
    value: false
}, {
    name: "Distance",
    type: "int",
    value: "6,0.1,10"
}], {
    target: -1,
    getDistance(ent) {
        var x = Player.getX();
        var y = Player.getY();
        var z = Player.getZ();
        var x1 = Entity.getX(ent);
        var y1 = Entity.getY(ent);
        var z1 = Entity.getZ(ent);
        var x2 = Math.pow(x1 - x, 2);
        var y2 = Math.pow(y1 - y, 2);
        var z2 = Math.pow(z1 - z, 2);
        return Math.sqrt(x2 + y2 + z2);
    },
    tick() {
        var mod = getModule("HitAim");
        var sett = getSettings(mod, "Lock", 0);
        var sett1 = getSettings(mod, "Distance", 0);
        if (getState(mod)) {
            if (getCode(mod).target != -1 && sett && getCode(mod).getDistance(getCode(mod).target) <= sett1) getCode(mod).aim(getCode(mod).target);
        }
    },
    aim(ent) {
        var mod = getModule("HitAim");
        var sett = getSettings(mod, "HeadLock", 0);
        if (ent != null) {
            var x = Entity.getX(ent) - getPlayerX();
            if (sett)
                var y = Entity.getY(ent) - getPlayerY()
            else
                var y = Entity.getY(ent) - 1 - getPlayerY();
            var z = Entity.getZ(ent) - getPlayerZ();

            if (Entity.getEntityTypeId(ent) != 63) y += 0.5;
            var a = 0.5 + Entity.getX(ent);
            var b = Entity.getY(ent);
            var c = 0.5 + Entity.getZ(ent);
            var len = Math.sqrt(x * x + y * y + z * z);
            var y = y / len;
            var pitch = Math.asin(y);
            pitch = pitch * 180.0 / Math.PI;
            pitch = -pitch;
            var yaw = -Math.atan2(a - (Player.getX() + 0.5), c - (Player.getZ() + 0.5)) * (180 / Math.PI);
            if (pitch < 89 && pitch > -89) {
                Entity.setRot(Player.getEntity(), yaw, pitch);
            }
        }
    },
    attack(a, v) {
        var mod = getModule("HitAim");
        var sett = getSettings(mod, "Distance", 0);
        if (getState(mod)) {
            if (a == Player.getEntity() && getCode(mod).getDistance(v) <= sett) {
                getCode(mod).aim(v);
                getCode(mod).target = v
            }
        }
    }
});
associateModule("TPAura,TA", [!1, !1], "Combat", [{
    name: "Expand",
    type: "int",
    value: "1,0.1,10"
}], {
    attack(a, v) {
        var mod = getModule("TPAura");
        var sett = getSettings(mod, "Expand", 0);
        if (getState(mod)) {
            if (a == Player.getEntity()) {
                Entity.setPosition(Player.getEntity(), Entity.getX(v), Entity.getY(v) + sett, Entity.getZ(v));
                setVelY(Player.getEntity(), 0.05);
            }
        }
    }
});
associateModule("HitBoost,HB", [!1, !1], "Combat", [{
    name: "Velocity",
    type: "int",
    value: "1.3,0.1,5"
}], {
    attack(a, v) {
        var mod = getModule("HitBoost");
        var sett = getSettings(mod, "Velocity", 0);
        if (getState(mod)) {
            if (a == Player.getEntity()) {
                var pitch = ((Entity.getPitch(getPlayerEnt()) + 90) * Math.PI) / 180;
                var yaw = ((Entity.getYaw(getPlayerEnt()) + 90) * Math.PI) / 180;
                var X = Math.sin(pitch) * Math.cos(yaw);
                var Y = Math.cos(pitch);
                var Z = Math.sin(pitch) * Math.sin(yaw);
                setVelX(getPlayerEnt(), X * sett);
                setVelY(getPlayerEnt(), Y * sett);
                setVelZ(getPlayerEnt(), Z * sett);
            }
        }
    }
});

associateModule("Flight,F", [!1, !1], "Movement", [{
    name: "Type",
    type: "string",
    value: "Mineplex,Crouch,Bounce,Mineplex,AirStack"
}, {
    name: "Velocity",
    type: "int",
    value: "1.5,0.1,5"
}], {
    timing: 10,
    isliquid: function (id) {
        var mod = getModule("Flight");
        if (id == 8 || id == 9 || id == 10 || id == 11) return true;
        return false;
    },
    onground: function () {
        var mod = getModule("Flight");
        var y = getPlayerY();
        while (y > 1) y -= 1;
        if ((Math.round(y * 100) >= 61 && Math.round(y * 100) <= 63) && getTile(getPlayerX(), getPlayerY() - 1.81, getPlayerZ()) != 0 && !getCode(mod).isliquid(getTile(getPlayerX(), getPlayerY() - 1.81, getPlayerZ()))) return true;
        if ((Math.round(y * 100) >= 11 && Math.round(y * 100) <= 13) && getTile(getPlayerX(), getPlayerY() - 1.81, getPlayerZ()) != 0 && !getCode(mod).isliquid(getTile(getPlayerX(), getPlayerY() - 1.81, getPlayerZ()))) return true;
        return false;
    },
    tick() {
        var mod = getModule("Flight");
        var sett = getSettings(mod, "Type", 0);
        var speed = getSettings(mod, "Velocity", 0);
        if (getState(mod) && confirmScreenSafe()) {
            if (sett == "Crouch") {
                if (Entity.isSneaking(Player.getEntity()) == true) {
                    let pitch = ((Entity.getPitch(getPlayerEnt()) + 90) * Math.PI) / 180;
                    let yaw = ((Entity.getYaw(getPlayerEnt()) + 90) * Math.PI) / 180;
                    let X = Math.sin(pitch) * Math.cos(yaw);
                    let Y = Math.cos(pitch);
                    let Z = Math.sin(pitch) * Math.sin(yaw);
                    setVelX(getPlayerEnt(), X * speed);
                    setVelY(getPlayerEnt(), 0.01);
                    setVelZ(getPlayerEnt(), Z * speed);
                    Entity.setPositionRelative(getPlayerEnt(), 0, 0.0005, 0);
                }
            };
            if (sett == "Mineplex") {
                let pitch = ((Entity.getPitch(getPlayerEnt()) + 90) * Math.PI) / 180;
                let yaw = ((Entity.getYaw(getPlayerEnt()) + 90) * Math.PI) / 180;
                let X = Math.sin(pitch) * Math.cos(yaw);
                let Y = Math.cos(pitch);
                let Z = Math.sin(pitch) * Math.sin(yaw);
                setVelX(getPlayerEnt(), X * speed);
                setVelY(getPlayerEnt(), 0);
                setVelZ(getPlayerEnt(), Z * speed);
            };
            if (sett == "Bounce") {
                if (!getCode(mod).onground()) {
                    let pitch = ((Entity.getPitch(getPlayerEnt()) + 90) * Math.PI) / 180;
                    let yaw = ((Entity.getYaw(getPlayerEnt()) + 90) * Math.PI) / 180;
                    let X = Math.sin(pitch) * Math.cos(yaw);
                    let Y = Math.cos(pitch);
                    let Z = Math.sin(pitch) * Math.sin(yaw);
                    setVelX(getPlayerEnt(), X * speed);
                    setVelZ(getPlayerEnt(), Z * speed);
                    getCode(mod).timing--;
                    if (getCode(mod).timing <= 0) {
                        setVelY(getPlayerEnt(), 0.35);
                        Entity.setPositionRelative(getPlayerEnt(), 0, 0.0001, 0);
                        getCode(mod).timing = 10;
                    }
                }
            };
            if (sett == "AirStack") {
                Entity.setPosition(getPlayerEnt(), Player.getX(), Player.getY() + 0.19, Player.getZ());
                setVelY(getPlayerEnt(), -0.2)
            }
        }
    },
    toggle() {
        var mod = getModule("Flight");
        if (getState(mod) && getSettings(mod, "Type", 0) == "Mineplex") {Entity.setPositionRelative(getPlayerEnt(), 0, 0.05, 0);}else{
            setVelX(Player.getEntity(), 0);
            setVelY(Player.getEntity(), -0.1);
            setVelZ(Player.getEntity(), 0);
        }
    }
});
associateModule("Speed,S", [!1, !1], "Movement", [{
    name: "Velocity",
    type: "int",
    value: "1.1,0.1,3"
}, {
    name: "Type",
    type: "string",
    value: "Increase,Increase"
}], {
    tick() {
        var mod = getModule("Speed");
        var sett = getSettings(mod, "Velocity", 0);
        if (getState(mod)) {
            setVelX(getPlayerEnt(), Entity.getVelX(getPlayerEnt()) * sett);
            setVelZ(getPlayerEnt(), Entity.getVelZ(getPlayerEnt()) * sett);
        }
    }
});
associateModule("LongJump,L", [!1, !1], "Movement", [{
    name: "Velocity",
    type: "int",
    value: "2,0.1,3"
}], {
    gui: null,
    jump() {
        var mod = getModule("LongJump");
        var sett = getSettings(mod, "Velocity", 0);
        Entity.setPositionRelative(getPlayerEnt(), 0, 0.05, 0);
        setVelX(Player.getEntity(), 0);
            setVelY(Player.getEntity(), 0);
            setVelZ(Player.getEntity(), 0);
        let p = ((Entity.getPitch(getPlayerEnt()) + 90) * Math.PI) / 180;
        let y = ((Entity.getYaw(getPlayerEnt()) + 90) * Math.PI) / 180;
        let xx = Math.sin(p) * Math.cos(y);
        let yy = Math.sin(p) * Math.sin(y);
        let zz = Math.cos(p);
        setVelY(getPlayerEnt(), +0.47);
        setVelZ(getPlayerEnt(), sett * yy);
        setVelX(getPlayerEnt(), sett * xx);
    },
    button() {
        var mod = getModule("LongJump");
        // if (getState(mod)) 
        uithread(() => {
            try {

                let move = false;
                let dx = 0;
                let dy = 0;
                let PosX = 0;
                let PosY = 0;

                let btn = new android.widget.TextView(ctx);
                btn.setText(mod.name[1]);
                btn.setTextColor(-1);
                btn.setTextSize(14);
                btn.setTransformationMethod(null);
                btn.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1));
                btn.setBackground(style.custom_simple("#545454"));
                btn.setGravity(android.view.Gravity.CENTER);
                btn.setOnClickListener(new android.view.View.OnClickListener({
                    onClick: function (v) {
                        if (confirmScreenSafe()) getCode(mod).jump()
                    }
                }));
                btn.setOnTouchListener(new android.view.View.OnTouchListener({
                    onTouch: function (view, motionEvent) {
                        try {
                            if (!move) return false;
                            switch (motionEvent.getAction()) {
                                case android.view.MotionEvent.ACTION_DOWN:
                                    dx = PosX - motionEvent.getRawX();
                                    dy = PosY - motionEvent.getRawY();
                                    break;
                                case android.view.MotionEvent.ACTION_MOVE:
                                    PosX = (motionEvent.getRawX() + dx);
                                    PosY = (motionEvent.getRawY() + dy);
                                    getCode(mod).gui.update(PosX, PosY, -1, -1);
                                    break;
                                case android.view.MotionEvent.ACTION_UP:
                                case android.view.MotionEvent.ACTION_CANCEL:
                                    move = false;
                                    break;
                            }
                        } catch (e) {
                            errorMessage(e);
                        }
                        return true;
                    }
                }));
                btn.setOnLongClickListener(new android.view.View.OnLongClickListener({
                    onLongClick: function (v, t) {
                        ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
                        move = true;
                        return true;
                    }
                }));

                getCode(mod).gui = new android.widget.PopupWindow(btn, gs(dip2px(50)), gs(dip2px(50)));
                getCode(mod).gui.setAnimationStyle(android.R.style.Animation_Dialog);
                getCode(mod).gui.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.LEFT | android.view.Gravity.TOP, 0, 0);
                getCode(mod).gui.update(ctx.getWindowManager().getDefaultDisplay().getWidth() / 2, ctx.getWindowManager().getDefaultDisplay().getHeight() / 2, -1, -1)

            } catch (e) {
                errorMessage(e)
            }
        })
    },
    toggle() {
        var mod = getModule("LongJump");
        if (getState(mod)) {
            getCode(mod).button();
        } else {
            getCode(mod).gui.dismiss();
        }
    }
});
associateModule("AirJump,A", [!1, !1], "Movement", [{
    name: "Velocity",
    type: "int",
    value: "0.4,0.1,1"
}], {
    gui: null,
    jump() {
        var mod = getModule("AirJump");
        var sett = getSettings(mod, "Velocity", 0);
        setVelY(getPlayerEnt(), +sett);
    },
    button() {
        var mod = getModule("AirJump");
        // if (getState(mod)) 
        uithread(() => {
            try {

                let move = false;
                let dx = 0;
                let dy = 0;
                let PosX = 0;
                let PosY = 0;

                let btn = new android.widget.TextView(ctx);
                btn.setText(mod.name[1]);
                btn.setTextColor(-1);
                btn.setTextSize(14);
                btn.setTransformationMethod(null);
                btn.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1));
                btn.setBackground(style.custom_simple("#545454"));
                btn.setGravity(android.view.Gravity.CENTER);
                btn.setOnClickListener(new android.view.View.OnClickListener({
                    onClick: function (v) {
                        if (confirmScreenSafe()) getCode(mod).jump()
                    }
                }));
                btn.setOnTouchListener(new android.view.View.OnTouchListener({
                    onTouch: function (view, motionEvent) {
                        try {
                            if (!move) return false;
                            switch (motionEvent.getAction()) {
                                case android.view.MotionEvent.ACTION_DOWN:
                                    dx = PosX - motionEvent.getRawX();
                                    dy = PosY - motionEvent.getRawY();
                                    break;
                                case android.view.MotionEvent.ACTION_MOVE:
                                    PosX = (motionEvent.getRawX() + dx);
                                    PosY = (motionEvent.getRawY() + dy);
                                    getCode(mod).gui.update(PosX, PosY, -1, -1);
                                    break;
                                case android.view.MotionEvent.ACTION_UP:
                                case android.view.MotionEvent.ACTION_CANCEL:
                                    move = false;
                                    break;
                            }
                        } catch (e) {
                            errorMessage(e);
                        }
                        return true;
                    }
                }));
                btn.setOnLongClickListener(new android.view.View.OnLongClickListener({
                    onLongClick: function (v, t) {
                        ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
                        move = true;
                        return true;
                    }
                }));

                getCode(mod).gui = new android.widget.PopupWindow(btn, gs(dip2px(50)), gs(dip2px(50)));
                getCode(mod).gui.setAnimationStyle(android.R.style.Animation_Dialog);
                getCode(mod).gui.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.LEFT | android.view.Gravity.TOP, 0, 0);
                getCode(mod).gui.update(ctx.getWindowManager().getDefaultDisplay().getWidth() / 2, ctx.getWindowManager().getDefaultDisplay().getHeight() / 2, -1, -1)

            } catch (e) {
                errorMessage(e)
            }
        })
    },
    toggle() {
        var mod = getModule("AirJump");
        if (getState(mod)) {
            getCode(mod).button();
        } else {
            getCode(mod).gui.dismiss();
        }
    }
});

associateModule("Elevator,E", [!1, !1], "Player", [{
    name: "Level",
    type: "int",
    value: "2,1,10"
}], {
    gui: null,
    button() {
        var mod = getModule("Elevator");
        var sett = getSettings(mod, "Level", 0);
        // if (getState(mod)) 
        uithread(() => {
            try {


                let move = false;
                let dx = 0;
                let dy = 0;
                let PosX = 0;
                let PosY = 0;

                let lay = new android.widget.LinearLayout(ctx);
                lay.setOrientation(1);

                let btn = new android.widget.TextView(ctx);
                btn.setText("Up");
                btn.setTextColor(-1);
                btn.setTextSize(14);
                btn.setTransformationMethod(null);
                btn.setLayoutParams(new android.widget.LinearLayout.LayoutParams(gs(dip2px(75)), gs(dip2px(50))));
                btn.setBackground(style.custom_simple("#545454"));
                btn.setGravity(android.view.Gravity.CENTER);
                btn.setOnClickListener(new android.view.View.OnClickListener({
                    onClick: function (v) {
                        if (confirmScreenSafe()) {
                            Entity.setPositionRelative(Player.getEntity(), 0, getSettings(mod, "Level", 0), 0);
                            setVelY(Player.getEntity(), 0)
                        }
                    }
                }));
                btn.setOnTouchListener(new android.view.View.OnTouchListener({
                    onTouch: function (view, motionEvent) {
                        try {
                            if (!move) return false;
                            switch (motionEvent.getAction()) {
                                case android.view.MotionEvent.ACTION_DOWN:
                                    dx = PosX - motionEvent.getRawX();
                                    dy = PosY - motionEvent.getRawY();
                                    break;
                                case android.view.MotionEvent.ACTION_MOVE:
                                    PosX = (motionEvent.getRawX() + dx);
                                    PosY = (motionEvent.getRawY() + dy);
                                    getCode(mod).gui.update(PosX, PosY, -1, -1);
                                    break;
                                case android.view.MotionEvent.ACTION_UP:
                                case android.view.MotionEvent.ACTION_CANCEL:
                                    move = false;
                                    break;
                            }
                        } catch (e) {
                            errorMessage(e);
                        }
                        return true;
                    }
                }));
                btn.setOnLongClickListener(new android.view.View.OnLongClickListener({
                    onLongClick: function (v, t) {
                        ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
                        move = true;
                        return true;
                    }
                }));

                lay.addView(btn);

                let params = new android.widget.LinearLayout.LayoutParams(gs(dip2px(75)), gs(dip2px(50)));
                params.setMargins(0, gs(2), 0, 0);

                let btn1 = new android.widget.TextView(ctx);
                btn1.setText("Down");
                btn1.setTextColor(-1);
                btn1.setTextSize(14);
                btn1.setTransformationMethod(null);
                btn1.setLayoutParams(params);
                btn1.setBackground(style.custom_simple("#545454"));
                btn1.setGravity(android.view.Gravity.CENTER);
                btn1.setOnClickListener(new android.view.View.OnClickListener({
                    onClick: function (v) {
                        if (confirmScreenSafe()) {
                            Entity.setPositionRelative(Player.getEntity(), 0, -getSettings(mod, "Level", 0), 0);
                            setVelY(Player.getEntity(), 0)
                        }
                    }
                }));
                btn1.setOnTouchListener(new android.view.View.OnTouchListener({
                    onTouch: function (view, motionEvent) {
                        try {
                            if (!move) return false;
                            switch (motionEvent.getAction()) {
                                case android.view.MotionEvent.ACTION_DOWN:
                                    dx = PosX - motionEvent.getRawX();
                                    dy = PosY - motionEvent.getRawY();
                                    break;
                                case android.view.MotionEvent.ACTION_MOVE:
                                    PosX = (motionEvent.getRawX() + dx);
                                    PosY = (motionEvent.getRawY() + dy);
                                    getCode(mod).gui.update(PosX, PosY, -1, -1);
                                    break;
                                case android.view.MotionEvent.ACTION_UP:
                                case android.view.MotionEvent.ACTION_CANCEL:
                                    move = false;
                                    break;
                            }
                        } catch (e) {
                            errorMessage(e);
                        }
                        return true;
                    }
                }));
                btn1.setOnLongClickListener(new android.view.View.OnLongClickListener({
                    onLongClick: function (v, t) {
                        ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
                        move = true;
                        return true;
                    }
                }));
                lay.addView(btn1)

                getCode(mod).gui = new android.widget.PopupWindow(lay, -2, -2);
                getCode(mod).gui.setAnimationStyle(android.R.style.Animation_Dialog);
                getCode(mod).gui.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.LEFT | android.view.Gravity.TOP, 0, 0);
                getCode(mod).gui.update(ctx.getWindowManager().getDefaultDisplay().getWidth() / 2, ctx.getWindowManager().getDefaultDisplay().getHeight() / 2, -1, -1)

            } catch (e) {
                errorMessage(e)
            }
        })
    },
    toggle() {
        var mod = getModule("Elevator");
        if (getState(mod)) {
            getCode(mod).button();
        } else {
            getCode(mod).gui.dismiss();
        }
    }
});
associateModule("FieldOfView,Fv", [!1, !1], "Misc", [{
    name: "Angle",
    type: "int",
    value: "90,1,180"
}], {
    tick() {
        var mod = getModule("FieldOfView");
        var sett = getSettings(mod, "Angle", 0);
        if (getState(mod)) {
            ModPE.setFov(sett);
        } else {
            ModPE.resetFov();
        }
    }
});
associateModule("Haste,He", [!1, !1], "Player", 0, {
    toggle() {
        var mod = getModule("Haste");
        if (getState(mod)) {
            Entity.addEffect(Player.getEntity(), 3, 5000000, 127, true, false);
        } else {
            Entity.removeEffect(Player.getEntity(), 3);
        }
    }
});


associateModule("ClickFriends,CF", [!1, !1], "Misc", 0, {
    list: [],
    /*initialization(){
        try {
            let path = android.os.Environment.getExternalStorageDirectory().getPath() + "Halcyon";
            //java.io.File(path).mkdirs();
            var file = new java.io.File(path, "friends.txt");
            file.createNewFile();

        }catch(e){
            errorMessage(e)
        }
    },*/
    isFriend(e) {
        var mod = getModule("ClickFriends");
        return getCode(mod).list.indexOf(e) == -1 ? false : true
    },
    attack(a, v) {
        var mod = getModule("ClickFriends");
        if (getState(mod)) {
            if (a == Player.getEntity()) {
                if (getCode(mod).list.indexOf(v) == -1) {
                    //if()
                    preventDefault();
                    getCode(mod).list.push(v);
                    customMessage(Entity.getNameTag(v) + "§r has §aadded§r to the friend list");
                    Entity.setNameTag(v, Entity.getNameTag(v) + "\n§r§a[FRIEND]");
                } else {
                    preventDefault();
                    delete getCode(mod).list[getCode(mod).list.indexOf(v)];
                    Entity.setNameTag(v, Entity.getNameTag(v).replace('\n§r§a[FRIEND]', ''));
                    customMessage(Entity.getNameTag(v) + "§r has been §cremoved§r from the friend list");
                }
            }
            //getCode(mod).list
        };
    }
});
associateModule("FastEat,FE", [!1, !1], "Player", 0, {
    on: "Item['setProperties'](0x104,{'use_duration':0x1,'food':{'nutrition':0x4,'saturation_modifier':'low','is_meat':![]}}),Item['setProperties'](0x142,{'stack_by_data':!![],'use_duration':0x1,'foil':![],'food':{'nutrition':0x4,'saturation_modifier':'supernatural','is_meat':![],'effects':[{'name':'regeneration','chance':0x1,'duration':0x5,'amplifier':0x1},{'name':'absorption','chance':0x1,'duration':0x78,'amplifier':0x0}],'enchanted_effects':[{'name':'regeneration','chance':0.66,'duration':0x1e,'amplifier':0x4},{'name':'absorption','chance':0.66,'duration':0x78,'amplifier':0x0},{'name':'resistance','chance':0.66,'duration':0x12c,'amplifier':0x0},{'name':'fire_resistance','chance':0.66,'duration':0x12c,'amplifier':0x0}]}}),Item['setProperties'](0x104,{'use_duration':0x1,'max_stack_size':0x1,'food':{'nutrition':0x6,'saturation_modifier':'normal','is_meat':![],'using_converts_to':'bowl'}}),Item['setProperties'](0x129,{'use_duration':0x1,'food':{'nutrition':0x5,'saturation_modifier':'normal','is_meat':![]}}),Item['setProperties'](0x13f,{'use_duration':0x1,'food':{'nutrition':0x3,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x140,{'use_duration':0x1,'food':{'nutrition':0x8,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x15d,{'use_duration':0x1,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x2,'saturation_modifier':'poor','is_meat':!![]}}),Item['setProperties'](0x1cc,{'use_duration':0x1,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x2,'saturation_modifier':'poor','is_meat':!![]}}),Item['setProperties'](0x1cd,{'use_duration':0x1,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x1,'saturation_modifier':'poor','is_meat':!![]}}),Item['setProperties'](0x1ce,{'use_duration':0x1,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x1,'saturation_modifier':'poor','is_meat':!![],'effects':[{'name':'poison','duration':0x3c,'amplifier':0x3},{'name':'nausea','duration':0xf,'amplifier':0x1},{'name':'hunger','duration':0xf,'amplifier':0x2}]}}),Item['setProperties'](0x15e,{'use_duration':0x1,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x5,'saturation_modifier':'normal','eat_sound':'random.burp','is_meat':!![]}}),Item['setProperties'](0x1cf,{'use_duration':0x1,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x6,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x168,{'use_duration':0x1,'food':{'nutrition':0x2,'saturation_modifier':'poor','is_meat':![]}}),Item['setProperties'](0x165,{'use_duration':0x1,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':![]}}),Item['setProperties'](0x16b,{'use_duration':0x1,'food':{'nutrition':0x3,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x16c,{'use_duration':0x1,'food':{'nutrition':0x8,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x16d,{'use_duration':0x1,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':!![],'effects':[{'name':'hunger','chance':0.3,'duration':0x1e,'amplifier':0x0}]}}),Item['setProperties'](0x16e,{'use_duration':0x1,'food':{'nutrition':0x6,'saturation_modifier':'normal','is_meat':!![]}}),Item['setProperties'](0x1a7,{'use_duration':0x1,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x1a8,{'use_duration':0x1,'food':{'nutrition':0x6,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x16f,{'use_duration':0x1,'food':{'nutrition':0x4,'saturation_modifier':'poor','is_meat':!![],'effects':[{'name':'hunger','chance':0.8,'duration':0x1e,'amplifier':0x0}]}}),Item['setProperties'](0x177,{'use_duration':0x1,'food':{'nutrition':0x2,'saturation_modifier':'good','is_meat':![],'effects':[{'name':'poison','chance':0x1,'duration':0x5,'amplifier':0x0}]}}),Item['setProperties'](0x187,{'use_duration':0x1,'food':{'nutrition':0x3,'saturation_modifier':'normal','is_meat':![]},'seed':{'crop_result':'carrots','plant_at':'farmland'}}),Item['setProperties'](0x188,{'use_duration':0x1,'food':{'nutrition':0x1,'saturation_modifier':'low','is_meat':![]},'seed':{'crop_result':'potatoes','plant_at':'farmland'}}),Item['setProperties'](0x189,{'use_duration':0x1,'food':{'nutrition':0x5,'saturation_modifier':'normal','is_meat':![]}}),Item['setProperties'](0x18a,{'use_duration':0x1,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':![],'effects':[{'name':'poison','chance':0.6,'duration':0x5,'amplifier':0x0}]}}),Item['setProperties'](0x18c,{'use_duration':0x1,'food':{'nutrition':0x6,'saturation_modifier':'supernatural','is_meat':![]}}),Item['setProperties'](0x190,{'use_duration':0x1,'food':{'nutrition':0x8,'saturation_modifier':'low','is_meat':![]}}),Item['setProperties'](0x19b,{'use_duration':0x1,'food':{'nutrition':0x3,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x19c,{'use_duration':0x1,'food':{'nutrition':0x5,'saturation_modifier':'normal','is_meat':!![]}}),Item['setProperties'](0x19d,{'use_duration':0x1,'max_stack_size':0x1,'food':{'nutrition':0xa,'saturation_modifier':'normal','using_converts_to':'bowl','is_meat':!![]}}),Item['setProperties'](0x1cb,{'use_duration':0x1,'food':{'nutrition':0x1,'saturation_modifier':'normal','is_meat':![]}}),Item['setProperties'](0x1c9,{'use_duration':0x1,'food':{'nutrition':0x1,'saturation_modifier':'normal','is_meat':![]}});",
    off: "Item['setProperties'](0x104,{'use_duration':0x20,'food':{'nutrition':0x4,'saturation_modifier':'low','is_meat':![]}}),Item['setProperties'](0x104,{'use_duration':0x20,'max_stack_size':0x1,'food':{'nutrition':0x6,'saturation_modifier':'normal','is_meat':![],'using_converts_to':'bowl'}}),Item['setProperties'](0x129,{'use_duration':0x20,'food':{'nutrition':0x5,'saturation_modifier':'normal','is_meat':![]}}),Item['setProperties'](0x13f,{'use_duration':0x20,'food':{'nutrition':0x3,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x140,{'use_duration':0x20,'food':{'nutrition':0x8,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x15d,{'use_duration':0x20,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x2,'saturation_modifier':'poor','is_meat':!![]}}),Item['setProperties'](0x1cc,{'use_duration':0x20,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x2,'saturation_modifier':'poor','is_meat':!![]}}),Item['setProperties'](0x1cd,{'use_duration':0x20,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x1,'saturation_modifier':'poor','is_meat':!![]}}),Item['setProperties'](0x1ce,{'use_duration':0x20,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x1,'saturation_modifier':'poor','is_meat':!![],'effects':[{'name':'poison','duration':0x3c,'amplifier':0x3},{'name':'nausea','duration':0xf,'amplifier':0x1},{'name':'hunger','duration':0xf,'amplifier':0x2}]}}),Item['setProperties'](0x15e,{'use_duration':0x20,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x5,'saturation_modifier':'normal','eat_sound':'random.burp','is_meat':!![]}}),Item['setProperties'](0x1cf,{'use_duration':0x20,'max_damage':0x0,'stacked_by_data':!![],'food':{'nutrition':0x6,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x168,{'use_duration':0x20,'food':{'nutrition':0x2,'saturation_modifier':'poor','is_meat':![]}}),Item['setProperties'](0x165,{'use_duration':0x20,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':![]}}),Item['setProperties'](0x16b,{'use_duration':0x20,'food':{'nutrition':0x3,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x16c,{'use_duration':0x20,'food':{'nutrition':0x8,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x16d,{'use_duration':0x20,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':!![],'effects':[{'name':'hunger','chance':0.3,'duration':0x1e,'amplifier':0x0}]}}),Item['setProperties'](0x16e,{'use_duration':0x20,'food':{'nutrition':0x6,'saturation_modifier':'normal','is_meat':!![]}}),Item['setProperties'](0x1a7,{'use_duration':0x20,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x1a8,{'use_duration':0x20,'food':{'nutrition':0x6,'saturation_modifier':'good','is_meat':!![]}}),Item['setProperties'](0x16f,{'use_duration':0x20,'food':{'nutrition':0x4,'saturation_modifier':'poor','is_meat':!![],'effects':[{'name':'hunger','chance':0.8,'duration':0x1e,'amplifier':0x0}]}}),Item['setProperties'](0x177,{'use_duration':0x20,'food':{'nutrition':0x2,'saturation_modifier':'good','is_meat':![],'effects':[{'name':'poison','chance':0x1,'duration':0x5,'amplifier':0x0}]}}),Item['setProperties'](0x187,{'use_duration':0x20,'food':{'nutrition':0x3,'saturation_modifier':'normal','is_meat':![]},'seed':{'crop_result':'carrots','plant_at':'farmland'}}),Item['setProperties'](0x188,{'use_duration':0x20,'food':{'nutrition':0x1,'saturation_modifier':'low','is_meat':![]},'seed':{'crop_result':'potatoes','plant_at':'farmland'}}),Item['setProperties'](0x189,{'use_duration':0x20,'food':{'nutrition':0x5,'saturation_modifier':'normal','is_meat':![]}}),Item['setProperties'](0x18a,{'use_duration':0x20,'food':{'nutrition':0x2,'saturation_modifier':'low','is_meat':![],'effects':[{'name':'poison','chance':0.6,'duration':0x5,'amplifier':0x0}]}}),Item['setProperties'](0x18c,{'use_duration':0x20,'food':{'nutrition':0x6,'saturation_modifier':'supernatural','is_meat':![]}}),Item['setProperties'](0x190,{'use_duration':0x20,'food':{'nutrition':0x8,'saturation_modifier':'low','is_meat':![]}}),Item['setProperties'](0x19b,{'use_duration':0x20,'food':{'nutrition':0x3,'saturation_modifier':'low','is_meat':!![]}}),Item['setProperties'](0x1c9,{'use_duration':0x20,'food':{'nutrition':0x1,'saturation_modifier':'normal','is_meat':!![]}}),Item['setProperties'](0x19c,{'use_duration':0x20,'food':{'nutrition':0x5,'saturation_modifier':'normal','is_meat':!![]}}),Item['setProperties'](0x19d,{'use_duration':0x20,'max_stack_size':0x1,'food':{'nutrition':0xa,'saturation_modifier':'normal','using_converts_to':'bowl','is_meat':!![]}}),Item['setProperties'](0x1cb,{'use_duration':0x20,'food':{'nutrition':0x1,'saturation_modifier':'normal','is_meat':![]}});",
    toggle(){
        var mod = getModule("FastEat");
        getState(mod) ? eval(getCode(mod).on) : eval(getCode(mod).off)
     }
});
associateModule("InfiniteAura,IA", [!1, !1], "Combat", [{
    name: "Range",
    type: "int",
    value: "100,1,100"
},{
    name: "Delay",
    type: "int",
    value: "10,1,20"
}, {
    name: "From EntityList",
    type: "bool",
    value: true
}], {
    aim(ent) {
        if (ent != null || ent != -1) {
            var x = Entity.getX(ent) - getPlayerX();
            var y = Entity.getY(ent) - getPlayerY()
            var z = Entity.getZ(ent) - getPlayerZ();

            if (Entity.getEntityTypeId(ent) != 63) y += 0.5;
            var a = 0.5 + Entity.getX(ent);
            var b = Entity.getY(ent);
            var c = 0.5 + Entity.getZ(ent);
            var len = Math.sqrt(x * x + y * y + z * z);
            var y = y / len;
            var pitch = Math.asin(y);
            pitch = pitch * 180.0 / Math.PI;
            pitch = -pitch;
            var yaw = -Math.atan2(a - (Player.getX() + 0.5), c - (Player.getZ() + 0.5)) * (180 / Math.PI);
            if (pitch < 89 && pitch > -89) {
                Entity.setRot(Player.getEntity(), yaw, pitch);
            }
        }
    },
    swing() {
        try {
            var hostThread = new java.lang.Thread(new java.lang.Runnable({
                run() {
                    try {
                        //android.os.Looper.prepare();
                        var inst = new android.app.Instrumentation;
                        inst.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_Q);
                        //android.os.Looper.loop();
                    } catch (e) {
                        errorMessage(e)
                    }

                }
            }))
            hostThread.start();
        } catch (e) {
            errorMessage(e)
        }
    },
    getNearestEntity(range) {
        var mod = getModule("InfiniteAura");
        var sett = getSettings(mod, "From EntityList", 0);
        var list = getCode(getModule("EntityList")).list;
        if (sett) {
            var players = list;
        } else {
            var players = Server.getAllPlayers();
        }
        var small = range;
        var ent = null;
        for (var i = 0; i < players.length; i++) {
            if (!getCode(getModule("ClickFriends")).isFriend(i)) {
                var x = Entity.getX(players[i]) - getPlayerX();
                var y = Entity.getY(players[i]) - getPlayerY();
                var z = Entity.getZ(players[i]) - getPlayerZ();
                var dist = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
                if (dist < small && dist > 0 && Entity.getHealth(players[i]) >= 1) {
                    small = dist;
                    ent = players[i];
                }
            }
        }
        return ent;
    },
    lastpos: [0, 0, 0],
    oldrot: [0, 0],
    timing: 5,
    st: 0,
    tick() {
        try {
            var mod = getModule("InfiniteAura");
            var sett = getSettings(mod, "Range", 0);
            var delay = getSettings(mod, "Delay", 0);
            var ent = getCode(mod).getNearestEntity(sett);
            if (getState(mod) && ent != -1) {

                if (Entity.getX(ent) != 0 && Entity.getY(ent) != 0 && Entity.getZ(ent) != 0) {
                    getCode(mod).timing--;
                    //getCode(mod).timing = 15
                    if (getCode(mod).timing == 2) {
                        getCode(mod).lastpos[0] = Player.getX();
                        getCode(mod).lastpos[1] = Player.getY();
                        getCode(mod).lastpos[2] = Player.getZ();
                        //getCode(mod).aim(ent);
                        //getCode(mod).oldrot[0] = Entity.getYaw(getPlayerEnt());
                        //getCode(mod).oldrot[1] = Entity.getPitch(getPlayerEnt());
                        var x = Entity.getX(ent);
                        var y = Entity.getY(ent) + 3;
                        var z = Entity.getZ(ent);
                        setVelY(Player.getEntity(), -0.1);
                        Entity.setCollisionSize(ent, 10, 10);
                        Entity.setPosition(Player.getEntity(), x, y, z);
                    };
                    if (getCode(mod).timing == 1) {
                        getCode(mod).aim(ent)
                        getCode(mod).swing();
                    }
                    if (getCode(mod).timing == 0) {
                        //Entity.setCollisionSize(getCode(mod).getNearestEntity(sett), 0.8, 1.8);
                        Entity.setPosition(Player.getEntity(), getCode(mod).lastpos[0], getCode(mod).lastpos[1], getCode(mod).lastpos[2]);
                        setVelY(Player.getEntity(), -0.1);
                        //getCode(mod).st == 1 ? setVelX(Player.getEntity(), 0.1) : 
                        //getCode(mod).st == 1 ? getCode(mod).st = 0 : getCode(mod).st++;
                        if(getCode(mod).st == 1){
                            getCode(mod).st = 0;
                            setVelX(Player.getEntity(), 0.1);
                        }else{
                            getCode(mod).st++;
                            setVelX(Player.getEntity(), -0.1);
                        }
                        getCode(mod).aim(ent);
                        //Entity.setRot(Player.getEntity(), getCode(mod).oldrot[0], getCode(mod).oldrot[1]);
                        getCode(mod).timing = delay
                    }
                }
            }
        } catch (e) {
            errorMessage(e)
        }
    },
    toggle(){
        var mod = getModule("InfiniteAura");
        getCode(mod).lastpos[0] = Player.getX();
            getCode(mod).lastpos[1] = Player.getY();
            getCode(mod).lastpos[2] = Player.getZ();
    }
});
associateModule("EntityList,EL", [!1, !1], "Misc", [{
    name: "Maximal Range",
    type: "int",
    value: "100000,100000,12000000"
}, {
    name: "Minimal Range",
    type: "int",
    value: "0,100000,12000000"
}, {
    name: "Mode",
    type: "string",
    value: "Only +,Only +,Only -,All"
}, {
    name: "Check ID",
    type: "bool",
    value: false
}, {
    name: "Output",
    type: "bool",
    value: false
}], {
    list: [],
    fakelist: [],
    isValid(ent) {
        if (Entity.getX(ent) != 0 && Entity.getY(ent) != 0 && Entity.getZ(ent) != 0) {
            return true
        } else {
            return false
        }
    },
    scan() {
        var t = (new Date()).getTime();
        var hostThread = new java.lang.Thread(new java.lang.Runnable({
            run() {
                try {
                    //android.os.Looper.prepare();

                    var mod = getModule("EntityList");

                    getCode(mod).fakelist = new Array();
                    //getCode(getModule("EntityList")isValid(e);

                    var sett = getSettings(mod, "Mode", 0);
                    var output = getSettings(mod, "Output", 0);
                    var min = parseFloat(getSettings(mod, "Minimal Range", 0)) + 1;
                    var max = parseFloat(getSettings(mod, "Maximal Range", 0)) + 1;
                    if (max > min) {
                        if (sett == "All") {
                            for (var i = -max; i < min; i++) {
                                try {
                                    if (confirmGameScreen())
                                        if ( /*Player.isPlayer(i) == true*/ Entity.getEntityTypeId(i) == 63) {
                                            if (i != Player.getEntity()) getCode(mod).fakelist.push(i);
                                        }
                                } catch (e) {
                                    errorMessage(e);
                                    break;
                                }
                            };
                            //var t = (new Date()).getTime();
                            for (var i = min; i <= max; i++) {
                                try {

                                    if (confirmGameScreen())
                                        if (Entity.getEntityTypeId(i) == 63) {
                                            if (i != Player.getEntity()) getCode(mod).fakelist.push(i);
                                        }
                                } catch (e) {
                                    errorMessage(e);
                                    break;
                                }
                            }
                        };
                        if (sett == "Only +") {
                            // var t = (new Date()).getTime();
                            for (var i = min; i <= max; i++) {
                                try {
                                    if (confirmGameScreen())
                                        if (Entity.getEntityTypeId(i) == 63) {
                                            if (i != Player.getEntity()) getCode(mod).fakelist.push(i);
                                        }
                                } catch (e) {
                                    errorMessage(e);
                                    break;
                                }
                            }
                        };
                        if (sett == "Only -") {
                            // var t = (new Date()).getTime();
                            for (var i = -max; i < min; i++) {
                                try {
                                    if (confirmGameScreen())
                                        if (Entity.getEntityTypeId(i) == 63) {
                                            if (i != Player.getEntity()) getCode(mod).fakelist.push(i);
                                        }
                                } catch (e) {
                                    errorMessage(e);
                                    break;
                                }
                            };
                        };

                        var t1 = (new Date()).getTime();
                        if (output)
                            customMessage("Scanned for " + (t1 - t) + "ms");

                        function uniq_fast(a) {
                            var seen = {};
                            var out = [];
                            var len = a.length;
                            var j = 0;
                            for (var i = 0; i < len; i++) {
                                var item = a[i];
                                if (seen[item] !== 1) {
                                    seen[item] = 1;
                                    out[j++] = item;
                                }
                            }
                            return out;
                        }
                        uniq_fast(getModule("EntityList").code.fakelist)
                        getModule("EntityList").code.list = getModule("EntityList").code.fakelist;
                        if (output) customMessage(getCode(mod).list.length + " players founded!");
                        getCode(mod).started = false;
                        sleep(1500);
                        if (getState(mod)) {
                            getCode(mod).started = true;
                            getCode(mod).scan();
                            if (output) customMessage("Scan restarted");
                        }
                    }
                    /*for (var i = -1000000; i < 1000000; i++) {
                        if (Player.isPlayer(i) == true && i != Player.getEntity()) {
                            getCode(mod).list.push(i);
                        }
                    };*/
                    //android.os.Looper.loop();
                } catch (e) {
                    errorMessage(e)
                }

            }
        }))
        hostThread.start();
    },
    started: false,
    button() { //getCode(getModule("EntityList")isValid(e);
        var mod = getModule("EntityList");
        // if (getState(mod)) 
        uithread(() => {
            try {

                let move = false;
                let dx = 0;
                let dy = 0;
                let PosX = 0;
                let PosY = 0;

                let btn = new android.widget.TextView(ctx);
                btn.setText("Scan");
                btn.setTextColor(-1);
                btn.setTextSize(14);
                btn.setTransformationMethod(null);
                btn.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1));
                btn.setBackground(style.custom_simple("#545454"));
                btn.setGravity(android.view.Gravity.CENTER);
                btn.setOnClickListener(new android.view.View.OnClickListener({
                    onClick: function (v) {
                        if (confirmGameScreen()) {
                            if (!getCode(mod).started) {
                                getCode(mod).started = true;
                                btn.setTextColor(android.graphics.Color.GREEN);
                                customMessage("Scan started");
                                getCode(mod).scan();
                                //getCode(mod).gui.dismiss();
                                btn.setTextColor(-1);
                            } else {
                                customMessage("Scan already started!");
                            }
                        }
                    }
                }));
                btn.setOnTouchListener(new android.view.View.OnTouchListener({
                    onTouch: function (view, motionEvent) {
                        try {
                            if (!move) return false;
                            switch (motionEvent.getAction()) {
                                case android.view.MotionEvent.ACTION_DOWN:
                                    dx = PosX - motionEvent.getRawX();
                                    dy = PosY - motionEvent.getRawY();
                                    break;
                                case android.view.MotionEvent.ACTION_MOVE:
                                    PosX = (motionEvent.getRawX() + dx);
                                    PosY = (motionEvent.getRawY() + dy);
                                    getCode(mod).gui.update(PosX, PosY, -1, -1);
                                    break;
                                case android.view.MotionEvent.ACTION_UP:
                                case android.view.MotionEvent.ACTION_CANCEL:
                                    move = false;
                                    break;
                            }
                        } catch (e) {
                            errorMessage(e);
                        }
                        return true;
                    }
                }));
                btn.setOnLongClickListener(new android.view.View.OnLongClickListener({
                    onLongClick: function (v, t) {
                        ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
                        move = true;
                        return true;
                    }
                }));

                getCode(mod).gui = new android.widget.PopupWindow(btn, gs(dip2px(75)), gs(dip2px(50)));
                getCode(mod).gui.setAnimationStyle(android.R.style.Animation_Dialog);
                getCode(mod).gui.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.LEFT | android.view.Gravity.TOP, 0, 0);
                getCode(mod).gui.update(ctx.getWindowManager().getDefaultDisplay().getWidth() / 2, ctx.getWindowManager().getDefaultDisplay().getHeight() / 2, -1, -1)

            } catch (e) {
                errorMessage(e)
            }
        })
    },
    attack(a, v) {
        var mod = getModule("EntityList");
        var sett = getSettings(mod, "Check ID", 0);
        if (sett && getState(mod)) {
            //preventDefault();
            customMessage(v + " - " + Entity.getEntityTypeId(v))
        }
    },
    toggle() {
        var mod = getModule("EntityList");
        if (getState(mod) && confirmGameScreen() && !getSettings(mod, "Check ID", 0)) {
            if (!getCode(mod).started) {
                getCode(mod).scan();
            } else {
                if (Halcyon.isDev) customMessage("Scan already started!");
            }
        }
    }
});
associateModule("ESP,E", [!1, !1], "Misc", [{
    name: "From EntityList",
    type: "bool",
    value: true
}, {
    name: "Type",
    type: "string",
    value: "3D,3D"
}], {
    getFloatBuffer: function (fArray) {
        var bBuffer = java.nio.ByteBuffer.allocateDirect(fArray.length * 4);
        bBuffer.order(java.nio.ByteOrder.nativeOrder());

        var fBuffer = bBuffer.asFloatBuffer();
        var fBuffer = bBuffer.asFloatBuffer();
        fBuffer.put(fArray);
        fBuffer.position(0);
        return fBuffer;
    },
    getShortBuffer: function (sArray) {
        var bBuffer = java.nio.ByteBuffer.allocateDirect(sArray.length * 2);
        bBuffer.order(java.nio.ByteOrder.nativeOrder());

        var sBuffer = bBuffer.asShortBuffer();
        sBuffer.put(sArray);
        sBuffer.position(0);
        return sBuffer;
    },
    renderer: null,
    glSurface: null,
    fov: 90,
    initted: !1,
    init() {
        var mod = getModule("ESP");
        var sett = getSettings(mod, "From EntityList", 0);

        /*var options = client.utils.File.getTextFromFile(new java.io.File(android.os.Environment.getExternalStorageDirectory() + "/games/com.mojang/minecraftpe/", "options.txt"));

        options = options.split("\n");
        options.forEach(function (entry) {
            var suboption = entry.split(":");
            if (suboption[0] == "gfx_field_of_view") {
                getCode(mod).fov = suboption[1];

            }
        });*/
        this.renderer = new android.opengl.GLSurfaceView.Renderer({
            onSurfaceCreated: function (gl, config) {
                var GL10 = javax.microedition.khronos.opengles.GL10;

                gl.glEnable(javax.microedition.khronos.opengles.GL10.GL_TEXTURE_2D);
                gl.glShadeModel(javax.microedition.khronos.opengles.GL10.GL_SMOOTH);
                gl.glClearColor(0, 0, 0, 0);
                gl.glClearDepthf(1);
                gl.glEnable(javax.microedition.khronos.opengles.GL10.GL_DEPTH_TEST);
                gl.glDepthFunc(javax.microedition.khronos.opengles.GL10.GL_LEQUAL);
                gl.glHint(javax.microedition.khronos.opengles.GL10.GL_PERSPECTIVE_CORRECTION_HINT, javax.microedition.khronos.opengles.GL10.GL_NICEST);
                //print("created");
            },
            onSurfaceChanged: function (gl, width, height) {
                //print("Changing...");
                var GL10 = javax.microedition.khronos.opengles.GL10;
                gl.glMatrixMode(GL10.GL_PROJECTION);
                gl.glLoadIdentity();
                android.opengl.GLU.gluPerspective(gl, getCode(mod).fov, width / height, 0.1, 100);
                gl.glMatrixMode(GL10.GL_MODELVIEW);
                gl.glLoadIdentity();
                //print("changed");
            },
            onDrawFrame: function (gl) {
                //print("Drawing...");
                var GL10 = javax.microedition.khronos.opengles.GL10;
                gl.glClear(GL10.GL_COLOR_BUFFER_BIT | GL10.GL_DEPTH_BUFFER_BIT);
                gl.glLoadIdentity();
                gl.glDisable(GL10.GL_LIGHTING);

                if (confirmScreenSafe()) { //m && c1.state[0]
                    try {
                        var yaw = getYaw() % 360;
                        var pitch = getPitch() % 360;
                        var eyeX = getPlayerX();
                        var eyeY = getPlayerY() + 1;
                        var eyeZ = getPlayerZ();

                        var dCenterX = Math.sin(yaw / 180 * Math.PI);
                        var dCenterZ = Math.cos(yaw / 180 * Math.PI);
                        var dCenterY = Math.sqrt(dCenterX * dCenterX + dCenterZ * dCenterZ) * Math.tan((pitch - 180) / 180 * Math.PI);

                        var centerX = eyeX - dCenterX;
                        var centerZ = eyeZ + dCenterZ;
                        var centerY = eyeY - dCenterY;

                        android.opengl.GLU.gluLookAt(gl, eyeX, eyeY, eyeZ, centerX, centerY, centerZ, 0, 1.0, 0);






                        try {
                            getCode(mod).render(gl);
                            //gl.glTranslatef(0,0,0);
                        } catch (e) {
                            print(e)
                        }

                        //gl.glTranslatef(Entity.getX(entry), Entity.getY(entry), Entity.getZ(entry));
                        //gl.glRotatef(180 - yaw, 0, 1, 0);
                    } catch (e) {
                        print("RenderProblem: " + e);
                    }

                }
            }
        });
        ctx.runOnUiThread(new java.lang.Runnable({
            run() {
                getCode(mod).glSurface = new android.opengl.GLSurfaceView(ctx);
                getCode(mod).glSurface.setZOrderOnTop(!0);


                getCode(mod).glSurface.setEGLConfigChooser(8, 8, 8, 8, 16, 0);
                getCode(mod).glSurface.getHolder().setFormat(android.graphics.PixelFormat.TRANSLUCENT);
                getCode(mod).glSurface.setRenderer(getCode(mod).renderer);
                getCode(mod).glSurface.setRenderMode(0);

                ctx.getWindow().getDecorView().addView(getCode(mod).glSurface);

                getCode(mod).initted = !0;
            }
        }));


    },
    drawBox: function (gl, x, y, z, xsize, ysize, zsize, friend) {
        var mod = getModule("ESP");
        var GL10 = javax.microedition.khronos.opengles.GL10;
        var size = new Array(xsize, ysize, zsize);
        var vertices = [
            0, 0, 0,
            size[0], 0, 0,
            0, 0, size[2],
            size[0], 0, size[2],

            0, size[1], 0,
            size[0], size[1], 0,
            0, size[1], size[2],
            size[0], size[1], size[2]
        ];
        var vertexBuffer = getCode(mod).getFloatBuffer(vertices);
        var indices = [
            0, 1,
            0, 2,
            0, 4,

            3, 1,
            3, 2,
            3, 7,

            5, 4,
            5, 7,
            5, 1,

            6, 4,
            6, 7,
            6, 2
        ];
        var indexBuffer = getCode(mod).getShortBuffer(indices);
        gl.glTranslatef(x, y, z);
        //gl.glRotatef(180 - getYaw(), 0, 1, 0);
        gl.glFrontFace(GL10.GL_CCW);
        //gl.glEnable(GL10.GL_CULL_FACE);
        //gl.glCullFace(GL10.GL_BACK);
        gl.glEnable(GL10.GL_BLEND);
        //var yaw = getYaw();
        //gl.glRotatef(180 - yaw, 0, 1, 0);
        gl.glBlendFunc(GL10.GL_SRC_ALPHA, GL10.GL_ONE_MINUS_SRC_ALPHA);
        gl.glLineWidth(5);
        if (!friend)
            gl.glColor4f(0.9, 0.1, 0.1, 0.8)
        else
            gl.glColor4f(0.1, 0.9, 0.1, 0.8);
        gl.glEnableClientState(GL10.GL_VERTEX_ARRAY);
        gl.glVertexPointer(3, GL10.GL_FLOAT, 0, vertexBuffer);
        gl.glDrawElements(GL10.GL_LINES, indices.length, GL10.GL_UNSIGNED_SHORT, indexBuffer);
        gl.glTranslatef(-x, -y, -z);
    },
    render(gl) {
        var mod = getModule("ESP");
        var sett = getSettings(mod, "From EntityList", 0);
        var list = getCode(getModule("EntityList")).list;
        if (getState(mod)) {
            let px = getPlayerX();
            let py = getPlayerY();
            let pz = getPlayerZ();
            if (sett) {
                var players = list;
            } else {
                var players = Server.getAllPlayers();
            }
            players.forEach(function (entry) {
                let x = Entity.getX(entry) - px;
                let y = Entity.getY(entry) - py;
                let z = Entity.getZ(entry) - pz;
                let dist = Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2) + Math.pow(z, 2));
                if (entry != getPlayerEnt() && Entity.getEntityTypeId(entry) == 63 && getCode(getModule("EntityList")).isValid(entry)) {
                    getCode(mod).drawBox(gl, Entity.getX(entry) - 0.5, Entity.getY(entry) - 0.5, Entity.getZ(entry) - 0.5, 0.9, 1.85, 0.9, getCode(getModule("ClickFriends")).isFriend(entry));
                }
            })
        }
    },
    toggle() {
        var mod = getModule("ESP");
        if (!getCode(mod).initted) {
            getCode(mod).init();
        }
    }
});
if (Halcyon.isDev) {
    associateModule("NoVoid,NV", [!1, !1], "Player", [{
        name: "Bypass",
        type: "bool",
        value: false
    }], {
        falling() {
            var velo = -1;
            if (Entity.getVelY(Player.getEntity()) <= velo) return !0;
            return !1;

        },
        save() {
            var px = Player.getX();
            var pz = Player.getZ();
            for (var i = 256.0; i > 0.0; i--) {
                if (Level.getTile(px, i, pz) != 0) {
                    Entity.setPosition(Player.getEntity(), px, i + 3, pz);
                    break;
                }
            }
        },
        tick() {
            var mod = getModule("NoVoid");
            var sett = getSettings(mod, "Bypass", 0);
            if (getState(mod) && getCode(mod).falling()) {
                //let serverip = Server.getAddress();
                //if (serverip == null) {
                //    serverip = "offline"
                // }
                //if (serverip.indexOf("amazo") >= 0 || serverip == "offline") {
                if (!sett) {
                    Entity.setPosition(Player.getEntity(), Player.getX() + 1, Player.getY() + 8, Player.getZ());
                    setVelY(Player.getEntity(), 0.1);
                    getCode(mod).save();
                } else {
                    setVelY(Player.getEntity(), 1.2);
                }
                //  } else {
                //  setVelY(Player.getEntity(), 0.1);
            } //

        }
    });
};

/*------------------------*\
| 🔥 Main
\*------------------------*/

var customMessage = (msg) => {
    clientMessage("§4§lH§falcyon §7>§r " + msg)
}
var sscreen = "";
var confirmScreenSafe = () => {
    if (sscreen == "hud_screen") {
        return true
    } else {
        return false
    }
} //by Shark. Taken from Jelly v0.9
function confirmGameScreen() {
    if (confirmScreenSafe() || sscreen == "chat_screen" || sscreen == "survival_inventory_screen" || sscreen == "creative_inventory_screen" || sscreen == "small_chest_screen" || sscreen == "large_chest_screen") {
        return true
    } else {
        return false
    }
}

var scale = 1;

//avr tick
var avr = () => {
    ctx.runOnUiThread({
        run() {
            try {

                new android.os.Handler()
                    .postDelayed({
                        run() {
                            Halcyon.mods.forEach((e) => {
                                if (getCode(e).hasOwnProperty("avr")) {
                                    getCode(e).avr();
                                }
                                if (getCode(e).initted) {
                                    getCode(e).glSurface.requestRender();
                                }
                            });
                            // if (client.utils.Render.initted) client.utils.Render.glSurface.requestRender();
                            //print(1)
                            eval(avr())
                        }
                    }, 1)
            } catch (e) {
                clientMessage(e)
            }


        }
    })
}
avr();
// fast uithread 
var uithread = (t) => {
    ctx.runOnUiThread({
        run() {
            try {
                t();
            } catch (e) {
                errorMessage(e);
            };
        }
    });
};

var gs = (number) => {
    return number / scale;
};

function sleep(millis) {
    var t = (new Date()).getTime();
    var i = 0;
    while (((new Date()).getTime() - t) < millis) {
        i++;
    }
};
var filemanager = {
    select: function (dir, fileName) {
        return (new java.lang.File(dir, fileName));
    },
    exists: function (selectedFile) {
        return selectedFile.exists();
    },
    isFile: function (file) {
        return file.isFile();
    },
    isDirectory: function (path) {
        return path.isDirectory();
    },
    create: function (selectedFile) {
        selectedFile.createNewFile();
        return selectedFile;
    },
    del: function (selectedFile) {
        selectedFile.delete();
    },
    read: function (selectedFile) {
        var readed = (new java.io.BufferedReader(new java.io.FileReader(selectedFile)));
        var data = new java.lang.StringBuilder();
        var string;
        while ((string = readed.readLine()) != null) {
            data.append(string);
            data.append('\n');
        }
        return data.toString();
    },
    readLine: function (selectedFile, line) {
        var readT = new filemanager.read(selectedFile);
        var lineArray = readT.split('\n');
        return lineArray[line - 1];
    },
    readKey: function (selectedFile, key, keySeparator) {
        var isText = 0;
        var textR = new filemanager.read(selectedFile);
        var splitTextR = textR.split('\n');
        for (var i = 0; i < splitTextR.length; i++) {
            var textRF = splitTextR[i].split(keySeparator);
            if (textRF[0] == key) {
                return textRF[1];
                isText = 1;
                break;
            }
            if (!isText) {
                return '[Unknown]';
            }
        }
    },
    write: function (selectedFile, text) {
        file.rewrite(selectedFile, (new manager.read(selectedFile)) + text);
    },
    rewrite: function (selectedFile, text) {
        var writeFOS = new java.io.FileOutputStream(selectedFile);
        writeFOS.write(new java.lang.String(text)
            .getBytes());
    }
};
var config = {
    dir: android.os.Environment.getExternalStorageDirectory().getAbsolutePath() + "/Halcyon/configs",
    createpath() {
        if (!java.io.File(config.dir).exists()) java.io.File(config.dir).mkdirs();
    },
    createmain() {
        var file = new java.io.File(config.dir, "default.cfg");
        if (java.io.File(file).exists())
            file.createNewFile();
        var input = "";
        Halcyon.mods.forEach((e, i, a) => {
            input = input + e.name[0] + ":" + getState(e) + "," + getBindState(e) + ":";
            e.settings.forEach((e) => {
                if (e.type != "bool")
                    input = input + e.name + "," + e.values[0] + ";"
                else
                    input = input + e.name + "," + e.values + ";"
            })
            if (!i != a.length)
                input = input + "\n"
        });
        filemanager.rewrite(file, input);
    },
    create(name) {
        try {
            var file = new java.io.File(config.dir, name + ".cfg");
            if (java.io.File(file).exists())
                file.createNewFile();
            var input = "";
            Halcyon.mods.forEach((e, i, a) => {
                input = input + e.name[0] + ":" + getState(e) + "," + getBindState(e) + ":";
                e.settings.forEach((e) => {
                    if (e.type != "bool")
                        input = input + e.name + "," + e.values[0] + ";"
                    else
                        input = input + e.name + "," + e.values + ";"
                })
                if (!i != a.length)
                    input = input + "\n"
            });
            filemanager.rewrite(file, input);
            customMessage("§aConfig §7§l'" + name + "'§r§a successful saved!")
        } catch (e) {
            errorMessage(e)
        }
    },
    load(name) {
        try {
            var file = new java.io.File(config.dir, name + ".cfg");
            if (java.io.File(file).exists()) {
                //var input = new Array(filemanager.read(file).split('\n'));
                
                //var input = filemanager.read(file)
                //clientMessage(typeof String(filemanager.read(file)).split('\n'));
                //clientMessage(typeof String(filemanager.read(file)).split('\n'));
                //input.split('\n');
                uithread(() => {
                    Halcyon.mods.forEach((e, i, a) => {
                        //disabling
                        //  var p = e.split('\n');
                        if (e.state[0]) {
                            if (getCode(e).toggle != undefined) getCode(e).toggle();
                        };
                        if (e.state[1]) {
                            if (e.bind != null)
                                if (e.bind.isShowing()) e.bind.dismiss();
                        }
                        if (getCode(e).gui != undefined && getCode(e).gui != null)
                            if (getCode(e).gui.isShowing()) getCode(e).gui.dismiss();

                        e.state[0] = false;
                        e.state[1] = false;


                    })
                });

                var input = String(filemanager.read(file)).split('\n')
                input.forEach((e, i, a) => {
                    if (i != a.length - 1) {
                        var par = e.split(":");
                        var mod = getModule(par[0]);
                        var state = par[1].split(",");
                        if(par[2] != ""){
                           var settings = par[2].split(';');
                        var newsettings = [];
                        settings.forEach((e, i, a) => {
                            if (i != a.length - 1) {
                                newsettings.push(e)
                            }
                        });
                        settings = newsettings;

                        settings.forEach((e, i, a) => {
                            var sett = e.split(',');
                            var type = (sett[1] == ("true" || "false") ? "bool" : "other");
                            var varible = false;
                            if (type == "bool") {
                                varible = (sett[1] == "true" ? true : false);
                                mod.settings[i].values = varible

                            } else {
                                if (type == "int") {
                                    varible = parseFloat(sett[1]);
                                    mod.settings[i].values[0] = varible
                                } else {
                                    varible = sett[1];
                                    mod.settings[i].values[0] = varible
                                }
                            }

                        })};
                        mod.state[0] = (state[0] == "true" ? true : false);
                        mod.state[1] = (state[1] == "true" ? true : false);

                        if (mod.state[0]) {
                            if (getCode(mod).toggle != undefined) getCode(mod).toggle();
                        };
                        if (getBindState(mod)) {
                            bindbutton(mod)
                        };
                    }
                })
                customMessage("§aConfig §7§l'" + name + "'§r§a successful loaded!")

            } else {
                customMessage("§eConfig §7§l'" + name + "'§r§e does not exists!")
            }
        } catch (e) {
            errorMessage(e)
        }
    }
}
config.createpath();
config.createmain();
// hud
var pb = new android.widget.TextView(ctx);
var png = 0;
var pp = null;
var ppp = null;
var hud = () => {
    uithread(() => {
        try {
            //pb = new android.widget.TextView(ctx);
            pb.setText("Ping: " + png);
            pb.setTextColor(android.graphics.Color.WHITE);
            pb.setTextSize(gs(17));
            pb.setGravity(android.view.Gravity.RIGHT);
            pb.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
            pb.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);

            //ping_meter

            ppp = new android.widget.PopupWindow(pb, -2, -2);
            ppp.setTouchable(!!0);
            ppp.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.RIGHT | android.view.Gravity.BOTTOM, 15, 5);
            ppp.setTouchable(!!0);


        } catch (e) {
            errorMessage(e)
        }
    });
}


var watermark = () => {
    uithread(() => {
        try {
            var pbt = new android.widget.TextView(ctx);
            pbt.setText(android.text.Html.fromHtml("Made by <font color='yellow'>au7yn</font>"));
            pbt.setTextColor(android.graphics.Color.WHITE);
            pbt.setTextSize(gs(17));
            pbt.setGravity(android.view.Gravity.RIGHT);
            pbt.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
            pbt.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);

            //ping_meter

            var pk = new android.widget.PopupWindow(pbt, -2, -2);
            pk.setTouchable(!!0);
            pk.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.RIGHT | android.view.Gravity.TOP, 15, 5);
            pk.setTouchable(!!0);


        } catch (e) {
            errorMessage(e)
        }
    });
}
watermark();
var post = new android.widget.TextView(ctx);

var pos = () => {
    uithread(() => {
        try {
            post.setText(android.text.Html.fromHtml('<font color="red">X:</font> ' + Math.round(Player.getX()) + " <font color='red'>Y:</font> " + Math.round(Player.getY()) + " <font color='red'>Z:</font> " + Math.round(Player.getZ())));
            post.setTextColor(android.graphics.Color.WHITE);
            post.setTextSize(gs(17));
            post.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
            post.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);

            pp = new android.widget.PopupWindow(post, -2, -2);
            pp.setTouchable(!!0);
            pp.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.LEFT | android.view.Gravity.BOTTOM, 15, 5);
            pp.setTouchable(!!0);

        } catch (e) {
            errorMessage(e)
        }
    });
};

var seekbarsetting = (setting) => {
    try {
        var sett = setting.values;
        let p10 = gs(10);
        let p6 = gs(6);
        let lay = new LinearLayout(ctx);
        lay.setOrientation(1);
        lay.setPadding(p10, p6, p10, p6);

        let text = new TextView(ctx);
        text.setText(fromHtml("<font color='#e1e4eb'>" + setting.name + ": </font><font color='green'>" + sett[0] + "</font>"));
        text.setTextColor(android.graphics.Color.parseColor("#e1e4eb"));
        text.setTextSize(gs(15));
        text.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
        text.setPadding(0, 0, 0, gs(4));
        text.setGravity(Gravity.LEFT);
        lay.addView(text);

        var seek = android.widget.SeekBar(ctx);
        seek.setMax(sett[2] / sett[1]);
        seek.setPadding(gs(3), 0, 0, 0);
        seek.getThumb().setColorFilter(android.graphics.Color.parseColor("#e1e4eb"), android.graphics.PorterDuff.Mode.SRC_IN);
        //seek.getProgressDrawable().setColorFilter(android.graphics.Color.parseColor("#626262"), android.graphics.PorterDuff.Mode.SRC_OUT);
        seek.setProgress(sett[0] / sett[1]);
        seek.setProgressTintList(new android.content.res.ColorStateList.valueOf(android.graphics.Color.parseColor("#e1e4eb")));
        seek.setOnSeekBarChangeListener(new android.widget.SeekBar.OnSeekBarChangeListener({
            onProgressChanged: function (seekBar, progress, fromUse) {

                text.setText(fromHtml(setting.name + ": <font color='green'>" + Math.round(progress * sett[1] * 100) / 100 + "</font>"));
                sett[0];
                //print(sett[0]);
            },
            onStopTrackingTouch: function (seek) {
                sett[0] = Math.round(seek.getProgress() * sett[1] * 100) / 100;
                //setting.values[0] = sett[0];
                //print(sett[0]);

            }
        }));
        lay.addView(seek);

        return lay
    } catch (e) {
        customMessage(e)
    }
};
var booleansetting = (setting) => {
    try {
        var sett = setting.values;
        let p10 = gs(10);
        let p6 = gs(6);

        let lay = new LinearLayout(ctx);
        lay.setOrientation(1);
        //lay.setBackground(style.custom_corner_color('#2b2b2b', gs(4), '#2a2a2a', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]))
        lay.setPadding(p10, p6, p10, p6);

        let text = new TextView(ctx);
        if (setting.values)
            text.setText(android.text.Html.fromHtml(setting.name + ': <font color="green">true</font>'))
        else
            text.setText(android.text.Html.fromHtml(setting.name + ': <font color="red">false</font>'));
        text.setTextColor(android.graphics.Color.parseColor("#e1e4eb"));
        text.setTextSize(gs(15));
        text.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
        text.setPadding(0, 0, 0, gs(4));
        text.setGravity(Gravity.LEFT);
        text.setOnClickListener(new OnClickListener({
            onClick(v) {
                ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(20);
                setting.values = !setting.values;

                if (setting.values)
                    text.setText(android.text.Html.fromHtml(setting.name + ': <font color="green">true</font>'))
                else
                    text.setText(android.text.Html.fromHtml(setting.name + ': <font color="red">false</font>'));
            }
        }));
        lay.addView(text);
        return lay



    } catch (e) {
        errorMessage(e)
    }
};
var stringsetting = (setting) => {
    try {

        var sett = setting.values;
        let p10 = gs(10);
        let p6 = gs(6);
        let opened = false;

        let lay = new LinearLayout(ctx);
        lay.setOrientation(1);
        //lay.setBackground(style.custom_corner_color('#2b2b2b', gs(4), '#2a2a2a', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]))
        lay.setPadding(p10, p6, p10, p6);

        function chooser(parameter) {
            let btn = new android.widget.TextView(ctx);
            btn.setText(android.text.Html.fromHtml(sett[0] == parameter ? '<font color="yellow"><b>' + parameter + '</b></font>' : parameter));
            btn.setTextColor(android.graphics.Color.parseColor("#e1e4eb"));
            btn.setTextSize(sett[0] == parameter ? gs(15) : gs(13));
            btn.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
            btn.setPadding(0, 0, 0, gs(3));
            btn.setGravity(Gravity.CENTER);
            btn.setOnClickListener(new OnClickListener({
                onClick(v) {
                    sett[0] = parameter;
                    text.setText(android.text.Html.fromHtml(setting.name + ': <font color="yellow">' + sett[0] + '</font>'));
                    //btn.setText(android.text.Html.fromHtml(sett[0] == parameter ? '<font color="yellow"><b>' + parameter + '</b></font>' : parameter));
                    lay.removeAllViews();
                    lay.addView(text);
                    sett.forEach((e, i) => {
                        if (i != 0) lay.addView(chooser(e))
                    });
                }
            }));
            return btn
        }

        let text = new TextView(ctx);
        text.setText(android.text.Html.fromHtml(setting.name + ': <font color="yellow">' + sett[0] + '</font>'))
        text.setTextColor(android.graphics.Color.parseColor("#e1e4eb"));
        text.setTextSize(gs(15));
        text.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
        text.setPadding(0, 0, 0, gs(4));
        text.setGravity(Gravity.LEFT);
        text.setOnClickListener(new OnClickListener({
            onClick(v) {
                ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(10);
                //setting.values = !setting.values;
                opened = !opened;
                if (opened) {
                    sett.forEach((e, i) => {
                        if (i != 0) lay.addView(chooser(e))
                    });
                } else {
                    lay.removeAllViews();
                    lay.addView(text);
                }
            }
        }));
        lay.addView(text);
        return lay

    } catch (e) {
        errorMessage(e)
    }
};
var mainbg = () => {
    let bg = new android.graphics.drawable.GradientDrawable();
    bg.setColor(HSV([1, 100, 85]));
    return bg;
};
var blackbg = () => {
    let bg = new android.graphics.drawable.GradientDrawable();
    bg.setColor(HSV([0, 0, 0]));
    bg.setAlpha(220);
    return bg;
};

var x = 150,
    y = 100;
var sx = x;
var sy = y;

var settings = (mod) => {
    uithread(() => {
        try {

            let move = false;
            let dx = 0;
            let dy = 0;

            let lay = new android.widget.LinearLayout(ctx);
            lay.setOrientation(1);
            lay.setBackground(style.main());

            let params = new android.widget.LinearLayout.LayoutParams(-2, -2)
            params.setMargins(gs(dip2px(10)), gs(dip2px(5)), gs(dip2px(10)), gs(dip2px(5)));

            var name1 = mod.name[0][0];
            var name2 = mod.name[0].slice(1);

            let text_main = new android.widget.TextView(ctx);
            text_main.setText(android.text.Html.fromHtml('<font color="#d90000">' + name1 + '</font><font color="#ffffff">' + name2 + '</font>'));
            text_main.setTextColor(-1);
            text_main.setGravity(android.view.Gravity.CENTER);
            text_main.setLayoutParams(params);
            text_main.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            text_main.setTypeface(font);
            text_main.setTransformationMethod(null);
            text_main.setTextSize(gs(16));
            text_main.setOnTouchListener(new android.view.View.OnTouchListener({
                onTouch: function (view, motionEvent) {
                    try {
                        move = true;
                        if (!move) {
                            return false
                        };
                        switch (motionEvent.getAction()) {
                            case android.view.MotionEvent.ACTION_DOWN:
                                dx = sx - motionEvent.getRawX();
                                dy = sy - motionEvent.getRawY();
                                break;
                            case android.view.MotionEvent.ACTION_MOVE:
                                sx = (motionEvent.getRawX() + dx);
                                sy = (motionEvent.getRawY() + dy);
                                gui.update(sx, sy, -1, -1);
                                break;
                            case android.view.MotionEvent.ACTION_UP:
                                ;
                            case android.view.MotionEvent.ACTION_CANCEL:
                                move = false;
                                break
                        }
                    } catch (e) {};
                    return true
                }
            }));
            lay.addView(text_main);

            /* -LINE- */
            params = new android.widget.LinearLayout.LayoutParams(gs(dip2px(160)), gs(dip2px(2)));
            let line = new android.widget.LinearLayout(ctx);
            line.setBackgroundColor(android.graphics.Color.parseColor("#d90000"));
            line.setLayoutParams(params);
            lay.addView(line);

            params = new android.widget.LinearLayout.LayoutParams(-1, -2);
            let main = new android.widget.LinearLayout(ctx);
            main.setOrientation(1);
            main.setLayoutParams(params);
            main.setBackground(style.custom_corner("#2d2d2d", [0, 0, 0, 0, 0, 0, 0, 0]));
            lay.addView(main);

            let scroll = new android.widget.ScrollView(ctx);
            scroll.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1));
            scroll.getLayoutParams().setMargins(gs(4), gs(5), gs(4), gs(5))
            main.addView(scroll);

            let funct = new android.widget.LinearLayout(ctx);
            funct.setOrientation(1);
            funct.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1));
            funct.getLayoutParams().setMargins(gs(4), gs(5), gs(4), gs(5))
            scroll.addView(funct);

            if (mod.settings != 0) {
                mod.settings.forEach((e) => {
                    if (e.type == "int") {
                        funct.addView(seekbarsetting(e))
                    } else {
                        if (e.type == "bool") {
                            funct.addView(booleansetting(e))
                        } else {
                            funct.addView(stringsetting(e))
                        }
                    }
                })
            };

            params = new android.widget.LinearLayout.LayoutParams(-1, gs(dip2px(2)));
            line = new android.widget.LinearLayout(ctx);
            line.setBackgroundColor(android.graphics.Color.parseColor("#d90000"));
            line.setLayoutParams(params);
            lay.addView(line);


            params = new android.widget.LinearLayout.LayoutParams(-2, -2)
            params.setMargins(gs(dip2px(10)), gs(dip2px(5)), gs(dip2px(10)), gs(dip2px(5)))
            text_main = new android.widget.TextView(ctx);
            if (mod.state[1])
                text_main.setText(android.text.Html.fromHtml('Bind: <font color="green">' + getBindState(mod) + '</font>'))
            else
                text_main.setText(android.text.Html.fromHtml('Bind: <font color="red">' + getBindState(mod) + '</font>'));
            text_main.setTextColor(-1);
            text_main.setSingleLine(true);
            text_main.setGravity(android.view.Gravity.CENTER);
            text_main.setLayoutParams(params);
            text_main.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            text_main.setBackground(style.custom_corner("#545454", [0, 0, 0, 0, 20, 20, 20, 20]));
            text_main.setTypeface(font);
            text_main.setTransformationMethod(null);
            text_main.setTextSize(gs(16));
            text_main.setOnClickListener(new OnClickListener({
                onClick(v) {
                    ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
                    mod.state[1] = !mod.state[1];
                    if (mod.state[1])
                        bindbutton(mod);
                    else
                        mod.bind.dismiss();
                    if (mod.state[1])
                        text_main.setText(android.text.Html.fromHtml('Bind: <font color="green">' + getBindState(mod) + '</font>'))
                    else
                        text_main.setText(android.text.Html.fromHtml('Bind: <font color="red">' + getBindState(mod) + '</font>'));
                }
            }));

            lay.addView(text_main);




            var gui = new android.widget.PopupWindow(lay, -2, -2, true);
            gui.setAnimationStyle(android.R.style.Animation_Dialog);
            gui.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.CENTER, 0, 0);
            gui.update(sx, sy, -1, -1);

        } catch (e) {
            print(e + e.lineNumber)
        }
    })
};

// button
var button_popup = null;
var button = () => {
    uithread(() => {
        try {
            let text = new android.widget.TextView(ctx);
            text.setText(android.text.Html.fromHtml('<font color="red">H</font><font color="#FFFFFF">alcyon - build 2</font>'));
            text.setTextColor(android.graphics.Color.WHITE);
            text.setTextSize(gs(17));
            text.setTypeface(android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD));
            text.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            text.setGravity(android.view.Gravity.CENTER);
            text.setOnClickListener(new OnClickListener({
                onClick(v) {
                    menu();
                }
            }));

            button_popup = new android.widget.PopupWindow(text, android.widget.RelativeLayout.LayoutParams.WRAP_CONTENT, android.widget.RelativeLayout.LayoutParams.WRAP_CONTENT);
            button_popup.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.LEFT | android.view.Gravity.TOP, gs(15), gs(5)); /////////////////////////////////////////////////
            //button_popup.setTouchable(!!0);
        } catch (e) {
            errorMessage(e)
        }
    });
}
var font = android.graphics.Typeface.create("sans-serif", android.graphics.Typeface.BOLD);
var style = {
    custom_simple(color) {
        let bg = new android.graphics.drawable.GradientDrawable();
        bg.setColor(android.graphics.Color.parseColor(color));
        return bg;
    },
    custom_corner(color, corners) {
        let bg = new android.graphics.drawable.GradientDrawable();
        bg.setColor(android.graphics.Color.parseColor(color));
        bg.setCornerRadii([corners[0], corners[1], corners[2], corners[3], corners[4], corners[5], corners[6], corners[7]]);
        return bg;
    },
    custom_corner_color(color, size, color1, corners) {
        let bg = new android.graphics.drawable.GradientDrawable();
        bg.setColor(android.graphics.Color.parseColor(color));
        bg.setStroke(size, android.graphics.Color.parseColor(color1));
        bg.setCornerRadii([corners[0], corners[1], corners[2], corners[3], corners[4], corners[5], corners[6], corners[7]]);
        return bg;
    },
    main() {
        let bg = new android.graphics.drawable.GradientDrawable();
        bg.setColor(android.graphics.Color.parseColor("#545454"));
        bg.setCornerRadius(20);
        return bg;
    }
}


var categories = [{
    name: "Combat",
    button: null,
    lay: null
}, {
    name: "Movement",
    button: null,
    lay: null
}, {
    name: "Player",
    button: null,
    lay: null
}, {
    name: "Misc.",
    button: null,
    lay: null
}];
var choosen = categories[0].name;

var dip2px = (dips) => {
    return Math.ceil(dips * ctx.getResources().getDisplayMetrics().density);
}

popup_menu = null;

var sbar = (mod) => {
    let lay = new android.widget.LinearLayout(ctx);
    lay.setOrientation(0);
    lay.setPadding(gs(15), gs(15), gs(15), 0);
    lay.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-2, gs(dip2px(25) + 15)));



    let btn = new android.widget.TextView(ctx);
    btn.setText('[]');
    btn.setTextSize(gs(13));
    btn.setTextColor(0);
    btn.setPadding(gs(5), gs(5), gs(5), gs(1));
    btn.setBackground(mod.state[0] ? style.custom_corner_color('#a2a2a2', gs(4), '#a2a2a2', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]) : style.custom_corner_color('#2d2d2d', gs(4), '#a2a2a2', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]));
    btn.setLayoutParams(new android.widget.LinearLayout.LayoutParams(gs(dip2px(20)), gs(dip2px(20))));
    btn.setOnClickListener(new android.view.View.OnClickListener({
        onClick: function (v) {
            mod.state[0] = !mod.state[0];
            btn.setBackground(mod.state[0] ? style.custom_corner_color('#a2a2a2', gs(4), '#a2a2a2', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]) : style.custom_corner_color('#2d2d2d', gs(4), '#a2a2a2', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]));
            if (getCode(mod).hasOwnProperty('toggle')) getCode(mod).toggle();

        }
    }));
    btn.setOnLongClickListener(new android.view.View.OnLongClickListener({
        onLongClick(v, t) {
            ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
            settings(mod);
            //mod.state[1] = !mod.state[1];
            //if (mod.state[1])
            //    bindbutton(mod);
            // else
            //     mod.bind.dismiss();
            return true;
        }
    }));
    lay.addView(btn);

    let lay1 = new android.widget.LinearLayout(ctx);
    lay1.setOrientation(1);
    lay1.setPadding(0, 0, 0, 5);



    let btn1 = new android.widget.TextView(ctx);
    btn1.setText(" " + mod.name[0]);
    //btn1.setTextSize(15);
    btn1.setTypeface(font);
    btn1.setTextColor(android.graphics.Color.parseColor("#e1e4eb"));
    btn1.setGravity(android.view.Gravity.LEFT);
    btn1.setPadding(gs(3), gs(1), gs(1), gs(1));
    btn1.setSingleLine(false);
    btn1.setBackground(null);
    btn1.setTextSize(gs(14));
    btn1.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1));
    btn1.setOnClickListener(new android.view.View.OnClickListener({
        onClick: function (v) {
            mod.state[0] = !mod.state[0];
            btn.setBackground(mod.state[0] ? style.custom_corner_color('#a2a2a2', gs(4), '#a2a2a2', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]) : style.custom_corner_color('#2d2d2d', gs(4), '#a2a2a2', [gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5), gs(5)]));
            if (getCode(mod).hasOwnProperty('toggle')) getCode(mod).toggle();
        }
    }));
    btn1.setOnLongClickListener(new android.view.View.OnLongClickListener({
        onLongClick(v, t) {
            ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
            settings(mod);
            /*mod.state[1] = !mod.state[1];
            if (mod.state[1])
                bindbutton(mod);
            else
                mod.bind.dismiss();*/
            return true;
        }
    }));
    lay1.addView(btn1);
    lay.addView(lay1);
    //mod.width = btn1.getWidth();
    return lay;
};

var bindbutton = (module) => {
    ctx.runOnUiThread({
        run() {
            try {
                //let module = Halcyon.getModule(mod);
                //let state = Halcyon.getState(module);
                let move = false;
                let dx = 0;
                let dy = 0;
                let PosX = 0;
                let PosY = 0;
                let touchListen = new android.view.View.OnTouchListener({
                    onTouch: function (view, motionEvent) {
                        try {
                            if (!move) return false;
                            switch (motionEvent.getAction()) {
                                case android.view.MotionEvent.ACTION_DOWN:
                                    dx = PosX - motionEvent.getRawX();
                                    dy = PosY - motionEvent.getRawY();
                                    break;
                                case android.view.MotionEvent.ACTION_MOVE:
                                    PosX = (motionEvent.getRawX() + dx);
                                    PosY = (motionEvent.getRawY() + dy);
                                    module.bind.update(PosX, PosY, -1, -1);
                                    break;
                                case android.view.MotionEvent.ACTION_UP:
                                case android.view.MotionEvent.ACTION_CANCEL:
                                    move = false;
                                    break;
                            }
                        } catch (e) {
                            errorMessage(e);
                        }
                        return true;
                    }
                });
                let longListen = new android.view.View.OnLongClickListener({
                    onLongClick: function (v, t) {
                        ctx.getSystemService(android.content.Context.VIBRATOR_SERVICE).vibrate(60);
                        move = true;
                        return true;
                    }
                });

                //ctx.injectKeyEvent(100, 1)
                //ctx.injectKeyEvent(100, 0)

                let btn = new android.widget.TextView(ctx);
                btn.setText(module.name[1]);
                btn.setTextColor(-1);
                btn.setTextSize(14);
                btn.setTransformationMethod(null);
                btn.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, -1));
                btn.setBackground(module.state[0] ? style.custom_simple("#d90000") : style.custom_simple("#545454"));
                btn.setGravity(android.view.Gravity.CENTER);
                btn.setOnClickListener(new android.view.View.OnClickListener({
                    onClick: function (v) {
                        module.state[0] = !module.state[0];
                        if (module.code.hasOwnProperty('toggle')) module.code.toggle();
                        btn.setBackground(module.state[0] ? style.custom_simple("#d90000") : style.custom_simple("#545454"));
                    }
                }));
                btn.setOnTouchListener(touchListen);
                btn.setOnLongClickListener(longListen);

                module.bind = new android.widget.PopupWindow(btn, gs(dip2px(45)), gs(dip2px(45)));
                module.bind.setAnimationStyle(android.R.style.Animation_Dialog);
                module.bind.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.LEFT | android.view.Gravity.TOP, 0, 0);
                module.bind.update(ctx.getWindowManager().getDefaultDisplay().getWidth() / 2, ctx.getWindowManager().getDefaultDisplay().getHeight() / 2, -1, -1)
            } catch (e) {
                errorMessage(e)
            }
        }
    })
}
// menu
var menu = () => {
    uithread(() => {
        try {
            let move = false;
            let dx = 0;
            let dy = 0;


            let lay = new android.widget.LinearLayout(ctx);
            lay.setOrientation(1);
            lay.setBackground(style.main());

            let params = new android.widget.LinearLayout.LayoutParams(-2, -2)
            params.setMargins(gs(dip2px(10)), gs(dip2px(5)), gs(dip2px(10)), gs(dip2px(5)));

            let text_main = new android.widget.TextView(ctx);
            Halcyon.isDev ? text_main.setText(android.text.Html.fromHtml('<font color="#d90000">H</font><font color="#ffffff">alcyon - build 2 Dev</font>')) : text_main.setText(android.text.Html.fromHtml('<font color="#d90000">H</font><font color="#ffffff">alcyon - build 2 Alpha</font>'))
            text_main.setTextColor(-1);
            text_main.setGravity(android.view.Gravity.CENTER);
            text_main.setLayoutParams(params);
            text_main.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            text_main.setTypeface(font);
            text_main.setTransformationMethod(null);
            text_main.setTextSize(gs(16));
            text_main.setOnTouchListener(new android.view.View.OnTouchListener({
                onTouch: function (view, motionEvent) {
                    try {
                        move = true;
                        if (!move) {
                            return false
                        };
                        switch (motionEvent.getAction()) {
                            case android.view.MotionEvent.ACTION_DOWN:
                                dx = x - motionEvent.getRawX();
                                dy = y - motionEvent.getRawY();
                                break;
                            case android.view.MotionEvent.ACTION_MOVE:
                                x = (motionEvent.getRawX() + dx);
                                y = (motionEvent.getRawY() + dy);
                                popup_menu.update(x, y, -1, -1);
                                break;
                            case android.view.MotionEvent.ACTION_UP:
                                ;
                            case android.view.MotionEvent.ACTION_CANCEL:
                                move = false;
                                break
                        }
                    } catch (e) {};
                    return true
                }
            }));
            text_main.setOnLongClickListener(new android.view.View.OnLongClickListener({
                onLongClick: function (view) {
                    popup_menu.update(x, y, -1, -1);
                    return true;
                }
            }));
            lay.addView(text_main);

            /* -LINE- */
            params = new android.widget.LinearLayout.LayoutParams(-1, gs(dip2px(2)));
            let line = new android.widget.LinearLayout(ctx);
            line.setBackgroundColor(android.graphics.Color.parseColor("#d90000"));
            line.setLayoutParams(params);
            lay.addView(line);

            params = new android.widget.LinearLayout.LayoutParams(-2, -2);
            let main = new android.widget.LinearLayout(ctx);
            main.setOrientation(1);
            main.setLayoutParams(params);
            main.setBackground(style.custom_corner("#2d2d2d", [0, 0, 0, 0, 0, 0, 0, 0]));
            lay.addView(main);

            // ----------------------------------------------------------------- Категории, горизонтально

            params = new android.widget.LinearLayout.LayoutParams(-2, gs(dip2px(65)));
            let категории = new android.widget.LinearLayout(ctx);
            категории.setOrientation(0);
            категории.setLayoutParams(params);
            main.addView(категории);

            params = new android.widget.LinearLayout.LayoutParams(-2, gs(dip2px(65))); //params for all



            let c = new android.widget.LinearLayout(ctx); //combat
            c.setOrientation(1);
            c.setLayoutParams(params);
            c.setBackground(choosen == "Combat" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));

            let m = new android.widget.LinearLayout(ctx); //Movement
            m.setOrientation(1);
            m.setLayoutParams(params);
            m.setBackground(choosen == "Movement" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));

            let p = new android.widget.LinearLayout(ctx); //Player
            p.setOrientation(1);
            p.setLayoutParams(params);
            p.setBackground(choosen == "Player" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));

            let ms = new android.widget.LinearLayout(ctx); //Misc
            ms.setOrientation(1);
            ms.setLayoutParams(params);
            ms.setBackground(choosen == "Misc" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));

            категории.addView(c);
            категории.addView(m);
            категории.addView(p);
            категории.addView(ms);


            let c_txt = new android.widget.LinearLayout(ctx); //combat
            c_txt.setOrientation(1);
            c_txt.setLayoutParams(new android.widget.LinearLayout.LayoutParams(gs(dip2px(65)), -1));
            c_txt.setBackground(choosen == "Combat" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));
            c.addView(c_txt);

            var c_icon = new android.widget.TextView(ctx);
            c_icon.setText("a");
            c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
            c_icon.setTypeface(ifont);
            c_icon.setTransformationMethod(null);
            c_icon.setTextSize(gs(38));
            c_icon.setGravity(android.view.Gravity.CENTER);
            c_icon.setPadding(0, gs(20), 0, gs(3));
            c_icon.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            c_icon.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {


                    choosen = "Combat";
                    c_txt.setBackground(style.custom_simple("#d90000"));
                    m_txt.setBackground(style.custom_simple("#373737"));
                    p_txt.setBackground(style.custom_simple("#373737"));
                    ms_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Combat") {
                            funct.addView(sbar(entry));

                        }
                    })
                }
            }));
            c_txt.addView(c_icon);

            var c_name = new android.widget.TextView(ctx);
            c_name.setText("Combat");
            c_name.setTextColor(android.graphics.Color.parseColor('#a2a2a2'));
            c_name.setTypeface(font);
            c_name.setTransformationMethod(null);
            c_name.setTextSize(gs(10));
            c_name.setPadding(0, 0, 0, gs(5));
            c_name.setGravity(android.view.Gravity.CENTER);
            c_name.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            c_name.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {
                    choosen = "Combat";
                    c_txt.setBackground(style.custom_simple("#d90000"));
                    m_txt.setBackground(style.custom_simple("#373737"));
                    p_txt.setBackground(style.custom_simple("#373737"));
                    ms_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Combat") {
                            funct.addView(sbar(entry));
                        }
                    })
                }
            }));
            c_txt.addView(c_name);

            let m_txt = new android.widget.LinearLayout(ctx); //combat
            m_txt.setOrientation(1);
            m_txt.setLayoutParams(new android.widget.LinearLayout.LayoutParams(gs(dip2px(65)), -1));
            m_txt.setBackground(choosen == "Movement" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));
            m.addView(m_txt);

            var m_icon = new android.widget.TextView(ctx);
            m_icon.setText("b");
            m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
            m_icon.setTypeface(ifont);
            m_icon.setTransformationMethod(null);
            m_icon.setTextSize(gs(38));
            m_icon.setGravity(android.view.Gravity.CENTER);
            m_icon.setPadding(0, gs(20), 0, gs(3));
            m_icon.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            m_icon.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {
                    choosen = "Movement";
                    m_txt.setBackground(style.custom_simple("#d90000"));
                    c_txt.setBackground(style.custom_simple("#373737"));
                    p_txt.setBackground(style.custom_simple("#373737"));
                    ms_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Movement") {
                            funct.addView(sbar(entry));
                        }
                    })
                }
            }));
            m_txt.addView(m_icon);

            var m_name = new android.widget.TextView(ctx);
            m_name.setText("Movement");
            m_name.setTextColor(android.graphics.Color.parseColor('#a2a2a2'));
            m_name.setTypeface(font);
            m_name.setTransformationMethod(null);
            m_name.setTextSize(gs(10));
            m_name.setPadding(0, 0, 0, gs(5));
            m_name.setGravity(android.view.Gravity.CENTER);
            m_name.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            m_icon.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {
                    choosen = "Movement";
                    m_txt.setBackground(style.custom_simple("#d90000"));
                    c_txt.setBackground(style.custom_simple("#373737"));
                    p_txt.setBackground(style.custom_simple("#373737"));
                    ms_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Movement") {
                            funct.addView(sbar(entry));
                        }
                    })
                }
            }));
            m_txt.addView(m_name);

            let p_txt = new android.widget.LinearLayout(ctx); //combat
            p_txt.setOrientation(1);
            p_txt.setLayoutParams(new android.widget.LinearLayout.LayoutParams(gs(dip2px(65)), -1));
            p_txt.setBackground(choosen == "Player" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));
            p.addView(p_txt);

            var p_icon = new android.widget.TextView(ctx);
            p_icon.setText("c");
            p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
            p_icon.setTypeface(ifont);
            p_icon.setTransformationMethod(null);
            p_icon.setTextSize(gs(38));
            p_icon.setGravity(android.view.Gravity.CENTER);
            p_icon.setPadding(0, gs(20), 0, gs(3));
            p_icon.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            p_icon.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {
                    choosen = "Player";
                    p_txt.setBackground(style.custom_simple("#d90000"));
                    c_txt.setBackground(style.custom_simple("#373737"));
                    m_txt.setBackground(style.custom_simple("#373737"));
                    ms_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Player") {
                            funct.addView(sbar(entry));
                        }
                    })
                }
            }));
            p_txt.addView(p_icon);

            var p_name = new android.widget.TextView(ctx);
            p_name.setText("Player");
            p_name.setTextColor(android.graphics.Color.parseColor('#a2a2a2'));
            p_name.setTypeface(font);
            p_name.setTransformationMethod(null);
            p_name.setTextSize(gs(10));
            p_name.setPadding(0, 0, 0, gs(5));
            p_name.setGravity(android.view.Gravity.CENTER);
            p_name.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            p_name.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {
                    choosen = "Player";
                    p_txt.setBackground(style.custom_simple("#d90000"));
                    c_txt.setBackground(style.custom_simple("#373737"));
                    m_txt.setBackground(style.custom_simple("#373737"));
                    ms_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Player") {
                            funct.addView(sbar(entry));
                        }
                    })
                }
            }));
            p_txt.addView(p_name);

            let ms_txt = new android.widget.LinearLayout(ctx); //combat
            ms_txt.setOrientation(1);
            ms_txt.setLayoutParams(new android.widget.LinearLayout.LayoutParams(gs(dip2px(65)), -1));
            ms_txt.setBackground(choosen == "Misc" ? style.custom_simple("#d90000") : style.custom_simple("#373737"));
            ms.addView(ms_txt);

            var ms_icon = new android.widget.TextView(ctx);
            ms_icon.setText("e");
            ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
            ms_icon.setTypeface(ifont);
            ms_icon.setTransformationMethod(null);
            ms_icon.setTextSize(gs(38));
            ms_icon.setGravity(android.view.Gravity.CENTER);
            ms_icon.setPadding(0, gs(20), 0, gs(3));
            ms_icon.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            ms_icon.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {
                    choosen = "Misc";
                    ms_txt.setBackground(style.custom_simple("#d90000"));
                    c_txt.setBackground(style.custom_simple("#373737"));
                    p_txt.setBackground(style.custom_simple("#373737"));
                    m_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Misc") {
                            funct.addView(sbar(entry));
                        }
                    })
                }
            }));
            ms_txt.addView(ms_icon);

            var ms_name = new android.widget.TextView(ctx);
            ms_name.setText("Misc");
            ms_name.setTextColor(android.graphics.Color.parseColor('#a2a2a2'));
            ms_name.setTypeface(font);
            ms_name.setTransformationMethod(null);
            ms_name.setTextSize(gs(10));
            ms_name.setPadding(0, 0, 0, gs(5));
            ms_name.setGravity(android.view.Gravity.CENTER);
            ms_name.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            ms_name.setOnClickListener(new android.view.View.OnClickListener({
                onClick: function (v) {
                    choosen = "Misc";
                    ms_txt.setBackground(style.custom_simple("#d90000"));
                    c_txt.setBackground(style.custom_simple("#373737"));
                    p_txt.setBackground(style.custom_simple("#373737"));
                    m_txt.setBackground(style.custom_simple("#373737"));
                    c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
                    m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
                    p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
                    ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
                    funct.removeAllViews();
                    Halcyon.mods.forEach(function (entry) {
                        if (entry.category == "Misc") {
                            funct.addView(sbar(entry));
                        }
                    })
                }
            }));
            ms_txt.addView(ms_name);

            c_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
            m_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
            p_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
            ms_icon.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));
            c_name.setTextColor(android.graphics.Color.parseColor(choosen == "Combat" ? '#ffffff' : '#a2a2a2'));
            m_name.setTextColor(android.graphics.Color.parseColor(choosen == "Movement" ? '#ffffff' : '#a2a2a2'));
            p_name.setTextColor(android.graphics.Color.parseColor(choosen == "Player" ? '#ffffff' : '#a2a2a2'));
            ms_name.setTextColor(android.graphics.Color.parseColor(choosen == "Misc" ? '#ffffff' : '#a2a2a2'));

            /* -LINE- */
            params = new android.widget.LinearLayout.LayoutParams(-1, gs(dip2px(2)));
            line = new android.widget.LinearLayout(ctx);
            line.setBackgroundColor(android.graphics.Color.parseColor("#d90000"));
            line.setLayoutParams(params);
            main.addView(line);
            /* -LINE- */

            // -----------------------------------------------------------------
            /* -BOTTOM-*/

            let scroll = new android.widget.ScrollView(ctx);
            scroll.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, gs(dip2px(200))));
            scroll.getLayoutParams().setMargins(gs(4), gs(5), gs(4), gs(5))
            main.addView(scroll);

            let funct = new android.widget.LinearLayout(ctx);
            funct.setOrientation(1);
            funct.setLayoutParams(new android.widget.LinearLayout.LayoutParams(-1, gs(dip2px(200))));
            funct.getLayoutParams().setMargins(gs(4), gs(5), gs(4), gs(5))
            scroll.addView(funct);

            Halcyon.mods.forEach(function (entry) {
                if (entry.category == choosen) {
                    funct.addView(sbar(entry));
                }
            });

            /* -LINE- */
            params = new android.widget.LinearLayout.LayoutParams(-1, gs(dip2px(2)));
            line = new android.widget.LinearLayout(ctx);
            line.setBackgroundColor(android.graphics.Color.parseColor("#d90000"));
            line.setLayoutParams(params);
            lay.addView(line);

            params = new android.widget.LinearLayout.LayoutParams(-2, -2)
            params.setMargins(gs(dip2px(10)), gs(dip2px(5)), gs(dip2px(10)), gs(dip2px(5)))
            text_main = new android.widget.TextView(ctx);
            text_main.setText(android.text.Html.fromHtml('Vk.com/nofairplay'));
            text_main.setTextColor(-1);
            text_main.setSingleLine(true);
            text_main.setGravity(android.view.Gravity.CENTER);
            text_main.setLayoutParams(params);
            text_main.setShadowLayer(1, 1, 1, android.graphics.Color.BLACK);
            text_main.setBackground(style.custom_corner("#545454", [0, 0, 0, 0, 20, 20, 20, 20]));
            text_main.setTypeface(font);
            text_main.setTransformationMethod(null);
            text_main.setTextSize(gs(16));
            text_main.setOnTouchListener(new android.view.View.OnTouchListener({
                onTouch: function (view, motionEvent) {
                    try {
                        move = true;
                        if (!move) {
                            return false
                        };
                        switch (motionEvent.getAction()) {
                            case android.view.MotionEvent.ACTION_DOWN:
                                dx = x - motionEvent.getRawX();
                                dy = y - motionEvent.getRawY();
                                break;
                            case android.view.MotionEvent.ACTION_MOVE:
                                x = (motionEvent.getRawX() + dx);
                                y = (motionEvent.getRawY() + dy);
                                popup_menu.update(x, y, -1, -1);
                                break;
                            case android.view.MotionEvent.ACTION_UP:
                                ;
                            case android.view.MotionEvent.ACTION_CANCEL:
                                move = false;
                                break
                        }
                    } catch (e) {};
                    return true
                }
            }));
            text_main.setOnLongClickListener(new android.view.View.OnLongClickListener({
                onLongClick: function (view) {
                    popup_menu.update(x, y, -1, -1);
                    return true;
                }
            }));
            lay.addView(text_main);

            popup_menu = new android.widget.PopupWindow(lay, -2, -2, true);
            popup_menu.setAnimationStyle(android.R.style.Animation_Dialog);
            popup_menu.showAtLocation(ctx.getWindow().getDecorView(), android.view.Gravity.TOP | android.view.Gravity.LEFT, gs(100), gs(75));
            popup_menu.update(x, y, -1, -1);


        } catch (e) {
            errorMessage(e)
        }
    });
}

var ping_timer = 10;
var ping_meter = (ip) => {
    var hostThread = new java.lang.Thread(new java.lang.Runnable({
        run() {
            //android.os.Looper.prepare();
            try {
                var ipAd = ip;
                var inet = java.net.InetAddress.getByName(ipAd);
                //if (Halcyon.isDev) customMessage("Sending Ping Request to " + ipAd);
                var finish = 0;
                var start = new java.util.GregorianCalendar().getTimeInMillis();
                if (inet.isReachable(5000)) {
                    finish = new java.util.GregorianCalendar().getTimeInMillis();
                    // if (Halcyon.isDev) customMessage("Ping RTT: " + (finish - start + "ms"));
                    png = (finish - start);
                } else {
                    png = -1;
                    //if (Halcyon.isDev) customMessage(ipAd + " NOT reachable.");
                }
            } catch (e) {
                if (Halcyon.isDev) customMessage(e);
            }
            //android.os.Looper.loop();

        }
    }))
    hostThread.start();
}

var inlevel_status = 1;

/*------------------------*\
| 🔥 Initialization
\*------------------------*/

new function () {
    //icon font
    if (!java.io.File(android.os.Environment.getExternalStorageDirectory().getAbsolutePath() + "/Halcyon").exists()) java.io.File(android.os.Environment.getExternalStorageDirectory().getAbsolutePath() + "/Halcyon").mkdirs();
    var fontFile = new java.io.File(android.os.Environment.getExternalStorageDirectory().getAbsolutePath() + "/Halcyon/icon-font.ttf");
    if (!fontFile.exists()) {
        fontFile.createNewFile();
        var fileOutputStream = new java.io.FileOutputStream(fontFile);
        fileOutputStream.write(android.util.Base64.decode(ifont, 0));
        fileOutputStream.close();
    };
    ifont = new android.graphics.Typeface.createFromFile(android.os.Environment.getExternalStorageDirectory().getAbsolutePath() + "/Halcyon/icon-font.ttf");
    //get dpi and scale
    try {
        var oF = new java.io.File(android.os.Environment.getExternalStorageDirectory() + "/games/com.mojang/minecraftpe/", "options.txt");
        let readed = (new java.io.BufferedReader(new java.io.FileReader(oF)));
        let data = new java.lang.StringBuilder();
        let string;
        while ((string = readed.readLine()) != null) data.append(string + "\n");
        //return data.toString();
        var oT = data.toString();
        if (oT.includes("key_key.attack:-99") || !oT.includes("key_key.attack:81")) {
            //needR = true;
            oT = oT.replace("key_key.attack:-99", "key_key.attack:81");
            oT = oT.replace("key_key.drop:81", "key_key.drop:-99");
            //oT = oT.split("keyboard_type_1")[0];
            var fos = new java.io.FileOutputStream(oF, false);
            fos.write(oT.getBytes());
            fos.close();
            print("Settings replaced. Restart your MCPE");
            net.zhuoweizhang.mcpelauncher.ui.NerdyStuffActivity.forceRestart(ctx);
        }
    } catch (e) {
        customMessage(e)
    }
    scale = Math.round(Math.round(ctx.getResources().getDisplayMetrics().density * 100) / 229 * 100) / 100;
    hud();
    pos();
    button();
    if (Halcyon.isDev) {
        customMessage('Scale=' + scale);
        print('Halcyon loaded successful! Total modules: ' + Halcyon.totalModules);
    } else {
        print(ModPE.getLanguage() == "ru_RU" ? "Длинное нажатие по кнопке в меню, откроет меню настроек для модуля!" : "A long press on the button in the menu will open the settings menu for the module!");
    }
};

/*----------*\
| 🔥 Hooks
\*----------*/

var modTick = () => {
    try {
        if (ping_timer == 0) {
            ping_meter(Server.getAddress());
            ping_timer = 10
        } else {
            ping_timer--
        }
        uithread(() => {
            if (png > -1 && png < 100)
                pb.setText(fromHtml("Ping: " + png))
            else if (png >= 100)
                pb.setText(fromHtml("Ping: <font color='yellow'>" + png + "</font>"))
            else pb.setText(fromHtml("<font color='#c80f0f'>Server is unreachable</font>"))
            // if(png != -1)
            //   pb.setText("Ping: " + png)
            //else
            //   pb.setText("Server is unreachable")
            post.setText(android.text.Html.fromHtml('<font color="red">X:</font> ' + Math.round(Player.getX()) + " <font color='red'>Y:</font> " + Math.round(Player.getY()) + " <font color='red'>Z:</font> " + Math.round(Player.getZ())));
        })
        Halcyon.mods.forEach(function (e) {
            if (e.code.hasOwnProperty('tick')) e.code.tick();
        })
    } catch (e) {
        errorMessage(e)
    }
};
var attackHook = (a, v) => {
    try {
        Halcyon.mods.forEach(function (e) {
            if (e.code.hasOwnProperty('attack')) e.code.attack(a, v);
        })
    } catch (e) {
        errorMessage(e)
    }
};
var entityHurtHook = (a, v, h) => {
    try {
        Halcyon.mods.forEach(function (e) {
            if (e.code.hasOwnProperty('hurt')) e.code.hurt(a, v, h);
        })
    } catch (e) {
        errorMessage(e)
    }
};
var useItem = (x, y, z, itemid, blockid, side, itemDamage, blockDamage) => {};
var toDirectionalVector = (vector, yaw, pitch) => {};
var screenChangeHook = (screen) => {
    sscreen = screen
};
var chatHook = (msg) => {
    var m = msg.split(" ");
    if (msg.charAt(0) == ".") {
        preventDefault();
        if (m[0] == ".save") {
            config.create(m[1]);
        };
        if (m[0] == ".load") {
            config.load(m[1]);
        };
    }
};
var serverMessageReceiveHook = (msg) => {};
var deathHook = (a, v) => {
    Halcyon.mods.forEach(function (e) {
        if (e.code.hasOwnProperty('death')) e.code.death(a, v);
    })
};
