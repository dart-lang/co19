// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - if `S` is `Future<T>`
///   - The least closure of `S` with respect to `L` is `Future<U>` where `U` is
///     the least closure of `T` with respect to `L`
///   - The greatest closure of `S` with respect to `L` is `Future<U>` where `U`
///     is the greatest closure of `T` with respect to `L`
///
/// @description Check that if `S` is `Future<T>` then the least closure of `S`
/// with respect to `L` is `Future<U>` where `U` is the least closure of `T`
/// with respect to `L`.
/// @author sgrekhov22@gmail.com
/// @issue https://github.com/dart-lang/language/issues/4720

import '../../Utils/static_type_helper.dart';

test1<
  X extends void Function(Future<int>),
  Y extends void Function(Future<num>)
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

test2<
  X extends void Function(Future<int>),
  Y extends void Function(Future<num?>)
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
}

test3<
  X extends void Function(Future<int?>),
  Y extends void Function(Future<num>)
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Future<int>)>>();
  print(v);
}

test4<
  X extends void Function(Future<int?>),
  Y extends void Function(Future<num?>)
>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<void Function(Future<int?>)>>();
  print(v);
}

main() {
  test1((Future<int> _) {}, (Future<num> _) {});
  test2((Future<int?> _) {}, (Future<num?> _) {});
  test3((Future<int?> _) {}, (Future<num> _) {});
  test4((Future<int?> _) {}, (Future<num?> _) {});
}
