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
/// @description Checks that it is a compile-time error when a backslash
/// character is not followed by another character in a single-line
/// single-quotes string literal that isn't raw.
/// @author msyabro


main() {
  '\';
//   ^
// [analyzer] unspecified
// [cfe] unspecified
}
