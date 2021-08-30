// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If [C] denotes a class, an expression of [C] by itself already
/// has a meaning, it evaluates to a [Type] object representing the class, so it
/// cannot also denote the unnamed constructor.
///
/// @description Checks that unnamed constructor tear off can be used in a
/// factory constructor. Test generic classes
///
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C<T> {
  T t;
  C(this.t);
  factory C.f1(T t) = C<T>.new;
  factory C.f2(T t) = D<T>;
  factory C.f3(T t) = D<T>.new;
}

class D<T> extends C<T> {
  D(T t) : super.new(t);
}

main() {
  Expect.isFalse(C<int>.f1(42) is D<int>);
  Expect.isTrue(C<int>.f2(42) is D<int>);
  Expect.isTrue(C<String>.f3("Lily was here") is D<String>);
}
