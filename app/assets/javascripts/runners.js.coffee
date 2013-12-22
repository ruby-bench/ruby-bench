$ ->
  $('form').submit () ->
    id = $("#runner_id").val()
    $(@).attr("action", "/runners/#{id}")
