// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A method `m` of a class `C` is subject to override inference if
/// it is missing one or more component types of its signature, and one or more
/// of the direct superinterfaces of `C` has a member named `m` (that is, `C.m`
/// overrides one or more declarations). Each missing type is filled in with the
/// corresponding type from the combined member signature `s` of `m` in the
/// direct superinterfaces of `C`.
/// ...
/// If there is no corresponding parameter in `s` for a parameter of the
/// declaration of `m` in `C`, it is treated as `dynamic`.
///
/// @description Checks that if there is no corresponding parameter in `s` for a
/// parameter of the declaration of `m` in `C`, it is treated as `dynamic`.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

mixin class A {
  void m1(num v1) {}
  void m2(num v1) {}
  void m3({required num v1}) {}
}

class C1 extends A {
  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

class C2 implements A {
  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

class C3 with A {
  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

mixin M1 on A {
  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

mixin M2 implements A {
  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

mixin class MC implements A {
  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

enum E1 implements A {
  e0;

  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

enum E2 with A {
  e0;

  void m1(v1, [v2]) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m2(v1, {v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }

  void m3({required v1, v2}) {
    Expect.throws(() {
      v2.checkDynamic;
    });
  }
}

class MA1 = A with M1;
class MA2 = Object with M2;

main() {
  C1().m1.expectStaticType<Exactly<void Function(num, [dynamic])>>();
  C1().m2.expectStaticType<Exactly<void Function(num, {dynamic v2})>>();
  C1().m3
      .expectStaticType<
        Exactly<void Function({required num v1, dynamic v2})>
      >();
  C2().m1.expectStaticType<Exactly<void Function(num, [dynamic])>>();
  C2().m2.expectStaticType<Exactly<void Function(num, {dynamic v2})>>();
  C2().m3
      .expectStaticType<
        Exactly<void Function({required num v1, dynamic v2})>
      >();
  MA1().m1.expectStaticType<Exactly<void Function(num, [dynamic])>>();
  MA1().m2.expectStaticType<Exactly<void Function(num, {dynamic v2})>>();
  MA1().m3
      .expectStaticType<
        Exactly<void Function({required num v1, dynamic v2})>
      >();
  MA2().m1.expectStaticType<Exactly<void Function(num, [dynamic])>>();
  MA2().m2.expectStaticType<Exactly<void Function(num, {dynamic v2})>>();
  MA2().m3
      .expectStaticType<
        Exactly<void Function({required num v1, dynamic v2})>
      >();
  MC().m1.expectStaticType<Exactly<void Function(num, [dynamic])>>();
  MC().m2.expectStaticType<Exactly<void Function(num, {dynamic v2})>>();
  MC().m3
      .expectStaticType<
        Exactly<void Function({required num v1, dynamic v2})>
      >();
  E1.e0.m1.expectStaticType<Exactly<void Function(num, [dynamic])>>();
  E1.e0.m2.expectStaticType<Exactly<void Function(num, {dynamic v2})>>();
  E1.e0.m3
      .expectStaticType<
        Exactly<void Function({required num v1, dynamic v2})>
      >();
  E2.e0.m1.expectStaticType<Exactly<void Function(num, [dynamic])>>();
  E2.e0.m2.expectStaticType<Exactly<void Function(num, {dynamic v2})>>();
  E2.e0.m3
      .expectStaticType<
        Exactly<void Function({required num v1, dynamic v2})>
      >();
}
