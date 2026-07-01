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
/// - If the enclosing function is not marked `sync*` or `async*`: For each
///   `return;` statement in the block, update `T` to be `UP(Null, T)`.
///
/// @description Check that return type of a function marked `async` with the
/// only `return;` or with no `return` statement is `Future<Null>`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = () async {
  return;
};
var f2 = () async {};

class C {
  static var sf1 = () async {
    return;
  };
  static var sf2 = () async {};

  var f1 = () async {
    return;
  };
  var f2 = () async {};
}

mixin M {
  static var sf1 = () async {
    return;
  };
  static var sf2 = () async {};

  var f1 = () async {
    return;
  };
  var f2 = () async {};
}

mixin class MC {
  static var sf1 = () async {
    return;
  };
  static var sf2 = () async {};

  var f1 = () async {
    return;
  };
  var f2 = () async {};
}

enum E {
  e0;

  static var sf1 = () async {
    return;
  };
  static var sf2 = () async {};
}

class A {}

extension Ext on A {
  static var sf1 = () async {
    return;
  };
  static var sf2 = () async {};
}

extension type ET(int _) {
  static var sf1 = () async {
    return;
  };
  static var sf2 = () async {};
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Future<Null> Function()>>();
  f2.expectStaticType<Exactly<Future<Null> Function()>>();

  C.sf1.expectStaticType<Exactly<Future<Null> Function()>>();
  C.sf2.expectStaticType<Exactly<Future<Null> Function()>>();
  C().f1.expectStaticType<Exactly<Future<Null> Function()>>();
  C().f2.expectStaticType<Exactly<Future<Null> Function()>>();

  M.sf1.expectStaticType<Exactly<Future<Null> Function()>>();
  M.sf2.expectStaticType<Exactly<Future<Null> Function()>>();
  MA().f1.expectStaticType<Exactly<Future<Null> Function()>>();
  MA().f2.expectStaticType<Exactly<Future<Null> Function()>>();

  MC.sf1.expectStaticType<Exactly<Future<Null> Function()>>();
  MC.sf2.expectStaticType<Exactly<Future<Null> Function()>>();
  MC().f1.expectStaticType<Exactly<Future<Null> Function()>>();
  MC().f2.expectStaticType<Exactly<Future<Null> Function()>>();

  E.sf1.expectStaticType<Exactly<Future<Null> Function()>>();
  E.sf2.expectStaticType<Exactly<Future<Null> Function()>>();

  Ext.sf1.expectStaticType<Exactly<Future<Null> Function()>>();
  Ext.sf2.expectStaticType<Exactly<Future<Null> Function()>>();

  ET.sf1.expectStaticType<Exactly<Future<Null> Function()>>();
  ET.sf2.expectStaticType<Exactly<Future<Null> Function()>>();
}
