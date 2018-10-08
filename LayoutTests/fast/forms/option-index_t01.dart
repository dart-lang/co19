/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test makes sure we don't crash when trying to get the
 * index of an option element that has no corresponding select element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var x = new OptionElement(data: 't', value: 'v');
  shouldBe(x.index, 0);
}
