// JavaScript Document
// $(function(){
//
// });

var lottery={
    index:0,	//当前转动到哪个位置
    count:9,	//总共有多少个位置
    timer:0,	//setTimeout的ID，用clearTimeout清除
    speed:200,	//初始转动速度
    times:0,	//转动次数
    cycle:21,	//转动基本次数：即至少需要转动多少次再进入抽奖环节
    prize:4,	//中奖位置
    init:function(id){
        if ($("#"+id).find(".lottery-unit").length>0) {
            $lottery = $("#"+id);
            $units = $lottery.find(".lottery-unit");
            this.obj = $lottery;
            this.count = $units.length;
            $lottery.find(".lottery-unit-"+this.index).addClass("active");
        };
    },
    roll:function(){
        var index = this.index;
        var count = this.count;
        var lottery = this.obj;
        $(lottery).find(".lottery-unit-"+index).removeClass("active");
        index += 1;
        if (index>count){
            index = 0;
        };
        $(lottery).find(".lottery-unit-"+index).addClass("active");
        this.index=index;
        return false;
    },
    stop:function(index){
        this.prize=index;
        return false;
    }
};

function roll(){
    lottery.times += 1;
    lottery.roll();
    if (lottery.times > lottery.cycle+10 && lottery.prize==lottery.index) {
        var url = window.location.host;
        $('#giftname').html(p);
        $('#giftimg').attr('src','http://'+url+'/static/lottery/images/'+n+'.png');
        showgiftbox();
        //alert(lottery.prize+' / '+lottery.index);
        clearTimeout(lottery.timer);
        //lottery.prize=4;
        lottery.times=0;
        click=false;
    }else{
        if (lottery.times<lottery.cycle) {
            lottery.speed -= 10;
        }else if(lottery.times==lottery.cycle) {
            //var index = Math.random()*(lottery.count)|0;
            //lottery.prize = index;
        }else{
            if (lottery.times > lottery.cycle+10 && ((lottery.prize==0 && lottery.index==7) || lottery.prize==lottery.index+1)) {
                lottery.speed += 110;
            }else{
                lottery.speed += 20;
            }
        }
        if (lottery.speed<40) {
            lottery.speed=40;
        };
        //console.log(lottery.times+'^^^^^^'+lottery.speed+'^^^^^^^'+lottery.prize);
        lottery.timer = setTimeout(roll,lottery.speed);
    }
    return false;
}
var click = false;
var n = 8;
var p = '';
$(function(){
    $('#start').click(function(){
        if(click){ return false; }
        $.ajax({
            url : "lottery/begin",
            type : "POST",
            error : function(){
                layer.msg('数据出错 请稍后再试');
            },
            success : function(res){
                var dataObj=eval("("+res+")");//转换为json对象
                var a = dataObj.angle;
                p = dataObj.prize;
                n = dataObj.id;
                var s = dataObj.stoped;
                lottery.init('lottery');
                lottery.speed=100;
                lottery.prize=s;
                click=true;
                roll();
            }
        });
    });

    $('.getgift').click(function(){
        if($(this).hasClass('notread')){
            $(this).removeClass('notread');
            $('.giftfm').removeClass('hidden');
        }else{
            hidegiftbox();
        }
    });
    //关闭
    $('.closegift').click(function(){
        hidegiftbox();
    });
    //规则
    $('.showrolebox').click(function(){
        showrolebox();
    });
    $('.closerolebox').click(function(){
        hiderolebox();
    });
});
function showgiftbox(){
    $('.giftfm').addClass('hidden');
    $('.getgift').addClass('notread');
    $('.cover').fadeIn(500,function(){
        $('.giftout,.giftbg,.giftclose').show();
    });
}
function hidegiftbox(){
    $('.giftout,.giftbg,.giftclose').hide(function(){
        $('.cover').fadeOut();
    });
}
function showrolebox(){
    $('.cover').fadeIn();
    $('.rolebox').show();
}
function hiderolebox(){
    $('.rolebox').hide(function(){
        $('.cover').fadeOut();
    });
}