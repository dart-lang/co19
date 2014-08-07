/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var host = document.querySelector('div');
  var root = host.createShadowRoot();
  root.innerHtml = '<style>:host(.enabled) #foo { background: green;}</style><div id="foo"></div>';

  var foo = root.querySelector("#foo");
  host.classes.add('enabled');
  shouldBe(getComputedStyle(foo).backgroundColor, "rgb(0, 128, 0)");
}
