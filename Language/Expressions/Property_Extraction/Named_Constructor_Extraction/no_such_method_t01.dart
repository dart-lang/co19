/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#m
 * proceeds as follows:...
 * Otherwise, if the type T does not declare an accessible named constructor
 * f with name m, a NoSuchMethodError is thrown.
 * @description Check that NoSuchMethodError is thrown if T does not declare
 * an accessible named constructor m
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  C.n() {
  }
}

main() {
  Expect.throws(() {var x = new C#m;}, (e) => e is NoSuchMethodError);
}
