/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A ﬁnal or constant variable declaration of the form ﬁnal T v;,
 * ﬁnal T v = e; or the form const T v = e; always induces an implicit setter
 * function with signature
 *   void set v = (T x)
 *   whose execution causes a runtime exception.
 * It is a static warning to invoke such a setter.
 * @description Checks that execution of a setter of a class-level final variable
 * causes a runtime exception.
 * Checks that it is a static warning to invoke such a setter.
 * @static-warning
 * @author kaigorodov
 * @issue 12544
 */
import "../../Utils/expect.dart";

class C {
  static final String bar = "bar";
}

main() {
  try {
    C.bar="bar";
  } on Error catch(ok) {
  }
}
