$(document).ready(function() {
  var path = document.URL.split("/");
  id = path[path.length - 1];
  if (path[path.length -2] == "users" && id > 0)
  {
    userInfo = document.getElementById("user-id");
    currentUserId = userInfo.className;
    console.log(userInfo.className);
    button = document.getElementById("btnFriend");
    we_are_friend = document.getElementById("we_are_friend").className;
    console.log(we_are_friend);

    function addFriend() {
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (xmlhttp.status == 200 && xmlhttp.readyState == 4)
        {
          button.innerHTML = "Remove";
          button.onclick = removeFriend;
        }
      }
      xmlhttp.open("POST", "http://localhost:3000/users/" + id, true);
      xmlhttp.send();
    }

    function removeFriend() {
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (xmlhttp.status == 200 && xmlhttp.readyState == 4)
        {
          button.innerHTML = "Add";
          button.onclick = addFriend;
        }
      }
      xmlhttp.open("DELETE", "http://localhost:3000/users/" + id, true);
      xmlhttp.send();
    }

    if (we_are_friend == "false")
      button.onclick = addFriend;
    else
      button.onclick = removeFriend;
  }
/*
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

  $("#destroyFriend").click(function() {
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
  });
  */
});
