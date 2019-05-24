# frozen_string_literal: true

module InstallGemLocal
  module CopyGem
    def choose_copy_folder
      options = {
        'a' => { 'value' => 'desktop', 'display' => 'Desktop' },
        'b' => { 'value' => 'downloads', 'display' => 'Downloads' },
        'c' => { 'value' => 'documents', 'display' => 'Documents' },
        '/' => { 'value' => 'exit', 'display' => 'Exit' }
      }

      InstallGemLocal::Helper.prompt_options(
        flash_message: InstallGemLocal::Helper.flash_message(title: 'Choose Folder To Copy'),
        options: options
      )
    end

    def copy_gem
      puts ''
      puts 'Copy Gem'.green
      files_exists = file_names

      if files_exists.count > 1
        copy_file_to_path(multiple_version_selection)
      elsif files_exists.count == 1
        copy_file_to_path(files_exists.first)
      else
        ap 'Gem not exist'
      end
    end

    def copy_file_to_path(file_name)
      return if file_name == 'exit'

      case choose_copy_folder
      when 'desktop'
        tty_command.run("cp #{file_name} ~/Desktop")
      when 'downloads'
        tty_command.run("cp #{file_name} ~/Downloads")
      when 'documents'
        tty_command.run("cp #{file_name} ~/Documents")
      end
    end
  end
end
