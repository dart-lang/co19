/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test reading data from a blob as an ArrayBuffer
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var blob = new Blob(["HelloWorld"]);
  var reader = new FileReader();
  var onloadstartSeen = false;
  shouldBe(reader.readyState, FileReader.EMPTY);
  reader.readAsArrayBuffer(blob);

  asyncStart();
  reader.onLoadStart.listen((_) {
    shouldBeFalse(onloadstartSeen);
    onloadstartSeen = true;
    shouldBe(reader.readyState, FileReader.LOADING);
    shouldBe(reader.error, null);
    shouldNotBe(reader.result, null);
    shouldBeTrue(reader.result.lengthInBytes >= 0);
    shouldBeTrue(reader.result.lengthInBytes <= 10);
  });
  reader.onAbort.listen((_) {
    testFailed("onabort invoked on reader");
  });
  reader.onError.listen((_) {
    testFailed("onerror invoked on reader");
  });
  reader.onLoadEnd.listen((_) {
    shouldBe(reader.readyState, FileReader.DONE);
    shouldBe(reader.error, null);
    shouldNotBe(reader.result, null);
    shouldBe(reader.result.lengthInBytes, 10);
    asyncEnd();
  });
}
