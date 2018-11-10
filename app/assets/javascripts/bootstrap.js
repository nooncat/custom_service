jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();


  Date.prototype.toDatetimeLocal = function toDatetimeLocal() {
    var
      date = this,
      ten = function (i) {
        return (i < 10 ? '0' : '') + i;
      },
      YYYY = date.getFullYear(),
      MM = ten(date.getMonth() + 1),
      DD = ten(date.getDate()),
      HH = ten(date.getHours()),
      II = ten(date.getMinutes()),
      SS = ten(date.getSeconds())
    ;
    return YYYY + '-' + MM + '-' + DD + 'T' + HH + ':' + II + ':' + SS;
  };

  $('[role="autoFillableDate"][type="datetime-local"]').on('click', function(e) {
    var target = e.currentTarget;
    if (target.value == '') { target.value = new Date().toDatetimeLocal() }
  })
});
