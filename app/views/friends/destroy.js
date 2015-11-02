<% if flash[:friend_success] == true %>
  $("a[href='/users/<%= current_user.id %>']").parent().parent().remove();
  $("input[name='_method']").remove();
  $('#formRemoveFriend').attr("method", "post");
  $('#btnRemoveFriend').attr("value", "Add Friend");
  $('#btnRemoveFriend').removeClass("red darken-1");
  $('#btnRemoveFriend').addClass("light-blue accent-3");
  $('#btnRemoveFriend').attr("id", "btnAddFriend");
  $('#formRemoveFriend').attr("id", "formAddFriend");
  $('#postMessage').css("display", "none");
  if ($('#listFriends > li').length > 0)
  {
    <% puts "if".blue %>
  }
  else
  {
    $('#cardContentFriend').find("ul").remove();
    <% puts "Remove #listFriends".yellow %>
  }
  <% puts "Success <destroy.js>".green %>
<% else %>

  <% puts "Error <destroy.js>".red %>
<% end %>
