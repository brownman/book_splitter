describe("Reader", function() {
  
  it("logic: split from string to array by symbols", function() {
   str =  "first line.second line, third line"
   expect(Splitter.split(str).length).toEqual(3);
  });
  
  it("jquery: populate dom with array", function() {
     loadFixtures("many_lists.html");

    var num = $("#menu_split1 li").size() 
    expect(num).toEqual(0);
    //populate the dom.menu with array
    //
    var selector = $("#menu_split1")
    var arr = 
    [
   'first line', 
   'second line',
   'third line',
   'fourth line'

    ]

  //populate_dom 
    selector.updateDom(arr);
    //selector.find('li').size()
    var num = $("#menu_split1 li").size() 
    expect(num).toEqual(4);
  
  });
  

  it("click on item of list should add row before", function() {
    loadFixtures("many_lists.html");
    str = $( $("#menu_split7 li").first() )

    expect(str).toHaveText("11.");
    
  });




  it("cleans number by removing spaces and dashes", function() {
    expect(CreditCard.cleanNumber("123 4-5")).toEqual("12345");
  });
  
  it("validates based on mod 10", function() {
    expect(CreditCard.validNumber("4111 1111-11111111")).toBeTruthy();
    expect(CreditCard.validNumber("4111111111111121")).toBeFalsy();
  });
  
  it("validates when text field loses focus", function() {
    loadFixtures("order_form.html");
    $("#card_number").validateCreditCardNumber();
    $("#card_number").val("123");
    $("#card_number").blur();
    expect($("#card_number_error")).toHaveText("Invalid credit card number.");
    $("#card_number").val("4111 1111-11111111");
    $("#card_number").blur();
    expect($("#card_number_error")).toHaveText("");
  });
 String.prototype.ReplaceAll = function(stringToFind,stringToReplace){
    var temp = this;
    var index = temp.indexOf(stringToFind);
        while(index != -1){
            temp = temp.replace(stringToFind,stringToReplace);
            index = temp.indexOf(stringToFind);
        }
        return temp;
    }
 
  it("split string by dots", function() {
/*
sign = "."
to_sign = sign + "="
from="[" + sign  + "]"
from_reg = new RegExp(from,"g");
str = "hello.. world. ok? miiiu".replace(from_reg , to_sign);
expect(str).toEqual("");
*/

//.split("=") ).
//toEqual([]);

  });

 
});
