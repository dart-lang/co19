/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A literal string (10.5) that does not involve string interpolation (10.5.1) is a constant expression.
 * @description Checks that various literal strings can be assigned to a static final variable
 * and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */

final i1 = "";
final i2 = "test";
final i3 = 'test';
final i4 = @"test";
final i5 = @'test';
final i6 = """test
              test""";
final i7 = '''test
               test''';
final i8 = @"""test
              test""";
final i9 = @'''test
               test''';


main() {
  var x = i1+i2+i3+i4+i5+i6+i7+i8+i9;
  Expect.isNotNull(x);
}
