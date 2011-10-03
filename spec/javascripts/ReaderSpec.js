describe("CreditCard", function() {
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
   expect(Splitter.split(",,,hello.. !! world. ok ?").length).toEqual(10);
  });

 
});
