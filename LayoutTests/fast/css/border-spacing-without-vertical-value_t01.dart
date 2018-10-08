/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests obtaining the value of "border-spacing" property
 * without setting -webkit-border-vertical-spacing.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var a = document.createElement("a");
  a.setAttribute("style", "-webkit-border-horizontal-spacing: 1px;");

  var borderSpacing = a.style.getPropertyValue('border-spacing');
  shouldBe(borderSpacing, '');
}
