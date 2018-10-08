/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that async scripts fire onbeforeload immediately and 
 * that it is cancellable.
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
    s1.async = true;
    s1.src = "$root/resources/shouldnotexecute.js";
    s1.addEventListener('onbeforeload', (_) {
      debug('cancelled onbeforeload async');
      return false;
    });
    document.body.append(s1);

    var s2 = new ScriptElement();
    s2.async = true;
    s2.src = "$root/resources/async.js";
    s2.addEventListener('onbeforeload', (_) {
      debug('onbeforeload async');
      return true;
    });
    document.body.append(s2);

    var s3 = new ScriptElement();
    s3.src = "data:text/javascript,";
    s3.addEventListener('onbeforeload', (_) {
      debug('onbeforeload external');
      return true;
    });
    document.body.append(s3);

    var expected = [
      'cancelled onbeforeload async',
      'onbeforeload async',
      'onbeforeload external',
      'async',
      'load'
    ];

    asyncStart();
    window.onLoad.first.then((_) {
      debug('load');
      Expect.listEquals(expected, consoleList());
      asyncEnd();
    });
    asyncEnd();
  });
}
