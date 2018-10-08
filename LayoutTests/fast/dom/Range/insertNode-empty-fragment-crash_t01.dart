/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test Range.insertNode(fragment) when the fragment is empty and
 * the range is collapsed
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var p = document.createElement('p');
  var t1 = new Text('12345');
  p.append(t1);
  var t2 = new Text('ABCDE');
  p.append(t2);
  document.body.append(p);
  var r = document.createRange();
  r.setStart(p, 1);
  r.setEnd(p, 1);
  shouldBeEqualToString(r.toString(), "");

  var df = document.createDocumentFragment();
  r.insertNode(df);

  shouldBe(p.childNodes.length, 2);
  shouldBe(p.childNodes[0], t1);
  shouldBe(p.childNodes[1], t2);

  shouldBeTrue(r.collapsed);
  shouldBe(r.startContainer, p);
  shouldBe(r.startOffset, 1);
  shouldBe(r.endContainer, p);
  shouldBe(r.endOffset, 1);
  shouldBeEqualToString(r.toString(), "");

  p.remove();
}
