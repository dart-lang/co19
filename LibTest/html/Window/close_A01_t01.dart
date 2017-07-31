/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close()
 * Closes the window.
 * This method should only succeed if the WindowBase object is script-closeable
 * and the window calling close is allowed to navigate the window.
 * A window is script-closeable if it is either a window that was opened by another window,
 * or if it is a window with only one document in its history.
 * A window might not be allowed to navigate, and therefore close,
 * another window due to browser security features.
 * @description Checks that a new window is opened.
 * @needsreview issue #16893
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  WindowBase nw = window.open("about:blank", "_blank");
  nw.close();
  Expect.isTrue(nw.closed);
}
