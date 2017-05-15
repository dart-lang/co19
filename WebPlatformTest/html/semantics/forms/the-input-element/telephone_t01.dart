/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/forms/the-input-element/telephone.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/master/forms.html#telephone-state-(type=tel)
 * @description Input tel
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <h1>Input tel</h1>
    <input type="tel" id="novalue" />
    <input type="tel" id="value_with_LF" value="0&#x000A;1" />
    <input type="tel" id="value_with_CR" value="0&#x000D;1" />
    <input type="tel" id="value_with_CRLF" value="0&#x000A;&#x000D;1" />
    <div id="log">
    </div>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  var element = document.getElementById('novalue');
  
  test((){
  	assert_equals(element.type, 'tel');
  }, 'tel type supported on input element');
  
  test((){
  	element.value = '0\u000A1';
  	assert_equals(element.value, '01');
  }, 'User agents must not allow users to insert "LF" (U+000A)');
  
  test((){
  	element.value = '0\u000D1';
  	assert_equals(element.value, '01');
  }, 'User agents must not allow users to insert "CR" (U+000D)');

  element = document.getElementById('value_with_LF');
  
  test((){
  	assert_equals(element.value, '01');
  }, 'The value attribute, if specified, must have a value that contains no "LF" (U+000A)');

  element = document.getElementById('value_with_CR');
  
  test((){
  	assert_equals(element.value, '01');
  }, 'The value attribute, if specified, must have a value that contains no "CR" (U+000D)');

  test((){
  	element = document.getElementById('novalue');  	
  	element.value = '0\u000D\u000A1';
  	assert_equals(element.value, '01');

  	element = document.getElementById('value_with_CRLF');
  	assert_equals(element.value, '01');
  }, 'The value sanitization algorithm is as follows: Strip line breaks from the value');

  element = document.getElementById('novalue');
  
  test((){
  	element.value = '+811234';
  	assert_equals(element.value, '+811234');
  }, 'Element can accept the phone number with plus sign(country code)');
  
  test((){
  	element.value = '1234#5678';
  	assert_equals(element.value, '1234#5678');
  }, 'Element can accept the phone number with hash mark(extension number)');
  test((){
  	element.value = '123-456-789';
  	assert_equals(element.value, '123-456-789');
  }, 'Element can accept the phone number with hyphen');
  
  test((){
  	element.value = '123.456.789';
  	assert_equals(element.value, '123.456.789');
  }, 'Element can accept the phone number with dots');
  
  test((){
  	element.value = '1 23 4';
  	assert_equals(element.value, '1 23 4');
  }, 'Element can accept the phone number with whitespace');
  
  test((){
  	element.value = ' 1234 ';
  	assert_equals(element.value, ' 1234 ');
  }, 'Element can accept the phone number with leading & following whitespaces');
  
  test((){
  	element.value = '(03)12345678';
  	assert_equals(element.value, '(03)12345678');
  }, 'Element can accept the phone number with parentheses(area code)');

  checkTestFailures();
}
