/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  addConsole();

  EventListener onError(msg) => (e) {
    testFailed('Failed during $msg: $e');
  };

  var gotFile, gotEntry;

  var firstGotFile = true;

  gotFile = (entry) => (file) {
    if (firstGotFile) {
      firstGotFile = false;
      setTimeout(() => gotEntry(entry), 0);
      return;
    }
    var reader = new FileReader();
    reader.onError.listen(onError('FileReader'));
    reader.onLoadEnd.listen((_) {
      testPassed('PASS');
      asyncEnd();
    });
    reader.readAsText(file);
  };

  gotEntry = (entry) {
    entry.file().then(gotFile(entry), onError: onError('file'));
    gc();
  };

  gotFS(fs) {
    fs.root.createFile('foo').then(gotEntry, onError: onError('getFile'));
  }

  asyncStart();
  window.requestFileSystem(0).then(gotFS, onError: onError('requestFileSystem'));
}
