# Introduction

vim-quickrun-phpunit is outputter of vim-quickrun plugin.

Simplifies the results of running the PHPUnit.
Result message will be green and red coloring.

If PHPUnit test case is failure, result message is output to the quickfix window.
You can jump to the error from the quickfix window.

# Install

Please put your vim's runtimepath this plugin files.

For example

* ~/.vim/autoload/quickrun/outputter/phpunit.vim
* ~/.vim/bundle/quickrun-outputter-phpunit/autoload/quickrun/outputter/phpunit.vim

Please install vim-quickrun Version 0.5.1(or later) before use this plugin.

https://github.com/thinca/vim-quickrun

# How to use

* Example of .vimrc

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter'] = 'phpunit'

* Option settings

let g:quickrun_config['phpunit']['outputter/running_mark'] = 'running...'
let g:quickrun_config['phpunit']['outputter/height'] = '3'
