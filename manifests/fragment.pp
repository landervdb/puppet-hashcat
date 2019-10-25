# @summary A (part of) a hash to be collected
#
# All fragments with the same target will be merged into a
# single hash and can be collected using the collect_hash 
# function.
#
# @example
#   hashcat::fragment { 'fragment_1': 
#     content => { 'key' => 'value' },
#     target  => 'myhash',
#   }
define hashcat::fragment (
  Variant[Hash, Array, String] $content = {},
  String $target = 'all',
) {
  hash_fragment { $title:
    content => $content,
    target  => $target,
  }
}
