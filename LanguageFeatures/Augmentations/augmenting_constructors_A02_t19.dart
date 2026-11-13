// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// ...
/// It is a compile-time error if:
/// - The signature of an augmenting constructor does not match the signature of
///   the corresponding introductory declaration.
///
/// @description Checks that it is not an error if an augmentation uses a
/// parameter whose type annotation uses an import prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import 'augmentation_libraries_lib.dart';

part 'augmenting_constructors_A02_t19_part.dart';

class C {
  AL? a;
  C(this.a);
  C.foo([this.a]);
  C.bar({this.a});
  C.baz({required this.a});
}

enum E {
  e0(const AL()),
  e1.foo(const AL()),
  e2.bar(a: const AL()),
  e3.baz(a: const AL());

  final AL? a;
  const E(this.a);
  const E.foo([this.a]);
  const E.bar({this.a});
  const E.baz({required this.a});
}

extension type ET._(AL? a) {
  ET(this.a);
  ET.foo([this.a]);
  ET.bar({this.a});
  ET.baz({required this.a});
}

main() {
  C(AL());
  C.foo(AL());
  C.bar(a: AL());
  C.baz(a: AL());

  print(E);

  ET(AL());
  ET.foo(AL());
  ET.bar(a: AL());
  ET.baz(a: AL());
}
