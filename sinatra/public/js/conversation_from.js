$(function(){
  $(".conversation").each(function(){
    $this = $(this);
    var questionHeight = parseInt($this.find(".question").css("height"));
    var answerHeight = parseInt($this.find(".answer").css("height"));
    $this.find("div.loverimg").css("top", "+=" + (answerHeight - 20));
    console.log(questionHeight);
    $this.find(".targetimg").css("top", "+=" + (questionHeight - 20))
  });
});