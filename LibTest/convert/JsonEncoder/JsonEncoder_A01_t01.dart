/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionconst JsonEncoder([Object toEncodable(Object nonSerializable)])
 * Creates a JSON encoder.
 * The JSON encoder handles numbers, strings, booleans, null, lists and maps directly.
 * Any other object is attempted converted by toEncodable to an object that is of one
 * of the convertible types.
 * If toEncodable is omitted, it defaults to calling .toJson() on the object.
 * @description Checks that this constructor executes without error for various arguments.
 * @author kaigorodov
 */

import "dart:convert";

main() {
  JsonEncoder jenc=new JsonEncoder();
  JsonEncoder jenc2=new JsonEncoder((dynamic nonSerializable)=>nonSerializable.toJson());
}
