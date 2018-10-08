/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test inline web worker via blob URL.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var msg = 'Hello from worker';

  var string = [
    "onmessage = function(e) {",
    "    postMessage('Hello from worker');",
    "};"
  ].join('\n');

  var blobURL = Url.createObjectUrl(new Blob([string]));
  var worker = new Worker(blobURL);
  worker.onMessage.listen((event) {
    shouldBe(event.data, msg);
    asyncEnd();
  });
  asyncStart();
  worker.postMessage('');
}
