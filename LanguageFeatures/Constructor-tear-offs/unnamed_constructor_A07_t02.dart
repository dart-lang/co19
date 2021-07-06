// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If [C] denotes a class, an expression of [C] by itself already
/// has a meaning, it evaluates to a [Type] object representing the class, so it
/// cannot also denote the unnamed constructor.
///
/// @description Checks that unnamed constructor tear off can be used in a
/// factory constructor
///
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs
import "../../Utils/expect.dart";

class D extends C {
  D() : super.new();
}

var Dnew = D.new;

class C {
  C();
  factory C.f1() = C.new;
  factory C.f2() = Dnew;
}

main() {
  Expect.isFalse(C.f1() is D);
  Expect.isTrue(C.f2() is D);
}
