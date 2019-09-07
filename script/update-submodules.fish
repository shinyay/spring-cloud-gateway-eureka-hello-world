#!/usr/bin/env fish

function update_submodules
  argparse -n update_submodules 'h/help' 'c/command=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "update-submodules.fish -t/--target <get/post>"
    return
  end

  set -lq _flag_command
  or set -l _flag_command update

  git submodule $_flag_command
end

update_submodules $argv
