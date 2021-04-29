$(document).ready(function()
{
    getAllProducts();
    $('#sortPriceDdl').change(sortProducts);
    $('body').on('change', 'input[name="brand[]"]', filterProductsByBrand);
});

function getAllProducts(brands, page)
{
  $.ajax(
    {
      method : "post",
      url : "models/products/getAllProducts.php",
      dataType : "JSON",
      contentType : "application/json",
      data : {
        request : true,
        brand : brands,
        page : page
      },
      success : function(items)
      {
        populateProducts(items);
      },
      error : function(xhr, error, status)
      {
        console.log(xhr, error, status);
      }
    }
  );
}

function populateProducts(items)
{
  html = ``;
  items.forEach(element => {
    html += `
    <div class="col s6 m4 l3">
    <div class="card medium">
      <div class="card-image">
        <a href="index.php?id=${element.perfume_type_category_sizeID}">
        <img src="${element.src_normal}" class="responsive-img"/>
        </a>
      </div>
      <div class="card-content center-align card_padding">
          <h6 > <a href="index.php?id=${element.perfume_type_category_sizeID}" class="black-text text-bold"> ${element.perfume_name}  </a> </h6>
          <h6>${element.type_name}</h6>
          <span class="productPrice"> ${element.currency}${element.price} </span>
          <br/>
          <span class="productVolume"> ${element.value}${element.measurement_unit} </span>
      </div>
      <div class="card-action center-align">
        <a href="index.php?id=${element.perfume_type_category_sizeID}" class="grey-text darken-2">Show more</a>
      </div>
    </div>
  </div>`;
  });
  document.querySelector("#products").innerHTML = html;
}

function sortProducts()
{
    let sort = $(this).val();
    let checkboxes = $('input[name="brand[]"]');
    let checked = [];
    for(let i = 0; i < checkboxes.length; i++)
    {
        if(checkboxes[i].checked)
        {
            checked.push(checkboxes[i].value);
        }
    }
    console.log(checked);
    if(checked.length)
    {
         $.ajax(
            {
            method : "post",
            url : "models/products/sortProducts.php",
            dataType : "json",
            data : {
                request : true,
                sort : sort,
                brand : checked,
            },
            success : function(items)
            {
                populateProducts(items);
            },
            error : function(xhr, error, status)
            {
                console.log(xhr, error, status);
            }
            }
        );
    }
    else
    {
        $.ajax(
            {
            method : "post",
            url : "models/products/sortProducts.php",
            dataType : "json",
            data : {
                request : true,
                sort : sort
            },
            success : function(items)
            {
                populateProducts(items);
            },
            error : function(xhr, error, status)
            {
                console.log(xhr, error, status);
            }
            }
        );
    }
   
}
function filterProductsByBrand()
{
    let checkboxes = $('input[name="brand[]"]');
    //console.log(checkboxes);
    let checked = [];
    //console.log(checkboxes.length);
    for(let i = 0; i < checkboxes.length; i++)
    {
        if(checkboxes[i].checked)
        {
            checked.push(checkboxes[i].value);
        }
    }
    console.log(checked);
    let sort = $('#sortPriceDdl').val();
    if(checked.length && sort == 0)
    {
         $.ajax(
            {
            method : "post",
            url : "models/products/filterProductsByBrand.php",
            dataType : "json",
            data : {
                request : true,
                brand : checked
            },
            success : function(items)
            {
              populateProducts(items);
            },
            error : function(xhr, error, status)
            {
                console.log(xhr, error, status);
            }
            }
        );
    }
    else if(sort != 0 && checked.length)
    {
        $.ajax(
            {
            method : "post",
            url : "models/products/filterProductsByBrand.php",
            dataType : "json",
            data : {
                request : true,
                sort : sort,
                brand : checked
            },
            success : function(items)
            {
                populateProducts(items);
            },
            error : function(xhr, error, status)
            {
                console.log(xhr, error, status);
            }
            }
        );
    }
    else
    {
        $.ajax(
            {
            method : "post",
            url : "models/products/sortProducts.php",
            dataType : "json",
            data : {
                request : true,
                sort : sort
            },
            success : function(items)
            {
                populateProducts(items);
            },
            error : function(xhr, error, status)
            {
                console.log(xhr, error, status);
            }
            }
        );
    }
   
}