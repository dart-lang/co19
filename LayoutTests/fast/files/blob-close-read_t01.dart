/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the Blob.close() method, reading.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var blobContents = ['0123456789abcdef'];

  var blob;
  var sliced;
  var reader;
  var reader2;

  var runNextTest;

  //shouldThrow(f) => f();

  testReadAfterClose()
  {
    debug("Testing that the reading of closed Blobs fail.");
    blob = new Blob(blobContents);
    blob.close();
    shouldBe(blob.size, 0);
    reader = new FileReader();
    shouldThrow(() => reader.readAsArrayBuffer(blob));
    shouldThrow(() => reader.readAsText(blob)); //bug, does not throw
    shouldThrow(() => reader.readAsDataUrl(blob));
    runNextTest();
  }

  testSlicedReadAfterClose()
  {
    debug("Testing that sliced reads aren't affected by close() on 'parent' Blob.");
    blob = new Blob(blobContents);
    sliced = blob.slice(2);
    shouldBe(sliced.size, 14);
    blob.close();
    var reader = new FileReader();
    reader.onLoad.listen((event) {
      FileReader reader = event.target;
      shouldBeEqualToString(reader.result, blobContents[0].substring(2));
    });
    reader.onLoadEnd.listen((_) {
      testPassed("readAsText() completed");
      shouldBe(sliced.size, 14);
      runNextTest();
    });
    reader.onError.listen((event) {
      testFailed(
          "Received error event: ${(event.target as FileReader).error.name}");
    });
    reader.readAsText(sliced);
  }

  testContinuedReadAfterClose()
  {
    debug("Testing that ongoing async reads aren't interrupted by close()");
    blob = new Blob(blobContents);
    var reader = new FileReader();
    reader.onLoadStart.listen((event) {
      // Close the Blob being read.
      blob.close();
      reader2 = new FileReader();
      shouldThrow(() => reader2.readAsArrayBuffer(blob));
      shouldBe(blob.size, 0);
    });
    reader.onLoad.listen((event) {
      FileReader target = event.target;
      testPassed("FileReader loaded: ${target.result}");
    });
    reader.onLoadEnd.listen((_) {
      testPassed("readAsText() completed");
      shouldBe(blob.size, 0);
      runNextTest();
    });
    reader.onError.listen((event) {
      FileReader target = event.target;
      testFailed("Received error event: ${target.error.name}");
      runNextTest();
    });
    reader.readAsText(blob);
  }

  var tests = [
    testReadAfterClose,
    testContinuedReadAfterClose,
    testSlicedReadAfterClose ];

  runNextTest = ()
  {
    if (tests.isEmpty) {
      asyncEnd();
    } else {
      tests.removeAt(0)();
    }
  };

  asyncStart();
  runNextTest();
}
