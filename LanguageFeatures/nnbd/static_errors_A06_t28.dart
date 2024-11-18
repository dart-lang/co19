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
/// `late`, `abstract` or `external`.
/// @author sgrekhov22@gmail.com

abstract class C<T> {
  late final v1;
  late final Object v2;
  late final T v3;
  abstract final v4;
  abstract final Object v5;
  abstract final T v6;
  external final v7;
  external final Object v8;
  external final T v9;
}

mixin M<T extends Object> {
  late final v1;
  late final Object v2;
  late final T v3;
  abstract final v4;
  abstract final Object v5;
  abstract final T v6;
  external final v7;
  external final Object v8;
  external final T v9;
}

main() {
  print(C);
  print(M);
}
