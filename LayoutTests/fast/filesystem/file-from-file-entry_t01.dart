/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Obtaining File from FileEntry.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var fileSystem = null;
  var testFileName = '/testFileEntry.txt';
  var testFileEntry = null;
  var testFile = null;

  errorCallback(error) {
    testFailed("Error occured: ${error.name}");
    asyncEnd();
  }

  fileCallback(file) {
    testFile = file;
    shouldBe(testFile.name, testFileEntry.name);
    shouldBe(testFile.type, 'text/plain');
    shouldBe(testFile.size, 0);
    asyncEnd();
  }

  getFileFromEntry(entry) {
    testFileEntry = entry;
    entry.file().then(fileCallback, onError: errorCallback);
  }

  createTestFile() {
    fileSystem.root.createFile(testFileName).then(getFileFromEntry, onError: errorCallback);
  }

  window.requestFileSystem(100).then((fs) {
    fileSystem = fs;
    createTestFile();
  }, onError: errorCallback);
}
