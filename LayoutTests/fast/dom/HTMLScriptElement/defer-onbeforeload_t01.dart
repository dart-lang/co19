/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that deferred scripts fire onbeforeload immediately
 * and that it is cancellable.
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

    var s1 = new ScriptElement();
    s1.defer = true;
    s1.src = "$root/resources/shouldnotexecute.js";
    s1.addEventListener('onbeforeload', (_) {
      debug('cancelled onbeforeload defer');
      return false;
    });
    document.body.append(s1);

    ScriptElement s2 = new ScriptElement();
    s2.defer = true;
    s2.src = "$root/resources/defer.js";
    s2.addEventListener('onbeforeload', (_) {
      debug('onbeforeload defer');
      return true;
    });
    document.body.append(s2);

    ScriptElement s3 = new ScriptElement();
    s3.src = "$root/resources/external.js";
    s3.addEventListener('onbeforeload', (_) {
      debug('onbeforeload external');
      return true;
    });
    document.body.append(s3);

    var expected = [
      'cancelled onbeforeload defer',
      'onbeforeload defer',
      'onbeforeload external',
      'external',
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
