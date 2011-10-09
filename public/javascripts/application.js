// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
 // $("#order_credit_card_number").validateCreditCardNumber();

  //$("#btn_show_as_list").populate_li();
  $("li").live({

  click: function() {

           $(this).before("<li>=</li>");

           str = $(this).closest(".me").attr('data-id')
  //$("input").val(str)
  var select =  $(this).closest(".me");
var content = select.find("li").text()
  console.log(select);
select.find("input").val(content);
//               $(select("input")).val("x");
//        select.("input").text(str);


         }


});  
});
