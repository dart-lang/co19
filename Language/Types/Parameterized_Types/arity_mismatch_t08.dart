// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Let T be a parameterized type G < S1 , ..., Sn >. If G is not a
/// generic type, the type arguments Si, 1 ≤ i ≤ n are discarded. If G has
/// m <> n type parameters, T is treated as a parameterized type with m
/// arguments, all of which are dynamic.
/// In short, any arity mismatch results in all type arguments being dropped,
/// and replaced with the correct number of type arguments, all set to dynamic.
/// Of course, a static warning will be issued.
/// @description Checks that it if there is a mismatch in arguments number in
/// generic type invocation, then compile error occurs
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class C<T1 extends num, T2> {
  test() {
    Expect.isTrue(1 is T1);
    Expect.isTrue(1 is T2);
    Expect.isTrue('foo' is T1);
    Expect.isTrue('foo' is T2);
  }
}

main() {
  new C<int, List, List>().test();
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
