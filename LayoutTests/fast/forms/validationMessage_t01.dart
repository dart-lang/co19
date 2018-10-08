/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for validationMessage DOM property.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var form = document.createElement("form");
  document.body.append(form);

  // An input element with a pattern set and a mismatched value
  InputElement patternInput = document.createElement("input") as InputElement;
  patternInput.name = "patternInput";
  patternInput.pattern = "lorem ipsum";
  patternInput.value = "lorem";
  form.append(patternInput);
  debug("input patternMismatch: " + patternInput.validationMessage);

  // A required input with an empty value
  InputElement requiredInput = document.createElement("input") as InputElement;
  requiredInput.name = "requiredInput";
  requiredInput.required = true;
  form.append(requiredInput);
  debug("input valueMissing: " + requiredInput.validationMessage);

  // A required textarea with an empty value
  TextAreaElement requiredTextArea = document.createElement("textarea") as TextAreaElement;
  requiredTextArea.name = "requiredTextArea";
  requiredTextArea.required = true;
  form.append(requiredTextArea);
  debug("textarea valueMissing: " + requiredTextArea.validationMessage);

  // A required select with an empty value
  SelectElement requiredSelect = document.createElement("select") as SelectElement;
  requiredSelect.name = "requiredSelect";
  requiredSelect.required = true;
  form.append(requiredSelect);
  debug("select valueMissing: " + requiredSelect.validationMessage);

  // A type=email input for the "type mismatch" flag
  InputElement emailInput = document.createElement("input") as InputElement;
  emailInput.name = "emailInput";
  emailInput.type = "email";
  form.append(emailInput);
  emailInput.value = "incorrectValue";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "@xn--fsq.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "user@";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "user@example*.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  //emailInput.value = "user\uD83D\uDE47@example.com";
  emailInput.value = "user\u{1f647}@example.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "user${new String.fromCharCode(0xD800)}@example.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "user@.example.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "user@example.com.";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "user@xn--z8ja1psq..com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.multiple = true;
  emailInput.value = "foo@example.com,,bar@example.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = ",foo@example.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "foo@example.com,";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);
  emailInput.value = "foo@example.com,bar@..example.com";
  debug("input typeMismatch for " + emailInput.value + ": " + emailInput.validationMessage);

  InputElement numberInput = document.createElement("input") as InputElement;
  numberInput.type = "number";
  form.append(numberInput);
  numberInput.focus();
  document.execCommand("InsertText", false, "abc");
  document.execCommand("InsertText", false, "+++");
  debug("input badInput: " + numberInput.validationMessage);
  var nonRequiredBadInputMessage = numberInput.validationMessage;

  debug("badInput and valueMissing:");
  numberInput.required = true;
  shouldBe(numberInput.validationMessage, nonRequiredBadInputMessage);

  debug("stepMismatch:");
  numberInput.min = "0";
  numberInput.step = "0.1";
  numberInput.value = "0.11";
  debug("input stepMismatch: " + numberInput.validationMessage);
  numberInput.value = "0.19";
  debug("input stepMismatch: " + numberInput.validationMessage);
  numberInput.max = "10.02";
  numberInput.value = "10.01";
  debug("input stepMismatch: " + numberInput.validationMessage);

  debug("tooLong:");
  InputElement inputWithMax = document.createElement("input") as InputElement;
  inputWithMax.maxLength = 3;
  inputWithMax.value = "abcdef";
  document.body.append(inputWithMax);
  inputWithMax.focus();
  document.execCommand("delete", false, '');
  debug("input tooLong: " + inputWithMax.validationMessage);
  // fancyX should be treated as 3 characters.
  // U+0305 COMBINING OVERLINE
  // U+0332 COMBINING LOW LINE
  var fancyX = "x\u0305\u0332";
  inputWithMax.maxLength = 2;
  inputWithMax.value = fancyX + "X";
  inputWithMax.focus();
  inputWithMax.setSelectionRange(4, 4);
  document.execCommand("delete", false, '');
  debug("input tooLong: " + inputWithMax.validationMessage);
  // The following test might show English text + Arabic digits. It's expected and
  // it never happens in products.
  inputWithMax.lang = "ar-eg";
  debug("input tooLong: " + inputWithMax.validationMessage);

  TextAreaElement textarea = document.createElement("textarea") as TextAreaElement;
  document.body.append(textarea);
  textarea.focus();
  document.execCommand("inserttext", false, "a\nbc");
  textarea.maxLength = 3;
  debug("textarea tooLong: " + textarea.validationMessage);

  // A button can't be valited and, thus, has a blank validationMessage
  ButtonElement but = document.createElement("button") as ButtonElement;
  but.name = "button";
  form.append(but);
  shouldBe(but.validationMessage, '');

  // An input control with no name, so it can't be validated (willValidate = false)
  InputElement anoninput = document.createElement("input") as InputElement;
  form.append(anoninput);
  shouldBe(anoninput.validationMessage, '');

  // Fieldsets can't be validated
  FieldSetElement happyFieldset = document.createElement("fieldset") as FieldSetElement;
  happyFieldset.name = "fieldset";
  form.append(happyFieldset);
  shouldBe(happyFieldset.validationMessage, '');

  // Select controls can't be validated too
  SelectElement happySelect = document.createElement("select") as SelectElement;
  happySelect.name = "select";
  form.append(happySelect);
  shouldBe(happySelect.validationMessage, '');

  // Output elements can't be validated
  OutputElement happyOutput = document.createElement("output") as OutputElement;
  happySelect.name = "output";
  form.append(happyOutput);
  shouldBe(happyOutput.validationMessage, '');

  // Object elements can't be validated
  ObjectElement happyObject = document.createElement("object") as ObjectElement;
  happySelect.name = "object";
  form.append(happyObject);
  shouldBe(happyObject.validationMessage, '');

  form.remove();
}
