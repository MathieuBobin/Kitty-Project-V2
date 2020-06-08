$(document).ready(() => {
  $("#category").change(() => {
    let category_id = $("#category").val();
    let url = "/categories/" + category_id + "/items";
    if (category_id == '') {
      url = '/items';
    }
    // $.ajax({
    //   url: url,
    //   type: 'GET',
    //   dataType: 'html',
    //   data: { category_id: category_id },
    //   success: (result) => {
    //     $('#items_container').remove(); 
    //     let items_container = $(result).filter('#items_container')[0];
    //     $('#category_selector').after(items_container);
    //   },
    //   error: (error) => {
    //     console.log(error);
    //   }
    // });

    const Http = new XMLHttpRequest();
    Http.open("GET", url, true);
    Http.send();

    Http.onreadystatechange = (e) => {
      result = Http.responseText;
      console.log(result);
      $('#items_container').remove(); 
      let items_container = $(result).filter('#items_container')[0];
      $('#category_selector').after(items_container);
    }
  });
});