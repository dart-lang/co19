/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If both the extension and the method is generic, then inference
 * must infer the extension type parameters first, to figure out whether the
 * extension applies, and only then start inferring method type parameters. As
 * mentioned above, the inference is similar to other cases of chained inference.
 * @description Check that two-step type inference forces correct type parameter
 * choice and error is thrown if method parameter is of incorrect type.
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

extension SuperList<T> on List<T> {
  void checkme<R extends T>(R i) {}
}

main() {
  List<String> list = [];
  list.checkme(42);
}
