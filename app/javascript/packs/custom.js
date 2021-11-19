$(document).on('turbolinks:load', function() {
//status dropdown
  $('body').on('change','#select', function() {
    status = $(this).val()
    $.ajax({
      method: "GET",
      url: "/admin/requests/filter_by_status",
      dataType: "script",
      data: { status: status}
    });
  })
  //category search
  $('#btn1').on("click",function (){
  	search = $('#text1').val()
  	$.ajax({
  		method: "GET",
  		url: "/student/dashboards/filter_by_search",
  		dataType: "script",
  		data: {search: search}
  	})
  });
  //dependent drop down

  // $("#drop2").prop("disabled", true); 
  $('#drop1').on("change",function () {
    drop1 = $(this).val()
    $.ajax({
      method: "GET",
      dataType: "json",
      data: {drop1: drop1 },
      url: "/student/dashboards/drop_down_filter",
      success: function(response){
        console.log(response);
        var books = response["books"];
        $("#ahsan").empty();
        $("#ahsan").append('<option>select subcategory</option>');
        for(var i = 0 ; i < books.length; i++) {
          $("#ahsan").append('<option value = "'+books[i]["id"] +'"> '+ books[i]["subcat"]+' </option>')
        }
      }
    });
  })
  $("#ahsan").on("change", function(){
    drop2 = $(this).val()
    $.ajax({
      method: "GET",
      dataType: "script",
      url: "/student/dashboards/drop_down_filter",
      data:{ drop2: drop2}
    });
  })
  //books search requests

  $("#btn2").on("click",function (){
    textfield = $('#text2').val()
    console.log(textfield)
    $.ajax({
      method: "GET",
      dataType: "script",
      data: {textfield: textfield},
      url: "/student/dashboards/show_books"
    })
  });
});