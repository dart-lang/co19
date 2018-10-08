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

main() {
  asyncStart();

  document.body.setInnerHtml('''
      <p>
          This test ensures that a normal image error doesn't crash if GC occurs
          before the error event fires.
      </p>
      ''', treeSanitizer: new NullTreeSanitizer());

  finishTesting() {
    setTimeout(asyncEnd, 0);
    return true;
  }

  test() {
    (() {
      ImageElement img = document.createElement('img');
      img.onLoad.listen((_) {
        testFailed('FAIL');
        finishTesting();
      });
      img.onError.listen((_) {
        testPassed('PASS');
        finishTesting();
      });
      img.src = "IntentionallyMissingFile";
    })();
    gc();
  }

  test();
}

