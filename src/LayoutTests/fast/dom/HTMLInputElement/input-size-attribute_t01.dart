/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTMLInputElement size attribute test
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var input = document.createElement("input");

  shouldBe(input.size, 20);
  input.setAttribute('size', '-1');
  shouldBe(input.size, 20);
  input.attributes.remove('size');
  shouldBe(input.size, 20);
  input.setAttribute('size', '1');
  shouldBe(input.size, 1);
  input.setAttribute('size', '2');
  shouldBe(input.size, 2);
  input.attributes.remove('size');
  shouldBe(input.size, 20);
  input.setAttribute('size', 'a');
  shouldBe(input.size, 20);
  input.attributes.remove('size');
  shouldBe(input.size, 20);
  input.setAttribute('size', '0');
  shouldBe(input.size, 20);
  input.setAttribute('size', '10');
  shouldBe(input.size, 10);

  shouldThrow(() {
    input.size = 0;
  }, (e) => e is DomException && e.name == DomException.INDEX_SIZE);
}
