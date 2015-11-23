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
 * @description Checks that raw multi-line strings are allowed to have any
 * content except the same kind of triple quotes they're enclosed in.
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  r'''\
  ''';
}
