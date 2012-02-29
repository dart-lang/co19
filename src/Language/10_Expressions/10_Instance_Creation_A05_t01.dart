/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if any of the type arguments to a constructor of a
 * generic type G invoked by a new expression or a constant object expression are
 * not subtypes of the bounds of the corresponding formal type parameters of G.
 * @description Checks that it is a static type warning if type arguments to a constructor of a
 * generic type G invoked by a new expression are not subtypes of the bounds
 * of the corresponding formal type parameters of G.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview Issue 1380
 */

class G<T extends num, S extends String> {
}

main() {
  try {
    var o = new G<double, double>();
  } catch(TypeError e) {}
}
