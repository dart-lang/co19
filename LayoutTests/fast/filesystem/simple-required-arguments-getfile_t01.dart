/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description DirectoryEntry required arguments test.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  addConsole();

  var fileSystem = null;

  errorCallback(error) {
    debug("Error occured while requesting a TEMPORARY file system:" + error.name);
    asyncEnd();
  }

  successCallback(fs) {
    fileSystem = fs;
    debug("Successfully obtained TEMPORARY FileSystem:" + fileSystem.name);
    var root = fileSystem.root;
    shouldThrow(() => root.getFile());
    asyncEnd();
  }

  asyncStart();
  window.requestFileSystem(100).then(successCallback, onError: errorCallback);
}
