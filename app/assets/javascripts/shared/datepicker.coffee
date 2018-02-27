$(document).on 'turbolinks:load', ->
  $('.datepicker').pickadate({
    selectMonths: true,
    selectYears: 5,
    today: 'Hoje',
    clear: 'Limpar',
    close: 'Ok',
    closeOnSelect: true,
    format: 'dd/mm/yyyy'
  });
  return
