/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The result of a lookup of a method m in object o with respect
 * to library L is the result of a lookup of method m in class C with respect
 * to library L, where C is the class of o.
 * @description Checks that result of a lookup of a method m in object o with
 * respect to library L method m in class C, where C is class of o
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';
import 'instance_lib.dart' as lib;

main() {
  lib.C1 c1 = new lib.C1();
  lib.C2 c2 = new lib.C2();
  Expect.equals(1, c1.m());
  Expect.equals(2, c2.m());
}
