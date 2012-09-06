//= require jquery
//= require jquery_ujs

$(document).ready ->
  $.ajax(
    "url": "http://localhost:3000/articles/1.json"
    "success": (data) ->
      $("#articles").html("<h1> #{data.title} </h1>")
    "beforeSend": ->
      $("#articles").html("Ładowanie...")
    "error": ->
      $("#articles").html("sorry, newsów nie będzie :(")
  )