# frozen_string_literal: true

module InstallGemLocal
  module InstallGem
    def install_gem
      puts ''
      puts 'Install Gem'.green
      files_exists = file_names
      if files_exists.count > 1
        install_gem_from_path(multiple_version_selection)
      elsif files_exists.count == 1
        install_gem_from_path(files_exists.first)
      else
        ap 'Gem not exist'
      end
    end

    def install_gem_from_path(file_name)
      return if file_name == 'exit'

      tty_command.run("gem install #{file_name}")
    end
  end
end
