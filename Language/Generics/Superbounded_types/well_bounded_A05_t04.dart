// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error to declare a variable with a
/// type which is a non-function type alias with a well-bounded type parameter
/// @author iarkh@unipro.ru

class A<T> {}

typedef B<X> = A<X>;

main() {
  B b1;
  B<dynamic> b2;
  B<Object?> b3;
  B<Never> b4;
  B<void> b5;
}
