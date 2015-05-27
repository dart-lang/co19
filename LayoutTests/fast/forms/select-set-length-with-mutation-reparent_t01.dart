/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that setting .length on an HTMLSelectElement works in the
 * presence of mutation event listeners that reparent options
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var sel = document.createElement('select');
  document.body.append(sel);
  var otherSel = document.createElement('select');
  document.body.append(otherSel);

  onRemove(e) {
    if (e.target.nextNode != null) {
      // remove listener temporarily to avoid lots of nesting
      sel.removeEventListener('DOMNodeRemoved', onRemove, false);
      var n = e.target.nextNode;
      n.remove();
      otherSel.append(n);
      sel.addEventListener('DOMNodeRemoved', onRemove, false);
    }
  }

  sel.addEventListener('DOMNodeRemoved', onRemove, false);
  sel.addEventListener('DOMNodeInserted', (_) {}, false);

  sel.length = 200;
  shouldBe(sel.length, 200);
  shouldBe(otherSel.length, 0);

  sel.length = 100;
  shouldBe(sel.length, 100);
  shouldBe(otherSel.length, 0);

  sel.length = 180;
  shouldBe(sel.length, 180);
  shouldBe(otherSel.length, 0);
}
