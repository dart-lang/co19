/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that className works on non HTMLElements
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var htmlElement = document.createElement('div');
  htmlElement.setAttribute('class', 'foo');
  Expect.equals('foo', htmlElement.className);

  var xmlElement = document.createElementNS('http://www.example.com', 'xml');
  xmlElement.setAttribute('class', 'foo');
  Expect.equals('foo', xmlElement.className);
}
