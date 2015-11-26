/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a throw expression is bottom.
 * @description It means (Types/Interface Types) that the static type of
 * throw expression is a subtype of any type.
 * Checks that no static warnings are produced when using throw expression
 * in typed contexts.
 * @static-clean
 * @author ilya
 */

class C {}

f(int x) => x++;

main() {
  try {
    C c = throw 1;
  } catch (e) {}

  try {
    f(throw new C());
  } catch (e) {}
}
