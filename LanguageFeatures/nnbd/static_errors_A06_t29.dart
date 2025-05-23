// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a mixin declaration or a class declaration with
/// no generative constructors declares an instance variable without an
/// initializing expression which is final or whose type is potentially
/// non-nullable, unless the variable is marked with a `late`, `abstract`, or
/// `external` modifier.
///
/// @description Check that it is not an error if a mixin declaration or a class
/// declaration with no generative constructors declares an instance variable
/// without an initializing expression which is final but it is marked with
/// `external`.
/// @author sgrekhov22@gmail.com

class C<T> {
  external final v1;
  external final Object v2;
  external final T v3;
}

mixin M<T extends Object> {
  external final v1;
  external final Object v2;
  external final T v3;
}

main() {
  print(C);
  print(M);
}
