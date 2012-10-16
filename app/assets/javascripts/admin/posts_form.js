//= require select2.js
//= require jquery.uniform.min
$(function() {
  $('#post_category_input select').uniform();
  $('#post_tag_list').select2({tags: []});
});
