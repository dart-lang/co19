/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test MutationEvents interfering with MutationObservers:
 * adding nodes 'out of order'
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="sandbox" style="display:none"><span></span></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var sandbox = document.getElementById('sandbox');
  var inserted = false;
  sandbox.addEventListener('DOMNodeRemoved', (_) {
    if (!inserted) {
      sandbox.append(document.createElement('div'));
      inserted = true;
    }
  });
  var observer = new MutationObserver((mutations, observer){});
  observer.observe(sandbox, childList: true);
  sandbox.text = 'hello world';

  var mutations = observer.takeRecords();
  shouldBe(mutations.length, 3);
  shouldBe(mutations[0].addedNodes.length, 0);
  shouldBe(mutations[0].removedNodes.length, 1);
  shouldBe(mutations[0].removedNodes[0].tagName, 'SPAN');
  shouldBe(mutations[1].addedNodes.length, 1);
  shouldBe(mutations[1].removedNodes.length, 0);
  shouldBe(mutations[1].addedNodes[0].tagName, 'DIV');
  shouldBe(mutations[2].addedNodes.length, 1);
  shouldBe(mutations[2].removedNodes.length, 0);
  shouldBe(mutations[2].addedNodes[0].nodeValue, 'hello world');
}
