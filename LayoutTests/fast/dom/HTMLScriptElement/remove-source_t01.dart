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
import "pwd.dart";

main() {
  var s0 = new ScriptElement();
  s0.async = false;
  s0.src = "$root/../../../resources/js-test.js";
  document.head.append(s0);

  asyncStart();
  s0.onLoad.first.then((_) {
    document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

    ScriptElement script = document.createElement("script");
    script.src = "data:text/javascript,debug('FAIL');";
    document.head.append(script);
    script.src = "";
    asyncEnd();
  });
}
