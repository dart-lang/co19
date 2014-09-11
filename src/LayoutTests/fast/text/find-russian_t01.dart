/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests find for strings with Russian letters й and ё in them. 
 */
import "dart:html";
import "../../testharness.dart";

int testcount=0;

void shouldBeCanFind(String target, String specimen, bool isExpectedToFind) {
    testcount++;
    window.getSelection().empty();
    var textNode = new Text(specimen);
    document.body.append(textNode);
    document.execCommand("FindString", false, target);
    var result = window.getSelection().rangeCount != 0;
    window.getSelection().empty();
    textNode.remove();
    String testName="(target=$target, specimen=$specimen, expected=$isExpectedToFind)";
    if (result == isExpectedToFind) {
        testPassed(testName);
    } else {
        testFailed(testName, "test no $testcount");
    }
    
}

void main() {

    var letterCyrillicI = new String.fromCharCode(0x0418);
    var letterCyrillicSmallI = new String.fromCharCode(0x0438);
    var letterCyrillicShortI = new String.fromCharCode(0x0419);
    var letterCyrillicSmallShortI = new String.fromCharCode(0x0439);
    var letterCyrillicE = new String.fromCharCode(0x0415);
    var letterCyrillicSmallE = new String.fromCharCode(0x0435);
    var letterCyrillicYO = new String.fromCharCode(0x0401);
    var letterCyrillicSmallYO = new String.fromCharCode(0x0451);
    var combiningDiaeresis = new String.fromCharCode(0x0308);
    var combiningBreve = new String.fromCharCode(0x0306);
    
    var decomposedCyrillicShortI = letterCyrillicI + combiningBreve;
    var decomposedCyrillicSmallShortI = letterCyrillicSmallI + combiningBreve;
    var decomposedCyrillicYO = letterCyrillicE + combiningDiaeresis;
    var decomposedCyrillicSmallYO = letterCyrillicSmallE + combiningDiaeresis;
    
    // Exact matches first as a baseline
    
    shouldBeCanFind(decomposedCyrillicShortI, decomposedCyrillicShortI, true);
    shouldBeCanFind(decomposedCyrillicSmallShortI, decomposedCyrillicSmallShortI, true);
    shouldBeCanFind(letterCyrillicShortI, letterCyrillicShortI, true);
    shouldBeCanFind(letterCyrillicSmallShortI, letterCyrillicSmallShortI, true);
    shouldBeCanFind("й", "йод", true);
    shouldBeCanFind("ё", "мумиё", true);
    
    
    // Composed and decomposed forms: Must be treated as equal
    
    shouldBeCanFind(decomposedCyrillicYO, decomposedCyrillicYO, true);
    shouldBeCanFind(decomposedCyrillicSmallYO, decomposedCyrillicSmallYO, true);
    shouldBeCanFind(letterCyrillicShortI, decomposedCyrillicShortI, true);
    shouldBeCanFind(letterCyrillicSmallShortI, decomposedCyrillicSmallShortI, true);
    shouldBeCanFind(letterCyrillicYO, decomposedCyrillicYO, true);
    shouldBeCanFind(letterCyrillicSmallYO, decomposedCyrillicSmallYO, true);
    shouldBeCanFind(decomposedCyrillicShortI, letterCyrillicShortI, true);
    shouldBeCanFind(decomposedCyrillicSmallShortI, letterCyrillicSmallShortI, true);
    shouldBeCanFind(decomposedCyrillicYO, letterCyrillicYO, true);
    shouldBeCanFind(decomposedCyrillicSmallYO, letterCyrillicSmallYO, true);
    
    // Small and capital letters: Must be treated as equal
    
    shouldBeCanFind(letterCyrillicSmallI, letterCyrillicI, true);
    shouldBeCanFind(letterCyrillicSmallYO, letterCyrillicYO, true);
    shouldBeCanFind(letterCyrillicI, letterCyrillicSmallI, true);
    shouldBeCanFind(letterCyrillicYO, letterCyrillicSmallYO, true);
//  was wrong:  (decomposedCyrillicSmallShortI, letterCyrillicI, true); fails
    shouldBeCanFind(decomposedCyrillicSmallShortI, letterCyrillicShortI, true); 
    shouldBeCanFind(decomposedCyrillicSmallYO, letterCyrillicYO, true);
// was wrong: (decomposedCyrillicShortI, letterCyrillicSmallI, true); fails
    shouldBeCanFind(decomposedCyrillicShortI, letterCyrillicSmallShortI, true); 
    shouldBeCanFind(decomposedCyrillicYO, letterCyrillicSmallYO, true);
    shouldBeCanFind(letterCyrillicSmallI + letterCyrillicSmallYO, letterCyrillicSmallI + letterCyrillicYO, true);
    shouldBeCanFind("й", "Йод", true);
    shouldBeCanFind("ё", "МУМИЁ", true);
    shouldBeCanFind("Й", "йод", true);
    shouldBeCanFind("Ё", "мумиё", true);
    
    // Е and Ё: Must be treated as equal
    
    shouldBeCanFind("мумие", "мумиё", true);
    shouldBeCanFind("МУМИЕ", "МУМИЁ", true);
    shouldBeCanFind("мумиё", "мумие", true);
    shouldBeCanFind("МУМИЁ", "МУМИЕ", true);
    
    // Й and и: Must *not* be treated as equal
    
    shouldBeCanFind("зайка", "заика", false);
    shouldBeCanFind("заика", "зайка", false);

    checkTestFailures();
}
