/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the behavior of .formaction, .formenctype, .formmethod
 * and .formtarget of HTMLInputElement and HTMLButtonElement.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');

  debug('Ordinary values for input:');
  input.type = "submit";
  shouldBeEqualToString(input.formAction, '');
  shouldBeEqualToString(input.formEnctype, '');
  shouldBeEqualToString(input.formMethod, '');
  shouldBeEqualToString(input.formTarget, '');

  input.setAttribute('formAction', 'http://localhost');
  shouldBeEqualToString(input.formAction, 'http://localhost/');
  input.setAttribute('formAction', 'http://localhost/');
  shouldBeEqualToString(input.formAction, 'http://localhost/');
  input.setAttribute('formEnctype', 'text/plain');
  shouldBeEqualToString(input.formEnctype, 'text/plain');
  input.setAttribute('formEnctype', 'na');
  shouldBeEqualToString(input.formEnctype, 'application/x-www-form-urlencoded');
  input.setAttribute('formMethod', 'GET');
  shouldBeEqualToString(input.formMethod, 'get');
  input.setAttribute('formMethod', 'ni');
  shouldBeEqualToString(input.formMethod, 'get');
  input.setAttribute('formTarget', '_blank');
  shouldBeEqualToString(input.formTarget, '_blank');
  input.setAttribute('formTarget', 'nu');
  shouldBeEqualToString(input.formTarget, 'nu');

  input.formAction = 'http://example.com';
  shouldBeEqualToString(input.formAction, 'http://example.com/');
  input.formAction = 'http://example.com/';
  shouldBeEqualToString(input.formAction, 'http://example.com/');
  input.formEnctype = 'text/plain';
  shouldBeEqualToString(input.formEnctype, 'text/plain');
  input.formEnctype = 'nota';
  shouldBeEqualToString(input.formEnctype, 'application/x-www-form-urlencoded');
  input.formMethod = 'POST';
  shouldBeEqualToString(input.formMethod, 'post');
  input.formMethod = 'neta';
  shouldBeEqualToString(input.formMethod, 'get');
  input.formTarget = 'http://example.com';
  shouldBeEqualToString(input.formTarget, 'http://example.com');
  input.formTarget = 'nta';
  shouldBeEqualToString(input.formTarget, 'nta');


  var button = document.createElement('button');
  debug('');
  debug('Ordinary values for button:');
  button.type = "submit";
  shouldBeEqualToString(button.formAction, '');
  shouldBeEqualToString(button.formEnctype, '');
  shouldBeEqualToString(button.formMethod, '');
  shouldBeEqualToString(button.formTarget, '');

  button.setAttribute('formAction', 'http://localhost');
  shouldBeEqualToString(button.formAction, 'http://localhost/');
  button.setAttribute('formAction', 'http://localhost/');
  shouldBeEqualToString(button.formAction, 'http://localhost/');
  button.setAttribute('formEnctype', 'text/plain');
  shouldBeEqualToString(button.formEnctype, 'text/plain');
  button.setAttribute('formEnctype', 'na');
  shouldBeEqualToString(button.formEnctype, 'application/x-www-form-urlencoded');
  button.setAttribute('formMethod', 'GET');
  shouldBeEqualToString(button.formMethod, 'get');
  button.setAttribute('formMethod', 'na');
  shouldBeEqualToString(button.formMethod, 'get');
  button.setAttribute('formTarget', '_blank');
  shouldBeEqualToString(button.formTarget, '_blank');
  button.setAttribute('formTarget', 'na');
  shouldBeEqualToString(button.formTarget, 'na');

  button.formAction = 'http://example.com';
  shouldBeEqualToString(button.formAction, 'http://example.com/');
  button.formAction = 'http://example.com/';
  shouldBeEqualToString(button.formAction, 'http://example.com/');
  button.formEnctype = 'text/plain';
  shouldBeEqualToString(button.formEnctype, 'text/plain');
  button.formEnctype = 'nota';
  shouldBeEqualToString(button.formEnctype, 'application/x-www-form-urlencoded');
  button.formMethod = 'POST';
  shouldBeEqualToString(button.formMethod, 'post');
  button.formMethod = 'nota';
  shouldBeEqualToString(button.formMethod, 'get');
  button.formTarget = 'http://example.com';
  shouldBeEqualToString(button.formTarget, 'http://example.com');
  button.formTarget = 'nota';
  shouldBeEqualToString(button.formTarget, 'nota');
}
