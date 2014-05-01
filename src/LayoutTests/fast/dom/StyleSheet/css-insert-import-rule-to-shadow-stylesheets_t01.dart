/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * @note tbd need somehow check
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <div id='sandbox'>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var sandbox = document.getElementById('sandbox');
  var host = document.createElement('p');
  var shadowRoot = host.createShadowRoot();
  shadowRoot.innerHtml = '<style>div { width: 100px; height: 100px; }</style><div></div>';
  sandbox.append(host);
  document.body.offsetLeft;
  shadowRoot.styleSheets[0].insertRule('@import url($root/../resources/css-insert-import-rule.css);', 0);

  setTimeout(() {
  }, 0);
}
