/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * <!-- based on crbug.com/94895#c20
 *      http://crbug.com/94895
 *      http://webkit.org/b/76461 -->
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  onError(msg) => (e) {
    testFailed(msg);
    asyncEnd();
  };

  gotFile(file) {
    // Ignore the result of FileEntry.file().
  }

  gotEntry(entry) {
    // It should not cause a crash that calling FileEntry.file() while the page is unloading.
    window.location.search = '?reenter';
    entry.file().then(gotFile, onError: onError('file'));
  }

  gotFS(fs) {
    fs.root.createFile('hoge').then(gotEntry, onError: onError('getFile'));
  }

  if (window.location.search != '?reenter') {
    //asyncStart();
    window.requestFileSystem(1024*1024).then(gotFS);
  } else {
    //asyncEnd();
  }
}
