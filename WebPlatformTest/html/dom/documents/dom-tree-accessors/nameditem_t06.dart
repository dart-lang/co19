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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/nameditem-06.html
 * @assertion http://www.whatwg.org/html/#dom-document-nameditem
 * @description Named items: imgs
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<img name=test1>

<img name=test2>
<img name=test2>

<img id=test3>

<img id=test4>
<img id=test4>

<img name=test5>
<img id=test5>

<img id=test6>
<img name=test6>

<img id=test7 name=fail>

<img name=test8 id=fail>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);

test(() {
  var img = document.getElementsByTagName("img")[0];
  assert_equals(img.attributes["name"], "test1");

  var test1=document.getElementsByName("test1")[0];
  assert_equals(test1, img);
}, "If there is one img, it should be returned (name)");

test(() {
  var img1 = document.getElementsByTagName("img")[1];
  assert_equals(img1.attributes["name"], "test2");
  var img2 = document.getElementsByTagName("img")[2];
  assert_equals(img2.attributes["name"], "test2");

  var collection = document.getElementsByName("test2");
  assert_array_equals(collection, [img1, img2]);
}, "If there are two imgs, a collection should be returned. (name)");

test(() {
  var img = document.getElementsByTagName("img")[3];
  assert_equals(img.id, "test3");

  Expect.equals(0, document.getElementsByName("test3").length, '"test3" in document should be false');
}, "If there is one img, it should not be returned (id)");

test(() {
  var img1 = document.getElementsByTagName("img")[4];
  assert_equals(img1.id, "test4");
  var img2 = document.getElementsByTagName("img")[5];
  assert_equals(img2.id, "test4");

  Expect.equals(0, document.getElementsByName("test4").length, '"test4" in document should be false');
}, "If there are two imgs, nothing should be returned. (id)");

test(() {
  var img1 = document.getElementsByTagName("img")[6];
  assert_equals(img1.attributes["name"], "test5");
  var img2 = document.getElementsByTagName("img")[7];
  assert_equals(img2.id, "test5");

  var test5 = document.getElementsByName("test5")[0];
  assert_equals(test5, img1);
}, "If there are two imgs, the one with a name should be returned. (name and id)");

test(() {
  var img1 = document.getElementsByTagName("img")[8];
  assert_equals(img1.id, "test6");
  var img2 = document.getElementsByTagName("img")[9];
  assert_equals(img2.attributes["name"], "test6");

  var test6 = document.getElementsByName("test6")[0];
  assert_equals(test6, img2);
}, "If there are two imgs, the one with a name should be returned. (id and name)");

test(() {
  var img = document.getElementsByTagName("img")[10];
  assert_equals(img.id, "test7");

  var test7 = document.getElementById("test7");
  assert_equals(test7, img);
}, "A name should affect getting an img by id");

test(() {
  var img = document.getElementsByTagName("img")[11];
  assert_equals(img.attributes["name"], "test8");

  var test8 = document.getElementsByName("test8")[0];
  assert_equals(test8, img);
}, "An id shouldn't affect getting an img by name");

checkTestFailures();
}
