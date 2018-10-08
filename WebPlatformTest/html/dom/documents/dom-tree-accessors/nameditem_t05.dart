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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/nameditem-05.html
 * @assertion http://www.whatwg.org/html/#dom-document-nameditem
 * @description Named items: embeds
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<embed name=test1></embed>

<embed name=test2></embed>
<embed name=test2></embed>

<embed id=test3></embed>

<embed id=test4></embed>
<embed id=test4></embed>

<embed name=test5></embed>
<embed id=test5></embed>

<embed id=test6></embed>
<embed name=test6></embed>

<embed id=test7 name=fail></embed>

<embed name=test8 id=fail></embed>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

test(() {
  var embed = document.getElementsByTagName("embed")[0] as EmbedElement;
  assert_equals(embed.name, "test1");

  var test1 = document.getElementsByName("test1")[0];
  assert_equals(test1, embed);
}, "If there is one embed, it should be returned (name)");

test(() {
  var embed1 = document.getElementsByTagName("embed")[1] as EmbedElement;
  assert_equals(embed1.name, "test2");
  var embed2 = document.getElementsByTagName("embed")[2] as EmbedElement;
  assert_equals(embed2.name, "test2");

  var collection = document.getElementsByName("test2");
  assert_array_equals(collection, [embed1, embed2]);
}, "If there are two embeds, a collection should be returned. (name)");

test(() {
  var embed = document.getElementsByTagName("embed")[3] as EmbedElement;
  assert_equals(embed.id, "test3");

  Expect.equals(0, document.getElementsByName("test3").length, '"test3" in document should be false');
}, "If there is one embed, it should not be returned (id)");

test(() {
  var embed1 = document.getElementsByTagName("embed")[4] as EmbedElement;
  assert_equals(embed1.id, "test4");
  var embed2 = document.getElementsByTagName("embed")[5] as EmbedElement;
  assert_equals(embed2.id, "test4");

  Expect.equals(0, document.getElementsByName("test4").length, '"test4" in document should be false');
}, "If there are two embeds, nothing should be returned. (id)");

test(() {
  var embed1 = document.getElementsByTagName("embed")[6] as EmbedElement;
  assert_equals(embed1.name, "test5");
  var embed2 = document.getElementsByTagName("embed")[7] as EmbedElement;
  assert_equals(embed2.id, "test5");

  var test5 = document.getElementsByName("test5")[0];
  assert_equals(test5, embed1);
}, "If there are two embeds, a collection should be returned. (name and id)");

test(() {
  var embed1 = document.getElementsByTagName("embed")[8] as EmbedElement;
  assert_equals(embed1.id, "test6");
  var embed2 = document.getElementsByTagName("embed")[9] as EmbedElement;
  assert_equals(embed2.name, "test6");

  var test6 = document.getElementsByName("test6")[0];
  assert_equals(test6, embed2);
}, "If there are two embeds, a collection should be returned. (id and name)");

test(() {
  var embed = document.getElementsByTagName("embed")[10] as EmbedElement;
  assert_equals(embed.id, "test7");

  Expect.equals(0, document.getElementsByName("test7").length, '"test7" in document should be false');
}, "A name shouldn't affect getting an embed by id");

test(() {
  var embed = document.getElementsByTagName("embed")[11] as EmbedElement;
  assert_equals(embed.name, "test8");

  var test8 = document.getElementsByName("test8")[0];
  assert_equals(test8, embed);
}, "An id shouldn't affect getting an embed by name");

checkTestFailures();
}
