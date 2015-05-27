/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that FileWriter handles abort properly.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "resources/file-writer-utils.dart";

main() {
  document.body.appendHtml('<div id="console"></div>');

  var sawWriteStart;
  var sawAbort;
  var sawWriteEnd;
  var writer;

  tenXBlob(blob) {
    var bb = [];
    for (var i = 0; i < 10; ++i) {
      bb.add(blob);
    }
    return new Blob(bb);
  }

  onWriteStart(e) {
    shouldBeTrue(writer != null);
    shouldBeTrue(writer.readyState == FileWriter.WRITING);
    shouldBeTrue(e.type == "writestart");
    shouldBeTrue(!sawWriteStart);
    shouldBeTrue(!sawWriteEnd);
    shouldBeTrue(!e.loaded);
    sawWriteStart = true;
    testPassed("Calling abort");
    writer.abort();
  }

  // We should always abort before completion.
  onWrite(e) {
    testFailed("In onWrite.");
  }

  onAbort(e) {
    shouldBeTrue(writer.readyState == FileWriter.DONE);
    shouldBeTrue(writer.error.name == "AbortError");
    shouldBeTrue(sawWriteStart);
    shouldBeTrue(!sawWriteEnd);
    shouldBeTrue(!sawAbort);
    shouldBeTrue(e.type == "abort");
    sawAbort = true;
    testPassed("Saw abort");
  }

  onWriteEnd(e) {
    shouldBeTrue(writer.readyState == FileWriter.DONE);
    shouldBeTrue(writer.error.name == "AbortError");
    shouldBeTrue(sawWriteStart);
    shouldBeTrue(sawAbort);
    shouldBeTrue(!sawWriteEnd);
    shouldBeTrue(e.type == "writeend");
    sawWriteEnd = true;
    testPassed("Saw writeend.");
    writer.abort();  // Verify that this does nothing in readyState DONE.
    cleanUp();
  }

  startWrite(fileWriter) {
    // Let's make it about a megabyte.
    var blob = tenXBlob(new Blob(["lorem ipsum"]));
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    writer = fileWriter;
    fileWriter.onError.listen(onError);
    fileWriter.onAbort.listen(onAbort);
    fileWriter.onWriteStart.listen(onWriteStart);
    fileWriter.onWrite.listen(onWrite);
    fileWriter.onWriteEnd.listen(onWriteEnd);
    fileWriter.abort();  // Verify that this does nothing in readyState INIT.
    fileWriter.write(blob);
  }

  runTest(unusedFileEntry, fileWriter) {
    startWrite(fileWriter);
  }

  setupAndRunTest(2*1024*1024, 'file-writer-abort', runTest);
}
