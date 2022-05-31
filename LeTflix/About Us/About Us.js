var countMore=0;
$(function(){
    $('#hamburger-menu').click(() => {
        $('#hamburger-menu').toggleClass('active')
        $('#nav-menu').toggleClass('active')
    });
    $(".content-1 h2").hide();
    $(".content-1 #logo").hide();
    setTimeout(function(){
        $(".content-1 #logo").slideDown(1500);
        $(".content-1 h2").slideDown(1500);
    },500);
    $("#text-1").hide();
    $("#text-2").hide();
    $("#text-3").hide();
    $("#text-4").hide();
    $("#text-5").hide();
    
    $("#content-des-title-1, #btn-1").click(function(){
        $("#text-1").slideToggle();
    });
    $("#content-des-title-2, #btn-2").click(function(){
        $("#text-2").slideToggle();
    });
    $("#content-des-title-3, #btn-3").click(function(){
        $("#text-3").slideToggle();
    });
    var idx=2;
    var translation = (idx-1)* -80;
    $("#content-des-title-4, #btn-4").click(function(){
        $("#text-4").slideToggle();
        $(".slide img").css({
            "transform":"translateX(" + translation + "vw)",
            "transition":"none"
        });
        var i;
        for(i=1;i<3;i++){
            setTimeout(function(){
                idx++;
                translation = (idx-1)* -80;
                $(".slide img").css({
                    "transform":"translateX(" + translation + "vw)",
                    "transition":"1s"
                });
                if(idx==5){
                    setTimeout(function(){
                        idx=2;
                        translation = (idx-1)* -80;
                        $(".slide img").css({
                            "transform":"translateX(" + translation + "vw)",
                            "transition":"none"
                        });
                    },1000);
                }
            },5000*i);
        }
    });
    
    
    $("#right-arw").click(function(){
        if(idx<5){
            idx++;
            translation = (idx-1)* -80;
            $(".slide img").css({
                "transform":"translateX(" + translation + "vw)",
                "transition":"1s"
            });
        }
        else{
            return;
        }
        console.log(idx);
        if(idx==5){
            setTimeout(function(){
                idx=2;
                translation = (idx-1)* -80;
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
            translation = (idx-1)* -80;
            $(".slide img").css({
                "transform":"translateX(" + translation + "vw)",
                "transition":"1s"
            });
        }
        else{
            return;
        }
        console.log(idx);
        if(idx==1){
            setTimeout(function(){
                idx=4;
                translation = (idx-1)* -80;
                $(".slide img").css({
                    "transform":"translateX(" + translation + "vw)",
                    "transition":"none"
                });
            },1000);
        }

    });
    $("#content-des-title-5, #btn-5").click(function(){
        $("#text-5").slideToggle();
    });
});