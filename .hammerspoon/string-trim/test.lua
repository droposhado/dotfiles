local trim = require('./init')

assert(trim('a string'), 'a string')
assert(trim(' a   string'), 'a   string')
assert(trim('a string   '), 'a string')
assert(trim('a stri     ng   '), 'a stri     ng')
assert(trim('    a s  t     ri    ng'), 'a s  t     ri    ng')
assert(trim('a string         '), 'a string')

print('All tested passed successfully')