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
/// @description Checks that it is a compile-time error if a raw multi-line
/// double-quoted string closes with one single quote.
/// @author msyabro
/// @reviewer iefremov


main() {
//     ^
// [cfe] unspecified
  try {
//^
// [analyzer] unspecified
// [cfe] unspecified
    r"""s';
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (e) {}
}
// [error line 45, column 0]
// [analyzer] unspecified