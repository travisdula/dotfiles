fish_vi_key_bindings
skim_key_bindings
set SEM $HOME/docs/school/2022_spring/
set -x BAT_THEME Nord
function __fish_command_not_found_handler --on-event fish_command_not_found
    if test -d $argv
        cd $argv
    else
        echo "fish: Unknown command '$argv'"
    end
end

if status --is-login
    notes-generator &
    startx
end
