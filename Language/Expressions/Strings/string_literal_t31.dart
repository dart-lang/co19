// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// stringLiteral:
///   (multilineString | singleLineString)+
/// ;
/// singleLineString:
///   '"' stringContentDQ* '"' |
///   ''' stringContentSQ* ''' |
///   'r' ''' (~( ''' | NEWLINE ))* ''' |
///   'r' '"' (~( '"' | NEWLINE ))* '"'
/// ;
/// stringContentDQ:
///   ~( '\' | '"' | '$' | NEWLINE ) |
///   '\' ~( NEWLINE ) |
///   stringInterpolation
/// ;
/// stringContentSQ:
///   ~( '\' | ''' | '$' | NEWLINE ) |
///   '\' ~( NEWLINE ) |
///   stringInterpolation
/// ;
/// NEWLINE:
///   '\n' |
///   '\r'
/// ;
/// @description Checks that it is a compile-time error if a double-quoted
/// string contains \r.
/// @author msyabro


main() {
  "stri
//    ^
// [analyzer] unspecified
// [cfe] unspecified
ng";
// ^
// [analyzer] unspecified
// [cfe] unspecified
}
