$(document).ready(() => {
  $("#category").change(() => {
    let category_id = $("#category").val();
    let url = "/categories/" + category_id + "/items";
    if (category_id == '') {
      url = '/items';
    }

    const Http = new XMLHttpRequest();
    Http.open("GET", url, true);
    Http.send();

    Http.onreadystatechange = (e) => {
      result = Http.responseText;
      console.log(result)
      $('div#items-container').remove(); 
      let items_container = $(result).filter('div#items-container');
      $('#category_selector').after(items_container);
    }
  });
});