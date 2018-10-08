/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void postMessage(message, String targetOrigin, [List messagePorts])
 * Sends a cross-origin message.
 * @description Checks that the message can be sent to a new window.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const text = "Hi there!";

main() {
  WindowBase nw = window.open("about:blank", "_blank");
  Expect.isTrue(nw is WindowBase);
  asyncStart();
  nw.addEventListener("message", (Event event) {
    print("ev=$event");
    Expect.equals(text, (event as MessageEvent).data);
    nw.close();
    asyncEnd();
  });

  nw.postMessage(text, "*");
}
