$( document ).ready(function() {

  $("#indexingForm").validate({
    rules: {
      urls: {
        required: true,
      },
    }
  });

});
