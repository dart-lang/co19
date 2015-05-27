/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type a map literal of the form const{k1 : e1 . . . kn : en }
 * or the form {k1 : e1 . . . kn : en } is Map <dynamic, dynamic>.
 * @description Checks that static type of map literal with omitted type
 * arguments is indeed Map<dynamic, dynamic> by assigning it to declared
 * variable of type Map <K,V> where K, V are arbitrary types. No static
 * warnings expected.
 * @static-clean
 * @author ilya
 */

class K {}
class V {}

main() {
  Map<K,V> x = {1: true, String: (){}};
  Map<K,V> y = const {1: true, String: null};
}
