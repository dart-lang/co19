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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/nameditem-04.html
 * @assertion http://www.whatwg.org/html/#dom-document-nameditem
 * @description Named items: forms
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<form name=test1></form>

<form name=test2></form>
<form name=test2></form>

<form id=test3></form>

<form id=test4></form>
<form id=test4></form>

<form name=test5></form>
<form id=test5></form>

<form id=test6></form>
<form name=test6></form>

<form id=test7 name=fail></form>

<form name=test8 id=fail></form>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

test(() {
  var form = document.getElementsByTagName("form")[0] as Element;
  assert_equals(form.attributes["name"], "test1");
}, "If there is one form, it should be returned (name)");

test(() {
  var form1 = document.getElementsByTagName("form")[1] as Element;
  var form2 = document.getElementsByTagName("form")[2] as Element;
  assert_equals(form1.attributes["name"], "test2");
  assert_equals(form2.attributes["name"], "test2");

  var collection = document.getElementsByName("test2");
  assert_array_equals(collection, [form1, form2]);
}, "If there are two forms, a collection should be returned. (name)");

test(() {
  var collection = document.getElementsByTagName("form");
  var form = collection[3] as Element;
  assert_equals(form.id, "test3");

  Expect.equals(0, document.getElementsByName("test3").length);
}, "If there is one form, it should not be returned (id)");

test(() {
  var form1 = document.getElementsByTagName("form")[4] as Element;
  assert_equals(form1.id, "test4");
  var form2 = document.getElementsByTagName("form")[5] as Element;
  assert_equals(form2.id, "test4");

  Expect.equals(0, document.getElementsByName("test4").length, '"test4" in document should be false');
}, "If there are two forms, nothing should be returned. (id)");

test(() {
  var form1 = document.getElementsByTagName("form")[6] as FormElement;
  assert_equals(form1.name, "test5");
  var form2 = document.getElementsByTagName("form")[7] as Element;
  assert_equals(form2.id, "test5");

  var test5 = document.getElementsByName("test5")[0];
  assert_equals(test5, form1, '"test5" in document should be true');
}, "If there are two forms, a collection should be returned. (name and id)");

test(() {
  var form1 = document.getElementsByTagName("form")[8] as Element;
  assert_equals(form1.id, "test6");
  var form2 = document.getElementsByTagName("form")[9] as FormElement;
  assert_equals(form2.name, "test6");

  var test6 = document.getElementById("test6");
  assert_equals(test6, form1, '"test6" in document should be true');
}, "If there are two forms, a collection should be returned. (id and name)");

test(() {
  var form = document.getElementsByTagName("form")[10] as Element;
  assert_equals(form.id, "test7");

  Expect.equals(0, document.getElementsByName("test7").length, '"test7" in document should be false');
}, "A name shouldn't affect getting an form by id");

test(() {
  var form = document.getElementsByTagName("form")[11] as FormElement;
  assert_equals(form.name, "test8");

  var test8 = document.getElementsByName("test8")[0];
  assert_equals(test8, form, '"test8" in document should be true');
}, "An id shouldn't affect getting an form by name");

checkTestFailures();
}
