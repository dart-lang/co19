/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests if the filesystem object is unserializable by
 * default
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  errorCallback(error) {
    testFailed("Error occurred: ${error.name}");
    asyncEnd();
  }

  fileSystemCallback(fs) {
    shouldThrow(() => window.postMessage(fs, '*'));
    asyncEnd();
  }

  onmessage(_) { }
  window.addEventListener('message', onmessage, false);

  asyncStart();
  window.requestFileSystem(100).then(fileSystemCallback, onError: errorCallback);
}
