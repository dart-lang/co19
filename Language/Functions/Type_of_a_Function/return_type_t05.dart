// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a function declaration does not declare a return type
/// explicitly, its return type is `dynamic`, unless it is a constructor, in
/// which case it is not considered to have a return type, or it is a setter or
/// operator `[]=`, in which case its return type is `void`.
///
/// @description Checks if a non-local function declaration does not declare a
/// return type explicitly, its return type is `dynamic`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

f1() {
  if (1 > 2) {
    return 42;
  }
  return 3.14;
}

class C {
  static sf1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }

  f1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }
}

mixin M {
  static sf1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }

  f1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }
}

mixin class MC {
  static sf1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }

  f1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }
}

enum E {
  e0;

  static sf1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }

  f1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }
}

class A {}

extension Ext on A {
  static sf1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }

  f1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }
}

extension type ET(int _) {
  static sf1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }

  f1() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<dynamic Function()>>();
  C.sf1.expectStaticType<Exactly<dynamic Function()>>();
  C().f1.expectStaticType<Exactly<dynamic Function()>>();
  M.sf1.expectStaticType<Exactly<dynamic Function()>>();
  MA().f1.expectStaticType<Exactly<dynamic Function()>>();
  MC.sf1.expectStaticType<Exactly<dynamic Function()>>();
  MC().f1.expectStaticType<Exactly<dynamic Function()>>();
  E.sf1.expectStaticType<Exactly<dynamic Function()>>();
  E.e0.f1.expectStaticType<Exactly<dynamic Function()>>();
  Ext.sf1.expectStaticType<Exactly<dynamic Function()>>();
  A().f1.expectStaticType<Exactly<dynamic Function()>>();
  ET.sf1.expectStaticType<Exactly<dynamic Function()>>();
  ET(0).f1.expectStaticType<Exactly<dynamic Function()>>();
}
