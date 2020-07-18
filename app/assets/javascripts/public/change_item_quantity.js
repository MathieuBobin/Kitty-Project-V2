$(document).ready(() => {
  let quantitySelectors = $('select#quantity');
  quantitySelectors.change((e) => {
    let changedSelector = $(e.target);
    let itemId = changedSelector.closest('tr').attr('id');
    let quantity = changedSelector.val();
    let url = '/provisional_cart_items/' + itemId;
    $.ajax({
      url: url,
      type: 'PUT',
      data: 'quantity=' + quantity,
      success: () => {

      },
      error: (error) => {

      }
    });
  });
});