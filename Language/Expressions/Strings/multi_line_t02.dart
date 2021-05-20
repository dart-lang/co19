// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
/// double-quotes string literal contains another triplet of double quotes.
/// @author msyabro


main() {
//     ^
// [cfe] unspecified
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  """
  incorrect """ string
//              ^
// [analyzer] unspecified
// [cfe] unspecified
// [error line 44, column 0]
// [analyzer] unspecified
// [cfe] unspecified
// [error line 45, column 0]
// [analyzer] unspecified
  """;
}