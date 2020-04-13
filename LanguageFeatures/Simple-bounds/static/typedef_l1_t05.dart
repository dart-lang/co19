/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 * a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
 * generic class or parameterized type alias [G1] (that is, [T] is a raw type),
 * every type argument of [G1] has a simple bound.
 * @description Checks that simple bounds are correct for [typedef] with [X
 * extends num] parameter (covariant)
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

typedef G<X extends num> = void Function<Y extends X>();

main() {
  G? source;
  void Function<X extends num>()? target = source;

  void Function<X extends dynamic>()? target1 = source;
//                                             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void Function<Null>() target2 = source;
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
