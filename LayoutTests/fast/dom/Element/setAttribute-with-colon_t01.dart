/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests checks whether setAttribute allows name parameters
 * with colons in them.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var elem = document.createElementNS('http://www.example.org', 'test');
  elem.setAttribute('bb:dddd', 'attr_value');
  Expect.equals('attr_value', elem.getAttribute('bb:dddd'));
}

