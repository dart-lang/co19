/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that page-break-inside property is not inherited
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var parent = document.createElement("div");
  parent.setAttribute("style", "page-break-inside: avoid");

  var child = document.createElement("div");
  parent.append(child);
  document.body.append(parent);

  shouldBe(getComputedStyle(parent).getPropertyValue('page-break-inside'), 'avoid');
  shouldBe(getComputedStyle(child).getPropertyValue('page-break-inside'), 'auto');
}

