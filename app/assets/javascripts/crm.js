// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function(){

  $('button.delete_contact').on('click', function(eventObject){

    var id = $(this).attr('id');

    if(id>0)
    {

      $.ajax({
        url: '/contacts/' + id,
        method: 'DELETE',
        data: {},
        dataType: 'JSON'
      }).done(function(data){

        $('.contact[id=' + id + ']').remove();

      }).fail(function(data){

        console.log('fail');

      });

    }

  });

});

  // delegate exmple
  //$('ul.contacts').on('click','.delete_contact', function(e){
