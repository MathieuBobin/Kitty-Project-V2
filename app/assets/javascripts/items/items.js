$(document).ready(() => {
  $("#category").change(() => {
    let category_id = $("#category").val();
    let url = "/items";
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'html',
      data: { category_id: category_id },
      success: (result) => {
        $('#items_container').remove(); 
        let items_container = $(result).filter('#items_container')[0];
        $('#category_selector').after(items_container);
      },
      error: (error) => {
        console.log(error);
      }
    });
  });
});