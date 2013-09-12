/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static Properties
 * const int AFTER_COLON
 * const int ALLOW_STRING_MASK
 * const int ALLOW_VALUE
 * const int ALLOW_VALUE_MASK
 * const int BACKSLASH
 * const int BACKSPACE
 * const int CARRIAGE_RETURN
 * const int CHAR_0
 * const int CHAR_9
 * const int CHAR_a
 * const int CHAR_b
 * const int CHAR_E
 * const int CHAR_e
 * const int CHAR_f
 * const int CHAR_l
 * const int CHAR_n
 * const int CHAR_r
 * const int CHAR_s
 * const int CHAR_t
 * const int CHAR_u
 * const int COLON
 * const int COMMA
 * const int DECIMALPOINT
 * const int EMPTY
 * const int EMPTY_MASK
 * const int FORM_FEED
 * const int INSIDE_ARRAY
 * const int INSIDE_OBJECT
 * const int LBRACE
 * const int LBRACKET
 * const int MINUS
 * const int NEWLINE
 * const int NO_VALUES
 * const int NON_EMPTY
 * const int PLUS
 * const int QUOTE
 * const int RBRACE
 * const int RBRACKET
 * const int SLASH
 * const int SPACE
 * const int STATE_ARRAY_COMMA
 * const int STATE_ARRAY_EMPTY
 * const int STATE_ARRAY_VALUE
 * const int STATE_END
 * const int STATE_INITIAL
 * const int STATE_OBJECT_COLON
 * const int STATE_OBJECT_COMMA
 * const int STATE_OBJECT_EMPTY
 * const int STATE_OBJECT_KEY
 * const int STATE_OBJECT_VALUE
 * const int STRING_ONLY
 * const int TAB
 * const int VALUE_READ_BITS
 * @description Checks that all that properties are defined and are not null.
 * are parsed correctly.
 * @author kaigorodov
 */
import "dart:json";

main() {
  int sum=JsonParser.AFTER_COLON
+JsonParser.ALLOW_STRING_MASK
+JsonParser.ALLOW_VALUE
+JsonParser.ALLOW_VALUE_MASK
+JsonParser.BACKSLASH
+JsonParser.BACKSPACE
+JsonParser.CARRIAGE_RETURN
+JsonParser.CHAR_0
+JsonParser.CHAR_9
+JsonParser.CHAR_a
+JsonParser.CHAR_b
+JsonParser.CHAR_E
+JsonParser.CHAR_e
+JsonParser.CHAR_f
+JsonParser.CHAR_l
+JsonParser.CHAR_n
+JsonParser.CHAR_r
+JsonParser.CHAR_s
+JsonParser.CHAR_t
+JsonParser.CHAR_u
+JsonParser.COLON
+JsonParser.COMMA
+JsonParser.DECIMALPOINT
+JsonParser.EMPTY
+JsonParser.EMPTY_MASK
+JsonParser.FORM_FEED
+JsonParser.INSIDE_ARRAY
+JsonParser.INSIDE_OBJECT
+JsonParser.LBRACE
+JsonParser.LBRACKET
+JsonParser.MINUS
+JsonParser.NEWLINE
+JsonParser.NO_VALUES
+JsonParser.NON_EMPTY
+JsonParser.PLUS
+JsonParser.QUOTE
+JsonParser.RBRACE
+JsonParser.RBRACKET
+JsonParser.SLASH
+JsonParser.SPACE
+JsonParser.STATE_ARRAY_COMMA
+JsonParser.STATE_ARRAY_EMPTY
+JsonParser.STATE_ARRAY_VALUE
+JsonParser.STATE_END
+JsonParser.STATE_INITIAL
+JsonParser.STATE_OBJECT_COLON
+JsonParser.STATE_OBJECT_COMMA
+JsonParser.STATE_OBJECT_EMPTY
+JsonParser.STATE_OBJECT_KEY
+JsonParser.STATE_OBJECT_VALUE
+JsonParser.STRING_ONLY
+JsonParser.TAB
+JsonParser.VALUE_READ_BITS;
}