$(document).ready(function()
{
    $("#add_to_basket").click(addToBasket);
    const urlParams = new URLSearchParams(window.location.search);
    const myParam = urlParams.get('view');
    if(myParam=="shopping_cart")
    {
        getProductsFromBasket();
        getPaymentMethods();
        $('body').on('click', 'a.increaseQuantity', increaseQuantity);
        $('body').on('click', 'a.removeItem', removeFromBasket);
        $('body').on('click', 'a#ModelPurchaseConfirm', checkPurchaseForm);
        $('body').on('change', 'select#paymentDdl', displayCardInput);
    }
});

function addToBasket()
{
    let idProduct = ($(this).data("idproduct"));
    $.ajax(
        {
            method : "POST",
            url : "models/products/addProductToBasket.php",
            dataType : "json",
            data : {
                "id" : idProduct,
                "request" : true
            },
            success : function(message)
            {
                if(message == 200)
                {
                    alert("Successfuly added!");
                    getProductsFromBasket();
                }
                else if(message == 400)
                {
                    alert("Increasing product quantity unavailable.");
                    alert(message);
                }
                else
                {
                    alert(message.message);
                }
            },
            error : function(xhr)
            {

            }
        }
    );
}
function displayCardInput()
{
    let value = $(this).val();
    console.log(value);
    if(value == 2)
    {
        $("#credit_card_number").html(` <div class="input-field col s12">
              <i class="material-icons prefix">credit_card</i>
                   <input type="text" id="ccNumber" name="ccNumber"/>
                <label for="tbAddress">Your credit card number</label>
                <span class="helper-text"> E.g. 1111-1111-1111-1111</span>
              </div>`);
    }
    else
    {
        $("#credit_card_number").html("");
    }
}
function getProductsFromBasket()
{
     $.ajax(
        {
            method : "POST",
            url : "models/products/getProductsFromBasket.php",
            dataType : "json",
            data : {
                "request" : true
            },
            success : function(items)
            {
                showProductsFromBasket(items);
            },
            error : function(xhr)
            {

            }
        }
    );
}
function showProductsFromBasket(items)
{
    if(items.length)
    {
        $("#shopping_title").html("Your products");
        let html=``;
        let sum=0;
        items.forEach(element => {
            sum+=element.price*element.quantity;
            html += `
                <tr>
                    <td class="center-align">
                       <span class="center-align"> <img src="${element.src_mini}" class="responsive-img"/> </span>
                    </td>
                    <td>
                        <p class="center-align"> ${element.perfume_name} </p>
                    </td>
                    <td>
                        <p class="center-align"> ${element.currency}${element.price}</p>
                    </td>
                    <td>
                        <p class="center-align"> ${element.quantity} </p>
                    </td>
                    <td>
                        <p class="center-align"> <a href="#" id="${element.price_listID}" class="increaseQuantity"><i class="material-icons black-text">add</i></a>
                    </td>
                    <td>
                        <p class="center-align"> <a href="#" id="${element.price_listID}" class="removeItem"><i class="material-icons black-text">clear</i></a>
                    </td>
                </tr>
            `;
        });
        $("#products").html(html);
        $("#total_cost").html("Total cost: $" + sum);
        $("#total_cost").next().html(`<a href="#modalPurchase" class="black-text btn modal-trigger">Finalize purchase</a>`);
    }
    else
    {   $("#products").html("");
        $("#total_cost").html("");
        $("#shopping_title").html("Your shopping cart is empty!");
    }
}
function increaseQuantity()
{
    let id = $(this).attr("id");
    $.ajax(
        {
            method : "POST",
            url : "models/products/increaseProductQuantityInBasket.php",
            dataType : "text",
            data : {
                "request" : true,
                "id" : id
            },
            success: function(response) {
                return getProductsFromBasket();
            },
            error : function(xhr)
            {

            },
        }
    );
}
function removeFromBasket()
{
    let id = $(this).attr("id");
     $.ajax(
        {
            method : "POST",
            url : "models/products/removeProductFromBasket.php",
            dataType : "text",
            data : {
                "request" : true,
                "id" : id
            },
            success: function(response) {
                alert("Succesfuly deleted.");
                return getProductsFromBasket();
            },
            error : function(xhr)
            {

            },
        }
    );
}
function getPaymentMethods()
{
     $.ajax(
        {
            method : "POST",
            url : "models/purchase/getPaymentMethods.php",
            dataType : "json",
            data : {
                "request" : true,
            },
            success: function(items) {
                console.log(items);
                populatePaymentMethods(items);
            },
            error : function(xhr)
            {

            },
        }
    );
}
function populatePaymentMethods(items)
{
    html = `<option value="0"> Choose.. </option>`;
    console.log(items);
    items.forEach(element => {
        console.log(element);
        html += `<option value="${element.paymentID}"> ${element.method} </option>`;
    });
    console.log(html);
    $("#paymentDdl").html(html);
}
function checkPurchaseForm()
{
    let success = true;
    let inputPhone = $("#tbPhoneNumber");
    let inputAddress = $("#tbAddress");
    let inputPayment = $("#paymentDdl");
    let phoneRegEx = /^[0-9]{9,15}$/;
    let addressRegEx = /^([A-zČĆĐŠŽčćđšž\.]+)(\s[A-zČĆĐŠŽčćđšž][a-zčćđšž]+)+\s?(([0-9\w]{2,4})|([0-9]+))$/;
    if(!phoneRegEx.test(inputPhone.val()))
        {
            removeHelperClass(inputPhone, "teal-text");
            addHelperClass(inputPhone, "red-text");
            success = false;
        }
    else
        {
            addHelperClass(inputPhone, "teal-text");
            removeHelperClass(inputPhone, "red-text");
        }
    if(!addressRegEx.test(inputAddress.val()))
        {
            removeHelperClass(inputAddress, "teal-text");
            addHelperClass(inputAddress, "red-text");
            success = false;
        }
    else
        {
            addHelperClass(inputAddress, "teal-text");
            removeHelperClass(inputAddress, "red-text");
        }
    if(inputPayment.val() == 0)
        {
            removeHelperClass(inputPayment, "teal-text");
            addHelperClass(inputPayment, "red-text");
            success = false;
        }
    else
        {
            addHelperClass(inputPayment, "teal-text");
            removeHelperClass(inputPayment, "red-text");
        }
   
    if(success)
    {
        let phoneNumber = inputPhone.val();
        let address = inputAddress.val();
        let paymentMethod = inputPayment.val();
        if(paymentMethod == 2)
        {
            $.ajax(
            {
                method : "POST",
                url : "models/purchase/confirmPurchaseForm.php",
                dataType : "text",
                data : {
                    "request" : true,
                    "address" : address,
                    "phoneNumber" : phoneNumber,
                    "paymentMethod" : paymentMethod,
                    "ccNumber" : ccNumber
                },
                success: function(message) {
                   alert(message);
                },
                error : function(xhr)
                {
                   
                },
            });
        }
        else
        {
             $.ajax(
            {
                method : "POST",
                url : "models/purchase/confirmPurchaseForm.php",
                dataType : "text",
                data : {
                    "request" : true,
                    "address" : address,
                    "phoneNumber" : phoneNumber,
                    "paymentMethod" : paymentMethod
                },
                success: function(message) {
                    alert(message);
                },
                error : function(xhr)
                {

                },
            });
        }
    }
}
function removeHelperClass(input, className)
{
    input.next().next().removeClass(className);
}
function addHelperClass(input, className)
{
    input.next().next().addClass(className);
}