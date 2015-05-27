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
 * after web-platform-tests/html/semantics/forms/the-form-element/form-nameditem.html
 * @assertion
 * @description Form named getter
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<!-- XXX Nothing tests id attributes yet. -->
<!-- XXX Keygen. -->
<!-- XXX We also need tests for moving inputs and forms in the DOM. -->
<form>
<input type=button name=button>
<input type=radio name=radio value=x>
<input type=radio name=radio value=y>
<input type=radio name=radio value=z>
</form>

<form>
<button name=l1></button>
<fieldset name=l2></fieldset>
<input type=hidden name=l3>
<input type=text name=l4>
<input type=search name=l5>
<input type=tel name=l6>
<input type=url name=l7>
<input type=email name=l8>
<input type=password name=l9>
<input type=datetime name=l10>
<input type=date name=l11>
<input type=month name=l12>
<input type=week name=l13>
<input type=time name=l14>
<input type=datetime-local name=l15>
<input type=number name=l16>
<input type=range name=l17>
<input type=color name=l18>
<input type=checkbox name=l19>
<input type=radio name=l20>
<input type=file name=l21>
<input type=submit name=l22>
<input type=image name=l23>
<input type=reset name=l24>
<input type=button name=l25>
<input type=foo name=l26>
<input name=l27>
<object name=l28></object>
<output name=l29></output>
<select name=l30></select>
<textarea name=l31></textarea>
</form>

<form>
<!-- EventTarget -->
<input type=radio name=addEventListener>
<input type=radio name=removeEventListener>
<input type=radio name=dispatchEvent>

<!-- Node -->
<input type=radio name=nodeType>
<input type=radio name=nodeName>
<input type=radio name=ownerDocument>

<!-- Element -->
<input type=radio name=namespaceURI>
<input type=radio name=prefix>
<input type=radio name=localName>

<!-- HTMLElement -->
<input type=radio name=title>
<input type=radio name=lang>
<input type=radio name=dir>

<!-- HTMLFormElement -->
<input type=radio name=acceptCharset>
<input type=radio name=action>
<input type=radio name=autocomplete>
<input type=radio name=enctype>
<input type=radio name=encoding>
<input type=radio name=method>
<input type=radio name=name>
<input type=radio name=noValidate>
<input type=radio name=target>
<input type=radio name=elements>
<input type=radio name=length>
<input type=radio name=submit>
<input type=radio name=reset>
<input type=radio name=checkValidity>
</form>

<img name=x>
<form></form><!-- no child nodes -->
<img name=y>
<form><!-- a child node --></form>
<img name=z>

<input form=a name=b>
<form id=a></form>
<input form=c name=d>
<input form=c name=d>
<form id=c></form>
''';

void main() {
  document.body.appendHtml(htmlEL);

test(() {
  var form = document.getElementsByTagName("form")[0];
  var item;
  Expect.throws(()=>form.item, (e)=> e is NoSuchMethodError);
}, "Forms should not have an item method");

test(() {
  var form = document.getElementsByTagName("form")[0];
  Expect.throws(()=>form.namedItem, (e)=> e is NoSuchMethodError);
}, "Forms should not have a namedItem method");

test(() {
  var form = document.getElementsByTagName("form")[0];
  var button = document.getElementsByTagName("input")[0];
  assert_equals(button.type, "button");
  assert_equals(button.name, "button");
}, "Name for a single element should work");

test(() {
  var form = document.getElementsByTagName("form")[5];
  assert_equals(form.id, "a");

  var input = document.getElementsByName("b")[0];
  assert_equals(input.localName, "input");
  assert_equals(input.getAttribute("form"), "a");
}, "The form attribute should be taken into account for named getters (single element)");

test(() {
  var form = document.getElementsByTagName("form")[6];
  assert_equals(form.id, "c");

  var input1 = document.getElementsByName("d")[0];
  assert_equals(input1.localName, "input");
  assert_equals(input1.getAttribute("form"), "c");

  var input2 = document.getElementsByName("d")[1];
  assert_equals(input2.localName, "input");
  assert_equals(input2.getAttribute("form"), "c");

}, "The form attribute should be taken into account for named getters (multiple elements)");

  checkTestFailures();
}
