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
/// without an initializing expression whose type is potentially non-nullable
/// but it is marked with `late`, `abstract` or `external`.
/// @author sgrekhov22@gmail.com

abstract class C<T extends Object?> {
  late Object v1;
  late T v2;
  abstract Object v3;
  abstract T v4;
  external Object v5;
  external T v6;
}

mixin M<T extends Object?> {
  late Object v1;
  late T v2;
  abstract Object v3;
  abstract T v4;
  external Object v5;
  external T v6;
}

main() {
  print(C);
  print(M);
}
