/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that an image which is prefetched, and 
 * which is also contained as a subresource of the current document can be 
 * loaded correctly as a subresource, even if the URI doesn't exist.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <link rel="prefetch" href="IntentionallyMissingFile.jpg"/>
    <img src="IntentionallyMissingFile.jpg"/>
    ''', treeSanitizer: new NullTreeSanitizer());

  var dne_error_count = 0;

  dne_onerror(_)
  {
    ++dne_error_count;
    if (dne_error_count == 2) {
      asyncEnd();
    }
  }

  asyncStart();
  document.body.querySelector('link').onError.listen(dne_onerror);
  document.body.querySelector('img').onError.listen(dne_onerror);
}
