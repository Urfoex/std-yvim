if exists("b:current_syntax")
    finish
endif

syn match numbers '\d\+'
syn match numbers '\d\+\.\d\+'

syn match ipnumbers '\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}'

syn match hexnumbers '0x[0-9a-fA-F]\+'

syn match date '\d\{4}\/\d\{2}\/\d\{2}'
syn match date '\d\{4}-\d\{2}-\d\{2}'

syn match time '\d\{2}:\d\{2}'
syn match time '\d\{2}:\d\{2}:\d\{2}'
syn match time '\d\{2}:\d\{2}:\d\{2}\.\d\{1,6}+\d\{2}:\d\{2}'


syn match brackets '[\[\{\()}]]' contained

syn match sessionid '[a-z0-9]\{30}' contained
syn match sessionid_2 '\s[a-z0-9]\{30}\s'
syn match sessionid_2 '\s[a-z0-9]\{30}$'

syn keyword booleans True False contained
syn keyword nones None contained


syn cluster content contains=sessionid
syn cluster content add=string_region
syn cluster content add=list_capsule
syn cluster content add=tuple_capsule
syn cluster content add=dict_capsule
syn cluster content add=booleans
syn cluster content add=nones
syn cluster content add=numbers

syn region list_capsule matchgroup=brackets start='\[' end=']' contains=@content
syn region tuple_capsule matchgroup=brackets start='(' end=')' contains=@content
syn region dict_capsule matchgroup=brackets start='{' end='}' contains=@content

syn match anystring '.\*' contained
syn region string_region start="'" end="'" contains=numbers,date,time,ipnumbers,sessionid,anystring
" syn region string_region start="'" end="'" contains=numbers,date,time,ipnumbers,sessionid,strings,anystring


syn keyword bad_stuff error Traceback exception
syn match error_msgs 'Unhandled error in Deferred:'


hi def link nones Keyword
hi def link booleans Keyword
hi def link numbers Number
hi def link ipnumbers Structure
hi def link hexnumbers Number
hi def link date Statement
hi def link time Statement
hi def link sessionid Identifier
hi def link sessionid_2 Identifier
hi def link brackets Function
" hi def link strings String
hi def link string_region String
hi def link list_capsule Normal
hi def link tuple_capsule Normal
hi def link dict_capsule Normal
hi def link bad_stuff Error
hi def link error_msgs Error

let b:current_syntax = "ypsilonlog"
