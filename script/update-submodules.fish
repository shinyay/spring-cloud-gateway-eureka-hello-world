#!/usr/bin/env fish

function update_submodules
  argparse -n update_submodules 'h/help' 'c/command=' -- $argv
  or return 1

  if set -lq _flag_help
    echo "update-submodules.fish -c/--command <FOLLOWING_COMMAND> "
    echo "    add"
    echo "    status"
    echo "    init"
    echo "    deinit"
    echo "    update"
    echo "    summary"
    echo "    foreach"
    echo "    sync"
    echo "    absorbgitdirs"
    echo ""
    echo "Example:"
    echo "update-submodules.fish -c status"
    return
  end

  set -lq _flag_command
  or set -l _flag_command foreach git pull origin master

  git submodule $_flag_command
end

update_submodules $argv
