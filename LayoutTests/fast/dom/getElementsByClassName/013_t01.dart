/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description element.getElementsByClassName(): adding an element
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.documentElement.className = "a";
  document.body.className = "a";

  var collection = document.body.getElementsByClassName("a"),
      ele = document.createElement("x-y-z");
  ele.className = "a";
  document.body.append(ele);
  shouldBeList(collection, [ele]);
}
