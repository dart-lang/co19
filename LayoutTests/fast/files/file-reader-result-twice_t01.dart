/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that FileReader.result returns the same result regardless
 * of whether it's from cache or not by getting it twice.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  setupHandlers(reader, expectedResult) {
    reader.onAbort.listen((_) {
      testFailed("onabort invoked on reader");
    });
    reader.onError.listen((_) {
      testFailed("onerror invoked on reader");
    });
    reader.onLoadEnd.listen((_) {
      debug("reader.readyState");
      shouldBe(reader.readyState, FileReader.DONE);
      debug("reader.error");
      shouldBe(reader.error, null);
      // Read result attribute twice to go through Blink's code path for
      // caching converted result and reading from the cache.
      debug("reader.result");
      shouldBe(reader.result, expectedResult);
      shouldBe(reader.result, expectedResult);
      asyncEnd();
    });
  }

  var blob = new Blob(["HelloWorld"], "text/plain;charset=us-ascii");

  asyncMultiStart(2);
  
  {
    debug("Read from a blob as a text");
    var reader = new FileReader();
    reader.readAsText(blob);
    setupHandlers(reader, "HelloWorld");
  }

  {
    debug("Read from a blob as a data URL");
    var reader = new FileReader();
    reader.readAsDataUrl(blob);
    setupHandlers(reader, "data:text/plain;charset=us-ascii;base64,SGVsbG9Xb3JsZA==");
  }
}
