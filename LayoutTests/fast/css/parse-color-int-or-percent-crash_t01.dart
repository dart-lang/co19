/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var stopElement = document.createElementNS("http://www.w3.org/2000/svg", "stop");
  //stopElement.style.stopColor = "blue";
  stopElement.style.setProperty("stop-color", "blue");

  var colorString = "rgb(00000000000000000000";
  stopElement.style.setProperty("stop-color", colorString);
  //shouldBe(stopElement.style.stopColor, "rgb(0, 0, 255)");
  shouldBe(stopElement.style.getPropertyValue("stop-color"), "rgb(0, 0, 255)");
}
