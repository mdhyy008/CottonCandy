require "import"
import "android.graphics.drawable.ColorDrawable"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "func_mod"
import "Snackbar"
import "android.content.*" 
import "android.content.pm.PackageManager"

apps_lay = {
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  layout_height="fill";
  id="colo";
  {
    TextView;
    text="应用管理";
    textSize="22sp";
    textColor="#ffffff";
    layout_margin="10dp";
  };
  {
    TextView;
    textColor="#ffffff";
    layout_marginLeft="10dp";
    layout_height="30dp";
    text="应用数量加载中...";
    id="app_num";
  };
  {
    ListView;
    id="lv";
    layout_width="fill";
  };
};



activity.setContentView(apps_lay)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF3F51B5);



import "java.io.File"--导入File类
oo = File("/storage/emulated/0/.Dabai2017/mht_color_top.txt").exists()

if oo == true then 

  top_c = 读("/storage/emulated/0/.Dabai2017/mht_color_top.txt")
  lv.setBackgroundDrawable(ColorDrawable(tointeger(top_c)))
  colo.setBackgroundDrawable(ColorDrawable(tointeger(top_c)))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(tointeger(top_c));

end





function GetAppInfo(包名)
  import "android.content.pm.PackageManager"
  local pm = activity.getPackageManager();
  local 图标 = pm.getApplicationInfo(tostring(包名),0)
  local 图标 = 图标.loadIcon(pm);
  local pkg = activity.getPackageManager().getPackageInfo(包名, 0); 
  local 应用名称 = pkg.applicationInfo.loadLabel(activity.getPackageManager())
  local 版本号 = activity.getPackageManager().getPackageInfo(包名, 0).versionName
  local 最后更新时间 = activity.getPackageManager().getPackageInfo(包名, 0).lastUpdateTime
  local cal = Calendar.getInstance();
  cal.setTimeInMillis(最后更新时间); 
  local 最后更新时间 = cal.getTime().toLocaleString()
  return 包名,版本号,最后更新时间,图标,应用名称
end



item = {
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  {
    LinearLayout;
    layout_height="60dp";
    layout_width="fill";
    {
      ImageView;
      id="s_icon";
      layout_height="45dp";
      layout_gravity="center";
      layout_marginLeft="10dp";
      layout_width="45dp";
      src="icon.png";
    };
    {
      LinearLayout;
      paddingLeft="10dp";
      orientation="vertical";
      layout_height="fill";
      layout_width="fill";
      {
        TextView;
        id="s_name";
        text="应用名";
        textColor="#ffffff";
        layout_marginTop="10dp";
        textSize="17sp";
        layout_gravity="left";
      };
      {
        TextView;
        id="s_ver";
        text="版本号";
        textColor="#ffffff";
      };
      {
        TextView;
        id="s_pack";
        textSize="0sp";
        textColor="#ffffff";
        text="包名";
      };
    };
  };
};





x_lay = {
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="fill";
  {
    ImageView;
    layout_gravity="center";
    src="icon.png";
    layout_width="45dp";
    layout_height="45dp";
    id="x_icon";

  };
  {
    TextView;
    layout_gravity="center";
    text="版本号";
    id="x_ver";
    layout_marginTop="5dp";
  };
  {
    TextView;
    layout_gravity="center";
    text="包名";
    id="x_pack";
    layout_marginTop="5dp";
  };
  {
    Button;
    layout_width="fill";
    text="终止进程";
    id="kill";
    BackgroundColor="#E91E63";
    TextColor="#ffffff";
    layout_marginTop="10dp";
  };
  {
    Button;
    layout_width="fill";
    text="卸载应用";
    id="xz";
    BackgroundColor="#E91E63";
    TextColor="#ffffff";
  };
  {
    LinearLayout;
    orientation="horizontal";
    gravity="center";
    {
      Button;
      layout_width="50%w";
      text="冻结";
      id="dj";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };
    {
      Button;
      layout_width="50%w";
      text="解冻";
      id="jd";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };
  };
};








pack = activity.getPackageManager().getInstalledPackages(3);



data={}
--创建适配器
adp=LuaAdapter(activity,data,item)

dialog = ProgressDialog.show(this, "提示", "正在获取应用列表")


task(1000,function() 

  for i=1,#pack-1 do

    包名,版本号,最后更新时间,图标,应用名称 = GetAppInfo(pack[i].packageName)

    table.insert(data,{
      s_name={
        Text=tostring(应用名称), 
      }, 
      s_ver={
        Text=tostring(版本号), 
      },
      s_pack={
        Text=tostring(包名), 
      }, 
      s_icon={
        src=图标, 
      }, 



    })

  end



  --设置适配器
  lv.Adapter=adp
  dialog.hide()
  app_num.setText("总应用数:"..#pack-1)


  lv.onItemClick=function(l,v,p,i)


    --SavePicture("/storage/emulated/0/.Dabai2017/x_icon.png",)

    ale = AlertDialog.Builder(activity)
    ale.setTitle(v.Tag.s_name.Text)
    ale.setView(loadlayout(x_lay))
    op = ale.show()

    x_ver.setText(v.Tag.s_ver.Text)
    x_pack.setText(v.Tag.s_pack.Text)

    paaa,verr,tiiii,srci,nammm = GetAppInfo(v.Tag.s_pack.Text)
    x_icon.setImageDrawable(srci)



    x_icon.onClick = function()


      packageName=v.Tag.s_pack.Text
      import "android.content.Intent"
      import "android.content.pm.PackageManager"
      manager = activity.getPackageManager()
      open = manager.getLaunchIntentForPackage(packageName)
      this.startActivity(open) 

    end





    kill.onClick = function() 


      dialog = ProgressDialog.show(this, "提示", "正在终结<"..v.Tag.s_name.Text..">进程")
      task(200,function() 
        su("am force-stop "..v.Tag.s_pack.Text)
        dialog.hide()
        op.hide()
        alert("终止命令送达")
      end)



    end

    xz.onClick = function()
      dialog = ProgressDialog.show(this, "提示", "正在卸载<"..v.Tag.s_name.Text..">")

      task(200,function() 
        su("pm uninstall "..v.Tag.s_pack.Text) 
        alert("卸载成功")
        dialog.hide()
        activity.finish()
        activity.newActivity("apps")
      end)







    end

    dj.onClick = function()

      dialog = ProgressDialog.show(this, "提示", "正在冻结<"..v.Tag.s_name.Text..">")
      task(200,function() 
        su("pm disable "..v.Tag.s_pack.Text)
        dialog.hide()
        op.hide()
        alert("冻结命令送达")
      end)

    end

    jd.onClick = function()
      dialog = ProgressDialog.show(this, "提示", "正在解冻<"..v.Tag.s_name.Text..">")
      task(200,function() 
        su("pm enable "..v.Tag.s_pack.Text) 
        dialog.hide()
        op.hide()
        alert("解冻命令送达")
      end)

    end 


    return true
  end



end)



function onKeyDown(e)
  if e==4 then

    AlertDialog.Builder(this)
    .setTitle("提示")
    .setMessage("退出应用管理？")
    .setPositiveButton("确认",{onClick=function(v)
        activity.finish()
      end})
    .show()


  end
end
