/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Tests attribute parsing and handling of whitespace in attribute values.
 *
 * @param type Name of the type being tested (only for test output)
 * @param target The element that should be tested
 * @param attribute The name of the attribute that should be tested
 * @param expected The fallback/default value that is the expectation for invalid values
 * @param whitespace An array of strings that are valid whitespace characters
 * @param valid An array of strings containing valid attribute values
 * @param invalid An array of strings containing invalid attribute values
 * @param garbage An array of strings containing values that would make a valid value invalid when concatenated
 * @param assert_valid_custom A function for asserting validity of a valid value, arguments passed to this function: the element and the string from valid values array
 * @param assert_invalid_custom A function for asserting that an invalid value results in the expected default value, arguments passed to this function: the element and the expected value
 */
library whitespace_helper;
import "dart:html";
import "../../../testharness.dart";

void testType(String type, Element target, String attribute, var expected,
              List<String> whitespace, List<String> valid, List<String> invalid, List validunits,
              List<String> garbage, Function assert_valid_custom, Function assert_invalid_custom) {
    whitespace.forEach((String leading) {
        whitespace.forEach((String trailing) {
            valid.forEach((String value) {
                validunits.forEach((var unit) {
                    var valueStr = "$leading$value$unit$trailing";
                    var escapedValueStr = valueStr
                       .replaceAll("(\r)", '\\r')
                       .replaceAll("(\n)", '\\n')
                       .replaceAll("(\t)", '\\t')
                       .replaceAll("(\f)", '\\f');
                    test(() {
                        try {
                            target.setAttribute(attribute, valueStr);
                            assert_equals(target.getAttribute(attribute), valueStr);
                            assert_valid_custom(target, value);
                        }
                        finally {
                            target.attributes.remove(attribute);
                        }
                    }, "Test $type valid value: $escapedValueStr");
                });
            });

            // test invalid values
            invalid.forEach((value) {
                validunits.forEach((unit) {
                    var valueStr = "$leading$value$unit$trailing";
                    var escapedValueStr = valueStr.replaceAll("(\r)", '\\r').replaceAll("(\n)", '\\n').replaceAll("(\t)", '\\t').replaceAll("(\f)", '\\f');
                    test(() {
                        try {
                            target.setAttribute(attribute, valueStr);
                            assert_equals(target.getAttribute(attribute), valueStr);
                            assert_invalid_custom(target, expected);
                        }
                        finally {
                            target.attributes.remove(attribute);
                        }
                    }, "Test $type invalid value: $escapedValueStr");
                });
            });
        });

        // test whitespace between value and unit
        validunits.forEach((unit) {
            if (unit == "" || leading == "") {
                return;
            }
            valid.forEach((value) {
                var valueStr = "$value$leading$unit";
                var escapedValueStr = valueStr.replaceAll("(\r)", '\\r').replaceAll("(\n)", '\\n').replaceAll("(\t)", '\\t').replaceAll("(\f)", '\\f');
                test(() {
                    try {
                        target.setAttribute(attribute, valueStr);
                        assert_equals(target.getAttribute(attribute), valueStr);
                        assert_invalid_custom(target, expected);
                    }
                    finally {
                        target.attributes.remove(attribute);
                    }
                }, "Test $type WS invalid value: $escapedValueStr");
            });
        });

        // test trailing garbage
        garbage.forEach((trailing) {
            valid.forEach((value) {
                var valueStr = "$leading$value$trailing";
                var escapedValueStr = valueStr.replaceAll("(\r)", '\\r').replaceAll("(\n)", '\\n').replaceAll("(\t)", '\\t').replaceAll("(\f)", '\\f');
                test(() {
                    try {
                        target.setAttribute(attribute, valueStr);
                        assert_equals(target.getAttribute(attribute), valueStr);
                        assert_invalid_custom(target, expected);
                    }
                    finally {
                        target.attributes.remove(attribute);
                    }
                }, "Test $type trailing garbage, value: $escapedValueStr");
            });
        });
    });
}
