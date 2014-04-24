/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for proper behavior of Range.insertNode(documentFragment) 
 * when startContainer != endContainer
 */
import "dart:html";
import "../../../../Utils/expect.dart";
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
  r.setEnd(t2, 3);
  shouldBeEqualToString(r.toString(), "ABC");

  var df = document.createDocumentFragment();
  var t3 = new Text("PQR");
  var t4 = new Text("XYZ");
  df.append(t3);
  df.append(t4);
  r.insertNode(df);

  shouldBe(p.childNodes.length, 4);
  shouldBe(p.childNodes[0], t1);
  shouldBe(p.childNodes[1], t3);
  shouldBe(p.childNodes[2], t4);
  shouldBe(p.childNodes[3], t2);

  shouldBeFalse(r.collapsed);
  shouldBe(r.commonAncestorContainer, p);
  shouldBe(r.startContainer, p);
  shouldBe(r.startOffset, 1);
  shouldBe(r.endContainer, t2);
  shouldBe(r.endOffset, 3);
  shouldBeEqualToString(r.toString(), "PQRXYZABC");

  // clean up after ourselves
  p.remove();
}

