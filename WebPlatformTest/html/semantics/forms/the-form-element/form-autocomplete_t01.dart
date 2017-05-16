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
 * after web-platform-tests/html/semantics/forms/the-form-element/form-autocomplete.html
 * @assertion
 * <link rel=help href="http://www.w3.org/html/wg/drafts/html/master/#the-form-element">
 * <link rel=help href="http://www.w3.org/html/wg/drafts/html/master/#attr-fe-autocomplete">
 * @description form autocomplete attributes
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<form name="missing_attribute">
  <input>
  <input autocomplete="on">
  <input autocomplete="off">
  <input autocomplete="foobar">
</form>
<form name="autocomplete_on" autocomplete="on">
  <input>
  <input autocomplete="on">
  <input autocomplete="off">
  <input autocomplete="foobar">
</form>
<form name="autocomplete_off" autocomplete="off">
  <input>
  <input autocomplete="on">
  <input autocomplete="off">
  <input autocomplete="foobar">
</form>
<form name="autocomplete_invalid" autocomplete="foobar">
  <input>
  <input autocomplete="on">
  <input autocomplete="off">
  <input autocomplete="foobar">
</form>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  void autocompletetest(form, expectedValues, desc) {
    test((){
      assert_equals(form.autocomplete, expectedValues[0], "0");
      assert_equals(form.children[0].autocomplete, expectedValues[1], "1");
      assert_equals(form.children[1].autocomplete, expectedValues[2], "2");
      assert_equals(form.children[2].autocomplete, expectedValues[3], "3");
      assert_equals(form.children[3].autocomplete, expectedValues[4], "4");
    }, desc);
  }

  autocompletetest(document.getElementsByName("missing_attribute").first, ["on", "on", "on", "off", ""], "form autocomplete attribute missing");
  autocompletetest(document.getElementsByName("autocomplete_on").first, ["on", "on", "on", "off", ""], "form autocomplete attribute on");
  autocompletetest(document.getElementsByName("autocomplete_off").first, ["off", "off", "on", "off", ""], "form autocomplete attribute off");
  autocompletetest(document.getElementsByName("autocomplete_invalid").first, ["on", "on", "on", "off", ""], "form autocomplete attribute invalid");

  var keywords = [ "name", "honorific-prefix", "given-name", "additional-name", "family-name", "honorific-suffix", "nickname", "organization-title", "organization", "street-address", "address-line1", "address-line2", "address-line3", "locality", "region", "country", "country-name", "postal-code", "cc-name", "cc-given-name", "cc-additional-name", "cc-family-name", "cc-number", "cc-exp", "cc-exp-month", "cc-exp-year", "cc-csc", "cc-type", "language", "bday", "bday-day", "bday-month", "bday-year", "sex", "url", "photo", "tel", "tel-country-code", "tel-national", "tel-area-code", "tel-local", "tel-local-prefix", "tel-local-suffix", "tel-extension", "email", "impp" ];
  keywords.forEach((keyword) {
    test((){
      var input = document.createElement("input") as InputElement;
      input.setAttribute("autocomplete", keyword);
      assert_equals(input.autocomplete, keyword);
    }, keyword + " is an allowed autocomplete field name");
  });

  checkTestFailures();
}
