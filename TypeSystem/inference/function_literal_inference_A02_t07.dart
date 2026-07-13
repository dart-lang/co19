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
/// `return e;` statement is `UP(S, Never)`, where `S` is inferred using the
/// local type inference algorithm. Test generic type literals.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = <T>(T t) {
  return 2 > 1 ? t : (1 as num?);
};
var f2 = <T extends num>(T t) {
  return 2 > 1 ? t : (1 as num?);
};

class C {
  static var sf1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  static var sf2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };

  var f1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  var f2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
}

mixin M {
  static var sf1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  static var sf2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };

  var f1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  var f2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
}

mixin class MC {
  static var sf1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  static var sf2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };

  var f1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  var f2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
}

enum E {
  e0;

  static var sf1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  static var sf2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
}

class A {}

extension Ext on A {
  static var sf1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  static var sf2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
}

extension type ET(int _) {
  static var sf1 = <T>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
  static var sf2 = <T extends num>(T t) {
    return 2 > 1 ? t : (1 as num?);
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  f2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  C.sf1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  C.sf2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  C().f1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  C().f2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  M.sf1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  M.sf2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  MA().f1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  MA().f2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  MC.sf1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  MC.sf2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  MC().f1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  MC().f2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  E.sf1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  E.sf2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  Ext.sf1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  Ext.sf2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();
  ET.sf1.expectStaticType<Exactly<Object? Function<T>(T)>>();
  ET.sf2.expectStaticType<Exactly<num? Function<T extends num>(T)>>();}
