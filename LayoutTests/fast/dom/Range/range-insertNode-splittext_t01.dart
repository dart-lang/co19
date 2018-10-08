/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for proper behavior of Range.insertNode when splitting
 * text nodes
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var p = document.createElement('p');
  var t1 = new Text('12345');
  p.append(t1);
  var t2 = new Text('ABCDE');
  document.body.append(p);
  var r = document.createRange();
  r.setStart(t1, 2);
  r.setEnd(t1, 3);
  r.insertNode(t2);

  shouldBe(p.childNodes.length, 3);
  shouldBe(p.childNodes[0], t1);
  shouldBeEqualToString((p.childNodes[0] as Text).data, "12");
  shouldBe(p.childNodes[1], t2);
  shouldBeEqualToString((p.childNodes[1] as Text).data, "ABCDE");
  shouldBeEqualToString((p.childNodes[2] as Text).data, "345");

  var t3 = p.childNodes[2];

  shouldBeFalse(r.collapsed);
  shouldBe(r.commonAncestorContainer, p);
  shouldBe(r.startContainer, t1);
  shouldBe(r.startOffset, 2);
  shouldBe(r.endContainer, t3);
  shouldBe(r.endOffset, 1);
  shouldBeEqualToString(r.toString(), "ABCDE3");

  // clean up after ourselves
  p.remove();
}

