
var countMore=0;
$(function(){
    $('#hamburger-menu').click(() => {
        $('#hamburger-menu').toggleClass('active')
        $('#nav-menu').toggleClass('active')
    })
    //content
    $("#syn1").hide();
    $("#syn2").hide();
    $("#syn3").hide();
    $("#syn4").hide();
    $("#slider-ttl").hide();
    $("#slider-btn").hide();
    setTimeout(function(){
        $("#slider-ttl").fadeIn(1000),
        $("#slider-btn").fadeIn(1000);
        $("#syn1").fadeIn(1000);
    },700);
    var idx=2;
    var translation = (idx-1)* -68;
    $(".slide img").css({
        "transform":"translateX(" + translation + "vw)",
        "transition":"none"
    });
    var i;
    for(i=1;i<4;i++){
        setTimeout(function(){
            idx++;
            translation = (idx-1)* -68;
            $(".slide img").css({
                "transform":"translateX(" + translation + "vw)",
                "transition":"1s"
            }),$("#slider-btn").fadeOut(),$(".syn").fadeOut(),
            setTimeout(function(){
                $("#slider-btn").fadeIn();
            },1000);
            setTimeout(function(){
                if(idx==6 || idx==2){
                    $("#syn1").fadeIn();
                }
                else if(idx==3){
                    $("#syn2").fadeIn();
                }
                else if(idx==4){
                    $("#syn3").fadeIn();
                }
                else if(idx==5 || idx==1){
                    $("#syn4").fadeIn();
                }
            },1000);
            if(idx==6){
                setTimeout(function(){
                    idx=2;
                    translation = (idx-1)* -68;
                    $(".slide img").css({
                        "transform":"translateX(" + translation + "vw)",
                        "transition":"none"
                    }),$("#slider-btn").fadeOut()
                    setTimeout(function(){
                        $("#slider-btn").fadeIn()
                    },1000)
                    setTimeout(function(){
                        if(idx==6 || idx==2){
                            $("#syn1").fadeIn();
                        }
                        else if(idx==3){
                            $("#syn2").fadeIn();
                        }
                        else if(idx==4){
                            $("#syn3").fadeIn();
                        }
                        else if(idx==5 || idx==1){
                            $("#syn4").fadeIn();
                        }
                    },1000);
                },1000);
            }
        },10000*i);
    }
    $("#right-arw").click(function(){
        if(idx<6){
            idx++;
            translation = (idx-1)* -68;
            $(".slide img").css({
                "transform":"translateX(" + translation + "vw)",
                "transition":"1s"
            }),$("#slider-btn").fadeOut(),$(".syn").fadeOut(),
            setTimeout(function(){
                $("#slider-btn").fadeIn();
            },1000);
            setTimeout(function(){
                if(idx==6 || idx==2){
                    $("#syn1").fadeIn();
                }
                else if(idx==3){
                    $("#syn2").fadeIn();
                }
                else if(idx==4){
                    $("#syn3").fadeIn();
                }
                else if(idx==5 || idx==1){
                    $("#syn4").fadeIn();
                }
            },1000);
        }
        else{
            return;
        }
        console.log(idx);
        if(idx==6){
            setTimeout(function(){
                idx=2;
                translation = (idx-1)* -68;
                $(".slide img").css({
                    "transform":"translateX(" + translation + "vw)",
                    "transition":"none"
                });
            },1000);
        }

    });
    $("#left-arw").click(function(){
        if(idx>1){
            idx--;
            translation = (idx-1)* -68;
            $(".slide img").css({
                "transform":"translateX(" + translation + "vw)",
                "transition":"1s"
            }),$("#slider-btn").fadeOut(),$(".syn").fadeOut(),
            setTimeout(function(){
                $("#slider-btn").fadeIn();
            },1000);
            setTimeout(function(){
                if(idx==6||idx==2){
                    $("#syn1").fadeIn();
                }
                else if(idx==3){
                    $("#syn2").fadeIn();
                }
                else if(idx==4){
                    $("#syn3").fadeIn();
                }
                else if(idx==5 || idx==1){
                    $("#syn4").fadeIn();
                }
            },1000);
        }
        else{
            return;
        }
        console.log(idx);
        if(idx==1){
            setTimeout(function(){
                idx=5;
                translation = (idx-1)* -68;
                $(".slide img").css({
                    "transform":"translateX(" + translation + "vw)",
                    "transition":"none"
                });
            },1000);
        }

    });
});