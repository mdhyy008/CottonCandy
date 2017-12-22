require "import"
import "android.content.*"

import "android.app.ProgressDialog"


import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "su"

--弹窗方法


function alert(view)


  AlertView = {
    LinearLayout;
    layout_height="fill";
    layout_width="fill";
    orientation="vertical";
    {
      CardView;
      layout_width="-1";
      BackgroundColor="#000000";
      {
        TextView;
        textColor="#ffffff";
        textSize="17sp";
        text=view;
        layout_margin="5dp";
        layout_gravity="center";
      };
    };
  };



  Toast.makeText(activity,view,Toast.LENGTH_SHORT).setView(loadlayout(AlertView)).show()



end

--end




function 读(路径) 
  du = io.open(路径):read("*a")
  return du
end 


function 写入文件(路径,内容)
  import "java.io.File"
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end


function xiaotitle()


  --获取手机内置剩余存储空间
  function GetSurplusSpace()
    fs = StatFs(Environment.getDataDirectory().getPath())
    return Formatter.formatFileSize(activity, (fs.getAvailableBytes()))
  end

  --获取手机内置存储总空间
  function GetTotalSpace()
    path = Environment.getExternalStorageDirectory()
    stat = StatFs(path.getPath())
    blockSize = stat.getBlockSize()
    totalBlocks = stat.getBlockCount()
    return Formatter.formatFileSize(activity, blockSize * totalBlocks)

  end

  chucun.setText("可用:"..GetSurplusSpace().."/总储存:"..GetTotalSpace())


end





--控件圆角方法

function CircleButton(view,InsideColor,radiu)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable() 
  drawable.setShape(GradientDrawable.RECTANGLE) 
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu});
  view.setBackgroundDrawable(drawable)
end



--END




--主界面按钮单击事件

function buttonclick()




  right_4.onClick = function()




    local lista={"进入Doze模式","退出Doze模式","关于Doze模式"}
    local listalert=AlertDialog.Builder(this)

    .setItems(lista,DialogInterface.OnClickListener{ 
      onClick=function(v,l)
        l=tonumber(l)+1


        if lista[l] == "进入Doze模式" then
          os.execute("su -c command dumpsys deviceidle force-idle")
        elseif lista[l] == "退出Doze模式" then
          os.execute("su -c command dumpsys deviceidle step")
        elseif lista[l] == "关于Doze模式" then

          wlis = su("dumpsys deviceidle whitelist")
          abo = [[
  1.
  从Android6.0开始，Android提供了两种省电延长电池寿命的功能：Doze和App Standby
  当设备没有连接到电源，设备进入Doze模式时
  系统将通过延迟最近用户没有使用的应用程序的后台CPU运作及网络活动让应用程序处于App Standby状态，以此来减少电池消耗。
  2.
  系统要求：Android6.0（API 23）及其更高版本
  3.
  设备进入Doze睡眠模式时机：
  用户不操作设备一段时间
  屏幕关闭
  设备未连接电源充电
  4.
  Doze模式的五种状态，分别如下：
  ACTIVE：手机设备处于激活活动状态
  INACTIVE：屏幕关闭进入非活动状态
  IDLE_PENDING：每隔30分钟让App进入等待空闲预备状态
  IDLE：空闲状态
  IDLE_MAINTENANCE：处理挂起任务
    
  *当然，有些东西不受Doze影响
  --下面就是当前设备白名单列表：
  
    ]]

          about = abo..wlis

          abou = AlertDialog.Builder(this)
          .setTitle("Doze模式(打盹模式)介绍")
          .setMessage(about) 
          .show() 







        end

      end


    })

    listalert.show()

  end 













  root_k = {
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    orientation="vertical";
    {
      CardView;
      layout_width="fill";
      layout_height="50dp";
      CardElevation="0dp";
      layout_margin="10dp";


      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        {
          TextView;
          textSize="17sp";
          layout_marginLeft="10dp";
          text="显示布局边界";
          layout_gravity="center";
          textColor="#000000";
        };
      };
      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        gravity="right";
        {
          Switch;
          layout_gravity="center";
          layout_marginRight="10dp";
          id="root_1";
        };
      };
    };
    {
      CardView;
      layout_width="fill";
      layout_height="50dp";
      CardElevation="0dp";
      layout_margin="10dp";
      id="root_2";

      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        {
          TextView;
          textSize="17sp";
          layout_marginLeft="10dp";
          text="CPU过度绘制区域";
          layout_gravity="center";
          textColor="#000000";
        };
      };
    };
    {
      CardView;
      layout_width="fill";
      layout_height="50dp";
      CardElevation="0dp";
      layout_margin="10dp";
      id="root_3";

      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        {
          TextView;
          textSize="17sp";
          layout_marginLeft="10dp";
          text="CPU呈现模式分析";
          layout_gravity="center";
          textColor="#000000";
        };
      };
    };

  };





  right_8.onClick = function()

    AlertDialog.Builder(this)
    .setTitle("多窗口模式")
    .setMessage("已知支持机型:\n\n1.华为手机\n2.一加3")
    .setPositiveButton("开启",{onClick=function(v) 
        su("settings put global enable_freeform_support 1")
        os.execute("su -c command settings put global enable_freeform_support 1")
        alert("重启生效")
      end})
    .setNeutralButton("关闭",{onClick=function(v) 
        su("settings put global enable_freeform_support 0")
        os.execute("su -c command settings put global enable_freeform_support 0")
        alert("重启生效")

      end})
    .show()



  end





  left_9.onClick = function()


    AlertDialog.Builder(this)
    .setTitle("机型修改")
    .setMessage("*如果改完之后想改回来的同学,一开始就不要改了\n恢复机型会出现很大bug\n\n修改手机型号为vivo X20\n\n好处:\n1.王者荣耀高帧率\n2.可以去装逼了\n\n坏处:\n1.不能获取官方OTG更新\n2.部分软件由于型号不同不能用")

    .setPositiveButton("确认",{onClick=function(v) 



        model_q = su("getprop ro.product.model")
        brand_q = su("getprop ro.product.brand")
        name_q = su("getprop ro.product.name")
        device_q = su("getprop ro.product.device")
        manufacturer_q = su("getprop ro.product.manufacturer")
        product_q = su("getprop ro.build.product")

        -- print(model_q.."\n"..brand_q.."\n"..name_q.."\n"..device_q.."\n"..manufacturer_q.."\n"..product_q) 

        bu_q = su("cat /system/build.prop")

        bu_h1 = string.gsub(bu_q,model_q,"vivo X20")
        bu_h2 = string.gsub(bu_h1,brand_q,"vivo")
        bu_h3 = string.gsub(bu_h2,name_q,"X20")
        bu_h4 = string.gsub(bu_h3,device_q,"X20")
        bu_h5 = string.gsub(bu_h4,manufacturer_q,"vivo")
        bu_h6 = string.gsub(bu_h5,product_q,"X20")
        io.open("/sdcard/build.backup","w"):write(bu_h6):close() 

        su("busybox mount -o remount,rw /system")
        su("chmod 777 /system")
        su("chmod 777 /system/build.prop")
        su("cp /system/build.prop /system/build.bak.prop")
        su("cp /sdcard/build.backup /system/build.prop") 
        su("chmod 644 /system/build.prop") 
        su("reboot")



      end})
    .show()



  end







  right_1.onClick = function()

    aler = AlertDialog.Builder(activity)
    -- .setCancelable(false)
    .setTitle("开发者设置(root)")
    .setView(loadlayout(root_k))
    -- .setPositiveButton("积极",{onClick=function(v) print"点击了积极按钮"end})
    ale = aler.show()

    if su("getprop debug.layout") == "true" then

      root_1.setChecked(true)

    end

    --sw监听
    root_1.setOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener{

      onCheckedChanged=function(p1,p2)
        local dd = p1.isChecked()
        if dd == true then

          su("setprop debug.layout true")

        else

          su("setprop debug.layout false")
        end

      end
    })
    --监听结束




    root_2.onClick = function()

      local lista={"关闭","显示过度绘制区域","显示适合绿色弱视患者查看的区域"}
      local listalert=AlertDialog.Builder(this)

      .setItems(lista,DialogInterface.OnClickListener{ 
        onClick=function(v,l)
          l=tonumber(l)+1


          if lista[l] == "关闭" then
            os.execute("su -c command setprop debug.hwui.overdraw false")
          elseif lista[l] == "显示过度绘制区域" then
            os.execute("su -c command setprop debug.hwui.overdraw show")
          elseif lista[l] == "显示适合绿色弱视患者查看的区域" then
            os.execute("su -c command setprop debug.hwui.overdraw show_deuteranomaly") 
          end

        end


      })




      listalert.show()

    end 






    root_3.onClick = function()

      local lista={"关闭","在屏幕上显示为条形图","在 adb shell dumpsys gfxinfo 中"}
      local listalert=AlertDialog.Builder(this)

      .setItems(lista,DialogInterface.OnClickListener{ 
        onClick=function(v,l)
          l=tonumber(l)+1


          if lista[l] == "关闭" then
            os.execute("su -c command setprop debug.hwui.profile false")
          elseif lista[l] == "在屏幕上显示为条形图" then
            os.execute("su -c command setprop debug.hwui.profile visual_bars")
          elseif lista[l] == "在 adb shell dumpsys gfxinfo 中" then
            os.execute("setprop debug.hwui.profile true") 
          end

        end


      })

      listalert.show()

    end 











  end



















  left_4.onClick = function()

    import "bmob"
    bmobapi=bmob("c7f58fcd00d1f14901d44bdcbfe0f2d4","4c5eba422d9f6d251662adbed1b9b2de")


    import "android.content.Intent"
    local intent= Intent(Intent.ACTION_PICK)
    intent.setType("image/*")
    this.startActivityForResult(intent, 1)

    --回调
    function onActivityResult(requestCode,resultCode,intent)
      if intent then
        local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
        cursor.moveToFirst()
        import "android.provider.MediaStore"
        local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
        fileSrc = cursor.getString(idx)

        pro = ProgressDialog.show(this, "提示", "正在上传图片...").show()

        bmobapi:upload(fileSrc,function(co,js)
          print(co)
          pro.hide() 

          AlertDialog.Builder(this)
          .setTitle("上传完成")
          .setMessage(js.url)
          .setPositiveButton("复制url",{onClick=function(v) 

              import "android.content.*" 
              activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(js.url) 
              --默认Toast
              Toast.makeText(activity, "图片链接已复制",Toast.LENGTH_SHORT).show() 

            end})
          .show() 

        end)

      end
    end 
  end



  left_5.onClick = function()

    AlertDialog.Builder(this)

    .setMessage("可以关闭物理键LED\n部分机型可能不支持")
    .setPositiveButton("关闭",{onClick=function(v)

        su("echo 0 > /sys/class/leds/button-backlight/brightness")
        su("echo 0 > /sys/class/leds/button-backlight1/brightness")

      end})
    .setNegativeButton("开启",{onClick=function(v)

        su("echo 1 > /sys/class/leds/button-backlight/brightness")
        su("echo 1 > /sys/class/leds/button-backlight1/brightness")


      end})
    .show()




  end


  left_6.onClick = function()


    layout1 = {
      LinearLayout;
      layout_width="fill";
      orientation="vertical";
      layout_height="fill";
      {
        ListView;
        id="lista";
      };
    };





    item={
      LinearLayout;
      layout_width="fill";
      orientation="vertical";
      layout_height="fill";
      {
        TextView;
        text="WIFI密码加载中...";
        layout_width="fill";
        id="name";
        TextColor="#000000";
        textSize="17sp";

      };
    };

    datkl={} 
    adp=LuaAdapter(activity,datkl,item) 
    txt=su("cat /data/misc/wifi/wpa_supplicant.conf")

    for i in txt:gmatch("network={(.-)id_str") do 
      table.insert(datkl,{name=i:gsub("ssid=","SSID："):gsub("psk=","密码："):gsub("key_mgmt=","加密类型："):gsub("priority=","优先级："):gsub("\"","")})
    end

    AlertDialog.Builder(activity)
    .setView(loadlayout(layout1))
    .show()

    lista.Adapter=adp
    lista.onItemLongClick=function(parent, v, pos,id)
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(v.Tag.name.Text)
    end

  end



  left_1.onClick = function()


    dialog = ProgressDialog.show(this, "提示", "正在获取设备信息")


    task(500,function()

      local xinxi1 = su("cat /system/build.prop")
      local xinxi2 = su("cat /sys/class/net/wlan0/address")
      local xinxi3 = su("cat /proc/cpuinfo")
      local xinxi4 = su("cat /proc/meminfo")
      local xinxi5 = su("df")

      AlertDialog.Builder(this)
      .setMessage("\n\n内存信息---------------------\n\n\n\n"..xinxi4.."\n\n\n\n\n\n\n\n\n\n储存信息---------------------\n\n\n\n"..xinxi5.."\n\n\n\n\n\n\n\n\n\nCPU序列号---------------------\n\n"..xinxi3.."\n\n\n\n\n\n\n\n\n\nMAC地址---------------------\n\n"..xinxi2.."\n\n\n\n\n\n\n\n\n\nbuild信息---------------------\n"..xinxi1)
      .show()
      dialog.hide() 
    end) 


  end





  left_2.onClick = function()

    lay_super = {
      LinearLayout;
      layout_height="fill";
      orientation="vertical";
      layout_width="fill";
      {
        EditText;
        layout_width="fill";
        layout_marginTop="10dp";
        id="super";
        hint="字符串输入";
      };
    };


    AlertDialog.Builder(this)
    .setTitle("大小写转换")
    .setView(loadlayout(lay_super))
    .setPositiveButton("大写",{onClick=function(v) 

        local sup = super.getText().toString()

        local sur = string.upper(sup)





        AlertDialog.Builder(this)


        .setTitle("输出结果")
        .setMessage(sur)
        .setPositiveButton("复制",{onClick=function(v)

            import "android.content.*" 
            activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(sur)
            alert("复制成功") 
          end})

        .show()







      end})

    .setNegativeButton("小写",{onClick=function(v)

        local sup = super.getText().toString()
        local sur = string.lower(sup)

        AlertDialog.Builder(this)
        .setTitle("输出结果")
        .setMessage(sur)
        .setPositiveButton("复制",{onClick=function(v)
            import "android.content.*" 
            activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(sur)
            alert("复制完成") 

          end})

        .show()




      end})
    .show()
  end




  left_8.onClick = function()

    fi = {
      LinearLayout;
      orientation="vertical";
      layout_height="fill";
      layout_width="fill";
      {
        EditText;
        layout_width="fill";
        layout_margin="10dp";
        error="chmod命令来修改文件读写权";
        hint="文件绝对地址";
        id="ch_t";
        layout_marginTop="10dp";
      };
      {
        LinearLayout;
        orientation="horizontal";
        layout_width="fill";
        layout_marginTop="20dp";
        {
          Button;
          text="可读写";
          BackgroundColor="#E91E63";
          TextColor="#ffffff";
          layout_width="40%w";
          id="ch_b1";
        };
        {
          Button;
          text="只读";
          layout_width="50%w";
          BackgroundColor="#E91E63";
          TextColor="#ffffff";
          id="ch_b2";
        };
      };
    };


    AlertDialog.Builder(this)
    .setView(loadlayout(fi))
    .show() 



    ch_b1.onClick = function()

      su("chmod 777 "..ch_t.Text)

      alert("完成")
    end

    ch_b2.onClick = function()

      su("chmod 444 "..ch_t.Text)
      alert("完成")
    end







  end








  right_7.onClick = function()


    --单选对话框
    单选列表={"重启","Rec模式","fastboot模式","重启UI"}
    local 单选对话框=AlertDialog.Builder(this)
    .setTitle("高级电源")
    .setSingleChoiceItems(单选列表,-1,DialogInterface.OnClickListener{
      onClick=function(v,l)
        l=tonumber(l)+1
        print("点击了:"..单选列表[l])
        if 单选列表[l] == "重启" then
          su("reboot") 
        elseif 单选列表[l] == "Rec模式" then 
          su("reboot recovery") 
        elseif 单选列表[l] == "fastboot模式" then
          su("reboot bootloader") 
        elseif 单选列表[l] == "重启UI" then
          su("busybox killall com.android.systemui")
        end 
      end
    })
    单选对话框.show();







  end


  right_6.onClick = function()


    AlertDialog.Builder(this)

    .setMessage("重启WiFi和移动数据模块")
    .setPositiveButton("重启",{onClick=function(v)

        dialog = ProgressDialog.show(this, "提示", "正在刷新WiFi和数据")

        task(100,function()
          os.execute("su -c command svc data disable")
          os.execute("su -c command svc wifi disable")
          os.execute("su -c command svc data enable")
          os.execute("su -c command svc wifi enable") 
          dialog.hide() 
        end)


      end})
    .show()
  end



  left_7.onClick = function()

    AlertDialog.Builder(this)
    .setMessage("执行shell命令来清除日志")
    .setPositiveButton("清除",{onClick=function(v)

        su("logcat -c")

      end})
    .show()

  end




  right_5.onClick = function()

    dialog = ProgressDialog.show(this, "提示", "正在获取当前DPI以及分辨率")



    lay_dp = {
      LinearLayout;
      layout_height="fill";
      orientation="vertical";
      layout_width="fill";

      {
        TextView;
        layout_gravity="center";
        layout_width="fill";
        text="DPI";
        TextColor="#E91E63";
        layout_margin="10dp";
      };
      {
        EditText;
        layout_gravity="center";
        layout_width="fill";
        id="dpi_t";
        singleLine=true;
        InputType="number";
        hint="格式:直接写整数";

      };
      {
        Button;
        id="dpi_on";
        layout_gravity="center";
        layout_width="fill";
        text="修改";
        BackgroundColor="#E91E63";
        TextColor="#ffffff";
      };
      {
        TextView;
        layout_gravity="center";
        layout_width="fill";
        text="SIZE";
        TextColor="#E91E63";
        layout_margin="10dp";
      };
      {
        EditText;
        layout_gravity="center";
        layout_width="fill";
        id="size_t";
        singleLine=true;
        Text="1080x1920";
        hint="格式:宽x高";

      };
      {
        Button;
        id="size_on";
        layout_gravity="center";
        layout_width="fill";
        text="修改";
        BackgroundColor="#E91E63";
        TextColor="#ffffff";
      };
    };


    task(500,function()

      AlertDialog.Builder(activity)
      .setView(loadlayout(lay_dp))
      .show()

      dpi_on.onClick = function()
        su("wm density "..dpi_t.Text)
      end
      size_on.onClick = function()
        su("wm size "..size_t.Text)
      end

      dialog.hide()

      str = su("wm density")
      strs = su("wm size")

      size_t.setError("本机分辨率参数为"..strs)
      dpi_t.setError("本机DPI参数为"..str)


    end)


  end





  right_2.onClick = function()



    lay_sar = {
      LinearLayout;
      layout_width="fill";
      orientation="vertical";
      layout_height="fill";

      {
        TextView;
        textColor="#000000";
        text="设置速度为: 1.0 单位:/s";
        textSize="18sp";
        gravity="center";
        layout_marginTop="30dp";
        layout_width="fill";
        id="pro_i";
      };

      {
        SeekBar;
        layout_marginTop="30dp";
        id="seek";
        layout_width="fill";
        Progress=50;
      };

    };

    pr = 1.0


    AlertDialog.Builder(this)

    .setView(loadlayout(lay_sar))
    .setPositiveButton("设置",{onClick=function(v)

        dialog = ProgressDialog.show(this, "提示", "正在调整速度为"..pr.."倍")


        task(500,function()
          su("settings put global window_animation_scale "..pr)
          su("settings put global animator_duration_scale "..pr)
          su("settings put global transition_animation_scale "..pr) 
          alert("设置完成") 
          dialog.hide()
        end) 


      end})

    .show()







    seek.setOnSeekBarChangeListener{

      onProgressChanged=function()

        pro = seek.getProgress()
        pr = pro / 50

        pro_i.setText("设置速度为: "..pr.." 单位:/s")

      end}


  end



  left_3.onClick = function()

    AlertDialog.Builder(this)
    .setTitle("控制SELinux开启或关闭")

    .setPositiveButton("开启",{onClick=function(v)

        su("setenforce 1")

      end})
    .setNeutralButton("关闭",{onClick=function(v)


        su("setenforce 0")

      end})

    .show()

  end


  right_3.onClick = function()


    lay_t = {
      LinearLayout;
      layout_height="fill";
      layout_width="fill";
      orientation="vertical";

      {
        EditText;
        layout_width="fill";
        hint="全部文本";
        id="t_quan";
        layout_margin="10dp";
        gravity="center";
        MaxLines=3
      };
      {
        LinearLayout;
        layout_width="fill";
        gravity="center";
        layout_margin="10dp";
        {
          EditText;
          hint="替换前";
          layout_width="40%w";
          gravity="center";
          id="t_q";
          MaxLines=3
        };
        {
          TextView;
          text="替换成";
          textColor="#000000";
          textSize="20sp";

        };
        {
          EditText;
          hint="替换后";
          layout_width="40%w";
          gravity="center";
          id="t_h";
          MaxLines=3
        };

      };
      {
        Button;
        text="替换";
        id="tihuan";
        layout_width="fill";
        BackgroundColor="#E91E63";
        TextColor="#ffffff";
      };
      {
        EditText;
        layout_width="fill";
        hint="替换完毕输出";
        id="t_shu";
        layout_margin="10dp";
        gravity="center";
        MaxLines=3
      };
      {
        Button;
        text="复制结果";
        id="fzjg";
        layout_width="fill";
        BackgroundColor="#E91E63";
        TextColor="#ffffff";
      };
    };



    local dl=AlertDialog.Builder(activity)
    .setTitle("文本替换")
    .setView(loadlayout(lay_t))
    .setCancelable(false)

    .setPositiveButton("取中间",{onClick=function(v)



        lay_zj = {
          LinearLayout;
          layout_height="fill";
          layout_width="fill";
          orientation="vertical";

          {
            EditText;
            layout_width="fill";
            hint="全部文本";
            id="q_quan";
            layout_margin="10dp";
            gravity="center";
            MaxLines=3
          };
          {
            LinearLayout;
            layout_width="fill";
            gravity="center";
            layout_margin="10dp";
            {
              EditText;
              hint="前字符串";
              layout_width="40%w";
              gravity="center";
              id="q_q";
              MaxLines=3
            };

            {
              EditText;
              hint="后字符串";
              layout_width="40%w";
              gravity="center";
              id="q_h";
              MaxLines=3
            };

          };
          {
            Button;
            text="取中间";
            id="quzhongjian";
            layout_width="fill";
            BackgroundColor="#E91E63";
            TextColor="#ffffff";
          };
          {
            EditText;
            layout_width="fill";
            hint="取中间文本输出";
            id="q_shu";
            layout_margin="10dp";
            gravity="center";
            MaxLines=3
          };
          {
            Button;
            text="复制结果";
            id="fzjg_q";
            layout_width="fill";
            BackgroundColor="#E91E63";
            TextColor="#ffffff";
          };
        };



        local dll=AlertDialog.Builder(activity)
        .setTitle("取文本中间")
        .setView(loadlayout(lay_zj)) 
        .show() 



        quzhongjian.onClick = function()



          if q_quan.Text == "" then 

            alert("没有任何需要取中间的文字")

          else


            左 = q_q.Text

            右 = q_h.Text

            中=q_quan.Text:match(左.."(.-)"..右)

            q_shu.setText(中)


          end
        end



        fzjg_q.onClick = function()

          import "android.content.*" 
          activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(q_shu.Text)
          alert("复制成功") 

        end 





      end})
    .setNeutralButton("取消",nil)


    dl.show()



    function uni(内容)
      import "android.graphics.drawable.Drawable"
      import "android.graphics.PorterDuff"
      fCursorDrawableRes = TextView.getDeclaredField("mCursorDrawableRes");
      fCursorDrawableRes.setAccessible(true);
      mCursorDrawableRes = fCursorDrawableRes.getInt(内容);
      fEditor = TextView.getDeclaredField("mEditor");
      fEditor.setAccessible(true);
      editor = fEditor.get(内容);
      clazz = editor.getClass();
      fCursorDrawable = clazz.getDeclaredField("mCursorDrawable");
      fCursorDrawable.setAccessible(true);
      drawables =Drawable[1];
      drawables[0]=内容.getContext().getResources().getDrawable(mCursorDrawableRes);
      drawables[0].setColorFilter(0x80ffffff, PorterDuff.Mode.SRC_IN);
      fCursorDrawable.set(editor, drawables);
    end
    uni(t_shu)
    uni(t_q)
    uni(t_h)
    uni(t_quan)










    tihuan.onClick = function()

      th = string.gsub(t_quan.Text,t_q.Text,t_h.Text)
      t_shu.setText(th)

    end 

    fzjg.onClick = function()


      --先导入包
      import "android.content.*" 
      activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(t_shu.Text)
      alert("复制成功") 


    end



  end





end

--END



function write(路径,内容)
  import "java.io.File"
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
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










ka = [[

[QQ红包]恭喜发财，大吉大利！  






















































彩
虹
✨
💎
🍭
🍭
🍭
🍭
🍭
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍭
🍈
🔝
🍈
🔝娃哈哈矿泉水
🍭

]]
