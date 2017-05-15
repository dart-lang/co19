/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that a blob won't get garbage-collected while being
 * written out by a FileWriter.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "resources/file-writer-utils.dart";

main() {
  document.body.appendHtml('<div id="console"></div>',
      treeSanitizer: NodeTreeSanitizer.trusted);

  var fileEntry;

  onTestSuccess(_) {
    testPassed("Successfully wrote blob.");
    cleanUp();
  }

  tenXBlob(blob) {
    var bb = [];
    for (var i = 0; i < 10; ++i) {
      bb.add(blob);
    }
    return new Blob(bb);
  }

  startWrite(writer) {
    // Let's make it about a megabyte.
    var blob = tenXBlob(new Blob(["lorem ipsum"]));
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    blob = tenXBlob(blob);
    writer.onError.listen(onError);
    writer.onWriteEnd.listen(onTestSuccess);
    writer.write(blob);
  }

  runTest(unusedFileEntry, fileWriter) {
    startWrite(fileWriter);
    gc();
  }

  setupAndRunTest(2*1024*1024, 'file-writer-gc-blob', runTest);
}
