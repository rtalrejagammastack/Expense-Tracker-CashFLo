$(document).on('ajax:success', '.notification a', function() {
  $(this).parents('.notification').addClass('read');
  var count = parseInt($('#unread-count').text()) - 1;
  $('#unread-count').text(count);
});

$(document).on('click', '.notification', function() {
  window.location = $(this).find('a').attr('href');
});