$(document).ready(() => {
  let quantitySelectors = $('select#quantity');
  quantitySelectors.change((e) => {
    let changedSelector = $(e.target);
    let recId = changedSelector.closest('tr').attr('id');
    let quantity = changedSelector.val();
    let cartItemsContainer = changedSelector.closest('div.container');
    let cartItemsContainerId = cartItemsContainer.attr('id') 
    let url = '';
    if (cartItemsContainerId == 'provisional-cart-items') {
      url = '/provisional_cart_items/' + recId;
    } else if (cartItemsContainerId == 'cart-items') {
      url = '/cart_items/' + recId;
    }

    changedSelector.blur();

    $.ajax({
      url: url,
      type: 'PUT',
      data: 'quantity=' + quantity,
    });
  });
});