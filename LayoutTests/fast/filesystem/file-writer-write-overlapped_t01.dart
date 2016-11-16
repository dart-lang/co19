/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test using FileWriter.seek to write overlapping existing data
 * in a file.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/file-writer-utils.dart";

main() {
  document.body.appendHtml('<div id="console"></div>');

  var fileEntry;
  var fileWriter;
  var testData = "Lorem ipsum";
  var seekBackwardOffset = -4;
  var seekForwardOffset = 4;

  onTestSucceeded()
  {
    testPassed("All writes verified.");
    cleanUp();
  }

  validateNonextendingWriteEnd() {
    verifyByteRangeAsString(fileEntry, testData.length + seekForwardOffset, testData.substring(seekForwardOffset), onTestSucceeded);
  }

  validateNonextendingWriteStart() {
    testPassed("Nonextending write validated.");
    shouldBeTrue(fileWriter.length == testData.length * 2);
    verifyByteRangeAsString(fileEntry, 0, testData.substring(0, seekForwardOffset), validateNonextendingWriteEnd);
  }

  testNonextendingWrite() {
    writeString(fileEntry, fileWriter, seekForwardOffset, testData, validateNonextendingWriteStart);
  }

  setupNonextendingWrite() {
    testPassed("Positive seek validated.");
    setFileContents(fileEntry, fileWriter, testData + testData, testNonextendingWrite);
  }

  validateSeekForward() {
    shouldBeTrue(fileWriter.length == testData.length + seekForwardOffset);
    verifyByteRangeAsString(fileEntry, 0, testData.substring(0, seekForwardOffset), setupNonextendingWrite);
  }

  testSeekForward() {
    writeString(fileEntry, fileWriter, seekForwardOffset, testData, validateSeekForward);
  }

  setupSeekForward() {
    testPassed("Negative seek validated.");
    setFileContents(fileEntry, fileWriter, testData, testSeekForward);
  }

  validateSeekBackward() {
    shouldBeTrue(fileWriter.length == 2 * testData.length + seekBackwardOffset);
    verifyByteRangeAsString(fileEntry, 0, testData.substring(0, testData.length + seekBackwardOffset), setupSeekForward);
  }

  testSeekBackward() {
    writeString(fileEntry, fileWriter, seekBackwardOffset, testData, validateSeekBackward);
  }

  // Each test has 3 phases: setup, execution, and validation.  In the setup phase, we make sure that there's a FileWriter pointing at a file with appropriate
  // data for the test we want to run.  In the execution phase, we do a seek and a write, and the utility  that does those also validates that the data
  // actually got written.  So in the validation phase, we only have to check that the rest of the file didn't get corrupted while we were writing our bit.
  runTest(fileEntryIn, fileWriterIn) {
    fileEntry = fileEntryIn;
    fileWriter = fileWriterIn;
    setFileContents(fileEntry, fileWriter, testData, testSeekBackward);
  }

  setupAndRunTest(1024, 'file-writer-truncate-extend', runTest);
}
