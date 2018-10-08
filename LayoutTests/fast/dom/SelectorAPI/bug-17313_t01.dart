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

main() {
  document.body.setInnerHtml('''
    </script>
    <h1>Test case for <a href='http://bugs.webkit.org/show_bug.cgi?id=17313'>bug 17313</a></h1>
    <p>The test has passed if reloading the page does not crash.</p>
    <input type="hidden">
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    doReload() {
      window.location.href += '?';
    }

    doQSA() {
      document.querySelectorAll('h1:first-child');
      if (window.location.toString().indexOf('?') < 0)
        setTimeout(doReload, 100);
      else
        asyncEnd();
    }

    setTimeout(doQSA, 100);
  });
}
