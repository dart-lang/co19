/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description requestFileSystem TEMPORARY test.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  addConsole();

  errorCallback(error) {
    debug('Error occured while requesting a TEMPORARY file system:' + error.name);
    asyncEnd();
  }

  successCallback(fs) {
    var fileSystem = fs;
    debug("Successfully obtained TEMPORARY FileSystem:" + fileSystem.name);
    shouldBeTrue(fileSystem.name.length > 0);
    shouldBe(fileSystem.root.fullPath, "/");
    asyncEnd();
  }

  asyncStart();
  window.requestFileSystem(100).then(successCallback, onError: errorCallback);
}
