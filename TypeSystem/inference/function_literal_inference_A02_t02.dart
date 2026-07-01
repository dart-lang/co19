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
/// of `e`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = () async {
  return 0;
};
var f2 = () async {
  return 0 as num;
};
var f3 = () async {
  return 0 as dynamic;
};
var f4 = () async {
  return 0 as Never;
};
var f5 = () async {
  return null;
};
var f6 = () async {
  return Future.value(0);
};

class C {
  static var sf1 = () async {
    return 0;
  };
  static var sf2 = () async {
    return 0 as num;
  };
  static var sf3 = () async {
    return 0 as dynamic;
  };
  static var sf4 = () async {
    return 0 as Never;
  };
  static var sf5 = () async {
    return null;
  };
  static var sf6 = () async {
    return Future.value(0);
  };

  var f1 = () async {
    return 0;
  };
  var f2 = () async {
    return 0 as num;
  };
  var f3 = () async {
    return 0 as dynamic;
  };
  var f4 = () async {
    return 0 as Never;
  };
  var f5 = () async {
    return null;
  };
  var f6 = () async {
    return Future.value(0);
  };
}

mixin M {
  static var sf1 = () async {
    return 0;
  };
  static var sf2 = () async {
    return 0 as num;
  };
  static var sf3 = () async {
    return 0 as dynamic;
  };
  static var sf4 = () async {
    return 0 as Never;
  };
  static var sf5 = () async {
    return null;
  };
  static var sf6 = () async {
    return Future.value(0);
  };

  var f1 = () async {
    return 0;
  };
  var f2 = () async {
    return 0 as num;
  };
  var f3 = () async {
    return 0 as dynamic;
  };
  var f4 = () async {
    return 0 as Never;
  };
  var f5 = () async {
    return null;
  };
  var f6 = () async {
    return Future.value(0);
  };
}

mixin class MC {
  static var sf1 = () async {
    return 0;
  };
  static var sf2 = () async {
    return 0 as num;
  };
  static var sf3 = () async {
    return 0 as dynamic;
  };
  static var sf4 = () async {
    return 0 as Never;
  };
  static var sf5 = () async {
    return null;
  };
  static var sf6 = () async {
    return Future.value(0);
  };

  var f1 = () async {
    return 0;
  };
  var f2 = () async {
    return 0 as num;
  };
  var f3 = () async {
    return 0 as dynamic;
  };
  var f4 = () async {
    return 0 as Never;
  };
  var f5 = () async {
    return null;
  };
  var f6 = () async {
    return Future.value(0);
  };
}

enum E {
  e0;

  static var sf1 = () async {
    return 0;
  };
  static var sf2 = () async {
    return 0 as num;
  };
  static var sf3 = () async {
    return 0 as dynamic;
  };
  static var sf4 = () async {
    return 0 as Never;
  };
  static var sf5 = () async {
    return null;
  };
  static var sf6 = () async {
    return Future.value(0);
  };
}

class A {}

extension Ext on A {
  static var sf1 = () async {
    return 0;
  };
  static var sf2 = () async {
    return 0 as num;
  };
  static var sf3 = () async {
    return 0 as dynamic;
  };
  static var sf4 = () async {
    return 0 as Never;
  };
  static var sf5 = () async {
    return null;
  };
  static var sf6 = () async {
    return Future.value(0);
  };
}

extension type ET(int _) {
  static var sf1 = () async {
    return 0;
  };
  static var sf2 = () async {
    return 0 as num;
  };
  static var sf3 = () async {
    return 0 as dynamic;
  };
  static var sf4 = () async {
    return 0 as Never;
  };
  static var sf5 = () async {
    return null;
  };
  static var sf6 = () async {
    return Future.value(0);
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Future<int> Function()>>();
  f2.expectStaticType<Exactly<Future<num> Function()>>();
  f3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  f4.expectStaticType<Exactly<Future<Never> Function()>>();
  f5.expectStaticType<Exactly<Future<Null> Function()>>();
  f6.expectStaticType<Exactly<Future<int> Function()>>();

  C.sf1.expectStaticType<Exactly<Future<int> Function()>>();
  C.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  C.sf3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  C.sf4.expectStaticType<Exactly<Future<Never> Function()>>();
  C.sf5.expectStaticType<Exactly<Future<Null> Function()>>();
  C.sf6.expectStaticType<Exactly<Future<int> Function()>>();
  C().f1.expectStaticType<Exactly<Future<int> Function()>>();
  C().f2.expectStaticType<Exactly<Future<num> Function()>>();
  C().f3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  C().f4.expectStaticType<Exactly<Future<Never> Function()>>();
  C().f5.expectStaticType<Exactly<Future<Null> Function()>>();
  C().f6.expectStaticType<Exactly<Future<int> Function()>>();

  M.sf1.expectStaticType<Exactly<Future<int> Function()>>();
  M.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  M.sf3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  M.sf4.expectStaticType<Exactly<Future<Never> Function()>>();
  M.sf5.expectStaticType<Exactly<Future<Null> Function()>>();
  M.sf6.expectStaticType<Exactly<Future<int> Function()>>();
  MA().f1.expectStaticType<Exactly<Future<int> Function()>>();
  MA().f2.expectStaticType<Exactly<Future<num> Function()>>();
  MA().f3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  MA().f4.expectStaticType<Exactly<Future<Never> Function()>>();
  MA().f5.expectStaticType<Exactly<Future<Null> Function()>>();
  MA().f6.expectStaticType<Exactly<Future<int> Function()>>();

  MC.sf1.expectStaticType<Exactly<Future<int> Function()>>();
  MC.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  MC.sf3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  MC.sf4.expectStaticType<Exactly<Future<Never> Function()>>();
  MC.sf5.expectStaticType<Exactly<Future<Null> Function()>>();
  MC.sf6.expectStaticType<Exactly<Future<int> Function()>>();
  MC().f1.expectStaticType<Exactly<Future<int> Function()>>();
  MC().f2.expectStaticType<Exactly<Future<num> Function()>>();
  MC().f3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  MC().f4.expectStaticType<Exactly<Future<Never> Function()>>();
  MC().f5.expectStaticType<Exactly<Future<Null> Function()>>();
  MC().f6.expectStaticType<Exactly<Future<int> Function()>>();

  E.sf1.expectStaticType<Exactly<Future<int> Function()>>();
  E.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  E.sf3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  E.sf4.expectStaticType<Exactly<Future<Never> Function()>>();
  E.sf5.expectStaticType<Exactly<Future<Null> Function()>>();
  E.sf6.expectStaticType<Exactly<Future<int> Function()>>();

  Ext.sf1.expectStaticType<Exactly<Future<int> Function()>>();
  Ext.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  Ext.sf3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  Ext.sf4.expectStaticType<Exactly<Future<Never> Function()>>();
  Ext.sf5.expectStaticType<Exactly<Future<Null> Function()>>();
  Ext.sf6.expectStaticType<Exactly<Future<int> Function()>>();

  ET.sf1.expectStaticType<Exactly<Future<int> Function()>>();
  ET.sf2.expectStaticType<Exactly<Future<num> Function()>>();
  ET.sf3.expectStaticType<Exactly<Future<dynamic> Function()>>();
  ET.sf4.expectStaticType<Exactly<Future<Never> Function()>>();
  ET.sf5.expectStaticType<Exactly<Future<Null> Function()>>();
  ET.sf6.expectStaticType<Exactly<Future<int> Function()>>();
}
