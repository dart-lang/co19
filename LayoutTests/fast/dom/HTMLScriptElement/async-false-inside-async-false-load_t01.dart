/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that adding an async=false script while executing an
 * async=false script doesn't mess anything up.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  ScriptElement s0 = new ScriptElement();
  s0.async = false;
  s0.src = "$root/../../../resources/js-test.js";
  document.head.append(s0);

  asyncStart();
  s0.onLoad.first.then((_) {
    asyncEnd();
    document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

    startJSTest();

    ScriptElement first_script = document.createElement("script");
    first_script.async = false;
    first_script.src = "$root/resources/async-false.js";
    document.getElementsByTagName("head")[0].append(first_script);
  });
}
