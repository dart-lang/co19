/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This is a test for
 * https://bugs.webkit.org/show_bug.cgi?id=21063 (NULL pointer crash in
 * dispatchEvent(null)).  It passes if it does not crash.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  // FIXME: this should also test WorkerContext and MessagePort.
  var eventTargets = [
    new HttpRequest(),
    (new HttpRequest()).upload,
    window.applicationCache,
    //new Worker("about:blank"),
    document.body
  ];

  for (var eventTarget in eventTargets) {
    try {
      eventTarget.dispatchEvent(null);
    } catch(e) {
    }

    try {
      eventTarget.dispatchEvent("string");
    } catch(e) {
    }

    try {
      eventTarget.dispatchEvent(0);
    } catch(e) {
    }

    try {
      eventTarget.dispatchEvent({});
    } catch(e) {
    }
  }
}
