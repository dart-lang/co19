/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion WindowBase get contentWindow
 * @description Checks that the property is of type WindowBase.
 * @issue #16937
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

const text = "Hi there!";

main() {
  IFrameElement ife = new IFrameElement();
  document.body.append(ife);
  WindowBase nw = ife.contentWindow;
  asyncStart();
  nw.addEventListener("message", (Event event) {
    Expect.equals(text, (event as MessageEvent).data);
    nw.close();
    asyncEnd();
  });

  nw.postMessage(text, "*");
}
