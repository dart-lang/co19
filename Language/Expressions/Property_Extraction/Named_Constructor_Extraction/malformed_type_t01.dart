/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#m
 * proceeds as follows:
 * If T is a malformed type, a dynamic error occurs.
 * @description Check that it is a dynamic error if T is a malformed type
 * (T is not a type)
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  C.m() {
  }
}

main() {
  C c = new C.m();
  Expect.throws(() {var x = new c#m;}, (e) => e is Error);
}
