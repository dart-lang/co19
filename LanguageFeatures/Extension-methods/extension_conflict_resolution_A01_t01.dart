/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If more than one extension applies to a specific member
 * invocation, then we resort to a heuristic to choose one of the extensions to
 * apply. If exactly one of them is "more specific" than all the others, that
 * one is chosen. Otherwise it is a compile-time error.
 * @description Check that compile time error is thrown if two extension members
 * are equitable
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

extension TypedEquals1<T> {
  bool equals(T value) => this == value;
}

extension TypedEquals2<T> {
  bool equals(T value) => true;
}

String str1, str2;

main() {
  str1.equals(str2);
}
