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
  test1() {
    debug("Test that FileReader.abort on newly created FileReader doesn't crash.");
    new FileReader().abort();
  }

  test2() {
    debug("Test that FileReader.abort on newly created FileReader doesn't fire events.");

    var reader = new FileReader();
    reader.onLoad.listen((_) => testFailed("Received load event"));
    reader.onLoadEnd.listen((_) => testFailed("Received loadend event"));
    reader.onAbort.listen((_) => testFailed("Received abort event"));
    reader.onError.listen((event) => testFailed(
        "Received error event: ${(event.target as FileReader).error}"));

    reader.abort();
  }

  runTests()
  {
    test1();
    gc();

    test2();
    gc();

    setTimeout(asyncEnd);
  }

  asyncStart();
  runTests();
}

