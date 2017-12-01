(function($){
$.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _btnLeft = $("#"+ opt.left);//Shawphy:向上按钮
                var _btnRight = $("#"+ opt.right);//Shawphy:向下按钮
                var timerID;
                var _this=this.eq(0).find("ul:first");
                var lineH=_this.find("li:first").width(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.width()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,10):500; //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer //?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                var scrollUp=function(){
                        _btnLeft.unbind("click",scrollUp); //Shawphy:取消向左按钮的函数绑定
                        _this.animate({
                                marginLeft:-upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:last").prependTo(_this);
                                }
                                _this.css({marginLeft:0});
                                _btnLeft.bind("click",scrollUp); //Shawphy:绑定向左按钮的点击事件
                        });

                }
                //Shawphy:向右翻页函数
                var scrollDown=function(){
                        _btnRight.unbind("click",scrollDown);
                        for(i=1;i<=line;i++){
                                _this.find("li:first").show().appendTo(_this);
                        }
                        _this.css({marginLeft:-upHeight});
                        _this.animate({
                                marginLeft:0
                        },speed,function(){
                                _btnRight.bind("click",scrollDown);
                        });
                }
               //Shawphy:自动播放
                var autoPlay = function(){
                        if(timer)timerID = window.setInterval(scrollDown,timer);
                };
                var autoStop = function(){
                        if(timer)window.clearInterval(timerID);
                };
                 //鼠标事件绑定
                _this.hover(autoStop,autoPlay).mouseout();
                _btnLeft.css("cursor","pointer").click( scrollUp ).hover(autoStop,autoPlay);//Shawphy:向上向下鼠标事件绑定
                _btnRight.css("cursor","pointer").click( scrollDown ).hover(autoStop,autoPlay);

        }       
})
})(jQuery);