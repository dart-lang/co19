/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that FileWriter defends against infinite recursion via
 * abort.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/file-writer-utils.dart";

main() {
  document.body.appendHtml('<div id="console"></div>');

  var writer;
  var blob = new Blob(["lorem ipsum"]);
  var recursionDepth = 0;
  var method;
  var testsRun = 0;

  onWriteStart(e) {
    testPassed("Calling abort");
    ++recursionDepth;
    writer.abort();
  }

  // We should always abort before completion.
  onWrite(e) {
    testFailed("In onWrite.");
  }

  onAbort(e) {
    testPassed("Saw abort");
    try {
      method();
    } catch (ex) {
      shouldBe(ex.name, 'SecurityError');
      testPassed("Saw security error");
    }
  }

  onWriteEnd(e) {
    --recursionDepth;
    testPassed("Saw writeend.");
    if (recursionDepth == 0) {
      ++testsRun;
      if (testsRun == 1) {
        method = () {
          testPassed("Calling truncate.");
          writer.truncate(7);
        };
        setTimeout(method, 0);  // Invoke from the top level, so that we're not already in a handler.
      } else {
        cleanUp();
      }
    }
  }

  runTest(unusedFileEntry, fileWriter) {
    writer = fileWriter;
    method = () {
      testPassed("Calling write.");
      writer.write(blob);
    };
    fileWriter.onError.listen(onError);
    fileWriter.onAbort.listen(onAbort);
    fileWriter.onWriteStart.listen(onWriteStart);
    fileWriter.onWrite.listen(onWrite);
    fileWriter.onWriteEnd.listen(onWriteEnd);
    method();
  }

  setupAndRunTest(2*1024*1024, 'file-writer-abort-depth', runTest);
}
