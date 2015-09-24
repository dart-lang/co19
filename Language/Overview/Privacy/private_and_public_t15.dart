/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private. 
 * A declaration is private iff its name is private, otherwise it is public.
 * A name q is private iff any one of the identifiers that comprise q is 
 * private, otherwise it is public.
 * An identifier is private iff it begins with an underscore (the _ character) 
 * otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is 
 * public.
 * @description Checks that type parameter names can begin with an underscore 
 * and are still accessible in the appropriate scope.
 * @author iefremov
 * @reviewer rodionov
 */

class G<_, _$, __> {
  _ x = null;
  _$ y = null;
  __ z;
}

class G2<A, B, C> extends G<A, B, C> {}
class G3<_> extends G<_, _, _>{}

main() {
  new G<int, String, double>();
  new G2<int, String, double>();
  new G3<int>();
}
