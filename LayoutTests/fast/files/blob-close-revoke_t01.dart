/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the Blob.close() method, revoking.
 */
import "dart:html";
import "dart:typed_data";
import "../../testcommon.dart";

main() {
  base64ToUint8Array(a)
  {
    var binary = window.atob(a);
    var buffer = new Uint8List(binary.length);
    for (var i = 0; i < binary.length; i++)
      buffer[i] = binary.codeUnitAt(i);

    return buffer;
  }

  var pngBase64 = "iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAIAAAD/gAIDAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAnklEQVR42u3QMQEAAAgDoGlyo1vBzwciUJlw1ApkyZIlS5YsBbJkyZIlS5YCWbJkyZIlS4EsWbJkyZKlQJYsWbJkyVIgS5YsWbJkKZAlS5YsWbIUyJIlS5YsWQpkyZIlS5YsBbJkyZIlS5YCWbJkyZIlS4EsWbJkyZKlQJYsWbJkyVIgS5YsWbJkKZAlS5YsWbIUyJIlS5YsWQpkyfq2MosBSIeKONMAAAAASUVORK5CYII=";

  var blobContents = [base64ToUint8Array(pngBase64)];

  var blob;
  var blobURL1;
  var img;
  var worker;
  var blobURLs = [];
  var runNextTest;

  testRevokeAfterCloseWorkers()
  {
    debug("Test that dereferencing URLs referring to closed Blobs fail, workers.");
    blob = new Blob(["postMessage('FAIL');"], "application/javascript");
    var testNextWorker;

    for (var i = 0; i < 10; i++)
      blobURLs.add(Url.createObjectUrl(blob));

    // First check that the Blob URL can be used by a Worker,
    // then close it and verify that the rest cannot.

    onNonClosedError(_) {
      testFailed("Worker failed to load from Blob.");
      blob.close();
      testNextWorker();
    }
    onNonClosedMessage(_) {
      testPassed("Worker loaded.");
      blob.close();
      testNextWorker();
    }
    onClosedError(_) {
      testPassed("Error triggered on starting Worker from a closed Blob.");
      testNextWorker();
    }
    onClosedMessage(_) {
      testFailed("Worker loaded.");
      testNextWorker();
    }

    testNextWorker = ([onerror, onmessage]) {
      if (!blobURLs.isEmpty) {
        var u = blobURLs.removeAt(0);
        worker = new Worker(u);
        worker.onError.listen(onerror != null ? onerror : onClosedError);
        worker.onMessage.listen(onmessage != null ? onmessage : onClosedMessage);
      } else {
        runNextTest();
      }
    };
    testNextWorker(onNonClosedError, onNonClosedMessage);
  }

  testRevokeAfterClose()
  {
    debug("Test that dereferencing URLs referring to closed Blobs fail.");
    blob = new Blob(blobContents, "image/png");
    img = document.createElement("img");
    img.onError.listen((e) {
      testPassed("Error triggered on loading image from closed Blob.");
      runNextTest();
    });
    img.onLoad.listen((_) {
      testFailed("Image loaded");
      runNextTest();
    });
    blobURL1 = Url.createObjectUrl(blob);
    // create some more Blob URLs.
    for (var i = 0; i < 10; i++)
      Url.createObjectUrl(blob);
    // Make them all inaccessible.
    blob.close();
    img.src = blobURL1;
  }

  testCreateAfterClose()
  {
    debug("Test creating object URLs on closed Blobs");
    blob = new Blob(["body{background: green}"], "text/css");
    blob.close();
    shouldThrow(() => Url.createObjectUrl(blob));
    runNextTest();
  }

  var tests = [
    testRevokeAfterClose,
    testRevokeAfterCloseWorkers,
    testCreateAfterClose ];

  runNextTest = ()
  {
    if (tests.isEmpty) {
      asyncEnd();
      return;
    } else {
      tests.removeAt(0)();
    }
  };

  asyncStart();
  runNextTest();
}
