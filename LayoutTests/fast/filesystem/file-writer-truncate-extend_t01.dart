/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test of extending a file using truncate().
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/file-writer-utils.dart";

main() {
  document.body.appendHtml('<div id="console"></div>',
      treeSanitizer: NodeTreeSanitizer.trusted);

  onTestSucceeded() {
    testPassed("Truncate extension verified.");
    cleanUp();
  }

  truncateToExtend(fileEntry, fileWriter, contents, onSuccess)
  {
    var extension = 5;
    var lengthChecker = () {
      verifyFileLength(fileEntry, contents.length + extension, onSuccess);
    };
    var extensionChecker = () {
      verifyByteRangeIsZeroes(fileEntry, contents.length, extension, lengthChecker);
    };
    fileWriter.onWrite.listen((_) {
      verifyByteRangeAsString(fileEntry, 0, contents, extensionChecker);
    });
    fileWriter.truncate(contents.length + extension);
  }

  runTest(fileEntry, fileWriter) {
    var contents = "Lorem ipsum";
    writeString(fileEntry, fileWriter, 0, contents,
        () {
          truncateToExtend(fileEntry, fileWriter, contents, onTestSucceeded);
        });
  }

  setupAndRunTest(1024, 'file-writer-truncate-extend', runTest);
}
