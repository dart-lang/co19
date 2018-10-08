/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This verifies File.size (for a file from FileSystem API) always
 * returns the fresh size even after the file is modified.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var fileEntryForCleanup;
  var testFile;
  var testText1 = '1234567890';
  var testText2 = 'abcdefghijklmnopqrstuvwxyz';

  end(_) => asyncEnd();

  cleanup()
  {
    if (fileEntryForCleanup != null) {
      fileEntryForCleanup.remove().then(end, onError: end);
      return;
    }
    asyncEnd();
  }

  onError(e)
  {
    testFailed(e.name);
    cleanup();
  }

  writeTextToFile(entry, contents, successCallback)
  {
    debug('Writing ' + contents + ' to the file...');
    entry.createWriter().then((writer) {
      debug('Created a writer.');
      writer.write(new Blob([contents], 'text/plain'));
      writer.onWriteEnd.listen(successCallback);
      writer.onError.listen(onError);
    });
  }

  onWrittenFile(entry, file) {
    testFile = file;
    shouldBe(testFile.size, testText1.length);
    // Write into this file again.
    writeTextToFile(entry, testText2, (_) {
      debug('Write succeeded.');
      entry.file().then((file) {
        // The file size should be updated.
        shouldBe(testFile.size, testText2.length);
        cleanup();
      }, onError: onError);
    });
  }

  asyncStart();

  window.requestFileSystem(100).then((fs) {
    fs.root.createFile('test').then((entry) {
      fileEntryForCleanup = entry;
      writeTextToFile(entry, testText1, (_) {
        debug('Write succeeded.');
        (entry as FileEntry).file().then((file) =>
            onWrittenFile(entry, file), onError: onError);
      });
    }, onError: onError);
  }, onError: onError);
}
