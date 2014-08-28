/*
 * To change color when link touched
 */
$(function() {
  $("a.touch").bind({
    touchstart: function () {
      $(this).removeClass().addClass("touchstart");
    }
  });
});
$(function() {
  $("a.touch").bind({
    touchend: function () {
      $(this).removeClass().addClass("touchend");
    }
  });
});

