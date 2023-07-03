// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type parameters are declared in the type parameter scope of a
/// class or function. The type parameters of a generic G are in scope in the
/// bounds of all of the type parameters of G. The type parameters of a generic
/// class declaration G are also in scope in the extends and implements clauses
/// of G (if these exist) and in the body of G.
///
/// @description Checks that type parameters are in scope in the type parameters
/// bounds.
/// @author kaigorodov

class A<T, U extends T?> {
  T? t;
  A(U u) {
     t = u;
  }
}

main() {
  new A<num, double>(1.0);
}
