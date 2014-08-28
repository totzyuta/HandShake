$(function(){
  var tar = $("#Target");
  tar.focus(function(){
    $(".line-out").css("display", "none");
    $(".box").css("top", "10px");
    $(".select").css("top", "0px");

  }).keyup(function(){
    var word = tar.val();
    if(word != ""){
    console.log(word);
      $(".face-out-circle").each(function(){
        $this = $(this);
        var name = $this.find("img").attr("alt");
        console.log("name: " + name + ", word: " + word);
        if(name.indexOf(word) == 0){
          $this.css("display", "block");
        }else{
          $this.css("display", "none");        
        }
      });
    }else{
      $(".face-out-circle").each(function(){
        $this = $(this);
        $this.css("display", "block");
      });
    }
  });
  
});