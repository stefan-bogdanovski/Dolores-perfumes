$(document).ready(function() {
    $("#ModelSignInConfirm").click(validateUser);
});

function validateUser()
{
    let success = true;
    let usernameTb = $("#tbUsernameSignIn");
    let passwordTb = $("#tbPasswordSignIn");
    let username = usernameTb.val();
    let password = passwordTb.val();
    let usernameRegEx = /^[A-Z]+[A-z0-9]{5,9}$/;
    let passwordRegEx = /^.{6,}$/;
    if(!usernameRegEx.test(username))
        {
            success = false;
            printMessage(usernameTb.next().next(), "Username is 6 to 10 characters long.");
        }
    else
        {
            printMessage(usernameTb.next().next(), "");
        }
    if(!passwordRegEx.test(password))
        {
            success = false;
            printMessage(passwordTb.next().next(), "Password is at least 6 characters long.");
        }
    else
        {
            printMessage(passwordTb.next().next(), "");
        }
    if(success)
        {
            $.ajax({
                method : "POST",
                dataType : "json",
                url : "models/users/sign_in.php",
                data : {
                    username : username,
                    pw : password,
                    request : true
                },
                success : function(code)
                {
                    if(code == 200)
                    {
                        location.reload();
                    }
                    if(code.includes("Invalid username"))
                    {
                        printMessage(usernameTb.next().next(), "Username doesn't meet our requirements.");
                    }
                    if(code.includes("Invalid password"))
                    {
                        printMessage(passwordTb.next().next(), "Password doesn't meet our requirements");
                    }
                    if(code.includes("Incorrect username"))
                    {
                        printMessage(usernameTb.next().next(), "Username does not exist.");
                    }
                    if(code.includes("Incorrect password"))
                    {
                        printMessage(passwordTb.next().next(), "Password is incorrect.");
                    }
                },
                error : function(xhr, status, error)
                {
                    console.log(xhr);
                }
            });
        }
}


function printMessage(input, message)
{
    input.html(message);
}