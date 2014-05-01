/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <div id='sandbox'></div>
    <pre id='console'></pre>
    ''', treeSanitizer: new NullTreeSanitizer());

  var sandbox = document.getElementById('sandbox');
  var host = document.createElement('div');
  var shadowRoot = host.createShadowRoot();
  shadowRoot.innerHtml = '<style></style><div>Shadow</div>';
  shadowRoot.append(document.createElement('style'));
  sandbox.append(host);

  shouldBe(shadowRoot.styleSheets.length, 2);
}
