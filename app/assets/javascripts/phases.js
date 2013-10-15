$(function(){
  $("#new_phase").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_phase .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      $("#phase_list").append(
        '<tr id="phase' + data.id + '">' + 
          '<td>'+ data.id + '</td>' + 
          '<td>'+ data.name + '</td>' + 
          '<td>'+ '<a class="btn btn-default btn-xs" href="/phases/'+ data.id + '"><i class="icon-pencil"></i> Edit</a>' +
          '<a class="btn btn-default btn-xs" rel="nofollow" data-remote="true" data-method="delete" href="/phases/'+ data.id + '"><i class="icon-remove"></i> Remove</a>' +
          '</td>' +
        '</tr>'); 
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_phase span").html("This job type " + result.name);
    $("#new_phase .alert-danger").removeClass('hide');
    $("#new_phase .alert-danger").slideDown('slow');
  });

  $("#phase_list").on("ajax:success", function(e, data, status, xhr){
    $("#phase" + data.id).remove();
  });

  $("#new_lot").on("ajax:success", function(e, data, status, xhr)
  {
    $("#new_lot .alert-danger").fadeOut('slow');
    if (xhr.status == 201) // create
    {
      $("#lot_list").append(
        '<tr id="lot' + data.id + '">' + 
          '<td>'+ data.id + '</td>' + 
          '<td>'+ data.name + '</td>' + 
          '<td>'+ data.budget + '</td>' + 
          '<td>'+ '<a class="btn btn-default btn-xs" href="/lots/'+ data.id + '"><i class="icon-pencil"></i> Edit</a>' +
          '<a class="btn btn-default btn-xs" rel="nofollow" data-remote="true" data-method="delete" href="/lots/'+ data.id + '"><i class="icon-remove"></i> Remove</a>' +
          '</td>' +
        '</tr>'); 
    }
  }).bind("ajax:error", function(e, xhr, status, error){
    var result = xhr.responseJSON;

    $("#new_lot span").html("This job type " + result.name);
    $("#new_lot .alert-danger").removeClass('hide');
    $("#new_lot .alert-danger").slideDown('slow');
  });

  $("#lot_list").on("ajax:success", function(e, data, status, xhr){
    $("#lot" + data.id).remove();
  });

  $("#collaspe_lot_div").on('click', function(){
    $("#new_lot_div").fadeOut('fast');
  });

});