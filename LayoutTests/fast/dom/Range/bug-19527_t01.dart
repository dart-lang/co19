/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test Range.comparePoint and Range.isPointInRange Firefox
 * extensions.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <p>Test Range.comparePoint and Range.isPointInRange Firefox extensions.</p>
    ''', treeSanitizer: new NullTreeSanitizer());

  var ra = document.createRange();
  ra.selectNode(document.getElementsByTagName("p")[0]);

  _shouldThrow(func(), name) =>
    shouldThrow(func, (e) => e is DomException && e.name == name);

  _shouldThrow(() => ra.comparePoint(document.createElement('b'), 0),
      DomException.WRONG_DOCUMENT);
  _shouldThrow(() => ra.comparePoint(null, 0),
      DomException.HIERARCHY_REQUEST);
  shouldBe(ra.comparePoint(document.body, 0), -1);
  shouldBe(ra.comparePoint(document.documentElement, 0), -1);
  shouldBe(ra.isPointInRange(document.createElement('b'), 0), false);
  shouldBe(ra.isPointInRange(document.documentElement, 0), false);
  shouldBe(ra.isPointInRange(document.body, 0), false);
  _shouldThrow(() => ra.isPointInRange(null, 0),
      DomException.HIERARCHY_REQUEST);

  ra.detach();

  _shouldThrow(() => ra.comparePoint(document.createElement('b'), 0),
      DomException.WRONG_DOCUMENT);
  shouldBe(ra.comparePoint(document.body, 0), -1);
  _shouldThrow(() => ra.comparePoint(null, 0),
      DomException.HIERARCHY_REQUEST);
  shouldBe(ra.isPointInRange(document.createElement('b'), 0), false);
  shouldBe(ra.isPointInRange(document.body, 0), false);
  _shouldThrow(() => ra.isPointInRange(null, 0),
      DomException.HIERARCHY_REQUEST);
}
