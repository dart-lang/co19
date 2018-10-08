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
 * after web-platform-tests/html/semantics/forms/the-fieldset-element/disabled.html
 * @assertion
 *  <link rel="help" href="http://www.whatwg.org/html/#the-fieldset-element">
 * @description Fieldset disabled
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<form>
  <fieldset id=fs disabled>
    <legend>
      <input type=checkbox id=clubc_l1>
      <input type=radio id=clubr_l1>
      <input type=text id=clubt_l1>
    </legend>
    <legend><input type=checkbox id=club_l2></legend>
    <p><label>Name on card: <input id=clubname required></label></p>
    <p><label>Card number: <input id=clubnum required pattern="[-0-9]+"></label></p>
  </fieldset>
  <fieldset id=fs2 disabled>
    <p><legend><input type=checkbox id=club2></legend></p>
    <p><label>Name on card: <input id=clubname2 required></label></p>
    <p><label>Card number: <input id=clubnum2 required pattern="[-0-9]+"></label></p>
  </fieldset>
  <fieldset id=fs3 disabled>
    <fieldset>
      <legend><input type=checkbox id=club3></legend>
    </fieldset>
    <p><label>Name on card: <input id=clubname3 required></label></p>
    <p><label>Card number: <input id=clubnum3 required pattern="[-0-9]+"></label></p>
  </fieldset>
  <fieldset id=fs4 disabled>
    <legend>
      <fieldset><input type=checkbox id=club4></fieldset>
    </legend>
    <p><label>Name on card: <input id=clubname4 required></label></p>
    <p><label>Card number: <input id=clubnum4 required pattern="[-0-9]+"></label></p>
  </fieldset>
</form>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

  test( () {
    assert_true((document.getElementById('fs') as FieldSetElement).disabled,
        "The fieldset is disabled");
    assert_false((document.getElementById('clubname') as InputElement).willValidate, 
        "fieldset is disabled so is input 'clubname'");
    assert_false((document.getElementById('clubnum') as InputElement).willValidate, 
        "fieldset is disabled so is input 'clubnum'");
    assert_true((document.getElementById('clubc_l1') as InputElement).willValidate,
        "input 'clubc_l1' is descendant of the first legend child of the fieldset. It should not be disabled");
    assert_true((document.getElementById('clubr_l1') as InputElement).willValidate,
        "input 'clubr_l1' is descendant of the first legend child of the fieldset. It should not be disabled");
    assert_true((document.getElementById('clubt_l1') as InputElement).willValidate,
        "input 'clubt_l1' is descendant of the first legend child of the fieldset. It should not be disabled");
    assert_false((document.getElementById('club_l2') as InputElement).willValidate,
        "input 'club_l2' is a descendant of the second legend child of the fieldset. It should be disabled");
  }, "The disabled attribute, when specified, causes all the form control descendants of the fieldset element, excluding those that are descendants of the fieldset element's first legend element child, if any, to be disabled.");

  test( () {
    assert_true((document.getElementById('fs2') as FieldSetElement).disabled,
        "The fieldset is disabled");
    assert_false((document.getElementById('clubname2') as InputElement).willValidate,
        "fieldset is disabled so is input 'clubname2'");
    assert_false((document.getElementById('clubnum2') as InputElement).willValidate,
        "fieldset is disabled so is input 'clubnum2'");
    assert_false((document.getElementById('club2') as InputElement).willValidate,
        "the first legend is not a child of the disbled fieldset: input 'club2' is disabled");
  }, "The first 'legend' element is not a child of the disabled fieldset: Its descendants should be disabled.");

  test( () {
    assert_true((document.getElementById('fs3') as FieldSetElement).disabled,
        "The fieldset is disabled");
    assert_false((document.getElementById('clubname3') as InputElement).willValidate,
        "fieldset is disabled so is input 'clubname3'");
    assert_false((document.getElementById('clubnum3') as InputElement).willValidate,
        "fieldset is disabled so is input 'clubnum3'");
    assert_false((document.getElementById('club3') as InputElement).willValidate,
       "the first legend is not a child of the disbled fieldset: input 'club3' is disabled");
  }, "The <legend> element is not a child of the disabled fieldset: Its descendants should be disabled.");

  test( () {
    assert_true((document.getElementById('fs4') as FieldSetElement).disabled,
        "The fieldset is disabled");
    assert_false((document.getElementById('clubname4') as InputElement).willValidate,
        "fieldset is disabled so is input 'clubname4'");
    assert_false((document.getElementById('clubnum4') as InputElement).willValidate,
        "fieldset is disabled so is input 'clubnum4'");
    assert_true((document.getElementById('club4') as InputElement).willValidate,
        "the first legend a child of the disbled fieldset: input 'club4' is disabled");
  }, "The <legend> element is child of the disabled fieldset: Its descendants should be disabled.");

  checkTestFailures();
}
