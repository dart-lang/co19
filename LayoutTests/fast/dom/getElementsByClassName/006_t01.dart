/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description document.getElementsByClassName(): adding element with class
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.className = "a";

  var collection = document.getElementsByClassName("a"),
      ele = document.createElement("foo");

  ele.setAttribute("class", "a");
  document.body.append(ele);

  shouldBeList(collection, [document.body, ele]);
}
