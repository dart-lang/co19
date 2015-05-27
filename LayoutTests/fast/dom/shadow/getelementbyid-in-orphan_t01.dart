/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests to ensure ShadowRoot.getElementById works even if a 
 * ShadowRoot is orphan.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="wrapper"></div>
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  createDivWithId(id) {
    var div = document.createElement('div');
    div.id = id;

    return div;
  }

  var host = document.createElement('div');
  var shadowRoot = host.createShadowRoot();

  var shadowChild1 = createDivWithId('child1');
  var shadowChild2 = createDivWithId('child2');
  var hostChild1 = createDivWithId('child3');
  var hostChild2 = createDivWithId('child4');

  host.append(hostChild1);
  host.append(hostChild2);
  shadowRoot.append(shadowChild1);
  shadowRoot.append(shadowChild2);

  shouldBe(shadowRoot.getElementById("child1"), shadowChild1);
  shouldBe(shadowRoot.getElementById("child2"), shadowChild2);
  shouldBe(shadowRoot.getElementById("child3"), null);
  shouldBe(shadowRoot.getElementById("child4"), null);

  shouldBe(document.getElementById("child1"), null);
  shouldBe(document.getElementById("child2"), null);
  shouldBe(document.getElementById("child3"), null);
  shouldBe(document.getElementById("child4"), null);

  debug('Insert elements having the same id');

  var shadowChild2_2 = createDivWithId('child2');
  shadowRoot.append(shadowChild2_2);

  shouldBe(shadowRoot.getElementById("child2"), shadowChild2);

  var shadowChild2_3 = createDivWithId('child2');
  shadowRoot.insertBefore(shadowChild2_3, shadowRoot.firstChild);

  shouldBe(shadowRoot.getElementById("child2"), shadowChild2_3);

  debug('Make the host in document');
  var wrapper = document.getElementById('wrapper');
  wrapper.append(host);

  shouldBe(shadowRoot.getElementById("child1"), shadowChild1);
  shouldBe(shadowRoot.getElementById("child2"), shadowChild2_3);
  shouldBe(shadowRoot.getElementById("child3"), null);
  shouldBe(shadowRoot.getElementById("child4"), null);

  shouldBe(document.getElementById("child1"), null);
  shouldBe(document.getElementById("child2"), null);
  //shouldBe(document.getElementById("child3"), child3);
  //shouldBe(document.getElementById("child4"), child4);

  debug('Add a child and make the host not in document');
  var shadowChild5 = createDivWithId('child5');
  shadowRoot.append(shadowChild5);
  host.remove();

  shouldBe(shadowRoot.getElementById("child5"), shadowChild5);

  wrapper.innerHtml = "";
}
