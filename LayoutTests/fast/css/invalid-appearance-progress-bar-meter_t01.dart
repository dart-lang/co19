/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description PASS if it doesn't crash. See Bug 40158.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var inputForProgress = document.createElement("input");
  inputForProgress.setAttribute("style", "-webkit-appearance: progress-bar;");
  document.body.append(inputForProgress);

  var inputForMeter = document.createElement("input");
  inputForMeter.setAttribute("style", "-webkit-appearance: meter;");
  document.body.append(inputForMeter);
}
