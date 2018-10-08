/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description DirectoryReader.readEntries() test with many entries.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/fs-test-util.dart";

main() {
  var fileSystem = null;
  var reader = null;
  var numFilesExpected = 150;
  var numDirectoriesExpected = 150;
  var resultEntries = [];

  endTest() {
    removeAllInDirectory(fileSystem.root);
    asyncEnd();
  }

  errorCallback(error) {
    debug("Error occured:" + error.name);
    endTest();
  }

  var numFiles = 0, numDirectories = 0;

  verifyTestResult() {
    for (var i = 0; i < resultEntries.length; ++i) {
      var entry = resultEntries[i];
      if (entry.isDirectory) {
        ++numDirectories;
      } else {
        ++numFiles;
      }
    }
    shouldBe(numFiles, numFilesExpected);
    shouldBe(numDirectories, numDirectoriesExpected);
  }

  entriesCallback(entries) {
    resultEntries.addAll(entries);

    if (entries.length > 0) {
      reader.readEntries().then(entriesCallback, onError: errorCallback);
    } else {
      // Must have read all the entries.
      verifyTestResult();
      endTest();
    }
  }

  runReadDirectoryTest() {
    reader = fileSystem.root.createReader();
    reader.readEntries().then(entriesCallback, onError: errorCallback);
  }

  prepareForTest() {
    var helper = new JoinHelper();
    var done = (_) { helper.done(); };

    for (var i = 0; i < numFilesExpected; ++i) {
      var name = 'file$i';
      helper.run(() { fileSystem.root.createFile(name).then(done, onError: errorCallback); });
    }
    for (var i = 0; i < numDirectoriesExpected; ++i) {
      var name = 'directory$i';
      helper.run(() { fileSystem.root.createDirectory(name).then(done, onError: errorCallback); });
    }
    helper.join(runReadDirectoryTest);
  }

  successCallback(fs) {
    fileSystem = fs;
    debug("Successfully obtained TEMPORARY FileSystem:" + fileSystem.name);
    removeAllInDirectory(fileSystem.root, prepareForTest, errorCallback);
  }

  asyncStart();
  window.requestFileSystem(100).then(successCallback, onError: errorCallback);
}
