/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if T is a parameterized type of the form
 * G < T1, ... , Tn > and G is not a generic type with n type parameters.
 * @description Checks that it a compile-time error if G is not a generic type.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

class G {}

main() {
  try {
  	1 is G<int, bool>;
 } catch (var e) {
 }
}
