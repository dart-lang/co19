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
/// context type schema, the variable is treated as having type `dynamic`.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

void Function() f1 = ([v]) {
  Expect.throws(() {
    v.testDynamic;
  });
};

void Function() f2 = ({v}) {
  Expect.throws(() {
    v.testDynamic;
  });
};

class C {
  static void Function() sf1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  static void Function() sf2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  void Function() f1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  void Function() f2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

mixin M {
  static void Function() sf1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  static void Function() sf2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  void Function() f1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  void Function() f2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

mixin class MC {
  static void Function() sf1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  static void Function() sf2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  void Function() f1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  void Function() f2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

enum E {
  e0;
  static void Function() sf1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  static void Function() sf2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

class A {}

extension Ext on A {
  static void Function() sf1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  static void Function() sf2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

extension type ET(int _) {
  static void Function() sf1 = ([v]) {
    Expect.throws(() {
      v.testDynamic;
    });
  };

  static void Function() sf2 = ({v}) {
    Expect.throws(() {
      v.testDynamic;
    });
  };
}

class MA = Object with M;

main() {
  f1();
  f2();

  C.sf1();
  C.sf2();
  C().f1();
  C().f2();

  M.sf1();
  M.sf2();
  MA().f1();
  MA().f2();

  MC.sf1();
  MC.sf2();
  MC().f1();
  MC().f2();

  E.sf1();
  E.sf2();
  Ext.sf1();
  Ext.sf2();
  ET.sf1();
  ET.sf2();
}
