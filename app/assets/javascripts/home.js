$(function()
{
	$.mask.definitions['~']='[+-]';
  $('.input-phone').mask('(999) 999-9999')

  $('.date-picker').datepicker({ format: 'yyyy-mm-dd' });
})