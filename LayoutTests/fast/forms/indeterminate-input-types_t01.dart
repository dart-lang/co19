/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for Bug: 76995 - Checks whether indeterminate property
 * works with various input types.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <form style="visibility: hidden">
          <input type="radio" id="radioInput">
          <input type="checkbox" id="checkboxInput">
          <input type="date" id="dateInput">
          <input type="email" id="emailInput">
          <input type="file" id="fileInput">
          <input type="number" id="numberInput">
          <input type="text" id="passwordInput">
          <input type="password" id="passwordInput">
          <input type="range" id="rangeInput">
          <input type="search" id="searchInput">
          <input type="submit" id="submitInput">
          <input type="tel" id="telInput">
          <input type="time" id="timeInput">
          <input type="url" id="urlInput">
          <input type="week" id="weekInput">
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  RadioButtonInputElement radioInput = document.getElementById("radioInput") as RadioButtonInputElement;
  radioInput.indeterminate = true;
  shouldBeTrue(radioInput.indeterminate);

  CheckboxInputElement checkboxInput = document.getElementById("checkboxInput") as CheckboxInputElement;
  checkboxInput.indeterminate = true;
  shouldBeTrue(checkboxInput.indeterminate);

  DateInputElement dateInput = document.getElementById("dateInput") as DateInputElement;
  dateInput.indeterminate = true;
  shouldBeTrue(dateInput.indeterminate);

  EmailInputElement emailInput = document.getElementById("emailInput") as EmailInputElement;
  emailInput.indeterminate = true;
  shouldBeTrue(emailInput.indeterminate);

  FileUploadInputElement fileInput = document.getElementById("fileInput") as FileUploadInputElement;
  fileInput.indeterminate = true;
  shouldBeTrue(fileInput.indeterminate);

  NumberInputElement numberInput = document.getElementById("numberInput") as NumberInputElement;
  numberInput.indeterminate = true;
  shouldBeTrue(numberInput.indeterminate);

  PasswordInputElement passwordInput = document.getElementById("passwordInput") as PasswordInputElement;
  passwordInput.indeterminate = true;
  shouldBeTrue(passwordInput.indeterminate);

  RangeInputElement rangeInput = document.getElementById("rangeInput") as RangeInputElement;
  rangeInput.indeterminate = true;
  shouldBeTrue(rangeInput.indeterminate);

  SearchInputElement searchInput = document.getElementById("searchInput") as SearchInputElement;
  searchInput.indeterminate = true;
  shouldBeTrue(searchInput.indeterminate);

  SubmitButtonInputElement submitInput = document.getElementById("submitInput") as SubmitButtonInputElement;
  submitInput.indeterminate = true;
  shouldBeTrue(submitInput.indeterminate);

  TelephoneInputElement telInput = document.getElementById("telInput") as TelephoneInputElement;
  telInput.indeterminate = true;
  shouldBeTrue(telInput.indeterminate);

  TimeInputElement timeInput = document.getElementById("timeInput") as TimeInputElement;
  timeInput.indeterminate = true;
  shouldBeTrue(timeInput.indeterminate);

  UrlInputElement urlInput = document.getElementById("urlInput") as UrlInputElement;
  urlInput.indeterminate = true;
  shouldBeTrue(urlInput.indeterminate);

  WeekInputElement weekInput = document.getElementById("weekInput") as WeekInputElement;
  weekInput.indeterminate = true;
  shouldBeTrue(weekInput.indeterminate);
}
