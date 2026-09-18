Command-line application that shows Dart specification coverage by co19 tests.

// FIXME (sgrekhov)
For now this tool takes a .txt version of the Dart specification as an input.
It obtained from latex version as follows:

pip install pylatexenc
latex2text dartLangSpec.tex > spec.txt

Path to `spec.txt` is specified in `config/config.json`

// End of FIXME

Usage:
`$ cd Tools/spec_coverage`
`$ dart bin/main.dart`
