/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test making multiple async FileSystem operations.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/fs-test-util.dart";

main() {
  var fileSystem = null;

  var a;
  var b;
  var c;
  var d;

  var paths = [];
  var dirsCount = 0;
  var reader = null;

  errorCallback(e) {
  testFailed("${e.name}");
    asyncEnd();
  }

  entriesCallback(entries) {
    for (var entry in entries) {
      paths.add(entry.fullPath);
      if (entry.isDirectory)
        dirsCount++;
    }
    if (entries.length > 0) {
      reader.readEntries().then(entriesCallback, onError: errorCallback);
    } else {
      paths.sort();
      shouldBe(paths.join(','), "/a,/b,/c,/d2,/e,/f");
      shouldBe(dirsCount, 3);
      asyncEnd();
    }
  }

  verify() {
    debug("Verifying the FileSystem status.");
    reader = fileSystem.root.createReader();
    reader.readEntries().then(entriesCallback, onError: errorCallback);
  }

  asyncTest2() {
    debug("Starting async test stage 2.");

    var helper = new JoinHelper();
    var done = (_) { helper.done(); };

    helper.run(() { a.copyTo(b, name:'tmp').then(done, onError: errorCallback); });
    helper.run(() { a.getMetadata().then(done, onError: errorCallback); });
    helper.run(() { b.getParent().then(done, onError: errorCallback); });
    helper.run(() { c.copyTo(fileSystem.root, name:'f').then(done, onError: errorCallback); });
    helper.run(() { d.moveTo(fileSystem.root, name:'d2').then(done, onError: errorCallback); });
    helper.run(() { fileSystem.root.createFile('e').then(done, onError: errorCallback); });

    helper.join(verify);
  }

  asyncTest1() {
    debug("Starting async test stage 1.");

    var helper = new JoinHelper();
    var root = fileSystem.root;

    helper.run(() { root.createFile('a').then((entry) {
      a = entry;
      helper.done();
    }, onError: errorCallback); });

    helper.run(() { root.createDirectory('b').then((entry) {
      b = entry;
      helper.done();
    }, onError: errorCallback); });

    helper.run(() { root.createDirectory('c').then((entry) {
      c = entry;
      helper.done();
    }, onError: errorCallback); });

    helper.run(() { root.createFile('d').then((entry) {
      d = entry;
      helper.done();
    }, onError: errorCallback); });

    helper.join(asyncTest2);
  }

  asyncStart();

  window.requestFileSystem(100).then((fs) {
    fileSystem = fs;
    asyncTest1();
  }, onError: errorCallback);
}
