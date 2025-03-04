// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a class declaration declares an instance
/// variable with a potentially non-nullable type and no initializer expression,
/// and the class has a generative constructor where the variable is not
/// initialized via an initializing formal or an initializer list entry, unless
/// the variable is marked with a `late`, `abstract`, or `external` modifier.
///
/// @description Check that it is not an error if a class declaration declares
/// an instance variable with a potentially non-nullable type and no initializer
/// expression, and the class has a generative constructor where the variable is
/// not initialized via an initializing formal or an initializer list entry, but
/// the variable is marked with an`external` modifier. Test `FutureOr<F>` where
/// `F` is a function type.
/// @author sgrekhov22@gmail.com

import "dart:async";

typedef void Foo();

class C {
  external FutureOr<Function> x1;
  external final FutureOr<Function> x2;

  external FutureOr<Foo> x3;
  external final FutureOr<Foo> x4;
}

main() {
  C();
}
