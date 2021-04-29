$(document).ready(function()
{
    //alert("Cao");
    $("#ModelRegisterConfirm").click(CheckUserRegistration);
});

function CheckUserRegistration()
{
    let success = true;
    let usernameTb = $("#tbUsernameReg");
    let passwordTb = $("#tbPasswordReg");
    let emailTb = $("#tbEmailReg");
    let username = $("#tbUsernameReg").val();
    let password = $("#tbPasswordReg").val();
    let email = $("#tbEmailReg").val();
    //console.log(username, password, email);
    let usernameRegEx = /^[A-Z]+[A-z0-9]{5,9}$/;
    let passwordRegEx = /^.{6,}$/;
    let emailRegEx = /^[a-z]+[0-9a-z\.]*@[a-z]{2,10}(\.[a-z]{2,10})+$/;
    if(!usernameRegEx.test(username))
        {
            removeHelperClass(usernameTb, "teal-text");
            addHelperClass(usernameTb, "red-text");
            success = false;
        }
    else
        {
            addHelperClass(usernameTb, "teal-text");
            removeHelperClass(usernameTb, "red-text");
        }
    if(!passwordRegEx.test(password))
        {
            removeHelperClass(passwordTb, "teal-text");
            addHelperClass(passwordTb, "red-text");
            success = false;
        }
    else
        {
            addHelperClass(passwordTb, "teal-text");
            removeHelperClass(passwordTb, "red-text");
        }
    if(!emailRegEx.test(email))
        {
            removeHelperClass(emailTb, "teal-text");
            addHelperClass(emailTb, "red-text");
            success = false;
        }
    else
        {
            addHelperClass(emailTb, "teal-text");
            removeHelperClass(emailTb, "red-text");
        }
    if(success)
    {
        $.ajax(
            {
                method : "POST",
                dataType : "json",
                url : "models/users/register.php",
                data : {
                    username : username,
                    password : password,
                    email : email,
                    request : success
                },
                success : function(code)
                {
                    if(code == 200)
                        {
                            location.reload();
                            alert("Account successfully created.");
                        }
                    if (code.includes("Invalid username"))
                        {
                            removeHelperClass(usernameTb, "teal-text");
                            addHelperClass(usernameTb, "red-text");
                        }
                    else
                        {
                            addHelperClass(usernameTb, "teal-text");
                            removeHelperClass(usernameTb, "red-text");
                        }
                    if(code.includes("Already member"))
                        {
                            alert("Account with same username already exists.");
                            addHelperClass(usernameTb, "red-text");
                            removeHelperClass(usernameTb, "teal-text");
                        }
                    if (code.includes("Invalid password"))
                        {
                            removeHelperClass(passwordTb, "teal-text");
                            addHelperClass(passwordTb, "red-text");
                        }
                    else
                        {
                            addHelperClass(passwordTb, "teal-text");
                            removeHelperClass(passwordTb, "red-text");
                        }
                    if (code.includes("Invalid email"))
                        {
                            removeHelperClass(emailTb, "teal-text");
                            addHelperClass(emailTb, "red-text");
                        }
                    else
                        {
                            removeHelperClass(emailTb, "red-text");
                            addHelperClass(emailTb, "teal-text");
                        }
                },
                error : function(xhr, status, error)
                {
                    console.log(xhr);
                }
            }
        )
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