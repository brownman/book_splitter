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
};
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

                var arr_symbols = [',', '!', '.', "?", ":", ";", "="]
                story_enc = this.replace(story_enc, arr_symbols);


            //split   replace
            var story_arr = story_enc.split('$');

            console.log(story_arr);

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




};

(function($){
 $.fn.generate_dom = function(value) {

 var arr = Splitter.split(value);
 console.log('arr=' + arr);




 //console.log(this)
 console.log($(this))
 //    link.click_li();
 $(this).updateDom(arr, this);
 };

 $.fn.update_time = function(str) {
 alert(str)
 console.log(this)
$(this).html(str)
 };
 


 $.fn.updateDom = function(arr) {
 selector = this 
 console.log( this)
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


 $.fn.stringify_all_li = function()
 {
     var content = $(this).find("li").text()
         return content
 }

 $.fn.update_input_field = function()
 {
     var select =  $(this).get_parent_class(".me")
content = $(select).stringify_all_li()
         select.find("#input_story").first().val(content);
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
})(jQuery);
