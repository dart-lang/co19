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

// SharedOptions=--enable-experiment=super-parameters

import "../../Utils/expect.dart";

test<T>(T t) {}

class C<T> {
  C(final f, var v, int i, T t) {
    test<int>(f);
    test<int>(v);
    test<int>(i);
    test<T>(t);

    Expect.isTrue(f is int);
    Expect.isFalse(f is String);
    Expect.isTrue(v is int);
    Expect.isFalse(v is String);
    Expect.isTrue(i is int);
    Expect.isFalse(i is String);
    Expect.isTrue(t is int);
    Expect.isFalse(t is String);
    Expect.runtimeIsType<int>(f);
    Expect.runtimeIsNotType<String>(f);
    Expect.runtimeIsType<int>(v);
    Expect.runtimeIsNotType<String>(v);
    Expect.runtimeIsType<int>(i);
    Expect.runtimeIsNotType<String>(i);
    Expect.runtimeIsType<int>(t);
    Expect.runtimeIsNotType<String>(t);
  }
}

main() {
  C(1, 2, 3, 4);
}
