$(document).ready(() => {
    $('#hamburger-menu').click(() => {
        $('#hamburger-menu').toggleClass('active')
        $('#nav-menu').toggleClass('active')
    })
});

var silver_chosen = 0;
var gold_chosen = 0;
var diamond_chosen = 0;
document.addEventListener("DOMContentLoaded", () => {
    $('#btn-silver').on('change', function() { 
        $('.choose-btn').not(this).prop('checked', false);
        silver_chosen = 1;
        gold_chosen = 0;
        diamond_chosen = 0;
        $('#plans-rank1').css("border", "3px solid #0B1F64")
        $('#plans-rank2').css("border", "none")
        $('#plans-rank3').css("border", "none")
    });

    $('#btn-gold').on('change', function() { 
        $('.choose-btn').not(this).prop('checked', false);
        silver_chosen = 0;
        gold_chosen = 1;
        diamond_chosen = 0;
        $('#plans-rank1').css("border", "none")
        $('#plans-rank2').css("border", "3px solid #0B1F64")
        $('#plans-rank3').css("border", "none")
    });

    $('#btn-diamond').on('change', function() { 
        $('.choose-btn').not(this).prop('checked', false);
        silver_chosen = 0;
        gold_chosen = 0;
        diamond_chosen = 1;
        $('#plans-rank1').css("border", "none")
        $('#plans-rank2').css("border", "none")
        $('#plans-rank3').css("border", "3px solid #0B1F64")
    });

    document.querySelector("#step2-btn").addEventListener("click", e =>{
        if (silver_chosen == 1){
            e.preventDefault();
            alert("Successfully Subscribed as a Silver Member!");
            window.location = "../Home/Home.html";
        } else if (gold_chosen == 1){
            e.preventDefault();
            alert("Successfully Subscribed as a Gold Member!");
            window.location = "../Home/Home.html";
        } else if (diamond_chosen == 1){
            e.preventDefault();
            alert("Successfully Subscribed as a Diamond Member!");
            window.location = "../Home/Home.html";
        } else {
            alert("You need to choose a plan!");
        }
    });
});


// document.addEventListener("DOMContentLoaded", () => {
//     document.querySelector("#step2-btn").addEventListener("click", e =>{
//     var tnc = document.querySelector("input[type='checkbox_tnc']:checked");
//     var selectSilver = 0;
//     var selectGold = 0;
//     var selectDiamond = 0;
//     var btn = document.getElementById('btn');
//     // var btn_silver = document.getElementById('btn-silver');
//     // var btn_gold = document.getElementById('btn-gold');
//     // var btn_diamond = document.getElementById('btn-diamond');
//     var btn_silver = document.querySelector("input[type='btn-silver']:checked");
//     var btn_gold = document.querySelector("input[type='btn-golc']:checked");
//     var btn_diamond = document.querySelector("input[type='btn-diamond']:checked");

//     btn_silver.onclick = choose_silver;
//     btn_gold.onclick = choose_gold;
//     btn_diamond.onclick = choose_diamond;

//     function choose_silver() {
//         e.preventDefault();
//         selectSilver = 1;
//         selectGold = 0;
//         selectDiamond = 0;
//         alert("SILVER!!");
//         btn.style.width = "100%";
//     }

//     function choose_gold() {
//         e.preventDefault();
//         selectSilver = 0;
//         selectGold = 1;
//         selectDiamond = 0;
//         alert("YO BISA GA YA!!");
//         btn.style.width = "100%";
//     }

//     function choose_diamond() {
//         e.preventDefault();
//         selectSilver = 0;
//         selectGold = 0;
//         selectDiamond = 1;
//         btn.style.width = "100%";
//     }
    
//         if(!tnc){
//             alert("You need to agree the Terms and Conditions!");
//         } if (selectSilver == 0 && selectGold == 0 && selectDiamond == 0){
//             alert("You need to choose a plan!");
//         }else if (tnc && selectSilver==1){
//             e.preventDefault();
//             alert("You are now a Silver Member!");
            // window.location = plans.html;
//         }
//         else if (tnc && selectGold==1){
//             e.preventDefault();
//             alert("You are now a Gold Member!");
//             window.location = plans.html;
//         }else if (tnc && selectDiamond==1){
//             e.preventDefault();
//             alert("You are now a Diamond Member!");
//             window.location = plans.html;
//         }
//     });
// });


// document.addEventListener("DOMContentLoaded", () => {
//     document.querySelector("#step2-btn").addEventListener("click", e =>{
//         var tnc = document.querySelector("input[type='checkbox']:checked");
//         // var selectSilver = document.querySelector('input[id="rank-names"]:checked');

//         if (!selectRank){
//             alert("You need to choose a plan!");
//         } if (!tnc){
//             alert("You need to agree the Terms and Condition!");
//         } if (tnc && selectRank){
//             e.preventDefault();
//             alert("You are subscribed now!");
//             window.location = "plans.html";
//         }
//     });
// });

// $(document).ready(function() {
//     $("#step2-btn").addEventListener("click", e=> { 
//         var tnc = document.querySelector("input[type='checkbox']:checked");
//         var selectRank = document.querySelector('input[id="rank-names"]:checked');

//         if (!selectRank){
//             alert("You need to choose a plan!");
//         } if (!tnc){
//             alert("You need to agree the Terms and Condition!");
//         } if (tnc && selectRank){
//             alert("You are subscribed now!");
//             window.location = "plans.html";
//         }
//     });
//     // document.querySelector("#step2-btn").addEventListener("click", e =>{
//     // });
// });