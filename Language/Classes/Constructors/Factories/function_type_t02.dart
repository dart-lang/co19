/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if the function type of k' is not a
 * subtype of the type of k.
 * @description Checks that a compile error is produced if factory constructor
 * redirects to a constructor whose type is not a subtype of factory
 * constructor function type. Checks the case when constructor return types
 * are not assignable.
 * @compile-error
 * @author ilya
 */
import "../../../../Utils/dynamic_check.dart";

class F {
  factory F(x) = C;
}

class C { // does not implement F, not assignable to F
  C(x);
}

main() {
  checkTypeError(() => new F(123));
}
