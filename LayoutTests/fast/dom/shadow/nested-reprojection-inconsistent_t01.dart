/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When we modify host children and get distributed nodes in 
 * nested ShadowDOM, distribution should occur from the host.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
        <div id="host1"></div>
    </div>
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host1 = document.getElementById('host1');
  var shadowRoot11 = host1.createShadowRoot();
  shadowRoot11.innerHtml = '<div></div><shadow><content></content></shadow>';
  var div1 = shadowRoot11.firstChild;
  var shadow1 = shadowRoot11.lastChild;

  ShadowRoot shadowRoot12 = host1.createShadowRoot();
  shadowRoot12.innerHtml = '<div><shadow><content></content></shadow></div>';
  DivElement host2 = shadowRoot12.firstChild;

  ShadowRoot shadowRoot21 = host2.createShadowRoot();
  shadowRoot21.innerHtml = '<content></content>';

  ShadowRoot shadowRoot22 = host2.createShadowRoot();
  shadowRoot22.innerHtml = '<div><shadow><content></content></shadow></div>';
  DivElement host3 = shadowRoot22.firstChild;

  ShadowRoot shadowRoot31 = host3.createShadowRoot();
  shadowRoot31.innerHtml = '<content></content>';

  ContentElement content = shadowRoot31.firstChild;

  asyncStart();
  setTimeout(() {
    debug('Adds a div to ShadowRoot.');
    var addedDiv = document.createElement('div');
    shadowRoot11.append(addedDiv);
    shouldBe(content.getDistributedNodes().length, 2);
    shouldBe(content.getDistributedNodes()[0], div1);
    shouldBe(content.getDistributedNodes()[1], addedDiv);

    debug('Adds a div as fallback content, which should not be used.');
    var anotherAddedDiv = document.createElement('div');
    shadow1.append(anotherAddedDiv);
    shouldBe(content.getDistributedNodes().length, 2);
    shouldBe(content.getDistributedNodes()[0], div1);
    shouldBe(content.getDistributedNodes()[1], addedDiv);

    debug('Removes the first added div');
    addedDiv.remove();
    shouldBe(content.getDistributedNodes().length, 1);
    shouldBe(content.getDistributedNodes()[0], div1);

    debug('Removes the second added div');
    anotherAddedDiv.remove();
    shouldBe(content.getDistributedNodes().length, 1);
    shouldBe(content.getDistributedNodes()[0], div1);

    document.getElementById('container').innerHtml = "";
    asyncEnd();
  }, 0);
}
