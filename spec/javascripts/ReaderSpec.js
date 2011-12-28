describe("Reader", function() {
    //1.logic js
    //2.jquery functions
    //3.jquery functionality of the page


    //logic: js string to array
    it("js logic: string to array: split the text (Split defines punctuation symbols)", function() {
        str =  "first line.second line, third line"
        expect(Splitter.split(str).length).toEqual(3);
    });

    //jquery - generate li in the menu
    it("jquery: array to dom.menu.list: populate the dom.menu with list items", function() {
        loadFixtures("many_lists.html");


        var selector = $("#menu_split1")
        //var num = $("#menu_split1 li").size() 
        var num = selector.find("li").size()
        expect(num).toEqual(0);// no li elements


    //example: array with 4 lines
    var arr = 
        [
        'first line', 
        'second line',
        'third line',
        'fourth line'

        ]

        //populate_dom 
        selector.updateDom(arr);

    var num = $("#menu_split1 li").size() 
        expect(num).toEqual(4);

    //page should contain input_field 
    });


    //functionality:
    it("dom event: when a row is clicked: push in-place an empty row ", function() {
        loadFixtures("many_lists.html");

        selector = $("#menu_split7")

        //add 1 li to beggining of menu
        //
        //
        var li = selector.find('li')
        num = li.size();
    expect(num).toEqual(8);



    expect(li.first().text()).toNotEqual("=")
        li.first().click();

    li1 = selector.find('li') //update array
        num = li1.size();
    expect(num).toEqual(9);

    li2 = li1.first()
        expect(li2.text()).toEqual("=")


        //click on added(not original) item: jquery live() enable functionality
        li = selector.find('li').first().click();
    num = selector.find('li').size();
    expect(num).toEqual(10);

    //item is trackable
    expect(li.hasClass('clicked1')).toBeTruthy();

    });

    it("when li is clicked: remove row in all menus if all rows contain the sign: =", function() {
        loadFixtures("many_lists.html");

        var       selector1 = $("#menu_split7")
        var       selector0 = $("#menu_split3")

        num = selector1.find('li').size()
        expect(num).toEqual(8)


        num = selector0.find('li').size()
        expect(num).toEqual(8)


        //it should trigger the line check for the equality  symbol
        selector1.find('li').first().click()

        selector0.find('li').first().click()

        num = selector1.find('li').size()
        expect(num).toEqual(9)


        //manually add menu.li to the third menu
        var selector2 = $("#menu_split1")
        var arr = 
        [
        'first line', 
        'second line',
        'third line',
        'fourth line'
            ]
            selector2.updateDom(arr); //populate_dom 


    //it should trigger the line check for the equality  symbol
    selector2.find('li').first().click()
        num = selector1.find('li').size()
        expect(num).toEqual(8) //first li(=) is eliminated!
    });


    it(" input-field should contain all the li text: get:: dom.menu.li items and set:: dom.input field", function() {
        loadFixtures("many_lists.html");

        var selector = $("#menu_split7")

        selector.set_input_field()


        str = selector.get_input_field()


        expect(str).toEqual("11.d,f.ds,f.s,df,ds");
    });



    it("user is notice: wether a save is recommanded: refresh the menu's update-state after a menu.li.click()", function() {
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

        var story_enc =  "1\n2\n 3".replace(/\n/g, "~");
        expect(story_enc).toEqual("1~2~ 3");


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
