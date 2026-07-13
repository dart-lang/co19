// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Function literals which are inferred in an non-empty typing
/// context where the context type is a function type are inferred as described
/// below.
///
/// Each parameter is assumed to have its declared type if present. If no type
/// is declared for a parameter and there is a corresponding parameter in the
/// context type schema with type schema `K`, the parameter is given an inferred
/// type `T` where `T` is derived from `K` as follows. If the greatest closure
/// of `K` is `S` and `S` is a subtype of `Null`, then without null safety `T`
/// is `dynamic`, and with null safety `T` is `Object?`. Otherwise, `T` is `S`.
/// If there is no corresponding parameter in the context type schema, the
/// variable is treated as having type `dynamic`.
///
/// @description Check that if there is no corresponding parameter in the
/// context type schema, the variable is treated as having type `dynamic`. Test
/// the case when the type parameter of a function literal is eliminated by a
/// generic function instantiation algorithm.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class C<X> {
  void Function(X) f1 = <X>(v) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function([X]) f2 = <X>([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function({X v}) f3 = <X>({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function({required X v}) f4 = <X>({required v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

mixin M<X> {
  void Function(X) f1 = <X>(v) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function([X]) f2 = <X>([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function({X v}) f3 = <X>({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function({required X v}) f4 = <X>({required v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

mixin class MC<X> {
  void Function(X) f1 = <X>(v) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function([X]) f2 = <X>([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function({X v}) f3 = <X>({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
  void Function({required X v}) f4 = <X>({required v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

class MA<X> = Object with M<X>;

main() {
  C<int>().f1(1);
  C<int>().f2(2);
  C<int>().f3(v: 3);
  C<int>().f4(v: 4);

  MA<int>().f1(1);
  MA<int>().f2(2);
  MA<int>().f3(v: 3);
  MA<int>().f4(v: 4);

  MC<int>().f1(1);
  MC<int>().f2(2);
  MC<int>().f3(v: 3);
  MC<int>().f4(v: 4);
}
