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
/// @description Check that the return type of an async function with a single
/// `return e;` statement is `UP(flatten(S), Never)`, where `S` is inferred type
/// of `e`. Test generic type literals.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = <X>(X x) async {
  return x;
};
var f2 = <X extends num>(X x) async {
  return x;
};

class C {
  static var sf1 = <X>(X x) async {
    return x;
  };
  static var sf2 = <X extends num>(X x) async {
    return x;
  };

  var f1 = <X>(X x) async {
    return x;
  };
  var f2 = <X extends num>(X x) async {
    return x;
  };
}

mixin M {
  static var sf1 = <X>(X x) async {
    return x;
  };
  static var sf2 = <X extends num>(X x) async {
    return x;
  };

  var f1 = <X>(X x) async {
    return x;
  };
  var f2 = <X extends num>(X x) async {
    return x;
  };
}

mixin class MC {
  static var sf1 = <X>(X x) async {
    return x;
  };
  static var sf2 = <X extends num>(X x) async {
    return x;
  };

  var f1 = <X>(X x) async {
    return x;
  };
  var f2 = <X extends num>(X x) async {
    return x;
  };
}

enum E {
  e0;

  static var sf1 = <X>(X x) async {
    return x;
  };
  static var sf2 = <X extends num>(X x) async {
    return x;
  };
}

class A {}

extension Ext on A {
  static var sf1 = <X>(X x) async {
    return x;
  };
  static var sf2 = <X extends num>(X x) async {
    return x;
  };
}

extension type ET(int _) {
  static var sf1 = <X>(X x) async {
    return x;
  };
  static var sf2 = <X extends num>(X x) async {
    return x;
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  f2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();

  C.sf1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  C.sf2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();
  C().f1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  C().f2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();

  M.sf1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  M.sf2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();
  MA().f1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  MA().f2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();

  MC.sf1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  MC.sf2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();
  MC().f1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  MC().f2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();

  E.sf1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  E.sf2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();

  Ext.sf1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  Ext.sf2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();

  ET.sf1.expectStaticType<Exactly<Future<X> Function<X>(X)>>();
  ET.sf2.expectStaticType<Exactly<Future<X> Function<X extends num>(X)>>();
}
