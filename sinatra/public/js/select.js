$(function(){
  var tar = $("#Target");
  tar.focus(function(){
    $(".line-out").css("display", "none");
    $(".box").css("top", "10px");
    $(".select").css("top", "0px");

  }).blur(function(){
    $(".line-out").css("display", "block");
    $(".box").css("top", "30px");
    $(".select").css("top", "30px");

  }).keydown(function(){
    var word = tar.val();
    $(".face-out-circle").each(function(){
      $this = $(this);
    });
    console.log(word);
  });
  
});