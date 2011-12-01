// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function createList(items) {
    var list = $('<ul/>');

    $.each(items, function(i, item) {
        if (typeof item !== 'string') { return; }
        list.append(
            $('<li>' + item + '</li>')
            .click(function() {
                $(this).addClass('clicked');
            })
            );
    });

    return list;
}

var CreditCard = {
    cleanNumber: function(number) {
                     return number.replace(/[- ]/g, "");
                 },

    validNumber: function(number) {
                     var total = 0;
                     number = this.cleanNumber(number);
                     for (var i=number.length-1; i >= 0; i--) {
                         var n = parseInt(number[i]);
                         if ((i+number.length) % 2 == 0) {
                             n = n*2 > 9 ? n*2 - 9 : n*2;
                         }
                         total += n;
                     };
                     return total % 10 == 0;
                 }
}; //class CreditCard
var Splitter = {
    trace : function(value) 
    {
        console.log(value);
    },
    replace :function(str, sym) {
                 for (var i = 0; i <  sym.length ; i++) {
                     str = this.replace_one(str, sym[i]);
                     //str.replace(sym[i], sym[i].concat('='));
                 }

                 //.replace(",", ",=");
                 return str;
             },
    replace_one : function(story,sign)
    {
        //sign = "."
        to_sign = sign + "$"
            from="[" + sign  + "]"
            from_reg = new RegExp(from,"g");

        str = story.replace(from_reg , to_sign);
        return str;
    },

    split : function(str){

                var story_enc = str 

                    var arr_symbols = [',', '!', '.', "?", ":", ";", "=", '\n']
                    story_enc = this.replace(story_enc, arr_symbols);


                //split   replace
                var story_arr = story_enc.split('$');

                //    console.log(story_arr);

                //each symbol to replace str
                //            this.trace(story_arr);
                return story_arr

            },
    handler1 : function(that)
    {
        num =  $("li").index(that);

    },
    add_click_event : function(link)
    {

    },
    add_to_dom1 : function(arr)
    {
        $("#menu_split1 li").remove()
            $.each(arr, function(index, value) {
                console.log(value);
                link = $("<li>"+value+"</li>");

                //this.handler1(link);

                //update onClick 
                link.click(function () {
                    console.log(this);
                    str = ""
                    str += $("#clicks").text();   
                $(this).clone(true).insertBefore(this).text("=");
                var index = $("li").index(this);
                str =   index + "," + str
                    $("#clicks").text(str);
                $("#new_item2").text = str
                    str0 =  $('#order_credit_card_number').text(); 
                $('#order_credit_card_number').val(str0 + "," + str);
                //send to server: story + string of clicks
                //str = $(li).html

                })
                //link.click(this.handler1);
                $("#menu_split1").append(link); // check append() examples

                // }
    }
    );
}




};//class Splitter

(function($){
    $.fn.generate_dom = function(value) {

        var arr = Splitter.split(value);
        //console.log('arr=' + arr);




        //console.log(this)
        //console.log($(this))
        //    link.click_li();
        $(this).updateDom(arr, this);
    };

    $.fn.update_time = function(str) {
        alert(str)
    //console.log(this)
    $(this).html(str)
    };



    $.fn.updateDom = function(arr) {
        selector = $(this) 
            //console.log( this)
            //  $(".menu_split li").remove()
            $.each(arr, function(index, value) {
                link = $("<li>"+value+"</li>");
                //    link.click_li();

                //   $(this).append(link); // check append() examples
                //   this.append(link); // check append() examples
                selector.append(link); // check append() examples

            }


            )

            $(this).update_input_field();

    }



    $.fn.get_parent_class = function(str)
    {

        var select =  $(this).closest(str);
        return select;
    }
    $.fn.get_child_input = function()
    {

        var select =  $(this).find(".input_story").first()
            return select;
    }

    $.fn.stringify_all_li = function()
    {
        var content = $(this).find("li").text()
            return content
    }
    $.fn.get_child_save_state = function()
    {
        var content = $(this).find(".update_state").text()
            return content
    }
    $.fn.set_child_save_state = function(str)
    {
        $(this).find(".update_state").text(str)
    }

    $.fn.update_input_field = function()
    {
        var select =  $(this).get_parent_class(".me")
            content = $(select).stringify_all_li()
            select.get_child_input().val(content);
    }

    $.fn.update_save_state = function(str)
    {
        selector1 = $(this).get_parent_class(".me")
            selector1.set_child_save_state(str)
    } 
    $.fn.validateCreditCardNumber = function() {
        return this.each(function() {
            $(this).blur(function() {
                if (!CreditCard.validNumber(this.value)) {
                    $("#" + this.id + "_error").text("Invalid credit card number.");
                } else {
                    $("#" + this.id + "_error").text("");
                }
            });
        });
    };
  $.fn.update_others = function(index) 
        {//if1

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


                $(this).update_save_state("should save")
                $(this).find(nth).remove()
                $(this).update_input_field()

            })

        }


        }//if1

    //$("#btn_show_as_list").populate_li();
    $(".menu_split li").live({

        click: function() {

                   $(this).update_save_state("should save")
        $(this).addClass('clicked1');
    $(this).before("<li>=</li>");

    //index relative - in scope of ".me"
    var index = $(this).closest(".me").find(".menu_split li").index(this);

    str = $(".menu_split")


        //    alert("let's remove index:" + index)
        //        console.log(str)
        //              str = $(this).closest(".me").attr('data-id')
        //find element in current scope
        $(this).update_input_field()
//this.update_others()


       
$(this).update_others(index)
        
     

               }
    });  

})(jQuery);
