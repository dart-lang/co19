/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that FileWriter can continue immediately after an abort.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "resources/file-writer-utils.dart";

class MethodSet {
  var action,
      truncateLength,
      verifyLength,
      onwritestart,
      onprogress,
      onwrite,
      onabort,
      onwriteend;
  MethodSet({this.action,
    this.truncateLength,
    this.verifyLength,
    this.onwritestart,
    this.onprogress,
    this.onwrite,
    this.onabort,
    this.onwriteend});
}

main() {
  document.body.appendHtml('<div id="console"></div>');

  var sawWriteStart;
  var sawAbort;
  var sawWriteEnd;
  var writer;
  var expectedLength;
  var truncateLength;
  var blobSize = 1100000;
  var currentTest = 0;

  // fileSystemOverhead is an estimate of extra size needed to save a full file
  // system, it need to be large enough to avoid test failure due to file system
  // quota limit.
  var fileSystemOverhead = blobSize * 5 ~/ 1000 + 1024;
  var fileSystemSize = blobSize * 2 + fileSystemOverhead;

  var methodSet;
  var runTest;

  nop(_) {}

  tenXBlob(blob) {
    var bb = [];
    for (var i = 0; i < 10; ++i) {
      bb.add(blob);
    }
    return new Blob(bb);
  }

  getBlob() {
    // Let's make it about a megabyte.
    var blob = tenXBlob(new Blob(["lorem ipsum"]));
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    var size = blob.size;
    shouldBe(size, blobSize);
    return blob;
  }

  var blob = getBlob();

  abortWrite(e) {
    testPassed("Calling abort $currentTest");
    writer.abort();
  }

  abortOnComplete(e) {
    if (e.loaded == e.total) {
      testPassed("Calling abort at the end of the write");
      writer.abort();
    }
  }

  logAbort(e) {
    testPassed("Saw abort");
  }

  checkLengthAndStartNextTest(e) {
    shouldBe(writer.length, expectedLength);
    testPassed('writer.length is $expectedLength');
    testPassed("Saw writeend $currentTest.");
    ++currentTest;
    if (currentTest < methodSet.length)
      runTest();
    else {
      testPassed("All tests complete.");
      cleanUp();
    }
  }

  startWrite() {
    testPassed("Calling write.");
    writer.write(blob);
  }

  startTruncate() {
    testPassed("Calling truncate.");
    writer.truncate(truncateLength);
  }

  methodSet = [
  new MethodSet(  // Setup method set that writes, then aborts that write before completion.
    action : startWrite,
    verifyLength : 0,
    onwritestart : abortWrite,
    onprogress : nop,
    onwrite : onError,
    onabort : logAbort,
    onwriteend : checkLengthAndStartNextTest
  ),
  new MethodSet(  // Method set that does a complete write.
    action : startWrite,
    verifyLength : blobSize,
    onwritestart : nop,
    onprogress : nop,
    onwrite : nop,
    onabort : onError,
    onwriteend : checkLengthAndStartNextTest
  ),
  new MethodSet( // Method set that does a complete truncate, just to clean up.
    action : startTruncate,
    truncateLength : 0,
    verifyLength : 0,
    onwritestart : nop,
    onprogress : nop,
    onwrite : nop,
    onabort : onError,
    onwriteend : checkLengthAndStartNextTest
  ),
  new MethodSet(  // Setup method set that writes, then aborts that write just at completion.
    action : startWrite,
    verifyLength : blobSize,
    onwritestart : nop,
    onprogress : abortOnComplete,
    onwrite : nop,
    onabort : logAbort,
    onwriteend : checkLengthAndStartNextTest
  ),
  new MethodSet(  // Method set that does a complete write.
    action : startWrite,
    verifyLength : blobSize * 2, // Add in leftovers from previous method.
    onwritestart : nop,
    onprogress : nop,
    onwrite : nop,
    onabort : onError,
    onwriteend : checkLengthAndStartNextTest
  ),
  new MethodSet( // Method set that does a complete truncate, just to clean up.
    action : startTruncate,
    truncateLength : 0,
    verifyLength : 0,
    onwritestart : nop,
    onprogress : nop,
    onwrite : nop,
    onabort : onError,
    onwriteend : checkLengthAndStartNextTest
  ),
  new MethodSet(  // Setup method set that writes, then aborts that write as it starts.
    action : startWrite,
    verifyLength : 0,
    onwritestart : abortWrite,
    onprogress : nop,
    onwrite : onError,
    onabort : logAbort,
    onwriteend : checkLengthAndStartNextTest
  ),
  new MethodSet( // Method set that does a complete truncate.
    action : startTruncate,
    truncateLength : 7,
    verifyLength : 7,
    onwritestart : nop,
    onprogress : nop,
    onwrite : nop,
    onabort : onError,
    onwriteend : checkLengthAndStartNextTest
  )
  ];

  /*
     looks like writer object is the same each time,
     so we need to remove event listeners from previous run
  */
  var onerror;
  var onabort;
  var onwritestart;
  var onprogress;
  var onwrite;
  var onwriteend;

  setupWriter(methodSetIndex, writer) {
    var methods = methodSet[methodSetIndex];

    writer.removeEventListener('error', onerror);
    writer.removeEventListener('abort', onabort);
    writer.removeEventListener('writestart', onwritestart);
    writer.removeEventListener('progress', onprogress);
    writer.removeEventListener('write', onwrite);
    writer.removeEventListener('writeend', onwriteend);

    onerror = onError;
    onabort = methods.onabort;
    onwritestart = methods.onwritestart;
    onprogress = methods.onprogress;
    onwrite = methods.onwrite;
    onwriteend = methods.onwriteend;

    writer.onError.listen(onError);
    writer.onAbort.listen(onabort);
    writer.onWriteStart.listen(onwritestart);
    writer.onProgress.listen(onprogress);
    writer.onWrite.listen(onwrite);
    writer.onWriteEnd.listen(onwriteend);

    expectedLength = methods.verifyLength;
    truncateLength = methods.truncateLength;

    methods.action();
  }

  runTest = () {
    setupWriter(currentTest, writer);
  };

  setupAndRunTest(fileSystemSize, 'file-writer-abort', (fileEntry, fileWriter) {
    fileEntryForCleanup = fileEntry;
    writer = fileWriter;
    runTest();
  });
}
