$(function(){
  $(".conversation").each(function(){
    $this = $(this);
    var questionHeight = $this.find(".question").css("height");
    var answerHeight = parseInt($this.find(".answer").css("height"));
    $this.find("div.loverimg").css("top", "+=" + (answerHeight - 20));
    $this.find(".targetimg").css("top", "+=" + (questionHeight - 20))
  });
});