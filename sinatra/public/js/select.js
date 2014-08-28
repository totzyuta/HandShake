$(function(){
  $("#Target").focus(function(){
    $(".line-out").css("display", "none");
    $(".box").css("top", "10px");
    $(".select").css("top", "0px");
  });

  $("#Target").blur(function(){
    $(".line-out").css("display", "block");
    $(".box").css("top", "30px");
    $(".select").css("top", "30px");
  });

});