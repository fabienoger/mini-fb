$(document).ready(function() {
  var path = document.URL.split("/");
  id = path[path.length - 1];
  userInfo = document.getElementById("user-id");
  currentUserId = userInfo.className;
  $("#addFriend").click(function() {
    $.ajax({
      type: "POST",
      url: document.URL,
      data: {rq_id: id, cr_id: currentUserId},
      dataType: 'json',
      success: function(data) {
        $.each(data, function(key, value) {
          document.forms['new_qued_item'].elements['qued_item_' + key].value = value
        });
      }
    });
  });

  /*$("#destroyFriend").click(function() {
    $.ajax({
      type: "delete",
      url: document.URL,
      data: "data",
      dataType: 'json',
      success: function(data) {
        $.each(data, function(key, value) {
          document.forms['new_qued_item'].elements['qued_item_' + key].value = value
        });
      }
    });
  });*/
});
