# Exercise 9
### Author: Ramos, Quim Zyrelle L.
### Student Number: 2021-04091
### Section: B2L
---
## App Description
* A todo app with authentication capability.
* Authentication is managed by the Firebase.
* Text fields has validation whether it is not empty and email and password format are correct.

## Things done in the code
* To implement the first name and last name be stored in firebase, I created a new collection in the firebase that will collect user names as well as creating new model, new provider, and new firebase_api specified for usernames only.
* To implement validation to each text field, I put the textfields inside form and transformed them from textfield to textformfield as well as putting key.currentState.validate() method to prompt if there are any errors within the inputs before proceeding to the appropriate route.

## Challenge/s when developing the exercise
* I got stuck in connecting the app to the database in terms of usernames. It took me a long time to realize that the reason why when I sign up into the app, it does not reflect to the firebase is that the provider for username is not yet included in the main.dart.
* I was confused within the difference of textfield and textformfield, textformfield has the capability to validate inputs while textform has it, it is harder to implement thus took me some time to fixed the previous textfields be transformed to textformfield to attain the validation capacity.