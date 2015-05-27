/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that FileWriter produces proper progress events.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "resources/file-writer-utils.dart";

main() {
  document.body.appendHtml('<div id="console"></div>');

  var fileEntry;
  var sawWriteStart;
  var sawWrite;
  var sawWriteEnd;
  var sawProgress;
  var writer;
  var lastProgress = 0;
  var toBeWritten;

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
    shouldBeTrue(!sawProgress);
    shouldBeTrue(!sawWrite);
    shouldBeTrue(!sawWriteEnd);
    shouldBeTrue(!e.loaded);
    shouldBeTrue(e.total == toBeWritten);
    sawWriteStart = true;
  }

  onProgress(e) {
    shouldBeTrue(writer.readyState == FileWriter.WRITING);
    shouldBeTrue(sawWriteStart);
    shouldBeTrue(!sawWrite);
    shouldBeTrue(!sawWriteEnd);
    shouldBeTrue(e.type == "progress");
    shouldBeTrue(e.loaded <= e.total);
    shouldBeTrue(lastProgress < e.loaded);
    shouldBeTrue(e.total == toBeWritten);
    lastProgress = e.loaded;
    sawProgress = true;
  }

  onWrite(e) {
    shouldBeTrue(writer.readyState == FileWriter.DONE);
    shouldBeTrue(sawWriteStart);
    shouldBeTrue(sawProgress);
    shouldBeTrue(lastProgress == e.total);
    shouldBeTrue(!sawWrite);
    shouldBeTrue(!sawWriteEnd);
    shouldBeTrue(e.type == "write");
    shouldBeTrue(e.loaded == e.total);
    shouldBeTrue(e.total == toBeWritten);
    sawWrite = true;
  }

  onWriteEnd(e) {
    shouldBeTrue(writer.readyState == FileWriter.DONE);
    shouldBeTrue(sawWriteStart);
    shouldBeTrue(sawProgress);
    shouldBeTrue(sawWrite);
    shouldBeTrue(!sawWriteEnd);
    shouldBeTrue(e.type == "writeend");
    shouldBeTrue(e.loaded == e.total);
    shouldBeTrue(e.total == toBeWritten);
    sawWriteEnd = true;
    testPassed("Saw all the right events.");
    cleanUp();
  }

  startWrite(fileWriter) {
    // Let's make it about a megabyte.
    var blob = tenXBlob(new Blob(["lorem ipsum"]));
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    toBeWritten = blob.size;
    writer = fileWriter;
    fileWriter.onError.listen(onError);
    fileWriter.onWriteStart.listen(onWriteStart);
    fileWriter.onProgress.listen(onProgress);
    fileWriter.onWrite.listen(onWrite);
    fileWriter.onWriteEnd.listen(onWriteEnd);
    fileWriter.write(blob);
  }

  runTest(unusedFileEntry, fileWriter) {
    startWrite(fileWriter);
  }

  setupAndRunTest(2*1024*1024, 'file-writer-events', runTest);
}
