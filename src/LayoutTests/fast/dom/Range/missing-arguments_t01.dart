/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var range = document.createRange();
  var node = document.body;

  [
    () => range.compareBoundaryPoints(),
    () => range.compareBoundaryPoints(0),
    () => range.comparePoint(),
    () => range.comparePoint(node),
    () => range.createContextualFragment(),
    () => range.insertNode(),
    () => range.intersectsNode(),
    () => range.isPointInRange(),
    () => range.isPointInRange(node),
    () => range.selectNode(),
    () => range.selectNodeContents(),
    () => range.setEnd(),
    () => range.setEnd(node),
    () => range.setEndAfter(),
    () => range.setEndBefore(),
    () => range.setStart(),
    () => range.setStart(node),
    () => range.setStartAfter(),
    () => range.setStartBefore(),
    () => range.surroundContents()
  ].forEach((f) {
    shouldThrow(f);
  });
}
