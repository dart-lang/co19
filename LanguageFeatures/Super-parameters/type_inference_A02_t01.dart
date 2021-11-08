// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We infer the type of a parameter declaration, p, of a
/// non-redirecting generative constructor, C, as:
/// ...
/// Otherwise, if the parameter is an initializing formal (this.name) the
/// inferred type of the parameter is the declared/inferred type of the instance
/// variable named name of the surrounding class (which must exist, otherwise
/// it’s a compile-time error.)
///
/// @description Check that if the parameter is an initializing formal
/// (this.name) the inferred type of the parameter is the declared/inferred type
/// of the instance variable named name of the surrounding class
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

test<T>(T t) {}

class C<T> {
  final f;
  var v;
  int i;
  T t;
  C(this.f, this.v, this.i, this.t) {
    test<int>(this.f);
    test<int>(this.v);
    test<int>(this.i);
    test<T>(this.t);

    Expect.isTrue(f is int);
    Expect.isFalse(f is String);
    Expect.isTrue(v is int);
    Expect.isFalse(v is String);
    Expect.isTrue(i is int);
    Expect.isFalse(i is String);
    Expect.isTrue(t is int);
    Expect.isFalse(t is String);
  }
}

main() {
  C(1, 2, 3, 4);
}
