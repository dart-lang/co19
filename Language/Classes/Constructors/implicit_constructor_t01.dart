/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iff no constructor is specified for a class C, it implicitly has
 * a default constructor C() : super() {}, unless C is class Object.
 * @description Checks that it is possible to create an instance of the class
 * that doesn't declare any constructors.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

class C {
  var x;
}

main() {
  Expect.equals(null, (new C()).x);
}
