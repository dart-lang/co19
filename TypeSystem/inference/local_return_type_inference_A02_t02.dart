// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With null safety, local function body inference is changed so
/// that the local function name is not considered available for inference while
/// performing inference on the body. As a result, any recursive calls to the
/// function for which the result type is required for inference to complete
/// will no longer be treated as having return type `dynamic`, but will instead
/// result in an inference failure.
///
/// @description Checks that the omitted return type of a non-local function is
/// inferred to be `dynamic` when no other kind of type inference applies. In
/// that case, the rule "If a function declaration does not declare a return
/// type explicitly, its return type is dynamic" is applied.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

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
