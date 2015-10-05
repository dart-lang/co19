/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#
 * proceeds as follows:
 * ...
 * Otherwise, i evaluates to the closurization of the anonymous constructor
 * of type T
 * @description Check extracted constructor evaluates to the closurization
 * of anonymous constructor of type T
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  String creator;
  C() {
    this.creator = "default";
  }
  C.m() {
    this.creator = "m";
  }
}

main() {
  var i = new C#;
  var o = i();
  Expect.isTrue(o is C);
  Expect.equals("default", o.creator);
}
