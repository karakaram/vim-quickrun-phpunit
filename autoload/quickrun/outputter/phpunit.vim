" Name   : vim-quickrun-phpunit
" Version: 0.1
" Author : karakaram
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>

let s:save_cpo = &cpo
set cpo&vim

let s:outputter = {
\   'config': {
\     'running_mark': ':-)',
\     'height': 10,
\     'auto_open': 1,
\   }
\ }

function! s:outputter.init(session)
  let self._result = ''
endfunction

function! s:outputter.output(data, session)
  let self._result .= a:data
  echo self.config.running_mark
endfunction

function! s:outputter.finish(session)
  let data = self._result
  if stridx(data, 'OK (') > 0
    let ok_message = substitute(data, '.*\nOK (\(.*\))\n', 'OK \1', '')
    highlight phpUnitOk term=reverse ctermbg=2 guibg=DarkGreen
    echohl phpUnitOk | echo ok_message | echohl None
    lclose
  else
    let error_format = &errorformat
    let error_message = ''
    highlight phpUnitFailures term=reverse ctermbg=4 guibg=DarkRed

    if stridx(data, 'FAILURES!') > 0
      let error_message = substitute(data, '.*\nFAILURES!\n\(.*\)\n', 'FAILURES! \1', '')
      set errorformat=%E%n)\ %.%#,%Z%f:%l,%C%m,%-G%.%#
    elseif stridx(data, 'error:') > 0
      let error_message = 'ERROR!'
      set errorformat=%m\ in\ %f\ on\ line\ %l,%-G%.%#
    elseif stridx(data, 'Warning:') > 0
      let error_message = 'WARNING!'
      set errorformat=%m\ in\ %f\ on\ line\ %l,%-G%.%#
    else
      let error_message = 'SOMETHING WRONG! CHECK PHPUNIT SETTINGS.'
    endif
    
    lgetexpr data
    if self.config.auto_open == 1
      execute 'botright lwindow ' self.config.height
    endif
    execute 'set errorformat=' . error_format
    redraw!
    echohl phpUnitFailures | echo error_message | echohl None
  endif
endfunction

function! quickrun#outputter#phpunit#new()
  return deepcopy(s:outputter)
endfunction


let &cpo = s:save_cpo
