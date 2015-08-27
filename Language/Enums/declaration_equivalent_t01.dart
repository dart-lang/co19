/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The declaration of an enum of the form 
 * metadata enum E { id 0 , . . . id n−1 };
 * has the same effect as a class declaration
 * metadata class E {
 * final int index;
 * const E(this.index);
 * static const E id 0 = const E(0);
 * ...
 * static const E id n−1 = const E(n - 1);
 * static const List<E> values = const <E>[id 0 . . . id n−1 ];
 * String toString() => { 0: ‘E.id 0 ’, . . ., n-1: ‘E.id n−1 ’}[index]
 * }
 * @description Checks that declaration of an enum and class equivalent 
 * has the same effect
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

enum E1 {a, b, c}

class E2 {
  final int index;
  const E2(this.index);
  static const E2 a = const E2(0);
  static const E2 b = const E2(1);
  static const E2 c = const E2(3);
  static const List<E> values = const <E2>[a, b, c];
  String toString() => { 0: 'E2.a', 1: 'E2.b', 2: 'E2.c'}[index];
}

main() {
  E1 e1 = E1.b;
  E2 e2 = E2.b;
  Expect.equals(e1.toString(), 'E1.b');
  Expect.equals(e2.toString(), 'E2.b');
  Expect.isTrue(E1.a is E1);
}
