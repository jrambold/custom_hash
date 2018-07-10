require_relative 'hash_custom'

blah = HashCustom.new()

blah.put('hello', 'world')

blah.put(2, 4)
blah.put(4, 8)
blah.put(6, 16)

blah.put(2,32)

blah.print_hash
puts blah.keys.join(' ')
puts blah.values.join(' ')
