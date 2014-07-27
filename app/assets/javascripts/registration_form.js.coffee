window.registration_form =
  events: ->

    $(".registration_form input").keypress registration_form.press_enter(event)

    $('.go_to_step_2').click registration_form.nextStep
    
    $(".registration_form").bootstrapValidator(
      message: "This value is not valid"
      feedbackIcons:
        valid: "glyphicon glyphicon-ok"
        invalid: "glyphicon glyphicon-remove"
        validating: "glyphicon glyphicon-refresh"

      fields:
        'user[password_confirmation]':
          message: "aewesdadsa"
          validators:
            identical:
              field: 'user[password]'
              message: "The password and its confirm are not the same"


        
    ).on "success.form.bv", (e) ->
      
      # Called when the form is valid
      $form = $(e.target)
      e.preventDefault()  if $form.data("remote") and $.rails isnt `undefined`

  # a.isValidContainer('#step1')

  current_tab: ->
    $('.nav.nav-wizard').children('li.active').children().first().attr('id')

  press_enter: (e) ->
    if event.keyCode is 13
      e.preventDefault()
      if current_tab() == 'step_1_tab'
        registration_form.nextstep()
      else
        $('.registration_form').submit()


  nextStep: ->

    form = $('.registration_form').data('bootstrapValidator')
    if form.isValidContainer('#step1')
      $('#step_2_tab').attr('data-toggle', 'tab')
      $('#step_2_tab').click()
    else
      alert "Please, fill the form correctly before continuing."

  start: ->
    registration_form.events()