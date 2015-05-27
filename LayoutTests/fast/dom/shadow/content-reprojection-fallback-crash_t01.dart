/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description A crash should not happen when fallback elements are
 * reprojected.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="host1"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host1 = document.getElementById('host1');
  var shadowRoot1 = host1.createShadowRoot();
  shadowRoot1.innerHtml = '<div id="host2"><content select="span"><div id="fallback">fallback element</div></content><div id="div">This should be selected.</div></div>';

  var host2 = shadowRoot1.getElementById('host2');
  var shadowRoot2 = host2.createShadowRoot();
  shadowRoot2.innerHtml = '<content select="div"></content>';

  var content = shadowRoot2.getElementsByTagName('content').item(0);
  var distributedNodes = content.getDistributedNodes();

  shouldBe(distributedNodes[0], shadowRoot1.getElementById("fallback"));
  shouldBe(distributedNodes[1], shadowRoot1.getElementById("div"));
}
