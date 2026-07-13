// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a type `S` and a set of type variables `L` consisting of
/// the variables `X0, ..., Xn`, we define the least and greatest closure of `S`
/// with respect to `L` as follows.
/// ...
/// - if `S` is an interface type `C<T0, ..., Tk>`
///   - The least closure of `S` with respect to `L` is `C<U0, ..., Uk>` where
///     `Ui` is the least closure of `Ti` with respect to `L`
///   - The greatest closure of `S` with respect to `L` is `C<U0, ..., Uk>`
///     where `Ui` is the greatest closure of `Ti` with respect to `L`
///
/// @description Check that if `S` is `C<T0, ..., Tk>` then the greatest closure
/// of `S` with respect to `L` is `C<U0, ..., Uk>` where `Ui` is the greatest
/// closure of `Ti` with respect to `L`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class C<X, Y> {}

test<X extends C<X, List<X>>, Y extends C<Y, List<Y>>>(X x, Y y) {
  var v = 1 > 2 ? x : y;
  v.expectStaticType<Exactly<C<Object?, List<Object?>>>>();
}

main() {
  test<C<Never, List<Never>>, C<Never, List<Never>>>(
    C<Never, List<Never>>(),
    C<Never, List<Never>>(),
  );
}
