Kabir's Venmo Challenge
========================


### Overview

This application lets a user enter in a new (credit or debit) card for payments.  This application was made not just to fulfill the requirements (discussed below), but also to be portable and useable from the start.  I used open source frameworks and libraries for features that already have elegant solutions, but built many components by hand to showcase my technical chops that follow industry standards but conform to the Venmo design aesthetic.  I even tweaked some of Venmo's design patterns to show some of my own product thinking, and I look forward to hearing what the team thinks!

### Requirements (copied directly)

1. Your form should support the following networks:
 * Amex, Discover, JCB, MasterCard, Visa

#### The form should contain:
2. A number field
 * Prevent the user from entering more text if the first six digits don't match one of the networks above.
 * Prevent the user from entering too many digits.
  * American Express cards have 15 digit numbers.
  * MasterCard, Visa, Discover, and JCB credit and debit cards have 16 digit numbers.
3. A card logo
 * Show VDKGenericCard.png next to the text field when the field is empty.
 * Show the correct card logo when you've identified the card type.
4. An expiration date field
 * Prevent the user from entering an invalid expiration date.
5. A CVV field
 * Prevent the user from entering CVV that is too long.
 * Change the card logo to VDKCVV.png when the user is editing the CVV.
 * Prevent the user from entering too many digits.
  * American Express cards have 4 digit codes.
  * MasterCard, Visa, Discover, and JCB credit and debit cards have 3-digit codes.
6. A submit button
 * When the user taps submit, perform a Luhn validation on the card number.
 * If Luhn validation passes and all other fields are valid, show a "Success!" message. Otherwise, display a helpful error message.2. 
