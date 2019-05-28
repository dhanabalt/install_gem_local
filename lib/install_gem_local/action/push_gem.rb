# frozen_string_literal: true

module InstallGemLocal
  module PushGem
    def push_gem
      till_install
      puts ''
      puts 'Push Gem'.blue
      files_exists = file_names
      if files_exists.count > 1
        push_gem_from_path(multiple_version_selection(title_interpol: 'TO Push'))
      elsif files_exists.count == 1
        push_gem_from_path(files_exists.first)
      else
        ap 'Gem not exist'
      end
    end

    def push_gem_from_path(file_name)
      return if file_name == 'exit'

      tty_command.run("gem push #{file_name}")
    end
  end
end
