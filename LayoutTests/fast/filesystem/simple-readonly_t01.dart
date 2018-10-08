/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description FileSystem API readonly attributes test.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  addConsole();

  var fileSystem;
  var fileEntry;

  setReadonlyProperty(getter, setter, value) {
    var oldValue = getter();
    shouldThrow(() => setter(value));
    var newValue = getter();
    shouldBe(oldValue, newValue);
  }

  errorCallback(err) {
    testFailed(err.toString());
    asyncEnd();
  }

  getFileCallback(entry) {
    fileEntry = entry;
    setReadonlyProperty(() => fileEntry.isFile, (x) {fileEntry.isFile = x;}, false);
    setReadonlyProperty(() => fileEntry.isDirectory, (x) {fileEntry.isDirectory = x;}, true);
    setReadonlyProperty(() => fileEntry.name, (x) {fileEntry.name = x;}, 'bar');
    setReadonlyProperty(() => fileEntry.fullPath, (x) {fileEntry.fullPath = x;}, 'bar');
    setReadonlyProperty(() => fileEntry.filesystem, (x) {fileEntry.filesystem = x;}, null);
    asyncEnd();
  }

  successCallback(fs) {
    fileSystem = fs;
    setReadonlyProperty(() => fileSystem.name, (x) {fileSystem.name = x;}, 'bar');
    var root = fileSystem.root;
    root.createFile('foo').then(getFileCallback, onError: errorCallback);
  }

  asyncStart();
  window.requestFileSystem(100).then(successCallback, onError: errorCallback);
}
