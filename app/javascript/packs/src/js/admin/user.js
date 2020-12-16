$(document).on('turbolinks:load', function() {
  $password = $("#user_password");
  $passwordConfirm = $("#user_password_confirmation");

  $(".btn-user-submit").attr("disabled", true);
  $passwordConfirm.on('change', function() {
    if($password.val() === $passwordConfirm.val() && $password.val().length >= 6) {
      $(".admin--user-form-error").attr("hidden", true);
      $(".btn-user-submit").attr("disabled", false);
    } else {
      $(".admin--user-form-error").attr("hidden", false);
      $(".admin--user-form-error").html('Must match with Password and more than 6 characters');
    }
  });
});
