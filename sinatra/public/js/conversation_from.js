$(function(){
  $(".conversation").each(function(){
    $this = $(this);
    var questionHeight = parseInt($this.find(".question").css("height"));
    var answerHeight = parseInt($this.find(".answer").css("height"));
    $this.find("div.loverimg").css("top", "+=" + (answerHeight != 0 ? (answerHeight - 20) : 30));
    console.log(answerHeight);
    $this.find(".targetimg").css("top", "+=" + (questionHeight - 20))
  });
});