$ ->
  navRotator = setInterval(->
    current = $('#pages li.active')
    if current.next().length
      current.next().trigger('click')
    else
      $('#pages li:first-child').trigger('click')
  , 6000)

$('#pages li').live 'click', (e)->
  e.preventDefault()
  marginLeft = -1 * parseInt($(this).attr('data-page')) * $('#artistNavWrapper').width()
  $('#artistNav').css 'margin-left', marginLeft
  $('#pages li.active').removeClass('active')
  $(this).addClass('active')

$('div[data-href]').live 'click', (e)->
  $('iframe').attr 'src', $(@).attr('data-href')
  $('body').attr('class', $(@).attr('data-class'))

# $ ->
#   children = $('#artistNav li').length
#   pages = Math.ceil children/3

#   $('#pages').append($('li')) for i in [0..pages]
#   $('#pages li:first-child').addClass('active')

#   $('#pages')