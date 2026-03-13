// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We can omit the type of an optional parameter with a default
/// value, in which case the type is inferred from the default value.
///
/// @description Check that the omitted type of an non-declaring optional
/// parameter of a primary constructor with a default value is `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1([v = 42]) {
  this : assert(v.checkDynamic);
}

class C2({v = '42'}) {
  this : assert(v.checkDynamic);
}

main() {
  print(C1);
  print(C2);
}
