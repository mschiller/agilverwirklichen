$('.btn.copy').click(function () {
  var $this = $(this);
  var html = $this.html();
  var css = $this.css('background-color');
  $this.html('Server IP ... kopiert!');
  $this.css('background-color', '#FF8500');
  setTimeout(function () {
    $this.html(html);
    $this.css('background-color', css);
  }, 3000)
});
