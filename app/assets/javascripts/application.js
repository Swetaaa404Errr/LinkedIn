import "@hotwired/turbo-rails";
import "controllers";
import Rails from "@rails/ujs";
Rails.start();
require("@rails/ujs").start();

$(document).ready(function() {
  var counter = 0;
  $('.book-select-check').on('click', function(){
    if($(this).prop('checked')) {
      counter += 1;
      $("#delete-books").text(`Delete ${pluralize(counter, 'Book')}`);
      $("#delete-books").show();
    } else {
      counter -= 1;
      $("#delete-books").text(`Delete ${pluralize(counter, 'Book')}`);
      if(counter <= 0) {
        $("#delete-books").hide();
      }
    }
  });