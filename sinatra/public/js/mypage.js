var sizeReset = function(){
$(".anim-circle").css({
      width: "70px",
      height: "70px",
      top: "+=25px",
      left: "+=25px",
      opacity: 1,
      "border-radius": "130px",
      border: "10px solid white",
      });
};

var sizeResetLine = function(){
$(".anim-line").css({
      height: "52px",
      top: "+=4px",
      opacity: 1,
      });
};

var sizeReset2 = function(){
$(".anim-circle2").css({
      width: "70px",
      height: "70px",
      top: "+=25px",
      left: "+=25px",
      opacity: 1,
      "border-radius": "130px",
      border: "10px solid #ec902e",
      });
};

$(function(){
  setInterval(function(){
    $(".anim-circle").animate({
      width: "120px",
      height: "120px",
      top: "-=25px",
      left: "-=25px",
      opacity: 0.0,
      "border-width": "1px",
    }, 2000, "linear", sizeReset);
  }, 2000);
  
  setInterval(function(){
    $(".anim-circle2").animate({
      width: "120px",
      height: "120px",
      top: "-=25px",
      left: "-=25px",
      opacity: 0.0,
      "border-width": "1px",
    }, 2200, "linear", sizeReset2);
  }, 2200);
  
  setInterval(function(){
    var elem = $(".anim-line");
    $(elem).animate({
      height: "52px",
      top: "-=0px",
      opacity: 0.2,
    }, 600, "linear", function(){
      $(elem).animate({
        opacity: 1
      }, 600);
    });
  }, 1200);
  
  setInterval(function(){
    var elem = $(".new-circle-anim");
    $(elem).animate({
      opacity: 0.5,
    }, 600, "linear", function(){
      $(elem).animate({
        opacity: 1
      }, 1000);
    });
  }, 1600);
  
  setInterval(function(){
    var elem = $(".new-circle-anim");
    $(elem).animate({
      opacity: 0.5,
    }, 600, "linear", function(){
      $(elem).animate({
        opacity: 1
      }, 1000);
    });
  }, 1600);
});
