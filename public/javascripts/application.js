// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    // $("#order_credit_card_number").validateCreditCardNumber();

    //$("#btn_show_as_list").populate_li();
    $(".menu_split li").live({

        click: function() {

                   $(this).before("<li>=</li>");


  var index = $(".menu_split li").index(this);
  
 str = $(".menu_split")


                   alert(index)
                   console.log(str)
                   //              str = $(this).closest(".me").attr('data-id')
//find element in current scope
                   var select =  $(this).closest(".me");


                   var content = select.find("li").text()





        select.find("input").val(content);
                   


var nth = "li:nth-child(" + index + ")"
var str = $(".menu_split").find(nth).text()

alert(str)
if(str=="===")
{



$(".menu_split").find(nth).remove()
}


               }


    });  
});
//   console.log(select);
//$("input").val(str)
//               $(select("input")).val("x");
//        select.("input").text(str);


