
$(function(){
  the_refresh_list();
  //refresh the feed every 10 seconds
  setInterval(the_refresh_list, 10000);

  // mobile version menu pop-up
  $("#side-list").on('click',function () {
    if ($(".myLinks").css("height") == "210px") {
      $(".myLinks").css("height","0");
        $("#side-list").attr("aria-expanded","false");
    }else{
      $(".myLinks").css("height","210px");
      $("#side-list").attr("aria-expanded","true");
    }
  });

  if ($("header").css("width") >= "969px"){
      $(".myLinks").css("height","0");
      console.log("collapsed");
  }




  $('form').submit(function(event){

    event.preventDefault();
    $whichPost = $(this).parent().parent().attr("id");

    // TODO use AJAX post request to submit data.
    var currentComment = $(this).serialize();

    // adding the post id with the form data
    currentComment += "&whichPost=" + $whichPost;
    console.log(currentComment);

    // post request
    $.post("ajaxFunctionality.php",currentComment).done(function(data) {
      if (data == "false") {
        $("#" + $whichPost + " #error_format").empty().append(
          "Please fill out all fields with correct email address format. e.g. jordan@gmail.com"
        )
      }else {
        $("#" + $whichPost + " #error_format").empty();
        the_refresh_list();
        $(this).trigger("reset");
      }
    });

    the_refresh_list();
    $(this).trigger("reset");


  });

  function the_refresh_list() {

    $.get('ajaxFunctionality.php',{ps:" "})
    .done(function(data) {
      let collectionOfposts = JSON.parse(data);
      collectionOfposts.forEach(function(currentPID) {
        the_new_comment(currentPID.id);
      })
    }).fail(
      function (error) {
        console.log(error);
      }
    );

  }

// a function to display all the comments with particular id
  function the_new_comment(id) {
    $('#' + id + ' .database-comments').empty();

    $.get('ajaxFunctionality.php',{id:id})
    .done(function(data) {
      let allPosts = JSON.parse(data);

      allPosts.forEach(function(currentP) {
        $('#'+id+' .database-comments').append(
          $('<div class=user-comment>').append(
            $('<div class=comm>').append(
              $('<p>').text(currentP.comment)
            ) ,

            $('<div class=name>').append(
              $('<p>').text("By ").append($('<a href="mailto:'+ currentP.email +'">').text(currentP.name),
              $('<p>').append(currentP.date))
            )
          )
        );

      })
    }).fail(function(error) {
      console.log(error);
    });
  }

});
