$(function(){
  $(".conversation").each(function(){
    $this = $(this);
    var questionHeight = parseInt($this.find(".question").css("height"));
    var answerHeight = parseInt($this.find(".answer").css("height"));
    console.log("ans: " + answerHeight);
    $this.find("div.loverimg").css("top", "+=" + (answerHeight != 20 ? (answerHeight) : 0));
    $this.find(".targetimg").css("top", "+=" + (questionHeight - 20))
  });
});