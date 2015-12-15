/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If F is not a function type, the static type of i is Dynamic.
 * Otherwise the static type of i is the declared return type of F.
 * @description Checks that the static type of i is the declared return type of
 * F when F is a function type by verifying that the result of such function
 * invocation expression can be assigned to a variable of the same type without
 * static warnings.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class C {}

int fInt () => 0;
bool fBool() => true;
String fString() => '';
C fC() => new C();

main() {
  int resultInt = fInt();
  bool resultBool = fBool();
  String resultString = fString();
  C resultC = fC();
}
