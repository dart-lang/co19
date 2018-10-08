/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description FileReader.abort() in the last progress event shouldn't crash
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var reader = new FileReader();

  reader.onProgress.listen((_) {
    debug("The readyState");
    shouldBe(reader.readyState, FileReader.LOADING);
    reader.abort();
    asyncEnd();
  });

  reader.onLoadEnd.listen((_) {
    asyncEnd();
  });

  asyncMultiStart(2);

  reader.readAsText(new Blob(["foo"]));
}
