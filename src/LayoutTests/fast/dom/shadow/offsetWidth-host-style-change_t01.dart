/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description offsetWidth of a fixed width element should cause a style 
 * recalc if host styles are invalid
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="host"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.getElementById('host');
  var shadowRoot = host.createShadowRoot();
  var div = shadowRoot.append(document.createElement('div'));
  div.style.width = '100px';
  shouldBe(div.offsetWidth, 100);
  host.style.display = 'none';
  shouldBe(div.offsetWidth, 0);
}
