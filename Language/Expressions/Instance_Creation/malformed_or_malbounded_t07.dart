/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type T in an instance creation
 * expression of one of the forms
 * new T.id(a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k ),
 * new T (a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k ),
 * const T.id(a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k ),
 * const T (a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k ) is malformed
 * or malbounded.
 * @description Checks that it is a compile error if type arguments to a
 * constructor of a generic type G invoked by a new expression are not subtypes
 * of the bounds of the corresponding formal type parameters of G.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class G<T extends num, S extends String> {
}

main() {
  new G<double, double>();
}
