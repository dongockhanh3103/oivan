function questionForm(id) {
  return `<hr class='solid divide-line--${id} '>`
  + `<div class='form-inputs question-form--${id}'>`
    + ` <div class='row'>`
    + " <div class='col-11'>"
      +" <input"
        + " class='form-control is-valid string email required' "
          +" autofocus='autofocus' required='required'"
        +" aria-required='true' type='text'"
        +" name='questions[][label]'"
        +" placeholder='Give the question a label here...'"
      +"  />"
    +" </div>"
      +" <div class='col-1'>"
        + ` <button type='button' class='btn btn-danger' id='delete-quiz--${id}'>Delete</button> `
    + " </div>"
    +" </div>"
    +" <div class='row pt-3 pb-2'>"
      +" <div class='col-12'>"
        +" <textarea"
          + " class='form-control is-valid string email required' "
          + "autofocus='autofocus' required='required'"
          + "aria-required='true' type='text'"
          +"name='questions[][description]'"
        + ">"
      + " </textarea>"
    + " </div>"
  + " </div> "
  + `<div class='options-place--question-${id}' ></div>`
  + ` <button type='button' class='btn btn-primary' id='more-option--${id}'>More options</button>`
  + "</div>"
};

function optionForm(questionId, id) {
  return `<div class='row option--form-question-${questionId}--${id} pb-2'>`
  + `<div class='col-1'>${id+1}</div>`
  + "<div class='col-8 left'>"
    + "<input "
    +   "class='form-control is-valid string email required'"
    +   "autofocus='autofocus' required='required'"
    +   "aria-required='true' type='text'"
    +   "name='questions[][answers][][content]'"
    +   "placeholder='Give the answer here...'"
    + "/>"
  + "</div>"
  + "<div class='col-2 pt-2'>"
    + `<label><input class='checkbox--question-${questionId}--${id}' type='checkbox' name='questions[][answers][][correct]'>&nbsp;Correct Answer</label>`
  + "</div>"
  + "<div class='col-1'>"
    + `<button type='button' class='btn btn-danger' id='delete-option--${questionId}--${id}'>Delete</button>`
  + "</div>"
+ "</div>"
}


$(document).on('turbolinks:load', function() {
  $addMoreQuestionBtn = $(".admin--quiz-more-question-button");
  $questionArea = $(".admin--quiz-more-questions-area");
  let questionFormCount = 1;
  let questionState = {}

  $addMoreQuestionBtn.on('click', function() {   
    $questionArea.append(questionForm(questionFormCount));
    // Init Question with key is the index and value is number of option
    questionState[questionFormCount] = 0;
    // Example: {"1": 0}
    questionFormCount++;
  });

  $questionArea.on('click', "button[id^='delete-quiz--']", function(e) {
    const id = e.target.id.split('--')[1];

    $(`.question-form--${id}`).remove();
    $(`.divide-line--${id}`).remove();
  });

  $questionArea.on('click', "button[id^='more-option--']", function(e) {
    const questionId = e.target.id.split('--')[1];
    const id = questionState[questionId]++;

    $(`.options-place--question-${questionId}`).append(optionForm(questionId, id));
    if(id === 0) $(`.checkbox--question-${questionId}--${id}`).attr('checked','checked');
  });

  $questionArea.on('click', "button[id^='delete-option--']", function(e) {
    const idElement = e.target.id;
    const questionId = idElement.split('--')[1];
    const id = idElement.split('--')[2];

    $(`.option--form-question-${questionId}--${id}`).remove();
  });

});