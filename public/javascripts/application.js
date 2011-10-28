// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    // $("#order_credit_card_number").validateCreditCardNumber();

    //$("#btn_show_as_list").populate_li();
    $(".menu_split li").live({

        click: function() {

                   $(this).before("<li>=</li>");

                   //index relative - in scope of ".me"
                   var index = $(this).closest(".me").find(".menu_split li").index(this);

                   str = $(".menu_split")


        //    alert("let's remove index:" + index)
        console.log(str)
        //              str = $(this).closest(".me").attr('data-id')
        //find element in current scope
$(this).update_input_field()
  
    var nth = "li:nth-child(" + index + ")"
        var str = $(".menu_split").find(nth).text()

        //    alert(str)
        var str_exp = ""
        var times = $(".me").length
        for(var i=0; i<times ; i++)
        {
            str_exp += "="
        }
    //alert("str_exp" + str_exp);

    var str_eq = "="
        if(str == str_exp)
        {
            $(".menu_split").each(function(){
            
                $(this).find(nth).remove()
$(this).update_input_field()
                
            })

        }


               }


    });  
});
//   console.log(select);
//$("input").val(str)
//               $(select("input")).val("x");
//        select.("input").text(str);


