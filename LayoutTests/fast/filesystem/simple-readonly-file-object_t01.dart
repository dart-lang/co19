/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test readonly attributes of File.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/fs-test-util.dart";

main() {
  addConsole();

  var fileSystem = null;
  var testFileName = '/testFileEntry.txt';
  var testFileEntry = null;
  var testFile = null;

  setReadonlyProperty(getter, setter, value) {
    var oldValue = getter();
    shouldThrow(() => setter(value));
    var newValue = getter();
    shouldBe(oldValue, newValue);
  }

  errorCallback(error) {
    testFailed("Error occured:" + error.name);
    asyncEnd();
  }

  fileCallback(file) {
    testFile = file;
    setReadonlyProperty(() => testFile.size, (x) {testFile.size = x;}, 1);
    setReadonlyProperty(() => testFile.type, (x) {testFile.type = x;}, 'application/octet-stream');
    setReadonlyProperty(() => testFile.name, (x) {testFile.name = x;}, 'bar');
    asyncEnd();
  }

  getFileFromEntry(entry) {
    testFileEntry = entry;
    testFileEntry.file().then(fileCallback, onError: errorCallback);
  }

  createTestFile() {
    fileSystem.root.createFile(testFileName).then(getFileFromEntry, onError: errorCallback);
  }

  fileSystemCallback(fs) {
    fileSystem = fs;
    removeAllInDirectory(fileSystem.root, createTestFile, errorCallback);
  }

  asyncStart();
  window.requestFileSystem(100).then(fileSystemCallback, onError: errorCallback);
}
