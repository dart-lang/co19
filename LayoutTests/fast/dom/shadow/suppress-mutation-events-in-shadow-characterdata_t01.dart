/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Ensures that DOMCharacterDataModified isn't fired inside
 * shadows.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="host"></div>
    ''', treeSanitizer: new NullTreeSanitizer());
   
  var fired = false;
  var host = document.getElementById("host");
  var shadow = host.createShadowRoot();
  var div = document.createElement("div");
  div.addEventListener("DOMCharacterDataModified", (evt) {
    fired = true;
  }, false);

  shadow.append(div);
  div.innerHtml = "Hello, ";
  div.firstChild.appendData("World!");
  shouldBeFalse(fired);
  shouldBe(div.innerHtml, 'Hello, World!');
}