/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=50335
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;

  input.setAttribute('incremental', '');
  shouldBeTrue(input.incremental);

  input.attributes.remove('incremental');
  shouldBeFalse(input.incremental);

  input.incremental = true;
  shouldBeTrue(input.attributes.containsKey("incremental"));

  input.incremental = false;
  shouldBeFalse(input.attributes.containsKey("incremental"));
}
