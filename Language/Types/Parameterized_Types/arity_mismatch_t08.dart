// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let T be a parameterized type G < S1, ..., Sn >. If G is not a
/// generic type, the type arguments Si, 1 ≤ i ≤ n are discarded. If G has
/// m <> n type parameters, T is treated as as a parameterized type with m
/// arguments, all of which are dynamic.
/// In short, any arity mismatch results in all type arguments being dropped,
/// and replaced with the correct number of type arguments, all set to dynamic.
/// Of course, a static warning will be issued.
/// @description Checks that it if there is a mismatch in arguments number in
/// generic type invocation, then compile error occurs
/// @author sgrekhov@unipro.ru


class C<T1 extends num, T2> {
}

main() {
  new C<int, List, List>();
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
