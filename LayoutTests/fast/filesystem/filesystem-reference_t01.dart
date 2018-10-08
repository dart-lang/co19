/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests if Entries returned by callbacks keep ing
 * even after we lose a reference to the filesystem in the script.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/fs-test-util.dart";

main() {
  var testDirectory = null;
  var testEntries = null;

  errorCallback(error)
  {
    testFailed("Error occurred: ${error.name}");
    asyncEnd();
  }

  entriesCallback(entries)
  {
    debug("Running runTest4()...");
    testEntries = entries;
    shouldBe(testEntries.length, 4);
    asyncEnd();
  }

  runTest3()
  {
    debug("Running runTest3()...");
    testDirectory.createReader().readEntries().then(entriesCallback, onError: errorCallback);
    testDirectory = null;
    gc();
  }

  runTest2(root)
  {
    debug("Running runTest2()...");
    var helper = new JoinHelper();
    var done = (_) { helper.done(); };

    helper.run(() { root.createFile('/b/1').then(done, onError: errorCallback); });
    helper.run(() { root.createFile('/b/2').then(done, onError: errorCallback); });
    helper.run(() { root.createFile('/b/3').then(done, onError: errorCallback); });
    helper.run(() { root.createFile('/b/4').then(done, onError: errorCallback); });
    helper.run(() { root.getDirectory('b').then((entry) {
      testDirectory = entry;
      helper.done();
    }, onError: errorCallback); });

    gc();
    helper.join(() { runTest3(); });
  }

  runTest1(root)
  {
    debug("Running runTest1()...");
    var helper = new JoinHelper();
    var done = (_) { helper.done(); };

    helper.run(() { root.createFile('a').then(done, onError: errorCallback); });
    helper.run(() { root.createDirectory('b').then(done, onError: errorCallback); });
    helper.run(() { root.createDirectory('c').then(done, onError: errorCallback); });

    gc();
    helper.join(() { runTest2(root); });
  }

  fileSystemCallback(fs)
  {
    var root = fs.root;
    runTest1(root);
    fs = null;
    gc();
  }

  asyncStart();
  window.requestFileSystem(100).then(fileSystemCallback, onError: errorCallback);
}
