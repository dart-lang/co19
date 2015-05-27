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
 * after web-platform-tests/html/semantics/forms/attributes-common-to-form-controls/formAction_document_address.html
 * @assertion On getting the formAction IDL attribute, when the content attribute is
 * missing or its value is the empty string, the document's address must be returned instead.
 *   <link rel="help" href="http://www.w3.org/TR/html5/forms.html#dom-fs-formaction">
 *   <link rel="help" href="http://www.w3.org/TR/html5/dom.html#the-document's-address">
 *   <link rel="help" href="http://www.w3.org/TR/html5/forms.html#the-button-element">
 *   <link rel="help" href="http://www.w3.org/TR/html5/forms.html#the-input-element">
 * @description formAction_document_address  
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <div id="missing" style="display:none">
      <button type="submit">Submit</button>
      <input type="submit">
    </div>

    <div id="empty_string" style="display:none">
      <button type="submit" formaction="">Submit</button>
      <input type="submit" formaction="">
    </div>

    <div id="no_assigned_value" style="display:none">
      <button type="submit" formaction>Submit</button>
      <input type="submit" formaction>
    </div>
''';

void main() {
      document.body.appendHtml(htmlEL);
      
      // formaction content attribute is missing
      test(() {
        var formAction = document.querySelector('#missing button').formAction;
        var address = window.location.href;
        assert_equals(formAction, address);
      }, "Check if button.formAction is the document's address when formaction content attribute is missing");

      test(() {
        var formAction = document.querySelector('#missing input').formAction;
        var address = window.location.href;
        assert_equals(formAction, address);
      }, "Check if input.formAction is the document's address when formaction content attribute is missing");

      // formaction content attribute value is empty string
      test(() {
        var formAction = document.querySelector('#empty_string button').formAction;
        var address = window.location.href;
        assert_equals(formAction, address);
      }, "Check if button.formAction is the document's address when formaction content attribute value is empty string");

      test(() {
        var formAction = document.querySelector('#empty_string input').formAction;
        var address = window.location.href;
        assert_equals(formAction, address);
      }, "Check if input.formAction is the document's address when formaction content attribute value is empty string");

      // formaction content attribute value is not assigned, just for comparison with empty string above
      test(() {
        var formAction = document.querySelector('#no_assigned_value button').formAction;
        var address = window.location.href;
        assert_equals(formAction, address);
      }, "Check if button.formAction is the document's address when formaction content attribute value is not assigned");

      test(() {
        var formAction = document.querySelector('#no_assigned_value input').formAction;
        var address = window.location.href;
        assert_equals(formAction, address);
      }, "Check if input.formAction is the document's address when formaction content attribute value is not assigned");
  
   checkTestFailures();
}
