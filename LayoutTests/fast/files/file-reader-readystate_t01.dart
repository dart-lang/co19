/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description FileReader readyState
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var reader = new FileReader();

  debug("Check if the readyState is EMPTY initially");
  shouldBe(reader.readyState, FileReader.EMPTY);

  reader.onLoadStart.listen((_) {
    debug("Check if the readyState is LOADING in loadstart");
    shouldBe(reader.readyState, FileReader.LOADING);
    asyncEnd();
  });

  reader.onProgress.listen((_) {
    debug("Check if the readyState is LOADING in progress");
    shouldBe(reader.readyState, FileReader.LOADING);
    asyncEnd();
  });

  reader.onLoad.listen((_) {
    debug("Check if the readyState is DONE in load");
    shouldBe(reader.readyState, FileReader.DONE);
    asyncEnd();
  });

  reader.onLoadEnd.listen((_) {
    debug("Check if the readyState is DONE in loadend");
    shouldBe(reader.readyState, FileReader.DONE);
    asyncEnd();
  });

  asyncMultiStart(4);
  reader.readAsText(new Blob(["foo"]));
}
