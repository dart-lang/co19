// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The invocation of a constructor is not using an instantiated
/// type, it’s behaving as if the constructor was preceded by a raw type, which
/// type inference should then infer type arguments for. Doing
/// `List<int> l = .filled(10, 10);` works like doing
/// `List<int> l = List.filled(10, 10);`, and it is the following downwards
/// inference with context type `List<int>` that makes it into
/// `List<int>.filled(10, 10);`. This distinction matters for something like:
/// ```
/// List<String> l =
///   .generate(10, (int i) => i + 1).map((x) => x.toRadixString(16)).toList();
/// ```
/// which is equivalent to inserting `List` in front of `.generate`, which will
/// then be inferred as `List<int>`. In most normal use cases it doesn't matter,
/// because the context type will fill in the missing type variables, but if the
/// construction is followed by more selectors, it loses that context type.
///
/// @description Checks that in case of a constructor invocation the type
/// inference occurs as if the shorthand expression is preceded by the raw type
/// and then a type inference infers the type arguments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C<T> {
  T value;
  C(this.value);
  C.id(this.value);

  C<int> toInt(int v) => C<int>(v);
}

extension type ET<T>(T v) {
  ET.id(this.v);

  ET<int> toInt(int v) => ET<int>(v);
}

main() {
  C<int> c1 = .new("String").toInt(1);
  Expect.equals(1, c1.value);

  C<int> c2 = .id("String").toInt(2);
  Expect.equals(2, c2.value);

  ET<int> et1 = .new("String").toInt(3);
  Expect.equals(3, et1.v);

  ET<int> et2 = .id("String").toInt(4);
  Expect.equals(4, et2.v);
}
