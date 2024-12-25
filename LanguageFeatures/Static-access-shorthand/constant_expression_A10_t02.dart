// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member shorthand expression should be a potentially
/// constant expression if the corresponding explicit static member plus
/// selectors expression would be, which currently means that it's a potentially
/// constant expression if and only if it's a constant expression.
///
/// @description Checks that a static member shorthand expression can be used in
/// the initializer list of a constant constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class A {
  final int id;
  const A(this.id);
  static const A answer = const A(42);
}

class C {
  final A a;
  const C(this.a);
  const C.fromAnswer() : a = .answer;
}

main() {
  Expect.identical(42, C.fromAnswer().a.id);
}
