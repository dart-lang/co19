/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When an option element became 'checked' or not-'checked', 
 * distribution should happen. Since an option element does not create a 
 * renderer, we cannot check this using reftest.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
        <div id="host1">
            <option id="option1">option 1</option>
        </div>

        <div id="host2">
            <option id="option2" selected>option 2</option>
        </div>
    </div>

    <pre id="console"></pre>

    ''', treeSanitizer: new NullTreeSanitizer());

  var host1 = document.getElementById('host1');
  var host2 = document.getElementById('host2');
  var shadowRoot1 = host1.createShadowRoot();
  var shadowRoot2 = host2.createShadowRoot();

  shadowRoot1.innerHtml = '<content select="option:checked">';
  shadowRoot2.innerHtml = '<content select="option:checked">';

  ContentElement content1 = shadowRoot1.querySelector('content');
  ContentElement content2 = shadowRoot2.querySelector('content');

  asyncStart();
  setTimeout(() {
    var nodes1 = content1.getDistributedNodes();
    shouldBe(nodes1.length, 0);

    var nodes2 = content2.getDistributedNodes();
    shouldBe(nodes2.length, 1);

    debug('Flipping :checked state');
    OptionElement option1 = document.getElementById('option1');
    OptionElement option2 = document.getElementById('option2');
    option1.setAttribute('selected', 'true');
    option2.selected = false;

    nodes1 = content1.getDistributedNodes();
    shouldBe(nodes1.length, 1);

    nodes2 = content2.getDistributedNodes();
    shouldBe(nodes2.length, 0);

    document.getElementById('container').innerHtml = "";
    asyncEnd();
  }, 0);
}
