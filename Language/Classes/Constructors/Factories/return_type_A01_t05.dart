// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that assigning the result of invoking a factory
/// constructor to a variable `v` with declared type `T` such that
/// `M<T1,...,Tn>` is assignable to `T` does not result in an error or a static
/// warning.
/// @author rodionov

class S1 {}

class S2 extends S1 {}

class S3 extends S2 {}

abstract class I<T, U, V> {
  factory I() {
    return new M<T, U, V>();
  }
}

class M<T, U, V> implements I<T, U, V> {}

typedef f();

main() {
  I<S2, num, Function> m1 = new I<S3, int, f>();
}
