describe("Reader", function() {
        //1.logic js
        //2.jquery functions
        //3.jquery functionality of the page
        //4.
        //


        //logic: js string to array
        it("logic: split from string to array by symbols", function() {
            str =  "first line.second line, third line"
            expect(Splitter.split(str).length).toEqual(3);
            });

        //jquery - generate li in the menu
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
            //selectError: Expected '=' to equal ''.
            //or.find('li').size()
        var num = $("#menu_split1 li").size() 
            expect(num).toEqual(4);

        //page should contain input_field 
        });


        //functionality: click on li should add new item
        it("click on li should add a new li", function() {
                loadFixtures("many_lists.html");
                //  str = $( $("#menu_split7 li").first() )
                selector = $("#menu_split7")

                num = selector.find('li').size();
                //console.log(li)
                expect(num).toEqual(8);


                //add 1 li to beggining of menu
                li = selector.find('li').first().click();

                num = selector.find('li').size();
                expect(num).toEqual(9);
                //check functionality of the first li item - should respond to click()

                li1 = selector.find('li').first()
                expect(li1.text()).toEqual("=")
                li = selector.find('li').first().click();

                num = selector.find('li').size();
                expect(num).toEqual(10);

                expect(li.hasClass('clicked1')).toBeTruthy();

        });

     it("remove row in all menus when each line is signed with =", function() {
   loadFixtures("many_lists.html");
                //  str = $( $("#menu_split7 li").first() )

         var       selector1 = $("#menu_split7")

         var       selector0 = $("#menu_split3")
               /// selector2= $("#menu_split1")

num = selector1.find('li').size()
expect(num).toEqual(8)
selector1.find('li').first().click()
num = selector1.find('li').size()
expect(num).toEqual(9)


selector0.find('li').first().click()
//it should trigger the line check for the equality  symbol

num = selector1.find('li').size()
expect(num).toEqual(9)
console.log(selector1)


            var selector2 = $("#menu_split1")
            var arr = 
            [
            'first line', 
            'second line',
            'third line',
            'fourth line'

            ]

            //populate_dom 
            selector2.updateDom(arr);


selector2.find('li').first().click()

num = selector1.find('li').size()

console.log(selector1)
expect(num).toEqual(8)
        });


        it("input-field should contain all the li text", function() {
                loadFixtures("many_lists.html");

                var selector = $("#menu_split7")

                selector.update_input_field()

                selector1 = selector.get_parent_class(".me")
                selector2 = selector1.get_child_input()
                str = selector2.val()

                expect(str).toEqual("11.d,f.ds,f.s,df,ds");
                });

        it("click on item of list should add row before", function() {
                loadFixtures("many_lists.html");
                str = $( $("#menu_split7 li").first() )

                expect(str).toHaveText("11.");

                });

        it("what is the menu update state ", function() {
    loadFixtures("many_lists.html");
        var selector = $("#menu_split7")

selector1 = selector.get_parent_class(".me")
str = selector1.get_child_save_state()


                expect(str).toEqual("none");
//li  = selector.find('li').first().click()

//str = selector1.get_child_update_state()
selector.update_save_state("zzz")

str = selector1.get_child_save_state()
                expect(str).toEqual("zzz");

li  = selector.find('li').first().click()

str = selector1.get_child_save_state()
                expect(str).toEqual("should save");

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


        //});
        //describe("createList", function() {
var items = [ 'apple', 'orange', 'pear' ];

it("should return a jquery object containing an unordered list", function() {
        var list = createList(items);
        expect(list).toBeDefined();
        expect(list.jquery).toBeDefined();
        expect(list.length).toBe(1);
        expect(list[0].nodeName.toLowerCase()).toBe('ul');
        });

it("should contain the correct number of list items", function() {
        var list = createList(items);
        expect(list.children().length).toBe(3);
        expect(list.children('li').length).toBe(list.children().length);
        });

it("should properly populate the list items", function() {
        var list = createList(items);
        expect(list.children().eq(1).html()).toEqual('orange');
        });

it("should only use an item if it is a string", function() {
        var list = createList([ 'apple', 1, false, {}, [], 'pear' ]);
        expect(list.children().length).toBe(2);
        });

it("should add a click handler to its list items that adds a class of 'clicked'", function() {
        var list = createList(items),
        li = list.find('li').click();

        expect(li.hasClass('clicked')).toBeTruthy();
        });

/*
   it("should only use items that are at least three characters long", function() {
   var list = createList([ 'a', 'long enough' ]);
   expect(list.children().length).toBe(1);
   });
   */
});
