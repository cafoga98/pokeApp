import 'dart:io';

String fixture(String file) => File('test/resources/json/$file.json').readAsStringSync();