$(document).ready(function() {
  var path = document.URL.split("/");
  id = path[path.length - 1];
  if (path[path.length -2] == "users" && id > 0)
  {
    $userInfo = document.getElementById("user-id");
    $button = document.getElementById("btnFriend");
    $we_are_friend = document.getElementById("we_are_friend").className;
    $cardFriend = document.getElementById("cardContentFriend");
    $userName = document.getElementById("userName");
    currentUserId = $userInfo.className;

    if ($listFriends = document.getElementById("listFriends"))
      var issetListFriend = 1;
    else
      var issetListFriend = 0;

    function addFriend() {
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (xmlhttp.status == 200 && xmlhttp.readyState == 4)
        {
          if (issetListFriend == 0)
          {
            var node = document.createElement("ul");
            node.className = "collection";
            node.id = "listFriends";
            $cardFriend.appendChild(node);
          }
          $listFriends = document.getElementById("listFriends");
          redButton();
          $listFriends.innerHTML += '<li id="newFriend" class="collection-item blue-grey-text darken-1"><div>' + $userName.innerHTML + '<a href="/users/' + id + '" class="secondary-content light-blue-text darken-4"><i class="material-icons">send</i></a></div></li>';
          $button.onclick = removeFriend;
        }
      }
      xmlhttp.open("POST", "http://vps164881.ovh.net/users/" + id, true);
      xmlhttp.send();
    }

    function removeFriend() {
      var xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (xmlhttp.status == 200 && xmlhttp.readyState == 4)
        {
          if ($listFriends.children.length == 1)
            $listFriends.parentNode.removeChild($listFriends);
          else
          {
            if(document.getElementById("newFriend"))
              $listFriends.removeChild(document.getElementById("newFriend"));
            for (i = 0; i < $listFriends.children.length; i++)
            {
              var toto = $listFriends.children[i].childNodes[1].textContent.indexOf($userName.innerHTML);
              if (toto != -1)
                $listFriends.removeChild($listFriends.children[i]);
            }
          }
          blueButton();
          $button.onclick = addFriend;
        }
      }
      xmlhttp.open("DELETE", "http://vps164881.ovh.net/users/" + id, true);
      xmlhttp.send();
    }

    function redButton() {
      $('#btnFriend').removeClass('light-blue');
      $('#btnFriend').removeClass('accent-3');
      $('#btnFriend').addClass('red');
      $('#btnFriend').addClass('darken-1');
      $button.innerHTML = "Remove";
    }

    function blueButton() {
      $('btnFriend').removeClass('red');
      $('#btnFriend').removeClass('darken-1');
      $('#btnFriend').addClass('light-blue');
      $('#btnFriend').addClass('accent-3');
      $button.innerHTML = "Add Friend";
    }

    if ($we_are_friend == "false")
    {
      blueButton();
      $button.onclick = addFriend;
    }
    else
    {
      redButton();
      $button.onclick = removeFriend;
    }
  }
});
