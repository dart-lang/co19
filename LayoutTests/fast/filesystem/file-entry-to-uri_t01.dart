/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Obtaining URL from FileEntry.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var fileSystem = null;
  var testFileName = 'testFileEntry.txt';

  errorCallback(error) {
    testFailed("Error occured: ${error.name}");
    asyncEnd();
  }

  entryToURL(entry) {
    var url = entry.toUrl();
    shouldBe(url, 'filesystem:file:///temporary/testFileEntry.txt');
    asyncEnd();
  }

  createTestFile() {
    fileSystem.root.createFile(testFileName).then(entryToURL, onError: errorCallback);
  }

  asyncStart();

  window.requestFileSystem(100).then((fs) {
    fileSystem = fs;
    createTestFile();
  }, onError: errorCallback);
}
