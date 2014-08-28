var sizeReset = function(){
$(".anim-circle").css({
      width: "60px",
      height: "60px",
      top: "+=35px",
      left: "+=35px",
      opacity: 1,
      "border-radius": "130px",
      border: "10px solid white",
      });
};

$(function(){
  setInterval(function(){
    $(".anim-circle").animate({
      width: "130px",
      height: "130px",
      top: "-=35px",
      left: "-=35px",
      opacity: 0.0,
      "border-width": "1px",
    }, 2000, "linear", sizeReset);
  }, 3000);
});

var sizeReset2 = function(){
$(".anim-circle2").css({
      width: "60px",
      height: "60px",
      top: "+=35px",
      left: "+=35px",
      opacity: 1,
      "border-radius": "130px",
      border: "10px solid #ec902e",
      });
};

$(function(){
  setInterval(function(){
    $(".anim-circle2").animate({
      width: "130px",
      height: "130px",
      top: "-=35px",
      left: "-=35px",
      opacity: 0.0,
      "border-width": "1px",
    }, 2000, "linear", sizeReset2);
  }, 3000);
});