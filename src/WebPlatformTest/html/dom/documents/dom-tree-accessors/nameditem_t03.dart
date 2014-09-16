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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/nameditem-03.html
 * @assertion http://www.whatwg.org/html/#dom-document-nameditem
 * @description Named items: applets
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<applet name=test1></applet>

<applet name=test2></applet>
<applet name=test2></applet>

<applet id=test3></applet>

<applet id=test4></applet>
<applet id=test4></applet>

<applet name=test5></applet>
<applet id=test5></applet>

<applet id=test6></applet>
<applet name=test6></applet>

<applet id=test7 name=fail></applet>

<applet name=test8 id=fail></applet>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);

test(() {
  var applet = document.getElementsByTagName("applet")[0];
// print("applen is ${applet.runtimeType}");
  var name=applet.attributes["name"];
  assert_equals(name, "test1");

  var test1 = document.getElementsByName("test1")[0];
  assert_equals(test1, applet);
}, "If there is one applet, it should be returned (name)");

test(() {
  var applet1 = document.getElementsByTagName("applet")[1];
  var name1=applet1.attributes["name"];
  assert_equals(name1, "test2");
  var applet2 = document.getElementsByTagName("applet")[2];
  var name2=applet2.attributes["name"];
  assert_equals(name2, "test2");

  var collection = document.getElementsByName("test2");
  assert_array_equals(collection, [applet1, applet2]);
}, "If there are two applets, a collection should be returned. (name)");

test(() {
  var applet = document.getElementsByTagName("applet")[3];
  assert_equals(applet.id, "test3");

  var test3 = document.getElementById("test3");
  var name=applet.attributes["name"];
  assert_equals(name, null);
}, "If there is one applet, it should be returned (id)");

test(() {
  var applet1 = document.getElementsByTagName("applet")[4];
  assert_equals(applet1.id, "test4");
  var applet2 = document.getElementsByTagName("applet")[5];
  assert_equals(applet2.id, "test4");
}, "If there are two applets, a collection should be returned. (id)");

test(() {
  var applet1 = document.getElementsByTagName("applet")[6];
  var name1=applet1.attributes["name"];
  assert_equals(name1, "test5");
  var applet2 = document.getElementsByTagName("applet")[7];
  assert_equals(applet2.id, "test5");
}, "If there are two applets, a collection should be returned. (name and id)");

test(() {
  var applet1 = document.getElementsByTagName("applet")[8];
  assert_equals(applet1.id, "test6");
  var applet2 = document.getElementsByTagName("applet")[9];
  var name2=applet2.attributes["name"];
  assert_equals(name2, "test6");
}, "If there are two applets, a collection should be returned. (id and name)");

test(() {
  var applet = document.getElementsByTagName("applet")[10];
  assert_equals(applet.id, "test7");

  var test7 = document.getElementById("test7");
  assert_equals(test7, applet);
}, "A name shouldn't affect getting an applet by id");

test(() {
  var applet = document.getElementsByTagName("applet")[11];
  var name=applet.attributes["name"];
  assert_equals(name, "test8");

  var test8 = document.getElementsByName("test8")[0];
  assert_equals(test8, applet);
}, "An id shouldn't affect getting an applet by name");

checkTestFailures();
}
