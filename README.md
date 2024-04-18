# Simple Interest App v1.0

## Overview

Here we add validations to the form to check if a field is left empty or an invalid input was required.

The app allows users to calculate simple interest based on the principal amount, rate of interest, and term. 

Additionally, users can reset the input fields and dropdown selection to their initial state.

## Features Added
1. **Dropdown Selection**: Implemented a custom DropDownButton widget to select the currency for the calculation.
2. **Input Fields**: Users can input the principal amount, rate of interest, and term (in years) through text fields.
3. **Calculation**: Upon pressing the "Calculate" button, the app computes the total amount payable based on the provided inputs.
4. **Reset Functionality**: Added a "Reset" button to clear all input fields and reset the dropdown selection to its default value.

## Key Concepts Utilized
* **TextEditingController**: Used to control the input fields and retrieve their values for calculation.
* **Casting**: Employed casting to convert data types, such as parsing text input as double for numerical calculations.
* **Form Validation**: Implemented form validation to ensure that numeric values are entered into the principal, rate of interest, and term fields.

## Steps to implement form with validation
1. Create a form with a **GlobalKey**
2. Add **TextFormField** with a validation logic
3. Use button to validate and submit the form

## Project Structure
* **MoneyImageAsset.dart**: Contains the money image asset used in the app.
* **DropDownButton.dart**: Defines the custom dropdown button widget for currency selection.
* **SimpleInterestForm.dart**: Contains the main form widget for the simple interest calculator, including input fields, buttons, and form validation.

## How to Use
1. Enter the principal amount, rate of interest, and term in the respective text fields.
2. Select the desired currency from the dropdown menu.
3. Press the "Calculate" button to compute the total amount payable.
4. To reset the input fields and dropdown selection, click the "Reset" button.

## Next Steps
Future versions of the Simple Interest App could include enhancements such as:

1. Error handling for invalid input.
2. Support for additional currencies or currency conversion.
3. Integration with external APIs for real-time exchange rates.

##
**Here's the pictorial representation of the application:**

![alt text](<WhatsApp Image 2024-04-17 at 11.40.54_f30f4dcf.jpg>)
