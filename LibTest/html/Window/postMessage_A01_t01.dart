/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void postMessage(message, String targetOrigin, [List messagePorts])
 * Sends a cross-origin message.
 * @description Checks that the message can be sent to the main window.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const text = "Hi there!";

main() {
  asyncStart();
  window.addEventListener("message", (Event event) {
    print("ev=$event");
    Expect.equals(text, (event as MessageEvent).data);
    asyncEnd();
  });

  window.postMessage(text, "*");
}
