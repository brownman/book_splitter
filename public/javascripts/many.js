
function array_to_dom(arr) 
{
    //arr = ['abc','def','gh']


    $.each(arr, function(index, value) {
            console.log(value);

            $("#menu_split").append("<li>"+value+"</li>"); // check append() examples

            // }
            }
          );
    }
function li_click()
{

    str = ""    
        $(this).clone(true).insertBefore(this).text("");
    var index = $("li").index(this);
    str += index + ","
        $("p").text(str);
}

$("li").click(function(){

        str = ""    
        $(this).clone(true).insertBefore(this).text("");
        var index = $("li").index(this);
        str += index + ","
        $("p").text(str);
        });

$("#new_item").submit(function(e) {
        var value =   $("#item_name").val();

        $("#menu_split").append("<li>"+value+"</li>"); // check append() examples
        $("#item_name").val("");
        e.preventDefault();
        });

function replacing(str, sym) {
    for (var i = 0; i <  sym.length ; i++) {
        str = str.replace(sym[i], sym[i].concat('='));
    }

    //.replace(",", ",=");
    return str;
}

function string_to_array
{
    var story_enc = story

        var arr_symbols = [',', '!', '..', '.']
        story_enc = replacing(story_enc, arr_symbols);


    //split   replace
    var story_arr = story_enc.split("=");

    console.log(story_arr);

    //each symbol to replace str
    return story_arr
}

