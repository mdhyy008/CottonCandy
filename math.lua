require "import"
import "com.androlua.Ticker"
import "android.graphics.drawable.ColorDrawable"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "func_mod"
import "Snackbar"
import "android.content.*" 





math_lay = {
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  id="colo";
  layout_height="fill";
  {
    TextView;
    layout_gravity="center";
    text="随机数";
    id="m_t";
    textColor="#ffffff";
    textSize="50sp";
    layout_marginTop="100dp";
  };
  {
    LinearLayout;
    layout_marginTop="170dp";
    gravity="center";
    orientation="horizontal";
    layout_width="fill";
    {
      EditText;
      BackgroundColor="#E91E63";
      textSize="22sp";
      text="1";
      id="min";
      TextColor="#ffffff";
      InputType="number";
      gravity="center";
      layout_width="50%w";
      SingleLine=true;
    };
    {
      EditText;
      BackgroundColor="#E91E63";
      textSize="22sp";
      text="999";
      id="max";
      TextColor="#ffffff";
      InputType="number";
      gravity="center";
      layout_width="50%w";
      SingleLine=true;
    };
  };
  {
    CardView;
    radius="75dp";
    CardElevation="4dp";
    layout_width="150dp";
    layout_gravity="center";
    layout_marginTop="50dp";
    layout_height="150dp";
    {
      Button;
      text="开启";
      id="m_bt";
      layout_width="fill";
      textColor="#E91E63";
      background="through";
      textSize="40sp";
      layout_height="fill";
    };
  };
};









activity.setContentView(math_lay)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF3F51B5);

import "java.io.File"--导入File类
oo = File("/storage/emulated/0/.Dabai2017/mht_color_top.txt").exists()

if oo == true then 

  top_c = 读("/storage/emulated/0/.Dabai2017/mht_color_top.txt")
  colo.setBackgroundDrawable(ColorDrawable(tointeger(top_c)))
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(tointeger(top_c));

end




Snackbar.make(colo,"生成的随机数会自动复制到剪切板",Snackbar.LENGTH_SHORT).show();






ti=Ticker()
ti.Period=100
ti.onTick=function() 
  
  ran = math.random(min.Text,max.Text)
m_t.setText(tostring(ran))

activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(tostring(ran))
    
end






m_bt.onClick = function()
  
  
  if m_bt.Text == "开启" then
    --开启
    
   
  if min.Text == "" or max.Text == "" then
    alert("最小值和最大值不能为空") 
   else
   
  
   
   if tonumber(min.Text) <= tonumber(max.Text) then
         --启动Ticker定时器
     ti.start()
 m_bt.setText("关闭")
 
 
     else

 alert("最小值不能大于最大值")
     end
   
   
   
   
   
   end
   
   
   
   

    
    
    
    
    else
    m_bt.setText("开启")
    --关闭 
    --停止Ticker定时器
ti.stop()
    
    
    end
   
  end




tim_lay = {
  LinearLayout;
  layout_width="fill";
  layout_height="fill";
  orientation="vertical";
  {
    EditText;
    layout_width="fill";
    layout_marginTop="10dp";
    id="time";
    Text="100";
    InputType="number";
    hint="间隔时间单位毫秒  根据CPU好坏调整速度";
  };
};



colo.onLongClick = function()
  
  AlertDialog.Builder(activity)
  .setTitle("随机间隔时间")
.setView(loadlayout(tim_lay))
.setPositiveButton("修改",{onClick=function(v)
 
 if time.Text == "" then
   alert("玩死循环？")
 else
 ti.Period=tonumber(time.Text)
   end
    end})

 .show()
  
  
  end
