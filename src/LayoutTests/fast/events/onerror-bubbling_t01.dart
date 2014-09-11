/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  asyncStart();

  document.body.setInnerHtml('''
      <div>
          <script src="file:///GregTheBunny.js"></script>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.query('div').onError.listen((_) => testFailed('FAILED: inline script load error bubbled'));
  document.body.query('script').onError.listen((_) => testPassed('PASS: script error handler invoked'));

  test() {
    setTimeout(asyncEnd, 3000);

    var div = document.createElement("div");
    div.onError.listen((_) {
      testFailed('FAILED: dynamic script load error bubbled');
      asyncEnd();
    });

    var script = document.createElement("script");
    script.src = "file:///GregTheBunny.js";
    div.append(script);

    // force the script to load
    document.body.append(div);
  }

  window.onError.listen((_) => testFailed('FAILED: window.onerror handler invoked'));

  test();
}
