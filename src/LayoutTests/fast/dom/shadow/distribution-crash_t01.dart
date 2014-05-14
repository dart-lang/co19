/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description When modifying InsertionPoint's child, distribution should not
 * cause crash. PASS unless crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>PASS unless crash.</p>

    <div id="host"></div>
    <pre id="console"></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  createElementLikeDetails()
  {
    var details = document.createElement('div');
    var shadowRoot = details.createShadowRoot();

    shadowRoot.innerHtml = '<content select="div.summary"></content><content></content>';

    var defaultSummary = document.createElement('div');
    defaultSummary.createShadowRoot().innerHtml = 'Default Summary';
    shadowRoot.firstChild.append(defaultSummary);

    return details;    
  }

  var host = document.getElementById('host');
  var shadowRoot1 = host.createShadowRoot();
  shadowRoot1.innerHtml = 'something 1';

  var shadowRoot2 = host.createShadowRoot();
  var details = createElementLikeDetails();
  details.setInnerHtml('<shadow id="shadow">something 2</shadow>',
      treeSanitizer: new NullTreeSanitizer());

  shadowRoot2.append(details);

  var shadow = details.firstChild;

  setTimeout(() {
    shadow.firstChild.remove();
  }, 0);
}
