/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for validationMessage IDL attribute for <input type=date>
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var parent = document.createElement('div');
  document.body.append(parent);
  parent.innerHtml = '<input type=date id=date maxlength=1 pattern=x>';
  InputElement input = document.getElementById('date') as InputElement;

  String testIt(String value, String min, String max, [String step='']) {
    input.setAttribute("max", max);
    input.setAttribute("min", min);
    input.setAttribute("step", step);
    input.setAttribute("value", value);
    return input.validationMessage;
  }

  debug('No message');
  shouldBeEqualToString(testIt("", "", ""), '');

  debug('Value missing');
  input.setAttribute("required", "");
  shouldBeEqualToString(testIt("", "", ""), 'Please fill out this field.');
  input.attributes.remove("required");

  debug('Type mismatch');
  shouldBeEqualToString(testIt("foo", "", ""), '');

  debug('Range overflow');
  shouldBeEqualToString(testIt("1982-11-02", "", "1970-12-31"), 'Value must be 12/31/1970 or earlier.');

  debug('Range underflow');
  shouldBeEqualToString(testIt("1982-11-02", "1990-05-25", "1990-12-24"), 'Value must be 05/25/1990 or later.');

  debug('Step mismatch');
  shouldBeEqualToString(testIt("1982-11-02", "1982-01-01", "", "123"), 'Please enter a valid value. The two nearest valid values are 09/04/1982 and 01/05/1983.');
}
