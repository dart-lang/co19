/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests find for strings with kana letters in them. 
 */
import "dart:html";
import "../../testharness.dart";

bool canFind(String target, String specimen) {
    window.getSelection().empty();
    var textNode = new Text(specimen);
    document.body.append(textNode);
    document.execCommand("FindString", false, target);
    var result = window.getSelection().rangeCount != 0;
    window.getSelection().empty();
    textNode.remove();
    return result;
}

void main() {

    var combiningGraveAccent = new String.fromCharCode(0x0300);
    var combiningKatakanaHiraganaSemiVoicedSoundMark = new String.fromCharCode(0x309A);
    var combiningKatakanaHiraganaVoicedSoundMark = new String.fromCharCode(0x3099);
    
    var halfwidthKatakanaLetterA = new String.fromCharCode(0xFF71);
    var halfwidthKatakanaLetterHa = new String.fromCharCode(0xFF76);
    var halfwidthKatakanaLetterKa = new String.fromCharCode(0xFF76);
    var halfwidthKatakanaLetterSmallA = new String.fromCharCode(0xFF67);
    var hiraganaLetterA = new String.fromCharCode(0x3042);
    var hiraganaLetterBa = new String.fromCharCode(0x3070);
    var hiraganaLetterGa = new String.fromCharCode(0x304C);
    var hiraganaLetterHa = new String.fromCharCode(0x306F);
    var hiraganaLetterKa = new String.fromCharCode(0x304B);
    var hiraganaLetterPa = new String.fromCharCode(0x3071);
    var hiraganaLetterSmallA = new String.fromCharCode(0x3041);
    var katakanaLetterA = new String.fromCharCode(0x30A2);
    var katakanaLetterGa = new String.fromCharCode(0x30AC);
    var katakanaLetterKa = new String.fromCharCode(0x30AB);
    var katakanaLetterSmallA = new String.fromCharCode(0x30A1);
    var latinCapitalLetterAWithGrave = new String.fromCharCode(0x00C0);
    
    var decomposedHalfwidthKatakanaLetterBa = halfwidthKatakanaLetterHa + combiningKatakanaHiraganaVoicedSoundMark;
    var decomposedHalfwidthKatakanaLetterPa = halfwidthKatakanaLetterHa + combiningKatakanaHiraganaSemiVoicedSoundMark;
    var decomposedHiraganaLetterBa = hiraganaLetterHa + combiningKatakanaHiraganaVoicedSoundMark;
    var decomposedHiraganaLetterGa = hiraganaLetterKa + combiningKatakanaHiraganaVoicedSoundMark;
    var decomposedHiraganaLetterPa = hiraganaLetterHa + combiningKatakanaHiraganaSemiVoicedSoundMark;
    var decomposedKatakanaLetterGa = katakanaLetterKa + combiningKatakanaHiraganaVoicedSoundMark;
    var decomposedLatinCapitalLetterAWithGrave = 'A' + combiningGraveAccent;
    
    print('Exact matches first as a baseline');
    print('');
    
    shouldBe(canFind(decomposedHalfwidthKatakanaLetterBa, decomposedHalfwidthKatakanaLetterBa), true);
    shouldBe(canFind(decomposedHalfwidthKatakanaLetterPa, decomposedHalfwidthKatakanaLetterPa), true);
    shouldBe(canFind(decomposedHiraganaLetterBa, decomposedHiraganaLetterBa), true);
    shouldBe(canFind(decomposedHiraganaLetterGa, decomposedHiraganaLetterGa), true);
    shouldBe(canFind(decomposedHiraganaLetterPa, decomposedHiraganaLetterPa), true);
    shouldBe(canFind(decomposedKatakanaLetterGa, decomposedKatakanaLetterGa), true);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave, decomposedLatinCapitalLetterAWithGrave), true);
    shouldBe(canFind(halfwidthKatakanaLetterA, halfwidthKatakanaLetterA), true);
    shouldBe(canFind(halfwidthKatakanaLetterHa, halfwidthKatakanaLetterHa), true);
    shouldBe(canFind(halfwidthKatakanaLetterKa, halfwidthKatakanaLetterKa), true);
    shouldBe(canFind(halfwidthKatakanaLetterSmallA, halfwidthKatakanaLetterSmallA), true);
    shouldBe(canFind(hiraganaLetterA, hiraganaLetterA), true);
    shouldBe(canFind(hiraganaLetterBa, hiraganaLetterBa), true);
    shouldBe(canFind(hiraganaLetterGa, hiraganaLetterGa), true);
    shouldBe(canFind(hiraganaLetterHa, hiraganaLetterHa), true);
    shouldBe(canFind(hiraganaLetterKa, hiraganaLetterKa), true);
    shouldBe(canFind(hiraganaLetterPa, hiraganaLetterPa), true);
    shouldBe(canFind(hiraganaLetterSmallA, hiraganaLetterSmallA), true);
    shouldBe(canFind(katakanaLetterA, katakanaLetterA), true);
    shouldBe(canFind(katakanaLetterGa, katakanaLetterGa), true);
    shouldBe(canFind(katakanaLetterKa, katakanaLetterKa), true);
    shouldBe(canFind(katakanaLetterSmallA, katakanaLetterSmallA), true);
    shouldBe(canFind(latinCapitalLetterAWithGrave, latinCapitalLetterAWithGrave), true);
    
    print('');
    print('Hiragana, katakana, and half width katakana: Must be treated as equal');
    print('');
    
    shouldBe(canFind(decomposedHiraganaLetterGa, decomposedKatakanaLetterGa), true);
    shouldBe(canFind(decomposedKatakanaLetterGa, decomposedHiraganaLetterGa), true);
    shouldBe(canFind(hiraganaLetterA, halfwidthKatakanaLetterA), true);
    shouldBe(canFind(hiraganaLetterA, katakanaLetterA), true);
    shouldBe(canFind(katakanaLetterSmallA, hiraganaLetterSmallA), true);
    
    print('');
    print('Composed and decomposed forms: Must be treated as equal');
    print('');
    
    shouldBe(canFind(decomposedHiraganaLetterBa, hiraganaLetterBa), true);
    shouldBe(canFind(decomposedHiraganaLetterGa, decomposedKatakanaLetterGa), true);
    shouldBe(canFind(decomposedHiraganaLetterGa, hiraganaLetterGa), true);
    shouldBe(canFind(decomposedHiraganaLetterGa, katakanaLetterGa), true);
    shouldBe(canFind(decomposedHiraganaLetterPa, hiraganaLetterPa), true);
    shouldBe(canFind(decomposedKatakanaLetterGa, decomposedHiraganaLetterGa), true);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave, latinCapitalLetterAWithGrave), true);
    shouldBe(canFind(hiraganaLetterBa, decomposedHiraganaLetterBa), true);
    shouldBe(canFind(hiraganaLetterGa, decomposedHiraganaLetterGa), true);
    shouldBe(canFind(hiraganaLetterPa, decomposedHiraganaLetterPa), true);
    shouldBe(canFind(katakanaLetterGa, decomposedHiraganaLetterGa), true);
    shouldBe(canFind(latinCapitalLetterAWithGrave, decomposedLatinCapitalLetterAWithGrave), true);
    
    print('');
    print('Small and non-small kana letters: Must *not* be treated as equal');
    print('');
    
    shouldBe(canFind(halfwidthKatakanaLetterA, hiraganaLetterSmallA), false);
    shouldBe(canFind(halfwidthKatakanaLetterSmallA, halfwidthKatakanaLetterA), false);
    shouldBe(canFind(hiraganaLetterA, hiraganaLetterSmallA), false);
    shouldBe(canFind(hiraganaLetterSmallA, katakanaLetterA), false);
    shouldBe(canFind(katakanaLetterA, halfwidthKatakanaLetterSmallA), false);
    shouldBe(canFind(katakanaLetterSmallA, katakanaLetterA), false);
    
    print('');
    print('Kana letters where the only difference is in voiced sound marks: Must *not* be treated as equal');
    print('');
    
    shouldBe(canFind(decomposedHalfwidthKatakanaLetterBa, halfwidthKatakanaLetterHa), false);
    shouldBe(canFind(decomposedHalfwidthKatakanaLetterPa, halfwidthKatakanaLetterHa), false);
    shouldBe(canFind(decomposedHiraganaLetterBa, hiraganaLetterHa), false);
    shouldBe(canFind(decomposedHiraganaLetterBa, hiraganaLetterPa), false);
    shouldBe(canFind(decomposedHiraganaLetterGa, halfwidthKatakanaLetterKa), false);
    shouldBe(canFind(decomposedHiraganaLetterGa, hiraganaLetterKa), false);
    shouldBe(canFind(decomposedHiraganaLetterPa, hiraganaLetterBa), false);
    shouldBe(canFind(decomposedHiraganaLetterPa, hiraganaLetterHa), false);
    shouldBe(canFind(decomposedKatakanaLetterGa, halfwidthKatakanaLetterKa), false);
    shouldBe(canFind(decomposedKatakanaLetterGa, hiraganaLetterKa), false);
    shouldBe(canFind(halfwidthKatakanaLetterHa, decomposedHalfwidthKatakanaLetterBa), false);
    shouldBe(canFind(halfwidthKatakanaLetterHa, decomposedHalfwidthKatakanaLetterPa), false);
    shouldBe(canFind(halfwidthKatakanaLetterKa, decomposedHiraganaLetterGa), false);
    shouldBe(canFind(halfwidthKatakanaLetterKa, decomposedKatakanaLetterGa), false);
    shouldBe(canFind(hiraganaLetterBa, decomposedHiraganaLetterPa), false);
    shouldBe(canFind(hiraganaLetterBa, hiraganaLetterHa), false);
    shouldBe(canFind(hiraganaLetterBa, hiraganaLetterPa), false);
    shouldBe(canFind(hiraganaLetterGa, hiraganaLetterKa), false);
    shouldBe(canFind(hiraganaLetterHa, decomposedHiraganaLetterBa), false);
    shouldBe(canFind(hiraganaLetterHa, decomposedHiraganaLetterPa), false);
    shouldBe(canFind(hiraganaLetterHa, hiraganaLetterBa), false);
    shouldBe(canFind(hiraganaLetterHa, hiraganaLetterPa), false);
    shouldBe(canFind(hiraganaLetterKa, decomposedHiraganaLetterGa), false);
    shouldBe(canFind(hiraganaLetterKa, decomposedKatakanaLetterGa), false);
    shouldBe(canFind(hiraganaLetterKa, hiraganaLetterGa), false);
    shouldBe(canFind(hiraganaLetterPa, decomposedHiraganaLetterBa), false);
    shouldBe(canFind(hiraganaLetterPa, hiraganaLetterBa), false);
    shouldBe(canFind(hiraganaLetterPa, hiraganaLetterHa), false);
    
    print('');
    print('Composed/decomposed form differences before kana characters must have no effect');
    print('');
    
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + halfwidthKatakanaLetterA, latinCapitalLetterAWithGrave + hiraganaLetterSmallA), false);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + halfwidthKatakanaLetterSmallA, latinCapitalLetterAWithGrave + halfwidthKatakanaLetterA), false);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + hiraganaLetterA, latinCapitalLetterAWithGrave + hiraganaLetterSmallA), false);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + hiraganaLetterGa, latinCapitalLetterAWithGrave + hiraganaLetterGa), true);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + hiraganaLetterGa, latinCapitalLetterAWithGrave + hiraganaLetterKa), false);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + hiraganaLetterKa, latinCapitalLetterAWithGrave + hiraganaLetterGa), false);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + hiraganaLetterSmallA, latinCapitalLetterAWithGrave + katakanaLetterA), false);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + katakanaLetterA, latinCapitalLetterAWithGrave + halfwidthKatakanaLetterSmallA), false);
    shouldBe(canFind(decomposedLatinCapitalLetterAWithGrave + katakanaLetterSmallA, latinCapitalLetterAWithGrave + katakanaLetterA), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + halfwidthKatakanaLetterA, decomposedLatinCapitalLetterAWithGrave + hiraganaLetterSmallA), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + halfwidthKatakanaLetterSmallA, decomposedLatinCapitalLetterAWithGrave + halfwidthKatakanaLetterA), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + hiraganaLetterA, decomposedLatinCapitalLetterAWithGrave + hiraganaLetterSmallA), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + hiraganaLetterGa, decomposedLatinCapitalLetterAWithGrave + hiraganaLetterGa), true);
    shouldBe(canFind(latinCapitalLetterAWithGrave + hiraganaLetterGa, decomposedLatinCapitalLetterAWithGrave + hiraganaLetterKa), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + hiraganaLetterKa, decomposedLatinCapitalLetterAWithGrave + hiraganaLetterGa), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + hiraganaLetterSmallA, decomposedLatinCapitalLetterAWithGrave + katakanaLetterA), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + katakanaLetterA, decomposedLatinCapitalLetterAWithGrave + halfwidthKatakanaLetterSmallA), false);
    shouldBe(canFind(latinCapitalLetterAWithGrave + katakanaLetterSmallA, decomposedLatinCapitalLetterAWithGrave + katakanaLetterA), false);

    checkTestFailures();
}
