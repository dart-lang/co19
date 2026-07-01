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
/// `return e;` statement is `UP(flatten(S), Never)`, where `S` is inferred
/// using the local type inference algorithm.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = () async {
  return 2 > 1 ? 0 : (1 as num?);
};
var f2 = () async {
  return 2 > 1 ? Future.value(0) : Future.value(3.14);
};

class C {
  static var sf1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  static var sf2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };

  var f1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  var f2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };
}

mixin M {
  static var sf1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  static var sf2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };

  var f1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  var f2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };
}

mixin class MC {
  static var sf1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  static var sf2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };

  var f1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  var f2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };
}

enum E {
  e0;

  static var sf1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  static var sf2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };
}

class A {}

extension Ext on A {
  static var sf1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  static var sf2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };
}

extension type ET(int _) {
  static var sf1 = () async {
    return 2 > 1 ? 0 : (1 as num?);
  };
  static var sf2 = () async {
    return 2 > 1 ? Future.value(0) : Future.value(3.14);
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Future<num?> Function()>>();
  f2.expectStaticType<Exactly<Future<num> Function()>>();
  C.sf1.expectStaticType<Exactly<Future<num?> Function()>>();
  C.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  C().f1.expectStaticType<Exactly<Future<num?> Function()>>();
  C().f2.expectStaticType<Exactly<Future<num> Function()>>();
  M.sf1.expectStaticType<Exactly<Future<num?> Function()>>();
  M.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  MA().f1.expectStaticType<Exactly<Future<num?> Function()>>();
  MA().f2.expectStaticType<Exactly<Future<num> Function()>>();
  MC.sf1.expectStaticType<Exactly<Future<num?> Function()>>();
  MC.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  MC().f1.expectStaticType<Exactly<Future<num?> Function()>>();
  MC().f2.expectStaticType<Exactly<Future<num> Function()>>();
  Ext.sf1.expectStaticType<Exactly<Future<num?> Function()>>();
  Ext.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  E.sf1.expectStaticType<Exactly<Future<num?> Function()>>();
  E.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  ET.sf1.expectStaticType<Exactly<Future<num?> Function()>>();
  ET.sf2.expectStaticType<Exactly<Future<num> Function()>>();
}
