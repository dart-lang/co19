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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/nameditem-02.html
 * @assertion http://www.whatwg.org/html/#dom-document-nameditem
 * @description Named items: iframes
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<iframe name="test1"></iframe>

<iframe name="test2"></iframe>
<iframe name="test2"></iframe>

<iframe name="test3"></iframe>
<img name="test3">

<img name="test4">
<iframe name="test4"></iframe>

<iframe id="test5"></iframe>

<iframe name="test6" id="fail"></iframe>

<iframe name="fail" id="test7"></iframe>

<iframe name="42"></iframe>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

test(() {
  var iframe = document.getElementsByTagName("iframe")[0];
  assert_equals(iframe.name, "test1");
  var test1 = document.getElementsByName("test1")[0];
  assert_equals(test1, iframe.contentWindow);
}, "If the only named item is an iframe, the contentWindow should be returned.");

test(() {
  var iframe1 = document.getElementsByTagName("iframe")[1];
  assert_equals(iframe1.name, "test2");
  var iframe2 = document.getElementsByTagName("iframe")[2];
  assert_equals(iframe2.name, "test2");

  var collection = document.getElementsByName("test2");
  assert_true(collection is HtmlCollection, "collection should be an HTMLCollection, but is a ${collection.runtimeType}");
  assert_array_equals(collection, [iframe1, iframe2]);
}, "If there are two iframes, a collection should be returned.");

test(() {
  var iframe = document.getElementsByTagName("iframe")[3];
  assert_equals(iframe.name, "test3");
  var img = document.getElementsByTagName("img")[0];
  //assert_equals(img.name, "test3"); //Class 'ImageElement' has no instance getter 'name'.

  var collection = document.getElementsByName("test3");
  assert_array_equals(collection, [iframe, img]);
  assert_true(collection is HtmlCollection, "collection should be an HTMLCollection, but is a ${collection.runtimeType}");
}, "If there are an iframe and another element (iframe first), a collection should be returned.");

test(() {
  var iframe = document.getElementsByTagName("iframe")[4];
  assert_equals(iframe.name, "test4");
  var img = document.getElementsByTagName("img")[1];
  //assert_equals(img.name, "test4"); //Class 'ImageElement' has no instance getter 'name'.

  var collection = document.getElementsByName("test4");
  assert_array_equals(collection, [img, iframe]);
  assert_true(collection is HtmlCollection, "collection should be an HTMLCollection, but is a ${collection.runtimeType}");
}, "If there are an iframe and another element (iframe last), a collection should be returned.");

test(() {
  var collection = document.getElementsByName("test5");
  assert_equals(collection.length, 0);
}, "If an iframe has an id and no name, it should not be returned.");

test(() {
  var iframe = document.getElementsByTagName("iframe")[6];
  assert_equals(iframe.name, "test6");

  var test6 = document.getElementsByName("test6")[0];
//  assert_equals(test6, iframe.contentWindow);
  assert_equals(test6, iframe);
}, "If an iframe has a name and a different id, it should be returned by its name.");

test(() {
  var iframe = document.getElementsByTagName("iframe")[8];
  assert_equals(iframe.name, "42");

  var test42 = document.getElementsByName("42")[0];
//  assert_equals(test42, iframe.contentWindow);
  assert_equals(test42, iframe);
}, "An iframe whose name looks like an array index should work.");

checkTestFailures();
}
