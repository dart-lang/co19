/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description DirectoryReader.readEntries() test.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/fs-test-util.dart";

main() {
  var fileSystem = null;
  var reader = null;
  var resultEntries = [];

  var readEntriesCount = 0;
  var entriesCallbackCount = 0;

  // path: isDirectory map.
  var testEntries = {
    '/a': true,
    '/b': false,
    '/c': true,
    '/d': false,
    '/e': false,
    '/f': true,
  };
  var testEntriesCount = 0;

  endTest() {
    removeAllInDirectory(fileSystem.root);
    asyncEnd();
  }

  errorCallback(error) {
    debug("Error occured:" + error.name);
    endTest();
  }

  verifyTestResult() {
    shouldBe(readEntriesCount, entriesCallbackCount);
    shouldBe(resultEntries.length, testEntriesCount);
    //resultEntries.sort((a, b) { return (a.fullPath > b.fullPath) ? 1 : (a.fullPath < b.fullPath) ? -1 : 0; });
    for (var i = 0; i < resultEntries.length; ++i) {
      var entry = resultEntries[i];
      debug('Entry:' + entry.fullPath + ' isDirectory:' + entry.isDirectory.toString());
      shouldBe(testEntries[entry.fullPath], entry.isDirectory);
    }
  }

  var entries;
  entriesCallback(_entries) {
    entriesCallbackCount++;
    entries = _entries;
    resultEntries.addAll(entries);

    if (entries.length > 0) {
      readEntriesCount++;
      reader.readEntries().then(entriesCallback, onError: errorCallback);
    } else {
      // Must have read all the entries.
      verifyTestResult();
      endTest();
    }
  }

  runReadDirectoryTest() {
    readEntriesCount++;
    reader = fileSystem.root.createReader();
    reader.readEntries().then(entriesCallback, onError: errorCallback);
  }

  prepareForTest() {
    var helper = new JoinHelper();
    var done = (_) { helper.done(); };

    for (var path in testEntries.keys) {
      testEntriesCount++;
      if (testEntries[path])
        helper.run(() { fileSystem.root.createDirectory(path).then(done, onError: errorCallback); });
      else
        helper.run(() { fileSystem.root.createFile(path).then(done, onError: errorCallback); });
    }
    helper.join(runReadDirectoryTest);
  }

  successCallback(fs) {
    fileSystem = fs;
    debug("Successfully obtained Persistent FileSystem:" + fileSystem.name);
    removeAllInDirectory(fileSystem.root, prepareForTest, errorCallback);
  }

  asyncStart();
  window.requestFileSystem(100).then(successCallback, onError: errorCallback);
}
