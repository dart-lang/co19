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
/// ...
/// - For each `yield e;` statement in the block, let `S` be the inferred type
///   of `e`, using the local type inference algorithm described below with
///   typing context `K`, and update `T` to be `UP(S, T)`.
/// - If the enclosing function is marked `sync*`, then for each `yield* e;`
///   statement in the block, let `S` be the inferred type of `e`, using the
///   local type inference algorithm described below with a typing context of
///   `Iterable<K>;` let `E` be the type such that `Iterable<E>` is a
///   super-interface of `S;` and update `T` to be `UP(E, T)`.
///
/// @description Check that the return type of a `sync*` function with a single
/// `yield e;` is `Iterable<X>;`, where `X` is the static type of `e`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = () sync* {
  yield 0;
};
var f2 = () sync* {
  yield 0 as num;
};
var f3 = () sync* {
  yield 0 as dynamic;
};
var f4 = () sync* {
  yield 0 as Never;
};
var f5 = () sync* {
  yield null;
};
var f6 = () sync* {
  yield Future.value(0);
};
var f7 = () sync* {
  yield <num>[42];
};

class C {
  static var sf1 = () sync* {
    yield 0;
  };
  static var sf2 = () sync* {
    yield 0 as num;
  };
  static var sf3 = () sync* {
    yield 0 as dynamic;
  };
  static var sf4 = () sync* {
    yield 0 as Never;
  };
  static var sf5 = () sync* {
    yield null;
  };
  static var sf6 = () sync* {
    yield Future.value(0);
  };
  static var sf7 = () sync* {
    yield <num>[42];
  };

  var f1 = () sync* {
    yield 0;
  };
  var f2 = () sync* {
    yield 0 as num;
  };
  var f3 = () sync* {
    yield 0 as dynamic;
  };
  var f4 = () sync* {
    yield 0 as Never;
  };
  var f5 = () sync* {
    yield null;
  };
  var f6 = () sync* {
    yield Future.value(0);
  };
  var f7 = () sync* {
    yield <num>[42];
  };
}

mixin M {
  static var sf1 = () sync* {
    yield 0;
  };
  static var sf2 = () sync* {
    yield 0 as num;
  };
  static var sf3 = () sync* {
    yield 0 as dynamic;
  };
  static var sf4 = () sync* {
    yield 0 as Never;
  };
  static var sf5 = () sync* {
    yield null;
  };
  static var sf6 = () sync* {
    yield Future.value(0);
  };
  static var sf7 = () sync* {
    yield <num>[42];
  };

  var f1 = () sync* {
    yield 0;
  };
  var f2 = () sync* {
    yield 0 as num;
  };
  var f3 = () sync* {
    yield 0 as dynamic;
  };
  var f4 = () sync* {
    yield 0 as Never;
  };
  var f5 = () sync* {
    yield null;
  };
  var f6 = () sync* {
    yield Future.value(0);
  };
  var f7 = () sync* {
    yield <num>[42];
  };
}

mixin class MC {
  static var sf1 = () sync* {
    yield 0;
  };
  static var sf2 = () sync* {
    yield 0 as num;
  };
  static var sf3 = () sync* {
    yield 0 as dynamic;
  };
  static var sf4 = () sync* {
    yield 0 as Never;
  };
  static var sf5 = () sync* {
    yield null;
  };
  static var sf6 = () sync* {
    yield Future.value(0);
  };
  static var sf7 = () sync* {
    yield <num>[42];
  };

  var f1 = () sync* {
    yield 0;
  };
  var f2 = () sync* {
    yield 0 as num;
  };
  var f3 = () sync* {
    yield 0 as dynamic;
  };
  var f4 = () sync* {
    yield 0 as Never;
  };
  var f5 = () sync* {
    yield null;
  };
  var f6 = () sync* {
    yield Future.value(0);
  };
  var f7 = () sync* {
    yield <num>[42];
  };
}

enum E {
  e0;

  static var sf1 = () sync* {
    yield 0;
  };
  static var sf2 = () sync* {
    yield 0 as num;
  };
  static var sf3 = () sync* {
    yield 0 as dynamic;
  };
  static var sf4 = () sync* {
    yield 0 as Never;
  };
  static var sf5 = () sync* {
    yield null;
  };
  static var sf6 = () sync* {
    yield Future.value(0);
  };
  static var sf7 = () sync* {
    yield <num>[42];
  };
}

class A {}

extension Ext on A {
  static var sf1 = () sync* {
    yield 0;
  };
  static var sf2 = () sync* {
    yield 0 as num;
  };
  static var sf3 = () sync* {
    yield 0 as dynamic;
  };
  static var sf4 = () sync* {
    yield 0 as Never;
  };
  static var sf5 = () sync* {
    yield null;
  };
  static var sf6 = () sync* {
    yield Future.value(0);
  };
  static var sf7 = () sync* {
    yield <num>[42];
  };
}

extension type ET(int _) {
  static var sf1 = () sync* {
    yield 0;
  };
  static var sf2 = () sync* {
    yield 0 as num;
  };
  static var sf3 = () sync* {
    yield 0 as dynamic;
  };
  static var sf4 = () sync* {
    yield 0 as Never;
  };
  static var sf5 = () sync* {
    yield null;
  };
  static var sf6 = () sync* {
    yield Future.value(0);
  };
  static var sf7 = () sync* {
    yield <num>[42];
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Iterable<int> Function()>>();
  f2.expectStaticType<Exactly<Iterable<num> Function()>>();
  f3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  f4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  f5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  f6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  f7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();

  C.sf1.expectStaticType<Exactly<Iterable<int> Function()>>();
  C.sf2.expectStaticType<Exactly<Iterable<num> Function()>>();
  C.sf3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  C.sf4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  C.sf5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  C.sf6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  C.sf7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();
  C().f1.expectStaticType<Exactly<Iterable<int> Function()>>();
  C().f2.expectStaticType<Exactly<Iterable<num> Function()>>();
  C().f3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  C().f4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  C().f5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  C().f6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  C().f7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();

  M.sf1.expectStaticType<Exactly<Iterable<int> Function()>>();
  M.sf2.expectStaticType<Exactly<Iterable<num> Function()>>();
  M.sf3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  M.sf4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  M.sf5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  M.sf6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  M.sf7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();
  MA().f1.expectStaticType<Exactly<Iterable<int> Function()>>();
  MA().f2.expectStaticType<Exactly<Iterable<num> Function()>>();
  MA().f3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  MA().f4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  MA().f5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  MA().f6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  MA().f7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();

  MC.sf1.expectStaticType<Exactly<Iterable<int> Function()>>();
  MC.sf2.expectStaticType<Exactly<Iterable<num> Function()>>();
  MC.sf3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  MC.sf4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  MC.sf5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  MC.sf6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  MC.sf7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();
  MC().f1.expectStaticType<Exactly<Iterable<int> Function()>>();
  MC().f2.expectStaticType<Exactly<Iterable<num> Function()>>();
  MC().f3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  MC().f4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  MC().f5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  MC().f6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  MC().f7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();

  E.sf1.expectStaticType<Exactly<Iterable<int> Function()>>();
  E.sf2.expectStaticType<Exactly<Iterable<num> Function()>>();
  E.sf3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  E.sf4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  E.sf5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  E.sf6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  E.sf7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();

  Ext.sf1.expectStaticType<Exactly<Iterable<int> Function()>>();
  Ext.sf2.expectStaticType<Exactly<Iterable<num> Function()>>();
  Ext.sf3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  Ext.sf4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  Ext.sf5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  Ext.sf6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  Ext.sf7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();

  ET.sf1.expectStaticType<Exactly<Iterable<int> Function()>>();
  ET.sf2.expectStaticType<Exactly<Iterable<num> Function()>>();
  ET.sf3.expectStaticType<Exactly<Iterable<dynamic> Function()>>();
  ET.sf4.expectStaticType<Exactly<Iterable<Never> Function()>>();
  ET.sf5.expectStaticType<Exactly<Iterable<Null> Function()>>();
  ET.sf6.expectStaticType<Exactly<Iterable<Future<int>> Function()>>();
  ET.sf7.expectStaticType<Exactly<Iterable<List<num>> Function()>>();
}
