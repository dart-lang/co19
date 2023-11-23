// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We infer the type of a parameter declaration, p, of a
/// non-redirecting generative constructor, C, as:
///
/// If the p has a type in its <finalConstVarOrType>, that remains the type of
/// the parameter.
///
/// @description Check that if the p has a type in its <finalConstVarOrType>,
/// that remains the type of the parameter.
/// @author sgrekhov@unipro.ru

class S<T extends num> {
  S(T t);
}

class C<T extends num> extends S<T> {
  C(int super.t);
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
main() {
  C(42);
}
