/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Unknown script types should not be loaded nor executed. 
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
    document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

    var bogus_script = new ScriptElement();
    bogus_script.type = "bogus";
    bogus_script.src = "$root/shouldnotexecute.js";
    bogus_script.addEventListener("beforeload", (_) {
      debug("beforeload called on dynamic script that won't be loaded");
    }, false);
    document.head.append(bogus_script);

    ScriptElement fake = new ScriptElement();
    bogus_script.type = "fake";
    bogus_script.src = "$root/shouldnotexecute.js";
    document.head.append(fake);

    asyncStart();
    window.onLoad.first.then((_) {
      Expect.listEquals([], consoleList());
      asyncEnd();
    });
    asyncEnd();
  });
}
