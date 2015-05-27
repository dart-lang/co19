/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTMLCollection namedItem Method
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var form = document.createElement('form');
  document.body.append(form);
  //shouldBeNull(form.elements.namedItem("any"));
}
