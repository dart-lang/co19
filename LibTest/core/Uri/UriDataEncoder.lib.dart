/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Converts characters to the RFC 2397 for data: URIs
 */
import "dart:convert";

String unreserved = "0123456789" +
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
    "abcdefghijklmnopqrstuvwxyz" +
    "-" + "_" + "." + "!" + "~" + "*" + "'" + "(" + ")";
String reserved = ";" + "/" + "?" + ":" + "@" + "&" + "=" + "+" + r"$" + ",";

String mustNotBeEncoded = unreserved + reserved;

String encodeList(List<int> data) {
  String encoded = "";
  Iterator i = data.iterator;
  while (i.moveNext()) {
    int charCode = i.current;
    String char = new String.fromCharCode(charCode);
    if (mustNotBeEncoded.contains(char)) {
      encoded += char;
    } else {
      encoded += "%" + _normalize(charCode.toRadixString(16));
    }
  }
  return encoded;
}

String encodeString(String data, {Encoding encoding}) {
  String encoded = "";
  Iterator i = data.codeUnits.iterator;
  while (i.moveNext()) {
    int charCode = i.current;
    String char = new String.fromCharCode(charCode);
    if (mustNotBeEncoded.contains(char)) {
      encoded += char;
    } else {
      if (encoding != null) {
        List<int> codes = encoding.encode(char);
        if (codes.length > 1) {
          String ch1 = codes[0].toRadixString(16);
          String ch2 = codes[1].toRadixString(16);
          encoded += "%" + _normalize(ch1) + "%" + _normalize(ch2);
        } else {
          encoded += "%" + _normalize(charCode.toRadixString(16));
        }
      } else {
        encoded += "%" + _normalize(charCode.toRadixString(16));
      }
    }
  }
  return encoded;
}

String _normalize(String s) =>  (s.length == 1 ? "0" + s : s).toUpperCase();
