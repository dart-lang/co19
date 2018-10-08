/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that FileReader.abort after reading is done doesn't fire
 * events.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var text = "Hello";
  var reader = new FileReader();

  reader.onLoadEnd.listen((event) {
    debug('data read');
    var fileString = (event.target as FileReader).result;
    shouldBe(fileString, text);

    reader.onAbort.listen((_) =>
        testFailed("Received abort event after reading"));
    reader.onLoad.listen((_) =>
        testFailed("Received load event after reading"));
    reader.onLoadEnd.listen((_) =>
        testFailed("Received loadend event after reading"));
    reader.onLoadStart.listen((_) =>
        testFailed("Received load start event after reading"));
    reader.onProgress.listen((_) =>
        testFailed("Received progress event after reading"));

    reader.abort();
    gc();
    setTimeout(asyncEnd);
  });

  reader.onError.listen((event) => testFailed(
      "Received error event: ${(event.target as FileReader).error}"));

  reader.readAsText(new Blob([text]));
}
