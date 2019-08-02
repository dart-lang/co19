/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static member declarations in the extension declaration can be
 * accessed the same way as static members of a class or mixin declaration: By
 * prefixing with the extension's name.
 * @description Check that static member of an extension cannot be accessed
 * through an extension override
 * (see https://github.com/dart-lang/language/issues/481 for more details)
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

extension MySmart on Object {
  static void smartHelper() {}
}

main() {
  MySmart("12345").smartHelper();
}
