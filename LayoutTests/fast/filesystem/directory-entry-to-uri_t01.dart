/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Obtaining URL from DirectoryEntry.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var fileSystem = null;
  var testDirectoryName = 'testDirectory';

  errorCallback(error) {
    testFailed("Error occured: ${error.name}");
    asyncEnd();
  }

  entryToURL(entry) {
    var url = entry.toUrl();
    shouldBe(url, 'filesystem:file:///temporary/testDirectory');
    asyncEnd();
  }

  createTestDirectory() {
    fileSystem.root.createDirectory(testDirectoryName)
      .then(entryToURL, onError: errorCallback);
  }

  asyncStart();

  window.requestFileSystem(100).then((fs) {
    fileSystem = fs;
    createTestDirectory();
  }, onError: errorCallback);
}
