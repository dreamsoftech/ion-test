$(function(){
	$('.product_photo_link').on('click', function(){
    $('#product_photo').click();
  });

  $('#product_photo').on('change', function(input){
    
    evt = input.target;
    if (evt.files && evt.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          $('#photo')
              .attr('src', e.target.result)
              .width(150);
      };

      reader.readAsDataURL(evt.files[0]);
    }
  });
  
  $('#products_div .fadein').on('click', function(){
    $('#add-product-div').fadeIn('slow');
  });

  $('#products_div .fadeout').on('click', function(){
    $('#add-product-div').fadeOut('slow');
  })
});