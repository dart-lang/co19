/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let I be an interface type with default factory F. It is a static type
 * warning if any of the type arguments to the constructor of I invoked by a new
 * expression or a constant object expression are not subtypes of the bounds of the
 * corresponding formal type parameters of F.
 * @description Checks that it is a static type warning if type arguments to the
 * constructor of I invoked by a constant object expression are not subtypes of the bounds of the
 * corresponding formal type parameters of F.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview Issue 1380
 */

interface I<T, S> default F<T extends num, S extends String> {
  const I();
}

class F<T extends num, S extends String> implements I<T, S> {
  factory I() {
    return const F();
  }
  const F();
}

main() {
  try {
    var o = const I<double, double>();
  } catch(TypeError e) {}
}
