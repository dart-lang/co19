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
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
    <div id='sandbox'></div>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var sandbox = document.getElementById('sandbox');
  var host = document.createElement('div');
  var shadowRoot = host.createShadowRoot();
  shadowRoot.innerHtml = '<style>* { }</style><div>Shadow</div>';
  sandbox.append(host);

  debug("Testing &lt;style>...");
  var sheet = shadowRoot.styleSheets[0];
  var style = shadowRoot.querySelector('style');

  shouldBe(sheet.ownerNode, style);
  shouldBe(style.sheet == sheet, true);

  debug("Removing &lt;style>...");
  style.remove();

  shouldBe(style.sheet, null);
  shouldBe(sheet.ownerNode, null);
  shouldBe(sheet.cssRules[0].cssText[0], "*");

  debug("Re-adding &lt;style>...");
  shadowRoot.append(style);
  shouldBe(sheet.ownerNode, null);
  shouldBe(style.sheet == sheet, false);
  shouldBe(style.sheet.ownerNode, style);
}
