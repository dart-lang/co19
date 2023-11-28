// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that a compile error is produced when assigning the
/// result of invoking the factory constructor `M` to a variable `v` with
/// declared type `T` such that `M` is not assignable to `T`. Factory
/// constructor name is that of its enclosing class.
/// @author iefremov

class S1 {}
class S2 extends S1 {}
class S3 extends S2 {}

class M<T, U, V> {
  factory M() = C<T, U, V>;
}

class C<T, U, V> implements M<T, U, V> {
}

main() {
  M<S3, int, int> m1 = new M<S2, num, Function>();
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}
