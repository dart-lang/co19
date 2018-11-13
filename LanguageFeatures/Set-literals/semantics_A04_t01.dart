/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If s is an emptySetOrMapLiteral, then if s has a typeArguments
 * with one type argument, s is a set literal, and if s has a typeArguments with
 * two type arguments, s is a map literal.
 *
 * @description Checks that if s is an emptySetOrMapLiteral and s has a
 * typeArguments with one type argument, then s is a set literal
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(<int> {} is Set);
  Expect.isTrue( const <int> {} is Set);

  var x1 = const <int> {};
  Expect.isTrue( x1 is Set);
  var x2 = <int> {};
  Expect.isTrue( x2 is Set);
}
