$(function(){
	$("#btn_add_item").on("click", function(){
		if (!$("#new_purchase_order").valid()) return false;

		var template = $("#template_line_item").clone();

		template.find("#lot_name > span").text($("#lots option:selected").text());
		template.find("#lot_name > input").val($("#lots").val());
		template.find("#lot_name > input").attr("name", "lot_ids[]");

		template.find("#product_name > span").text($("#products option:selected").text());
		template.find("#product_name > input").val($("#products").val());
		template.find("#product_name > input").attr("name", "product_ids[]");
		
		template.find("#product_quantity > span").html($("#quantity").val());
		template.find("#product_quantity > input").val($("#quantity").val());
		template.find("#product_quantity > input").attr("name", "quantities[]");

		template.removeClass("hidden");
		$("#order_line_list tbody").append(template);
	});

	$("#order_line_list").on("click", "a.remove", function(){
		$(this).parent().parent().remove();
	});
	
});