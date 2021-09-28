// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated local generic functions
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import '../../Language/Classes/Constructors/Generative_Constructors/implicit_superinitializer_t04.dart';
import "../../Utils/expect.dart";

typedef X Foo<X>(X x);
X globalFunction<X>(X x) => x;

Foo getFoo() => globalFunction;

Foo<int> getIntFoo() => globalFunction<int>;

var g1 = getFoo();
var g2 = getFoo();
var ig1 = getIntFoo();
var ig2 = getIntFoo();

main() {
  Expect.identical(g1, g2);
  Expect.identical(ig1, ig2);
}
