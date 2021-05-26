// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// stringLiteral:
///   (multilineString | singleLineString)+
/// ;
/// multilineString:
///   '"""' stringContentTDQ* '"""' |
///   ''''' stringContentTSQ* ''''' |
///   '"""'  (~ '"""')* '"""' |
///   ''''' (~ ''''')* '''''
/// ;
/// stringContentTDQ:
///   ~( '\' | '"""' | '$') |
///   stringInterpolation
/// ;
/// stringContenTSQ:
///   ~( '\' | ''''' | '$') |
///   stringInterpolation
/// ;
/// @description Checks that it is a compile-time error when a multi-line
/// single-quotes string literal contains another triplet of single quotes.
/// @author msyabro
/// @reviewer rodionov


main() {
//     ^
// [cfe] unspecified
  try {
//^
// [analyzer] unspecified
// [cfe] unspecified
    '''
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    incorrect ''' string
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    ''';
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (e) {}
}
// [error line 53, column 0]
// [analyzer] unspecified