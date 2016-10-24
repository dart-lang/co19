/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks to ensure that a webgl context can be created
 * with the 'webgl' context ID
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body
    .appendHtml('<canvas id="c"></canvas>');

  dynamic c = document.getElementById("c");
  var gl = c.getContext("webgl");
  if (gl == null)
    testFailed("context does not exist");
  else
    testPassed("context exists");
}
