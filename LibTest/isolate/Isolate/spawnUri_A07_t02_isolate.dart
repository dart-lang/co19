/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "IsolateUtil.dart";

main() {
  dynamic i1 = 1, i2 = 2;
  // second error
  new Future.delayed(ONE_SECOND, () => "b" + i2 );
  // first error
  var x = "a" + i1;
}
