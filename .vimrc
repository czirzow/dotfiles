version 6.3
"

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " allow backspacing over everything in insert mode
set ai                  " always set autoindenting on
set nowrap              " don't wrap long lines
set ic                  " ignore case when searching
set nobackup            " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set ts=2
set sw=2
set modeline

set listchars=tab:»·,trail:·,eol:\

" Only do this part when compiled with support for autocommands
if has("autocmd")

	"noremap <F8> :so `/usr/local/share/vim/vim61/tools/vimspell.sh %`<CR><CR>
	"noremap <F7> :syntax clear SpellErrors<CR>

	autocmd FileType * set formatoptions=tcqn nocindent comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:- modeline

	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost * if line("'\"") | exe "'\"" | endif

	augroup text
		au!
		"In text files, always limit the width of text to 78 characters
		autocmd BufRead *.txt set wrap nocp
	augroup end

	" Don't use Ex mode, use Q for formatting
	map Q gq
	map <C-J> {Qap}

	"spell check with newsbody 
	map  \1\2<CR>:e! %<CR>
	map \1 :w!<CR>
	map \2 :!newsbody -qs -n % -p aspell check \%f<CR>

	augroup mutt
		autocmd BufNewFile,BufReadPost mutt-* set tw=67 nocp wrap ts=2 sw=2 et si ai 
		autocmd BufRead mutt-* 1;/^$/+ " below headers
	augroup end

	augroup cprog
		" Remove all cprog autocommands
		au!
		autocmd FileType h,pl,c,cpp  set formatoptions=croq cindent comments=sr:/*,mb:*,ex:*/,:// softtabstop=4 noexpandtab sw=2 tabstop=2
	augroup END

	augroup php
		au!
		autocmd FileType php,php3  set binary formatoptions=croq cindent comments=s1:/*,mb:*,ex:*/,bO://,:# softtabstop=2 noexpandtab sw=2 
		map ;s :!php -l -d display_errors=1 %<CR>
		map ;r :!php -d display_errors=1 -q %<CR>
		set binary
	augroup end


	augroup puppet                                                                                                                             
		au!                                                                                                                                      
		autocmd BufRead,BufNewFile *.pp set et softtabstop=2 sw=2                                                                                
	augroup end                                                                                                                                

	augroup gzip
		" Remove all gzip autocommands
		au!

		" Enable editing of gzipped files
		"       read: set binary mode before reading the file
		"             uncompress text in buffer after reading
		"      write: compress file after writing
		"     append: uncompress file, append, compress file
		autocmd BufReadPre,FileReadPre        *.gz set bin
		autocmd BufReadPost,FileReadPost      *.gz let ch_save = &ch|set ch=2
		autocmd BufReadPost,FileReadPost      *.gz '[,']!gunzip
		autocmd BufReadPost,FileReadPost      *.gz set nobin
		autocmd BufReadPost,FileReadPost      *.gz let &ch = ch_save|unlet ch_save
		autocmd BufReadPost,FileReadPost      *.gz execute ":doautocmd BufReadPost " . expand("%:r")

		autocmd BufWritePost,FileWritePost    *.gz !mv <afile> <afile>:r
		autocmd BufWritePost,FileWritePost    *.gz !gzip <afile>:r

		autocmd FileAppendPre                 *.gz !gunzip <afile>
		autocmd FileAppendPre                 *.gz !mv <afile>:r <afile>
		autocmd FileAppendPost                *.gz !mv <afile> <afile>:r
		autocmd FileAppendPost                *.gz !gzip <afile>:r
	augroup END

	" vim -b : edit binary using xxd-format!
	augroup Binary
		au!
		au BufReadPre  *.bin let &bin=1
		au BufReadPost *.bin if &bin | %!xxd
		au BufReadPost *.bin set ft=xxd | endif
		au BufWritePre *.bin if &bin | %!xxd -r
		au BufWritePre *.bin endif
		au BufWritePost *.bin if &bin | %!xxd
		au BufWritePost *.bin set nomod | endif
	augroup END
endif

		" Options
		let php_sql_query = 1       "for SQL syntax highlighting inside strings
		let php_htmlInStrings = 1       "for HTML syntax highlighting inside strings
		let php_baselib = 1             "for highlighting baselib functions
		let php_asp_tags = 1            "for highlighting ASP-style short tags
		let php_parent_error_close = 1  "for highlighting parent error ] or )
		let php_parent_error_open = 1   "for skipping an php end tag, if there exists 
		                           "an open ( or [ without a closing one
		"let php_oldStyle = 0            "for using old colorstyle
		let php_noShortTags = 1         "don't sync <? ?> as php
		let php_folding = 1             "for 1 folding classes and functions
		                            "for 2 for folding all { } regions
		let php_sync_method = -1 
		        "			x=-1 to sync by search ( default )
		        "			x>0 to sync at least x lines backwards
		        "			x=0 to sync from start

"set foldmethod=marker

filetype indent on

" Colors 
syntax on
set t_Co=256
"let xterm16_brightness  = 'high'         " 'high' is default
"let xterm16_colormap    = 'allblue'        " 'standard' is default
"colors xterm16

"let g:solarized_termcolors=256
syntax enable
set background=dark
"colorscheme solarized


