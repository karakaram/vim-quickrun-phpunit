# Description

vim-quickrun-phpunit is outputter of vim-quickrun plugin.

You can output to the command line the result of running the PHPUnit.  
Result message will be green and red coloring.

If PHPUnit test case is failure, result message is output to the location-list.  
You can jump to the error from the location-list.

# Install

Please put your vim's runtimepath this plugin files.

Example

* ~/.vim/autoload/quickrun/outputter/phpunit.vim
* ~/.vim/bundle/vim-quickrun-phpunit/autoload/quickrun/outputter/phpunit.vim

Please install vim-quickrun Version 0.5.1(or later) before use this plugin.  
<https://github.com/thinca/vim-quickrun>

# How to use

## Example of .vimrc

    augroup QuickRunPHPUnit
      autocmd!
      autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
    augroup END
    
    let g:quickrun_config['phpunit'] = {}
    let g:quickrun_config['phpunit']['outputter'] = 'phpunit'
       
    let g:quickrun_config['phpunit']['command'] = 'phpunit'
    let g:quickrun_config['phpunit']['cmdopt'] = ''
    let g:quickrun_config['phpunit']['exec'] = '%c %o %s'

## Option settings

    let g:quickrun_config['phpunit']['outputter/phpunit/running_mark'] = 'running...'
    let g:quickrun_config['phpunit']['outputter/phpunit/height'] = 3
    let g:quickrun_config['phpunit']['outputter/phpunit/auto_open'] = 0
