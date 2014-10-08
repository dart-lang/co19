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
import "../../../Utils/async_utils.dart";

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

  var radioInput = document.getElementById("radioInput");
  radioInput.indeterminate = true;
  shouldBeTrue(radioInput.indeterminate);

  var checkboxInput = document.getElementById("checkboxInput");
  checkboxInput.indeterminate = true;
  shouldBeTrue(checkboxInput.indeterminate);

  var dateInput = document.getElementById("dateInput");
  dateInput.indeterminate = true;
  shouldBeTrue(dateInput.indeterminate);

  var emailInput = document.getElementById("emailInput");
  emailInput.indeterminate = true;
  shouldBeTrue(emailInput.indeterminate);

  var fileInput = document.getElementById("fileInput");
  fileInput.indeterminate = true;
  shouldBeTrue(fileInput.indeterminate);

  var numberInput = document.getElementById("numberInput");
  numberInput.indeterminate = true;
  shouldBeTrue(numberInput.indeterminate);

  var passwordInput = document.getElementById("passwordInput");
  passwordInput.indeterminate = true;
  shouldBeTrue(passwordInput.indeterminate);

  var rangeInput = document.getElementById("rangeInput");
  rangeInput.indeterminate = true;
  shouldBeTrue(rangeInput.indeterminate);

  var searchInput = document.getElementById("searchInput");
  searchInput.indeterminate = true;
  shouldBeTrue(searchInput.indeterminate);

  var submitInput = document.getElementById("submitInput");
  submitInput.indeterminate = true;
  shouldBeTrue(submitInput.indeterminate);

  var telInput = document.getElementById("telInput");
  telInput.indeterminate = true;
  shouldBeTrue(telInput.indeterminate);

  var timeInput = document.getElementById("timeInput");
  timeInput.indeterminate = true;
  shouldBeTrue(timeInput.indeterminate);

  var urlInput = document.getElementById("urlInput");
  urlInput.indeterminate = true;
  shouldBeTrue(urlInput.indeterminate);

  var weekInput = document.getElementById("weekInput");
  weekInput.indeterminate = true;
  shouldBeTrue(weekInput.indeterminate);
}
