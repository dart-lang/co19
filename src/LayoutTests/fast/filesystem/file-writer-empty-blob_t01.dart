/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that FileWriter works without crash when trying to write
 * an empty blob.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "resources/file-writer-utils.dart";

main() {
  document.body.appendHtml('<div id="console"></div>');

  onTestSuccess(_) {
    testPassed("Successfully wrote blob.");
    cleanUp();
  }

  startWrite(writer) {
    var blob = new Blob([""]);
    writer.onError.listen(onError);
    writer.onWriteEnd.listen(onTestSuccess);
    writer.write(blob);
  }

  runTest(unusedFileEntry, fileWriter) {
    startWrite(fileWriter);
    gc();
  }

  setupAndRunTest(2 * 1024 * 1024, 'file-writer-empty-blob', runTest);
}
