// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The actual returned type of a function literal with a block body
/// is computed as follows. Let `T` be `Never` if every control path through the
/// block exits the block without reaching the end of the block, as computed by
/// the definite completion analysis specified elsewhere. Let `T` be `Null` if
/// any control path reaches the end of the block without exiting the block, as
/// computed by the definite completion analysis specified elsewhere. Let `K` be
/// the typing context for the function body as computed above from the imposed
/// return type schema.
/// - For each `return e;` statement in the block, let `S` be the inferred type
///   of `e`, using the local type inference algorithm described below with
///   typing context `K`, and update `T` to be `UP(flatten(S), T)` if the
///   enclosing function is `async`, or `UP(S, T)` otherwise.
///
/// @description Check that the return type of a function with a single
/// `return e;` statement is `UP(S, Never)`, where `S` is inferred type of `e`.
/// Test generic type literals.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = <X>(X x) {
  return x;
};
var f2 = <X extends num>(X x) {
  return x;
};

class C {
  static var sf1 = <X>(X x) {
    return x;
  };
  static var sf2 = <X extends num>(X x) {
    return x;
  };

  var f1 = <X>(X x) {
    return x;
  };
  var f2 = <X extends num>(X x) {
    return x;
  };
}

mixin M {
  static var sf1 = <X>(X x) {
    return x;
  };
  static var sf2 = <X extends num>(X x) {
    return x;
  };

  var f1 = <X>(X x) {
    return x;
  };
  var f2 = <X extends num>(X x) {
    return x;
  };
}

mixin class MC {
  static var sf1 = <X>(X x) {
    return x;
  };
  static var sf2 = <X extends num>(X x) {
    return x;
  };

  var f1 = <X>(X x) {
    return x;
  };
  var f2 = <X extends num>(X x) {
    return x;
  };
}

enum E {
  e0;

  static var sf1 = <X>(X x) {
    return x;
  };
  static var sf2 = <X extends num>(X x) {
    return x;
  };
}

class A {}

extension Ext on A {
  static var sf1 = <X>(X x) {
    return x;
  };
  static var sf2 = <X extends num>(X x) {
    return x;
  };
}

extension type ET(int _) {
  static var sf1 = <X>(X x) {
    return x;
  };
  static var sf2 = <X extends num>(X x) {
    return x;
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<T Function<T>(T t)>>();
  f2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();

  C.sf1.expectStaticType<Exactly<T Function<T>(T t)>>();
  C.sf2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();
  C().f1.expectStaticType<Exactly<T Function<T>(T t)>>();
  C().f2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();

  M.sf1.expectStaticType<Exactly<T Function<T>(T t)>>();
  M.sf2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();
  MA().f1.expectStaticType<Exactly<T Function<T>(T t)>>();
  MA().f2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();

  MC.sf1.expectStaticType<Exactly<T Function<T>(T t)>>();
  MC.sf2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();
  MC().f1.expectStaticType<Exactly<T Function<T>(T t)>>();
  MC().f2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();

  E.sf1.expectStaticType<Exactly<T Function<T>(T t)>>();
  E.sf2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();

  Ext.sf1.expectStaticType<Exactly<T Function<T>(T t)>>();
  Ext.sf2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();

  ET.sf1.expectStaticType<Exactly<T Function<T>(T t)>>();
  ET.sf2.expectStaticType<Exactly<T Function<T extends num>(T t)>>();
}
