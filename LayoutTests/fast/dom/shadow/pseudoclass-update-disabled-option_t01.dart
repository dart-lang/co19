/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When an option element became 'disabled' or not-'disabled', 
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
            <option id="option2">option 2</option>
        </div>

        <div id="host2">
            <option id="option3" disabled>option 3</option>
            <option id="option4" disabled>option 4</option>
        </div>
    </div>

    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host1 = document.getElementById('host1');
  var host2 = document.getElementById('host2');
  var shadowRoot1 = host1.createShadowRoot();
  var shadowRoot2 = host2.createShadowRoot();

  shadowRoot1.innerHtml = '<content select=":disabled">';
  shadowRoot2.innerHtml = '<content select=":disabled">';

  ContentElement content1 = shadowRoot1.querySelector('content');
  ContentElement content2 = shadowRoot2.querySelector('content');

  asyncStart();
  setTimeout(() {
  var option2 = document.getElementById('option2');
  var option4 = document.getElementById('option4');
    option2.setAttribute('disabled', 'true');
    option4.attributes.remove('disabled');

    List nodes1 = content1.getDistributedNodes();
    shouldBe(nodes1.length, 1);
    shouldBe(nodes1[0].innerHtml, "option 2");

    List nodes2 = content2.getDistributedNodes();
    shouldBe(nodes2.length, 1);
    shouldBe(nodes2[0].innerHtml, "option 3");

    document.getElementById('container').innerHtml = "";
    asyncEnd();
  }, 0);
}

