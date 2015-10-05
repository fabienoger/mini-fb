$(document).ready(function() {
  $("#addFriend").click(function() {
    $.ajax({
      type: "POST"
      url: document.URL,
      data: "data",
      dataType: 'json',
      success: function(data) {
        $.each(data, function(key, value) {
          document.forms['new_qued_item'].elements['qued_item_' + key].value = value
        });
      }
    });
    alert("add");
  });

  $("#destroyFriend").click(function() {
    alert("Destroy");
  });
});
