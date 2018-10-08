/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that XHR.responseType = 'blob' gives you back a Blob.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  asyncStart();

  testBlob(blobURL, blobType, doneFunction) {
    var xhr = new HttpRequest();
    xhr.open("GET", blobURL);
    xhr.responseType = "blob";
    shouldBeEqualToString(xhr.responseType, "blob");
    xhr.send();
    xhr.onReadyStateChange.listen((_) {
      if (xhr.readyState != 4) {
        shouldBeNull(xhr.response);
        return;
      }
      shouldBeTrue(xhr.response is Blob);
      shouldBeEqualToString(xhr.response.type, blobType);
      doneFunction();
    });
  }

  testBlob("$root/resources/utf8.txt", "text/plain", () {
    testBlob("$root/resources/IntentionallyMissingFile.txt", "", () {
      testBlob("$root/resources/empty-file", "", asyncEnd);
    });
  });
}
