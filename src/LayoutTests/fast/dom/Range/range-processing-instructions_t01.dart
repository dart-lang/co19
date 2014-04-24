/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that Range manipulations work with ProcessingInstruction
 * nodes.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var docString = "<foo><" + "?pi SUCC_FAILURE_ESS?><" + "?pi SUCC_FAILURE_ESS?></foo>";

  var doc = (new DomParser()).parseFromString(docString, "application/xml");
  var foo = doc.getElementsByTagName("foo")[0];

  var range = doc.createRange();
  range.setStart(foo.firstChild, 4);
  range.setEnd(foo.firstChild, 13);
  range.deleteContents();

  var expected = 'SUCCESS';

  debug('Test 1');
  shouldBe(foo.firstChild.data, expected);

  doc = (new DomParser()).parseFromString(docString, "application/xml");
  foo = doc.getElementsByTagName("foo")[0];

  range = doc.createRange();
  range.setStart(foo.firstChild, 4);
  range.setEnd(foo.firstChild.nextNode, 13);
  range.deleteContents();

  debug('Test 2');
  shouldBe(foo.firstChild.data + foo.firstChild.nextNode.data, expected);

  doc = (new DomParser()).parseFromString(docString, "application/xml");
  foo = doc.getElementsByTagName("foo")[0];

  range = doc.createRange();
  range.setStart(foo, 0);
  range.setEnd(foo.firstChild, 2);
  var data1 = range.cloneContents().firstChild.data;

  range.setStart(foo.firstChild, 2);
  range.setEnd(foo.firstChild, 4);
  var data2 = range.cloneContents().firstChild.data;

  range.setStart(foo.firstChild.nextNode, 13);
  range.setEnd(foo, 2);
  var data3 = range.cloneContents().firstChild.data;

  debug('Test 3');
  shouldBe(data1 + data2 + data3, expected);
}
