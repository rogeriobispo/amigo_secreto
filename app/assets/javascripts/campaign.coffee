$(document).on 'turbolinks:load', ->
  $('.update_campaign input').bind 'blur', ->
    $('.update_campaign').submit()

  $('#campaign_event_hour').on 'keyup', (e) ->
    value = $(this).val()
    $(this).val(value.concat(':')) if value.length == 2
    $(this).val(value.substring(0,(value.length - 1))) if value.length == 6


  $('.update_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'PUT'
        dataType: 'json',
        data: $(".update_campaign").serialize()
        success: (data, text, jqXHR) ->
          Materialize.toast('Campanha atualizada', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na atualização da Campanha', 4000, 'red')
    return false


  $('.remove_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          $(location).attr('href','/campaigns');
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na remoção da Campanha', 4000, 'red')
    return false

  $('.raffle_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          Materialize.toast('Tudo certo, em breve os participantes receberão um email!', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast(jqXHR.responseText, 4000, 'red')
    return false

  $('#btnremovecampaign').on 'click', ->
    $('.modal').modal
      dismissible: false
    option = $('#modal1').modal('open')

  $('#modalyes').on 'click', ->
    $('.remove_campaign').submit()
    Materialize.toast('Campanha removida com sucesso', 4000, 'green')

  $('#modalno').on 'click', ->
    Materialize.toast('Remoção cancelada', 4000, 'red')



