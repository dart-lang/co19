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
/// ...
/// - If the enclosing function is marked `async*`, then for each `yield* e;`
///   statement in the block, let `S` be the inferred type of `e`, using the
///   local type inference algorithm described below with a typing context of
///   `Stream<K>`; let `E` be the type such that `Stream<E>` is a
///   super-interface of `S;` and update `T` to be `UP(E, T)`.
///
/// @description Check that the return type of an `async*` function with a
/// single `yield e;` is `Stream<X>;`, where `X` is the static type of `e`
/// inferred using the local type inference algorithm.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = () async* {
  yield 2 > 1 ? 0 : (1 as num?);
};

class C {
  static var sf1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };

  var f1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };
}

mixin M {
  static var sf1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };

  var f1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };
}

mixin class MC {
  static var sf1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };

  var f1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };
}

enum E {
  e0;

  static var sf1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };
}

class A {}

extension Ext on A {
  static var sf1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };
}

extension type ET(int _) {
  static var sf1 = () async* {
    yield 2 > 1 ? 0 : (1 as num?);
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Stream<num?> Function()>>();
  C.sf1.expectStaticType<Exactly<Stream<num?> Function()>>();
  C().f1.expectStaticType<Exactly<Stream<num?> Function()>>();
  M.sf1.expectStaticType<Exactly<Stream<num?> Function()>>();
  MA().f1.expectStaticType<Exactly<Stream<num?> Function()>>();
  MC.sf1.expectStaticType<Exactly<Stream<num?> Function()>>();
  MC().f1.expectStaticType<Exactly<Stream<num?> Function()>>();
  E.sf1.expectStaticType<Exactly<Stream<num?> Function()>>();
  Ext.sf1.expectStaticType<Exactly<Stream<num?> Function()>>();
  ET.sf1.expectStaticType<Exactly<Stream<num?> Function()>>();
}
