// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let the element type of a list literal be the static type of the
/// type argument used to create the list. So <int>[] has an element type of int.
/// It may be explicit or filled in by type inference. So [1, 2.0] has an element
/// type of num.
///
/// @description Checks that element type of the list literals is the static type
/// of the type argument used to create the list
/// @author sgrekhov@unipro.ru


main() {
  bool b = true;
  var collection = <double>[3, 1.1, 4, 1, 5];

  List<int> list1 = [if (b) 1.1];
//                          ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  List<int> list2 = [if (!b) 1.1,];
//                           ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  List<int> list3 = [if (b) for (var v in collection) if (v > 3) v,];
//                                                               ^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  List<int> list4 = [if (!b) for (var v in collection) if (v > 3) v];
//                                                                ^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.

  List lis5t = <int>[if (b) 1.1];
//                          ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  List list6 = <int>[if (!b) 1.1,];
//                           ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  List list7 = <int>[if (b) for (var v in collection) if (v > 3) v,];
//                                                               ^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  List list8 = <int>[if (!b) for (var v in collection) if (v > 3) v];
//                                                                ^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.

  const list9 = <int>[if (1 > 2) 1.1];
//                               ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  const list10 = <int>[if (2 > 1) 1.1,];
//                                ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.

  var list11 = const <int>[if (1 > 2) 1.1];
//                                    ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
  var list12 = const <int>[if (2 > 1) 1.1,];
//                                    ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'double' can't be assigned to a variable of type 'int'.
}
