/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The is-expression e is! T is equivalent to !(e is T).
 * @description Checks that the is-expressions 'e is! T' and '!(e is T)' are
 * equivalent.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

//class C {}

main() {
  Expect.equals((1 is! num), !(1 is num));
  Expect.equals((1.0 is! num), !(1.0 is num));
  Expect.equals(("string" is! num), !("string" is num));
  Expect.equals((new Object() is! num), !(new Object() is num));

  Expect.equals((1 is! String), !(1 is String));
  Expect.equals((1.0 is! String), !(1.0 is String));
  Expect.equals(("string" is! String), !("string" is String));
  Expect.equals((new Object() is! String), !(new Object() is String));
}
