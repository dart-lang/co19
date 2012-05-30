/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operators are instance methods with special names.
 * Some, but not all, operators may be defined by user code, as described in section 7.1.2.
 * 7.1.2: The following names are allowed for user-defined operators:
 * <, >, <=, >=, -, +, /, ~/,  *, %, |, ^, &, <<, >>, []=, [], ~, call, equals, negate.
 * @description Checks that the listed operators can be user-defined and can be declared
 * in an interface.
 * @author vasya
 * @reviewer rodionov
 * @needsreview 2506
 */

interface I {
  // Arithmetic operations.
  I operator +(I other);
  I operator -(I other);
  I operator *(I other);
  I operator %(I other);
  I operator /(I other);
  I operator ~/(I other);

  // Relational operations.
  bool operator equals(I other);
  bool operator <(I other);
  bool operator <=(I other);
  bool operator >(I other);
  bool operator >=(I other);

  // Bit-operations.
  I operator &(I other);
  I operator |(I other);
  I operator ^(I other);
  I operator ~();
  I operator <<(I shiftAmount);
  I operator >>(I shiftAmount);

  // negate operation
  I operator negate();
  
  // get/set operations
  I operator[](int index);
  void operator[]=(int index, I value);

  //call operator
  void call(p1, p2);
}

main() {
  I i = null;

  try {i + i;} catch (NullPointerException e) {}
  try {i - i;} catch (NullPointerException e) {}
  try {i * i;} catch (NullPointerException e) {}
  try {i % i;} catch (NullPointerException e) {}
  try {i / i;} catch (NullPointerException e) {}
  try {i ~/ i;} catch (NullPointerException e) {}
  try {i == i;} catch (NullPointerException e) {}
  try {i < i;} catch (NullPointerException e) {}
  try {i <= i;} catch (NullPointerException e) {}
  try {i > i;} catch (NullPointerException e) {}
  try {i >= i;} catch (NullPointerException e) {}
  try {i & i;} catch (NullPointerException e) {}
  try {i | i;} catch (NullPointerException e) {}
  try {i ^ i;} catch (NullPointerException e) {}
  try {~i;} catch (NullPointerException e) {}
  try {i << i;} catch (NullPointerException e) {}
  try {i >> i;} catch (NullPointerException e) {}
  try {-i;} catch (NullPointerException e) {}
  try {i[0];} catch (NullPointerException e) {}
  try {i[0] = i;} catch (NullPointerException e) {}
  try {i(0, 0);} catch (NullPointerException e) {}
}

