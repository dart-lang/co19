/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test MutationEvents interfering with MutationObservers:
 * removing nodes 'out of order'
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="sandbox" style="display:none"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var sandbox = document.getElementById('sandbox');
  var removed = false;
  sandbox.addEventListener('DOMNodeInserted', (_) {
    if (!removed) {
      sandbox.firstChild.remove();
      removed = true;
    }
  });
  var observer = new MutationObserver((m,o){});
  observer.observe(sandbox, childList: true);
  sandbox.innerHtml = '<b></b><i></i>';

  var mutations = observer.takeRecords();
  shouldBe(mutations.length, 2);
  shouldBe(mutations[0].addedNodes.length, 1);
  shouldBe(mutations[0].removedNodes.length, 0);
  shouldBe((mutations[0].addedNodes[0] as Element).tagName, 'B');
  shouldBe(mutations[1].addedNodes.length, 1);
  shouldBe(mutations[1].removedNodes.length, 1);
  shouldBe((mutations[1].removedNodes[0] as Element).tagName, 'B');
  shouldBe((mutations[1].addedNodes[0] as Element).tagName, 'I');
}
