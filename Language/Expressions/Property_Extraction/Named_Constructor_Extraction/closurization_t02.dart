/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#m
 * proceeds as follows:...
 * Otherwise, i evaluates to the closurization of constructor f of type T
 * @description Check extracted constructor evaluates to the closurization
 * of constructor f of type T. Test the case when superclass has named
 * constructor with the same name
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  String creator = "A";

  A.m() {
    this.creator = "A.m";
  }
}

class C extends A {
  C() : super.m() {
    this.creator = "Default";
  }
  C.m() : super.m() {
    this.creator = "C.m";
  }
}

main() {
  var i = new C#m;
  var o = i();
  Expect.isTrue(o is C);
  Expect.equals("C.m", o.creator);
}
