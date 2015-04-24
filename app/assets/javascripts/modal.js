$(function() {
 dialog = $( "#product-modal" ).dialog({
  autoOpen: false,
  height: 570,
  width: 570,
  modal: true,
  buttons: {

    Cancel: function() {
      dialog.dialog( "close" );
    }
  },
  close: function() {
    form[ 0 ].reset();
  }
});
 $( "#create-product" ).button().on( "click", function() {
  dialog.dialog( "open" );
});
});