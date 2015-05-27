/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Range on detached node should not throw exception.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
    <p id="description"></p>
    <div id="sample">0123<b>45</b>6789</div>
    </div>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  _shouldThrow(func()) =>
    shouldThrow(func,
        (e) => e is DomException && e.name == DomException.INVALID_NODE_TYPE);

  $(id) { return document.getElementById(id); }

  var sample = $('sample').clone(true);
  var range = document.createRange();

  range.selectNode(sample.firstChild);
  shouldBe(range.startContainer, sample);
  range.setEndBefore(sample.firstChild);
  shouldBe(range.startContainer, sample);
  range.setEndAfter(sample.firstChild);
  shouldBe(range.startContainer, sample);
  range.setStartAfter(sample.firstChild);
  shouldBe(range.startContainer, sample);
  range.setStartBefore(sample.firstChild);
  shouldBe(range.startContainer, sample);

  _shouldThrow(() { range.selectNode(sample); range.startContainer; });
  _shouldThrow(() { range.setEndAfter(sample); range.startContainer; });
  _shouldThrow(() { range.setEndBefore(sample); range.startContainer; });
  _shouldThrow(() { range.setStartAfter(sample); range.startContainer; });
  _shouldThrow(() { range.setStartBefore(sample); range.startContainer; });
}
