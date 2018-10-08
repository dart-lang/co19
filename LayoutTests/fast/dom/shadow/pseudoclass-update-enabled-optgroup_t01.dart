/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When an optgroup element became 'enabled' or not-'enabled', 
 * distribution should happen. Since an optgroup element does not create a 
 * renderer, we cannot check this using reftest.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="container">
        <div id="host1">
            <optgroup id="optgroup1">optgroup 1</optgroup>
            <optgroup id="optgroup2">optgroup 2</optgroup>
        </div>

        <div id="host2">
            <optgroup id="optgroup3" disabled>optgroup 3</optgroup>
            <optgroup id="optgroup4" disabled>optgroup 4</optgroup>
        </div>
    </div>

    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host1 = document.getElementById('host1');
  var host2 = document.getElementById('host2');
  var shadowRoot1 = host1.createShadowRoot();
  var shadowRoot2 = host2.createShadowRoot();

  shadowRoot1.innerHtml = '<content select=":enabled">';
  shadowRoot2.innerHtml = '<content select=":enabled">';

  ContentElement content1 = shadowRoot1.querySelector('content');
  ContentElement content2 = shadowRoot2.querySelector('content');

  asyncStart();
  setTimeout(() {
    var optgroup2 = document.getElementById('optgroup2');
    var optgroup4 = document.getElementById('optgroup4');
    optgroup2.setAttribute('disabled', 'true');
    optgroup4.attributes.remove('disabled');

    List nodes1 = content1.getDistributedNodes();
    shouldBe(nodes1.length, 1);
    shouldBe(nodes1[0].innerHtml, "optgroup 1");

    List nodes2 = content2.getDistributedNodes();
    shouldBe(nodes2.length, 1);
    shouldBe(nodes2[0].innerHtml, "optgroup 4");

    document.getElementById('container').innerHtml = "";
    asyncEnd();
  }, 0);
}

