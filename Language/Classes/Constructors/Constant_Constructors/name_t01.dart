/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if M is not the name of the
 * immediately enclosing class.
 * @description Checks that it's a compile-time error when M is the name of
 * the type alias.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class C {
  const CAlias() {}
}
typedef CAlias = C;

main() {
  new C();
}
