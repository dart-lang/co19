/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test setting valid and invalid properties of HTMLProgressElement.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  ProgressElement p = document.createElement('progress');

  debug("Test values before properties were set");
  shouldBe(p.value, 0);
  shouldBe(p.max, 1);
  shouldBe(p.position, -1);

  debug("Set valid values");
  p.value = 7e1;
  p.max = 1e2;
  shouldBe(p.value, 70);
  shouldBe(p.max, 100);
  shouldBe(p.position, 0.7);

  debug("Set value bigger than max");
  p.value = 200;
  p.max = 100.0;
  shouldBe(p.value, 100);
  shouldBe(p.max, 100);
  shouldBe(p.position, 1);

  debug("Set value less than zero");
  p.value = -42;
  shouldBe(p.value, 0);
  shouldBe(p.position, 0);

  debug("Set attributes to valid numbers");
  p.setAttribute("value", "5");
  p.setAttribute("max", "10");
  shouldBe(p.value, 5);
  shouldBe(p.max, 10);
  shouldBe(num.parse(p.getAttribute('value')), 5);
  shouldBe(num.parse(p.getAttribute('max')), 10);

  debug("Set attributes to invalid values");
  p.setAttribute("value", "ABC");
  p.setAttribute("max", "#");
  shouldBe(p.value, 0);
  shouldBe(p.max, 1);
  shouldBe(p.getAttribute('value'), 'ABC');
  shouldBe(p.getAttribute('max'), '#');

  debug("Set value and max to numbers with leading spaces");
  p.setAttribute("value", " 5");
  p.setAttribute("max", " 10");
  shouldBe(p.value, 0);
  shouldBe(p.max, 1);
  shouldBe(p.position, 0);
}
