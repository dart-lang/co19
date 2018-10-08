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

    asyncStart();
    window.onLoad.first.then((_) {
      asyncStart();
      ScriptElement s = document.createElement("script");
      s.addEventListener("beforeload", (_) {
        s.remove();
        testPassed("");
        asyncEnd();
      }, false);
      s.addEventListener("error", (_) {
        testFailed("error event should not fire.");
      }, false);
      s.addEventListener("load", (_) {
        testFailed("load event should not fire.");
      }, false);
      s.src = "$root/resources/shouldnotexecute.js";
      document.body.append(s);
      asyncEnd();
    });
    asyncEnd();
  });
}
