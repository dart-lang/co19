/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * stringLiteral:
 *   (multilineString | singleLineString)+
 * ;
 * multilineString:
 *   '"""' stringContentTDQ* '"""' |
 *   ''''' stringContentTSQ* ''''' |
 *   '"""'  (~ '"""')* '"""' |
 *   ''''' (~ ''''')* '''''
 * ;
 * stringContentTDQ:
 *   ~( '\' | '"""' | '$') |
 *   stringInterpolation
 * ;
 * stringContenTSQ:
 *   ~( '\' | ''''' | '$') |
 *   stringInterpolation
 * ;
 * @description Checks that unbalanced string cause compile-time erros.
 * @compile-error
 * @reviewer iefremov
 * @author rodionov
 * @reviewer kaigorodov
 */

main() {
  '''\''';
}
