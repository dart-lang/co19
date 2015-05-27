/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure ShadowRoot.getElementById works after complex
 * DOM manipulation.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container"></div>
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  createDiv(id)
  {
    var div = document.createElement('div');
    div.id = id;
    return div;
  }

  var A = createDiv('A');
  var B = createDiv('B');
  var C = createDiv('C');
  var D = createDiv('D');
  var shadowRootA = A.createShadowRoot();
  var shadowRootB = B.createShadowRoot();
  var shadowRootC = C.createShadowRoot();

  shadowRootA.append(B);
  shadowRootB.append(C);
  shadowRootC.append(D);

  var container = document.getElementById('container');
  container.append(A);
  shouldBe(document.getElementById("A"), A);
  shouldBe(shadowRootA.getElementById("B"), B);
  shouldBe(shadowRootB.getElementById("C"), C);
  shouldBe(shadowRootC.getElementById("D"), D);

  debug('Remove C from shadowRootB');
  C.remove();

  shouldBe(document.getElementById("A"), A);
  shouldBe(shadowRootA.getElementById("B"), B);
  shouldBe(shadowRootB.getElementById("C"), null);
  shouldBe(shadowRootC.getElementById("D"), D);

  debug('Append C to ShadowRootB, and remove A from document');
  shadowRootB.append(C);
  A.remove();

  shouldBe(document.getElementById("A"), null);
  shouldBe(shadowRootA.getElementById("B"), B);
  shouldBe(shadowRootB.getElementById("C"), C);
  shouldBe(shadowRootC.getElementById("D"), D);

  debug('Remove C from shadowRootB');
  C.remove();

  shouldBe(document.getElementById("A"), null);
  shouldBe(shadowRootA.getElementById("B"), B);
  shouldBe(shadowRootB.getElementById("C"), null);
  shouldBe(shadowRootC.getElementById("D"), D);

  debug('Remove D from shadowRootC');
  D.remove();

  shouldBe(document.getElementById("A"), null);
  shouldBe(shadowRootA.getElementById("B"), B);
  shouldBe(shadowRootB.getElementById("C"), null);
  shouldBe(shadowRootC.getElementById("D"), null);
}
