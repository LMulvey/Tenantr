$(document).ready(function() {
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    //Is there a form submission?
    $("#form-submit-btn").click(function(event) {
        event.preventDefault();
        $('intput[type=submit]').prop('disabled', true);
        var error = false;
        var ccNum = $('#card_number').val(),
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('#card_year').val();
            
        if (!error) {
            // Get Stripe token:
            Stripe.createToken({
                number: ccNum,
                cvc: cvcNum,
                exp_month: expMonth,
                exp_year: expYear
            }, stripeResponseHandler);
        }
        return false;
    }); // form submissions
    
    function stripeResponseHandler(status, response) {
        // Get a reference for the form.
        var f = $("#new_user");
        
        // Get the token
        var token = response.id;
        
        // Add the token to the form
        f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
        
        // Submit the form
        f.get(0).submit();
    }
    
});