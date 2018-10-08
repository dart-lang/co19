/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion WindowBase open(String url, String name, [String options])
 * Opens a new window.
 * @description Checks that a new window is opened.
 */
import "dart:html";
import "../../../UtilsHtml/expect.dart";

main() {
  WindowBase nw = window.open("about:blank", "_blank");
  Expect.isTrue(nw is WindowBase);
  nw.close();
}
