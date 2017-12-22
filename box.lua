require "import"
import "android.content.*"
import "android.view.inputmethod.InputMethodManager"
import "android.graphics.drawable.ColorDrawable"
import "android.graphics.drawable.GradientDrawable"
import "android.widget.ImageView"
import "android.view.animation.TranslateAnimation"
import "android.graphics.drawable.ColorDrawable"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "func_mod"
import "Snackbar"
import "layout_box"
import "java.io.ByteArrayOutputStream"
import "android.graphics.Bitmap"
import "android.graphics.BitmapFactory"
import "android.util.Base64"





activity.setContentView(loadlayout(layout_box))
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF3F51B5);


import "java.io.File"--导入File类
oo = File("/storage/emulated/0/.Dabai2017/mht_color_top.txt").exists()

if oo == true then 

  top_c = 读("/storage/emulated/0/.Dabai2017/mht_color_top.txt")
  colo.setBackgroundDrawable(ColorDrawable(tointeger(top_c)))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(tointeger(top_c));

end




function cir(circolor,yj)

  CircleButton(baidu,circolor,yj)
  CircleButton(kong_o,circolor,yj)
  CircleButton(vi,circolor,yj)
  CircleButton(kong_bt,circolor,yj)
  CircleButton(xiaoxi,circolor,yj)
  CircleButton(powe,circolor,yj)
  CircleButton(shell,circolor,yj)
  CircleButton(suiji,circolor,yj)
  CircleButton(apps,circolor,yj)
  CircleButton(b_tu,circolor,yj)
  CircleButton(tu_b,circolor,yj)
  CircleButton(bizhi,circolor,yj)
  CircleButton(gapps,circolor,yj)
  CircleButton(dhl,circolor,yj)

end

cir(0xFFFFFFFF,10)


Snackbar.make(colo,"这里一共有13颗糖哦",Snackbar.LENGTH_SHORT).show();



function ButtonFrame(view,Thickness,FrameColor,InsideColor)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable() 
  drawable.setShape(GradientDrawable.RECTANGLE) 
  drawable.setStroke(Thickness, FrameColor)
  drawable.setColor(InsideColor)
  view.setBackgroundDrawable(drawable)
end


--ButtonFrame(kong_o,4,0xFFFFFFFF,0x00FFFFFF)
ButtonFrame(kong_i,4,0xFFFFFFFF,0x00FFFFFF)
--ButtonFrame(app,4,0xFFFFFFFF,0x00FFFFFF)







baidu.onClick = function() 


  l_bai = {
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    orientation="vertical";
    {
      TextView;
      layout_margin="10dp";
      text="让我帮你百度一下";
      textColor="#E91E63";
    };
    {
      EditText;
      error="治疗伸手党";
      id="bai_t";
      layout_width="fill";
      hint="输入你想百度的内容";
    };
  };





  AlertDialog.Builder(activity)
  .setView(loadlayout(l_bai))
  .setNeutralButton("百度一下",{onClick=function(v)

      url = "http://www.baidu-x.com/?q="..bai_t.Text
      AlertDialog.Builder(activity)
      .setTitle("结果")
      .setMessage(url)
      .setNeutralButton("浏览器预览",{onClick=function(v)

          import "android.content.Intent"
          import "android.net.Uri"
          viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
          activity.startActivity(viewIntent)

        end})
      .setPositiveButton("复制",{onClick=function(v)
          --先导入包
          import "android.content.*" 
          activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(url)
          alert("复制完成") 
        end})
      .show()




    end})
  .show()

end







kong_o.onClick = function()

  kong_o.setVisibility(8)
  kong_i.setVisibility(0)

  Translate_up_down=TranslateAnimation(1000,0, 0,0)
  Translate_up_down.setDuration(500)
  Translate_up_down.setFillAfter(false)
  kong_t.startAnimation(Translate_up_down)
  kong_num.startAnimation(Translate_up_down)
  kong_ti.startAnimation(Translate_up_down)
  kong_bt.startAnimation(Translate_up_down)
end



kong_bt.onClick = function()

  if kong_t.Text == "" or kong_num.Text == "" then 
    alert("文件名和文件体积不能为空")
  else

    dialog = ProgressDialog.show(this, "提示","正在生成一个体积为 "..kong_num.Text.."*1000B 的不明物体")

    task(1000,function()

      for i=1,kong_num.Text do 
        for i=1,100 do 
          io.open("/sdcard/"..kong_t.Text,"a+"):write("          "):close()
        end
      end 

      dialog.dismiss()
      alert("生成完毕")
    end)



  end
end





import "android.content.pm.PackageManager"
import "android.content.pm.ApplicationInfo"
function GetApkInfo(archiveFilePath)
  pm = activity.getPackageManager()
  info = pm.getPackageArchiveInfo(archiveFilePath, PackageManager.GET_ACTIVITIES); 
  if info ~= nil then
    appInfo = info.applicationInfo;
    appName = tostring(pm.getApplicationLabel(appInfo))
    packageName = appInfo.packageName; --安装包名称 
    version=info.versionName; --版本信息 
    icon = pm.getApplicationIcon(appInfo);--图标
  end
  return packageName,version,icon
end











import "android.widget.ArrayAdapter"
import "android.widget.LinearLayout"
import "android.widget.TextView"
import "java.io.File"
import "android.widget.ListView"
import "android.app.AlertDialog"
function ChoiceFile(StartPath,callback)
  --创建ListView作为文件列表
  lv=ListView(activity).setFastScrollEnabled(true)
  --创建路径标签
  cp=TextView(activity)
  lay=LinearLayout(activity).setOrientation(1).addView(cp).addView(lv)
  ChoiceFile_dialog=AlertDialog.Builder(activity)--创建对话框
  .setTitle("选择一个安装包")
  .setView(lay)
  .show()
  adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1)
  lv.setAdapter(adp)
  function SetItem(path)
    path=tostring(path)
    adp.clear()--清空适配器
    cp.Text=tostring(path)--设置当前路径
    if path~="/" then--不是根目录则加上../
      adp.add("../")
    end
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
    else
      ls={}
    end
    for index,c in ipairs(ls) do
      if c.isDirectory() then--如果是文件夹则
        adp.add(c.Name.."/")
      else--如果是文件则
        adp.add(c.Name)
      end
    end
  end
  lv.onItemClick=function(l,v,p,s)--列表点击事件
    项目=tostring(v.Text)
    if tostring(cp.Text)=="/" then
      路径=ls[p+1]
    else
      路径=ls[p]
    end

    if 项目=="../" then
      SetItem(File(cp.Text).getParentFile())
    elseif 路径.isDirectory() then
      SetItem(路径)
    elseif 路径.isFile() then
      callback(tostring(路径))
      ChoiceFile_dialog.hide()
    end

  end

  SetItem(StartPath)
end







vi.onClick = function() 
  ChoiceFile("/sdcard",function()


    pn,ver,ico = GetApkInfo(tostring(路径))


    apkp = {
      LinearLayout;
      layout_width="fill";
      layout_height="fill";
      orientation="vertical";
      {
        ImageView;
        layout_gravity="center";
        layout_height="100dp";
        layout_width="100dp";
        id="ic";
      };
      {
        TextView;
        layout_gravity="center";
        text="包名";
        id="pack";
      };
      {
        TextView;
        layout_gravity="center";
        id="ve";
        text="版本号";
      };
    };




    AlertDialog.Builder(activity)
    .setView(loadlayout(apkp))
    .show()


    pack.setText(pn)
    ve.setText(ver)
    ic.setImageBitmap(ico.getBitmap())



    ic.onLongClick = function()

      import "android.content.*" 
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(pn.."\n"..ver)
      alert("包名,版本号 已复制")
    end



  end)
end




xiaoxi.onClick = function()

  intent=Intent(Intent.ACTION_SEND); 
  intent.setType("text/plain"); 
  intent.putExtra(Intent.EXTRA_SUBJECT, "分享"); 
  intent.putExtra(Intent.EXTRA_TEXT,ka); 
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK); 
  activity.startActivity(Intent.createChooser(intent,"想要卡谁就发给谁,哦吼吼🎃")); 

end











powe.onClick = function()

  lay_po = {
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    orientation="vertical";
    {
      Button;
      layout_width="fill";
      text="电池信息";
      id="p_x";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };
    {
      TextView;
      layout_width="fill";
      id="p_xt";
      textIsSelectable=true;
    };
    {
      Button;
      layout_width="fill";
      text="充电状态";
      id="p_z";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };


    {
      LinearLayout;
      orientation="horizontal";
      Visibility=8;
      id="p_zt";
      gravity="center";
      layout_width="fill";
      {
        Button;
        TextColor="#ffffff";
        text="正在充电";
        BackgroundColor="#E91E63";
        layout_width="50%w";
        id="p_zz";
      };
      {
        Button;
        TextColor="#ffffff";
        text="停止充电";
        BackgroundColor="#E91E63";
        layout_width="50%w";
        id="p_tz";
      };
    };











    {
      EditText;
      layout_width="fill";
      id="p_v";
      layout_marginTop="10dp";
      error="正常电量在1-100\n可以乱搞";
      hint="输入想修改的电量数值";
    };
    {
      Button;
      layout_width="fill";
      text="确认修改电量";
      id="p_qd";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };
  };


  AlertDialog.Builder(activity)
  .setView(loadlayout(lay_po))
  .show()



  p_x.onClick = function()
    p_xt.setText(su("dumpsys battery")) 
  end

  p_z.onClick = function()

    if p_zt.getVisibility() == 0 then
      p_zt.setVisibility(8)
    else
      p_zt.setVisibility(0)
    end

  end


  p_zz.onClick = function()
    su("dumpsys battery set status 2")
  end

  p_tz.onClick = function()
    su("dumpsys battery set status 1")
  end

  p_qd.onClick = function()
    su("dumpsys battery set level "..p_v.Text) 
    alert("重启就恢复了")
  end




end







shell.onClick = function()

  she = {
    LinearLayout;
    orientation="vertical";
    layout_height="fill";
    layout_width="fill";
    {
      EditText;
      id="shel";
      error="shell有风险,运行需谨慎";
      layout_width="fill";
      layout_margin="20dp";
    };
  };



  AlertDialog.Builder(activity)
  .setView(loadlayout(she))
  .setTitle("Shell")
  .setPositiveButton("运行",{onClick=function(v)
      she_t = su(shel.Text)
      alert(she_t)
    end})
  .show()

end



suiji.onClick = function()
  activity.newActivity("math")
end





apps.onClick = function() 
  activity.newActivity("apps")
end





import "java.io.ByteArrayOutputStream"
import "android.graphics.Bitmap"
import "android.graphics.BitmapFactory"
import "android.util.Base64"

--图base模块
function BitTo64(bitmap)
  local txt = nil;
  local bStream = ByteArrayOutputStream();
  bitmap.compress(Bitmap.CompressFormat.PNG, 100, bStream);
  local bytes = bStream.toByteArray();
  txt = Base64.encodeToString(bytes, Base64.DEFAULT);
  return txt
end



function StoBIT(str)

  bitmap = nil
  bita = Base64.decode(str,Base64.DEFAULT)
  bitmap = BitmapFactory.decodeByteArray(bita,0,#bita)
  return bitmap

end



function Sharing(path)
  import "android.webkit.MimeTypeMap"
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.io.File"
  FileName=tostring(File(path).Name)
  ExtensionName=FileName:match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  intent = Intent()
  intent.setAction(Intent.ACTION_SEND)
  intent.setType(Mime)
  file = File(path)
  uri = Uri.fromFile(file)
  intent.putExtra(Intent.EXTRA_STREAM,uri)
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  activity.startActivity(Intent.createChooser(intent, "分享到:"))
end







tu_b.onClick = function()
  import "android.content.Intent"
  local intent= Intent(Intent.ACTION_PICK)
  intent.setType("image/*")
  this.startActivityForResult(intent, 1)
  -------

  --回调
  function onActivityResult(requestCode,resultCode,intent)
    if intent then
      local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
      cursor.moveToFirst()
      import "android.provider.MediaStore"
      local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
      fileSrc = cursor.getString(idx)


      dialog = ProgressDialog.show(this, "提示", "正在努力转换成Base64")


      task(500,function() 
        b_tt = BitTo64(loadbitmap(fileSrc))
        AlertDialog.Builder(this)
        .setTitle("转换结果")
        .setMessage("转换成功了，你可以选择保存成文本，也可以直接复制。")
        .setPositiveButton("复制",{onClick=function(v)

            activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(b_tt)
            alert("复制成功") 

          end})
        .setNeutralButton("保存到本地",{onClick=function(v)


            import "java.io.File"--导入File类
            fil = File(fileSrc).getName()
            写入文件("/sdcard/"..fil,b_tt)

            Snackbar.make(i,"保存到了/sdcard/"..fil,Snackbar.LENGTH_SHORT)
            .setAction("分享",{
              onClick=function(v)
                Sharing("/sdcard/"..fil) 
              end
            }).show();
          end})
        .show()
        dialog.dismiss()
      end)




    end
  end


end





function SavePicture(name,bm)
  if bm then
    import "java.io.FileOutputStream"
    import "java.io.File"
    import "android.graphics.Bitmap"
    name=tostring(name)
    f = File(name)
    out = FileOutputStream(f)
    bm.compress(Bitmap.CompressFormat.PNG,90, out)
    out.flush()
    out.close()
    return true
  else
    return false
  end
end




function OpenFile(path)
  import "android.webkit.MimeTypeMap"
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.io.File"
  FileName=tostring(File(path).Name)
  ExtensionName=FileName:match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  if Mime then 
    intent = Intent(); 
    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK); 
    intent.setAction(Intent.ACTION_VIEW); 
    intent.setDataAndType(Uri.fromFile(File(path)), Mime); 
    activity.startActivity(intent);
  else
    Toastc("找不到可以用来打开此文件的程序")
  end
end




b_tu.onClick = function()

  btu_lay = {
    LinearLayout;
    layout_height="fill";
    orientation="vertical";
    layout_width="fill";
    {
      EditText;
      layout_gravity="center";
      layout_width="fill";
      id="tu_t";
      hint="请输入base64码";
      SingleLine=true;
    };
  };


  AlertDialog.Builder(activity)
  .setTitle("Base64转图片")
  .setMessage("点击转换开始获取你剪切板的base64码，然后转换成png图，转换成功图片位置在根目录/bit.png")
  .setPositiveButton("转换",{onClick=function() 

      bas=activity.getSystemService(Context.CLIPBOARD_SERVICE).getText() 


      if SavePicture("/storage/emulated/0/bit.png",StoBIT(bas)) == true then

        Snackbar.make(i,"转换成功",Snackbar.LENGTH_SHORT)
        .setAction("查看",{
          onClick=function(v)
            OpenFile("/storage/emulated/0/bit.png")
          end
        }).show();
      else
        Snackbar.make(i,"转换失败了",Snackbar.LENGTH_SHORT).show();

      end



    end})
  .show()

end








bizhi.onClick = function()

  import "android.app.WallpaperManager"
  --导入WallpaperManager类
  wallpaperManager = WallpaperManager.getInstance(this)
  --初始化壁纸管理器


  bz_lay = {
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    orientation="vertical";
    {
      Button;
      layout_width="fill";
      text="更改壁纸";
      id="bz_1";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };
    {
      Button;
      layout_width="fill";
      text="清除壁纸";
      id="bz_2";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };
    {
      Button;
      layout_width="fill";
      text="保存当前壁纸";
      id="bz_3";
      BackgroundColor="#E91E63";
      TextColor="#ffffff";
    };
  };


  AlertDialog.Builder(activity)
  .setTitle("壁纸管理器")
  .setView(loadlayout(bz_lay))
  .show()



  bz_1.onClick = function()

    gg_lay = {
      LinearLayout;
      layout_width="fill";
      layout_height="fill";
      orientation="vertical";
      {
        EditText;
        layout_width="fill";
        id="gg_t";
        hint="网络图片地址";
      };
    };
    AlertDialog.Builder(activity)
    .setTitle("更换壁纸")
    .setView(loadlayout(gg_lay))
    .setPositiveButton("取网络图",{onClick=function(v) 
        dialog = ProgressDialog.show(this, "提示", "正在从你提供的地址下载图片") 
        Http.download(gg_t.Text,"/sdcard/.Dabai2017/cht_wp.png",cookie,header,function() 
          wallpaperManager.setBitmap(loadbitmap("/sdcard/.Dabai2017/cht_wp.png"))
          dialog.dismiss()
          alert("下载并设置成功")
          --设置壁纸   
        end)




      end})
    .setNeutralButton("取本地图",{onClick=function(v)
        --本地图
        import "android.content.Intent"
        local intent= Intent(Intent.ACTION_PICK)
        intent.setType("image/*")
        this.startActivityForResult(intent, 1)
        -------

        --回调
        function onActivityResult(requestCode,resultCode,intent)
          if intent then
            local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
            cursor.moveToFirst()
            import "android.provider.MediaStore"
            local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
            fileSrc = cursor.getString(idx)
            wallpaperManager.setBitmap(loadbitmap(fileSrc))
            alert("设置成功")
          end
        end 
        --本地图END 
      end})
    .show()

  end 




  bz_2.onClick = function()

    AlertDialog.Builder(this)
    .setTitle("清除壁纸")
    .setMessage("确定清除当然壁纸嘛，会恢复默认壁纸的哦")
    .setPositiveButton("确定",{onClick=function(v)
        wallpaperManager.clear()
        alert("清除壁纸成功")
      end})
    .show()

  end 


  bz_3.onClick = function()

    dialog = ProgressDialog.show(this, "提示", "正在获取当前壁纸并保存") 
    task(200,function()
      wall = wallpaperManager.getBitmap() 
      print(wall)
      ran = tostring(math.random(1,100))
      SavePicture("/storage/emulated/0/wallpaper_"..ran..".png",wall)
      dialog.dismiss()
      alert("已经保存壁纸到sdcard/wallpaper_"..ran..".png")
    end)

  end
end




gapps.onClick = function()

  gpac = "com.xiaochen.GoogleTool"
  if pcall(function() activity.getPackageManager().getPackageInfo(gpac,0) end) then 
    import "android.content.Intent"
    import "android.content.pm.PackageManager"
    manager = activity.getPackageManager()
    open = manager.getLaunchIntentForPackage(gpac)
    this.startActivity(open)


  else




      AlertDialog.Builder(this)
    .setTitle("下载")
    .setMessage("食用Google Apps管理器需要下载插件\n消耗大概300kb流量，是否继续？")
    .setPositiveButton("确定",{onClick=function(v)

import "android.content.Intent"
import "android.net.Uri"
url="https://www.coolapk.com/apk/com.xiaochen.GoogleTool"
viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
activity.startActivity(viewIntent)
        

      end})
    .show() 

  end


end





dhl.onClick = function()

  AlertDialog.Builder(this)
  .setTitle("导航栏控制")
  .setMessage("是否打开底部导航栏,需要busybox工具箱的支持")
  .setPositiveButton("打开",{onClick=function(v) 
      su("busybox mount -o rw,remount /system")
      su("echo qemu.hw.mainkeys=0 >> /system/build.prop")

    end})
  .setNeutralButton("关闭",{onClick=function(v)
      su("busybox mount -o rw,remount /system")
      su("echo qemu.hw.mainkeys=1 >> /system/build.prop")

    end})
  .show()



end
