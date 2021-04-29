$(document).ready(function()
{
    getBrands();
});
function getBrands()
{
  $.ajax(
    {
      method : "POST",
      url : "models/products/getBrands.php",
      dataType: "json",
      contentType: "application/json",
      data : {
        "request" : true
      },
      success : function(brands)
      {
        populateBrands(brands);
      },
      error : function(xhr, status, error)
      {
        console.log(xhr);
      }
    }
  );
}

function populateBrands(items)
{
  let html = ``;
  items.forEach(element => {
    html+= `<div class="checkboxWrapper">
    <label for="${element.brand_name}"> ${element.brand_name} </label><input type="checkbox" value="${element.brandID}" id="${element.brand_name}" name="brand[]"/>
    </div>`;
  });
  document.querySelector("#brands").innerHTML += html;
}
