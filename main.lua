require "import"
import "android.graphics.drawable.ColorDrawable"
import "java.util.logging.Formatter"
import "java.util.Formatter"
import "android.text.format.Formatter"
import "android.os.*"
import "android.widget.*"
import "layout"
import "func_mod"
import "Snackbar"


task(500,function()
  Runtime.getRuntime().exec("su")
end)

function 读(路径) 
  du = io.open(路径):read("*a")
  return du
end 





activity.setContentView(loadlayout(layout))
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF3F51B5);







import "java.io.File"--导入File类
oo = File("/storage/emulated/0/.Dabai2017/mht_color_top.txt").exists()

if oo == true then 

  top_c = 读("/storage/emulated/0/.Dabai2017/mht_color_top.txt")

  colo.setBackgroundDrawable(ColorDrawable(tointeger(top_c)))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(tointeger(top_c));


else

              argbc = 0xFF3F51B5
              写入文件("/storage/emulated/0/.Dabai2017/mht_color_top.txt",argbc)
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);

end



xiaotitle()
buttonclick()





function cir(circolor,yj)

  --左圆角
  CircleButton(left_1,circolor,yj)
  CircleButton(left_2,circolor,yj)
  CircleButton(left_3,circolor,yj)
  CircleButton(left_4,circolor,yj)
  CircleButton(left_5,circolor,yj)
  CircleButton(left_6,circolor,yj)
  CircleButton(left_7,circolor,yj)
  CircleButton(left_8,circolor,yj)
  CircleButton(left_9,circolor,yj)

  --右圆角
  CircleButton(right_1,circolor,yj)
  CircleButton(right_2,circolor,yj)
  CircleButton(right_3,circolor,yj)
  CircleButton(right_4,circolor,yj)
  CircleButton(right_5,circolor,yj)
  CircleButton(right_6,circolor,yj)
  CircleButton(right_7,circolor,yj)
  CircleButton(right_8,circolor,yj)
  CircleButton(right_9,circolor,yj)


end

cir(0xFFFFFFFF,20)


cht.onLongClick = function()

  argbc = 0xFF000000
  io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
  colo.setBackgroundDrawable(ColorDrawable(argbc))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);
  Snackbar.make(colo,"你发现了新大陆哦",Snackbar.LENGTH_SHORT).show();


end



cht.onClick = function()


  local lista={"主题颜色","关于"}
  local listalert=AlertDialog.Builder(this)

  .setItems(lista,DialogInterface.OnClickListener{

    onClick=function(v,l)
      l=tonumber(l)+1


      if lista[l] == "主题颜色" then

        --主题颜色开始

        local lista={"红","橙","黄","绿","青","蓝","紫"}
        local listalert=AlertDialog.Builder(this)

        .setItems(lista,DialogInterface.OnClickListener{

          onClick=function(v,l)
            l=tonumber(l)+1


            if lista[l] == "红" then

              argbc = 0xFFE91E63
              io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);


            elseif lista[l] == "橙" then

              argbc = 0xFFFF9800
              io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);


            elseif lista[l] == "黄" then

              argbc = 0xFFFDD835
              io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);



            elseif lista[l] == "绿" then


              argbc = 0xFF4CAF50
              io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);

            elseif lista[l] == "青" then

              argbc = 0xFF00BCD4
              io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);




            elseif lista[l] == "蓝" then

              argbc = 0xFF3F51B5
              io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);

            elseif lista[l] == "紫" then


              argbc = 0xFF673AB7
              io.open("/storage/emulated/0/.Dabai2017/mht_color_top.txt","w"):write(argbc):close()
              colo.setBackgroundDrawable(ColorDrawable(argbc))
              activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(argbc);


            end





          end}) 
        listalert.show()



        --主题颜色结束

      elseif lista[l] == "关于" then


        if busy == 1 then
          busyi = "busybox:已安装"
        else
          busyi = "busybox:未安装"
        end


        about = {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="vertical";
          {
            TextView;
            textColor="#000000";
            text="关于应用";
            layout_margin="10dp";
          };
          {
            ImageView;
            src="icon.png";
            layout_gravity="center";
          };
          {
            TextView;
            layout_marginTop="5dp";
            text="彩虹糖";
            layout_gravity="center";
          };
          {
            TextView;
            layout_marginTop="5dp";
            text="2.1(没啥大更新)";
            layout_gravity="center";
          };
          {
            TextView;
            layout_marginTop="5dp";
            text="busybox检测中...";
            id="busy_jc";
            layout_gravity="center";
          };
          {
            TextView;
            textColor="#000000";
            text="功能介绍";
            layout_margin="10dp";
          };
          {
            ScrollView;
            layout_width="fill";
            layout_height="fill";
            {
              TextView;
              layout_marginTop="5dp";
              text=[[
    1、设备信息:
    查看内存信息、储存信息、CPU序列号信息、MAC地址、Build信息
    2、开发者设置:
    快捷开启布局边界、CPU过度绘制和呈现模式分析
    3、大小写转换:
    字符串里所有大小写的转换
    4、系统速度调控:
    调节系统动画速度-时间越短,动画越短
    5、SELinux开关:
    安卓可以更好的对应用程序数据和系统日志进行访问控制。
    这不仅减轻了恶意程序对系统的影响力
    而且保护了用户不受移动设备上隐藏的恶意代码所攻击。
    6、文本操作:
    (1)字符串替换: 我也不知道怎么解释了
    (2)文本取中间:这个也没办法说明啊
    7、图片网络化:
    把本地图片上传到网络,可以把链接拿来用.或者给别人看
    8、Doze模式:
    这个模式是Android6.0新加的.具体介绍在<Doze关于>里
    9、物理键灯光:
    可以把手机的键盘灯关掉
    10、修改UI界面:
    (1)修改DPI密度
    (2)修改分辨率
    长按软件背景重置
    11、查看WiFi密码:
    查看本机连接过得所有WiFi的密码和各种参数,长按可以复制
    12、刷新网络:
    可以把WiFi和流量同时重启
    13、清除系统log:
    其实就是用Shell命令把系统日志删除掉
    14、高级重启:
    (1)普通重启,没有动画的那种冷重启
    (2)REC,重启到REC模式可以刷机喽
    (3)Fastboot,线刷模式
    15、文件读写权限:
    修改文件读写权限,可以选择只读或可读写
    16、多窗口模式:
    这个功能大部分机型都被删了吧,华为系列应该可以,开启后打开多任务,
    会多出来一个图标
    17、机型修改:
    把机型改成vivo X20
    后续打算加入很多机型
    
    更多功能:
    1、帮你百度一下:
    生成一个帮你百度一下的链接,可以自己试试
    2、生成空文件:
    生成指定大小的空文件,太大会卡.
    3、安装包操作:
    可以查看指定安装包信息,功能未完善
    4、消息卡屏:
    发送一串不明符号到QQ或者微信就会卡住对方,你自己小心哦.
    5、电池操作:
    (1)可以查看电池参数
    (2)可以修改充电状态 ~ 嘿嘿嘿
    (3)可以修改成指定电量
    6、运行Shell:
    运行一句Shell,会以toast形式返回给你
    7、随机数:
    开启后会默认每100毫秒随机一次,并且复制数字
    长按背景就可以设置延迟时间
    8、图片转base64:
    这个功能可以让你把图片转化成base64字符串
    base64转图片:
    可以把base64码转成图
    9、应用管理:
    控制应用 冻结解冻
    10、Gapps:
    需要下载GoogleApps管理器来管理谷歌应用
    11、导航栏开关:
    用来打开导航栏,有些系统不支持
    ]]

            };
          };
        };





        task(2000,function()

          AlertDialog.Builder(activity)
          .setView(loadlayout(about))
          .show()
          busy_jc.setText(busyi)

        end) 


        Snackbar.make(colo,"彩虹糖 ~ 沉浸在7种颜色之中",Snackbar.LENGTH_SHORT)
        .setAction("检查更新",{
          onClick=function(v)

            alert("去酷安更新😊")
            import "android.content.Intent"
            import "android.net.Uri"
            url = "https://www.coolapk.com/apk/"..activity.getPackageName()
            viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
            activity.startActivity(viewIntent)



          end
        })
        .setActionTextColor(0xffFFEB3B)

        .show()


      end
    end
  }) 
  listalert.show()

end 



right_9.onClick = function()

  activity.newActivity("box")

end






busy = 0


import "java.io.File"--导入File类
if File("/system/xbin/busybox").exists() == false then

  Snackbar.make(colo,"busybox检测:未安装 - 正在尝试安装",Snackbar.LENGTH_SHORT).show()

  task(2000,function()

    su("cp /data/data/com.CottonCandy/files/busybox /cache/busybox")
    su("chmod 0777 /cache/busybox")
    su("/cache/busybox mount -o rw,remount /system")
    su("mount -o rw,remount /system")
    su("/cache/busybox mount -f -o remount,rw /dev/block/bootdevice/by-name/system /system")
    su("mount -f -o remount,rw /dev/block/bootdevice/by-name/system /system")
    su("cp /cache/busybox /system/xbin/busybox")
    su("chmod 0777 /system/xbin/busybox") 



    if File("/system/xbin/busybox").exists() == false then
      alert("busybox安装失败")
    else
      alert("busybox安装成功")
    end




  end) 



else

  busy = 1


end









ver = "2.1"
title = ver.."版本 - 版本更新"
message = [[

*新增base64转图片
*新增Gapps管理
*新增导航栏开关

修复了一些已知bug
gapps解析失败是下载失败。
手动下就好了



]]



import "java.io.File"--导入File类
if File("/sdcard/.Dabai2017/cht_ver.txt").exists() == false then

  写入文件("/sdcard/.Dabai2017/cht_ver.txt",ver)


  AlertDialog.Builder(this)
  .setTitle(title)
  .setMessage(message)
  .show()


  写入文件("/sdcard/.Dabai2017/cht_ver.txt",ver)

else




  if tonumber(io.open("/sdcard/.Dabai2017/cht_ver.txt"):read("*a")) < tonumber(ver) then

    AlertDialog.Builder(this)
    .setTitle(title)
    .setMessage(message)
    .show()

    写入文件("/sdcard/.Dabai2017/cht_ver.txt",ver)


  else


  end



end




right_5.onLongClick = function()
  dialog = ProgressDialog.show(this, "提示", "正在恢复默认分辨率和DPI")
  task(500,function()
    su("wm size reset")
    su("wm density reset")
    dialog.hide()
  end)

end

