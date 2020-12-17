const questionForm = "<hr class='solid'><div class='form-inputs'>"
  + " <div class='row'>"
   + " <div class='col-11'>"
    +" <input"
       + " class='form-control is-valid string email required' "
        +" autofocus='autofocus' required='required'"
       +" aria-required='true' type='text'"
       +" name='question[][label]'"
       +" placeholder='Give the question a label here...'"
    +"  />"
   +" </div>"
    +" <div class='col-1'>"
      + " <button type='button' class='btn btn-danger'>Delete</button> "
   + " </div>"
  +" </div>"
  +" <div class='row pt-3'>"
    +" <div class='col-12'>"
      +" <textarea"
        + " class='form-control is-valid string email required' "
        + "autofocus='autofocus' required='required'"
        + "aria-required='true' type='text'"
        +"name='question[][description]'"
      + ">"
     + " </textarea>"
   + " </div>"
 + " </div>"
+ "</div>";


$(document).on('turbolinks:load', function() {
  $addMoreQuestionBtn = $(".admin--quiz-more-question-button");
  $questionArea = $(".admin--quiz-more-questions-area");
  let questionFormCount = 1;

  $addMoreQuestionBtn.on('click', function() {   
    console.log(questionFormCount++);
    $questionArea.append(questionForm);
  });
});


