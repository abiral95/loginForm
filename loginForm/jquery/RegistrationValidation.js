$(document).ready(function validateForm() {

    rules: {
        name: {
                required: true;
        };
        surname: {
                required: true;
                
        };
        username: {
            required: true;
            minlength: 5;
        }
        password: {
            required: true;

        }
    }



});