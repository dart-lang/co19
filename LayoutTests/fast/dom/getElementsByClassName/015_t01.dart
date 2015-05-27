/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.getElementsByClassName(): live updating
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.documentElement.className = "a";
  document.body.className = "a";

  var elms = document.getElementsByClassName("a");
  elms[1].className = "";
  shouldBeList(elms, [document.documentElement]);
}
