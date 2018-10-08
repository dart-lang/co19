/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that deferred scripts with invalid URLs are ignored 
 * and subsequent deferred scripts executed.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  ScriptElement s0 = new ScriptElement();
  s0.async = false;
  s0.src = "$root/../../../resources/js-test.js";
  document.body.append(s0);

  asyncStart();
  s0.onLoad.first.then((_) {
    document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

    ScriptElement s1 = new ScriptElement();
    s1.defer = true;
    s1.src = "http://localhost:999999/";
    document.body.append(s1);

    ScriptElement s2 = new ScriptElement();
    s2.defer = true;
    s2.src = "$root/resources/defer.js";
    document.body.append(s2);

    var expected = [
      'defer'
    ];

    asyncStart();
    window.onLoad.first.then((_) {
      Expect.listEquals(expected, consoleList());
      asyncEnd();
    });
    asyncEnd();
  });
}
