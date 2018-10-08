/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test setRangeText() method is not available in date inputs.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../resources/common-setrangetext.dart";

main() {
  runTestsShouldFail("input", { "type": "date" });
}
