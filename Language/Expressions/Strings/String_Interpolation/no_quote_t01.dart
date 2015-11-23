/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The form $id is equivalent to the form ${id}.
 * @description Checks that the result of using either form of string
 * interpolation construct is the same for both $id and ${id}.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class C {}

main() {
  var id = 10;
  var x;
  var _ = [];
  var c = new C();

  Expect.stringEquals('${id}', '$id');
  Expect.stringEquals("${x}", "$x");
  Expect.stringEquals("${_}", "$_");
  Expect.stringEquals('${c}', '$c');
}
