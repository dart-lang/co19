// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We infer the type of a parameter declaration, p, of a
/// non-redirecting generative constructor, C, as:
///
/// If the p has a type in its <finalConstVarOrType>, that remains the type of
/// the parameter.
///
/// @description Check that if the p has a type in its <finalConstVarOrType>,
/// that remains the type of the parameter.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

test<T>(T t) {}

class S<T> {
  final f;
  var v;
  num n;
  T t;
  S(this.f, this.v, this.n, this.t, var i) {
    test<int>(f);
    test<int>(v);
    test<num>(n);
    test<T>(t);
    test<int>(i);
  }
}

class C<T> extends S<T> {
  C(int x, int super.f, int super.v, int super.n, int super.t, int y,
      int super.i) {
    Expect.isTrue(f is int);
    Expect.isFalse(f is String);
    Expect.isTrue(v is int);
    Expect.isFalse(v is String);
    Expect.isTrue(n is int);
    Expect.isFalse(n is String);
    Expect.isTrue(t is int);
    Expect.isFalse(t is String);
  }
}

main() {
  C(1, 2, 3, 4);
}
